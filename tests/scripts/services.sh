#!/bin/bash
# Test Services Management Script for PEPATAC
# Manages local refgenieserver for integration tests.
#
# Bulker crate activation is handled by test-integration.sh via `bulker exec`.
#
# Usage:
#   ./scripts/services.sh start    # Verify bulker and start refgenieserver
#   ./scripts/services.sh stop     # Stop refgenieserver
#   ./scripts/services.sh status   # Show tool and server status

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Bulkers crate configuration
# Full crate identifier including tag — `bulker exec` is strict about the
# tag. Must track the `version:` field in tests/bulker_manifest.yaml.
BULKER_CRATE="${PEPATAC_TEST_BULKER_CRATE:-bulker/pepatac:1.1.1}"

# Required tools for basic pipeline execution
REQUIRED_TOOLS=(bowtie2 samtools macs3 skewer samblaster bedtools)

# Refgenieserver configuration
REFGENIESERVER_PORT="${PEPATAC_TEST_REFGENIESERVER_PORT:-8765}"
REFGENIESERVER_PID_FILE="/tmp/refgenieserver-pepatac-test.pid"
TEST_DATA_DIR="${PEPATAC_TEST_REFGENIE_DATA:-${PROJECT_ROOT}/tests/data/refgenie}"
REFGENIE_CONFIG="${TEST_DATA_DIR}/archive/genome_config.yaml"
REFGENIESERVER="${PROJECT_ROOT}/tests/.venv/bin/refgenieserver"

check_bulker() {
    if ! command -v bulker &>/dev/null; then
        echo "ERROR: bulker is not installed. Install with: cargo install bulker"
        return 1
    fi
    echo "  bulker: $(bulker --version 2>&1 | head -1)"
}

check_crate_cached() {
    if ! bulker crate list 2>/dev/null | grep -q "${BULKER_CRATE}"; then
        echo "ERROR: Bulkers crate ${BULKER_CRATE} is not cached."
        echo "  Install it with: bulker crate install ${BULKER_CRATE}"
        return 1
    fi
    echo "  Crate cached: ${BULKER_CRATE}"
}

check_tools() {
    # Use `bulker exec` to resolve each tool inside the crate environment.
    # This sidesteps scraping `bulker activate --echo` output (format-fragile
    # across bulker versions) and matches how test-integration.sh runs pytest.
    local missing=()
    for tool in "${REQUIRED_TOOLS[@]}"; do
        if bulker exec "${BULKER_CRATE}" -- which "${tool}" >/dev/null 2>&1; then
            echo "  ${tool}: OK"
        else
            echo "  ${tool}: MISSING"
            missing+=("$tool")
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        echo "WARNING: Missing tools: ${missing[*]}"
        echo "  These tools may not be available in the crate (check system PATH as fallback)."
    fi
}

start_refgenieserver() {
    if [ ! -f "${REFGENIESERVER}" ]; then
        echo "  refgenieserver: NOT INSTALLED (optional)"
        echo "    Install with: pip install refgenieserver (or run install-dev-refgenie.sh)"
        return 0
    fi
    if [ ! -f "${REFGENIE_CONFIG}" ]; then
        echo "  refgenieserver: NO TEST DATA (optional)"
        echo "    Run: ./tests/scripts/seed-local-refgenie.sh"
        return 0
    fi
    if [ -f "${REFGENIESERVER_PID_FILE}" ]; then
        if kill -0 "$(cat ${REFGENIESERVER_PID_FILE})" 2>/dev/null; then
            echo "  refgenieserver: ALREADY RUNNING (PID $(cat ${REFGENIESERVER_PID_FILE}))"
            return 0
        fi
    fi
    echo "  Starting refgenieserver on port ${REFGENIESERVER_PORT}..."
    "${REFGENIESERVER}" serve -c "${REFGENIE_CONFIG}" -p "${REFGENIESERVER_PORT}" &
    echo $! > "${REFGENIESERVER_PID_FILE}"
    sleep 2  # Give server time to start
    if curl -s "http://localhost:${REFGENIESERVER_PORT}/v3/genomes/list" >/dev/null 2>&1; then
        echo "  refgenieserver: OK (PID $(cat ${REFGENIESERVER_PID_FILE}), port ${REFGENIESERVER_PORT})"
    else
        echo "  refgenieserver: FAILED to start (check config and logs)"
        rm -f "${REFGENIESERVER_PID_FILE}"
        return 1
    fi
}

stop_refgenieserver() {
    if [ -f "${REFGENIESERVER_PID_FILE}" ]; then
        PID=$(cat "${REFGENIESERVER_PID_FILE}")
        if kill -0 "${PID}" 2>/dev/null; then
            kill "${PID}"
            echo "  Stopped refgenieserver (PID ${PID})"
        fi
        rm -f "${REFGENIESERVER_PID_FILE}"
    else
        echo "  refgenieserver: not running"
    fi
}

check_refgenieserver() {
    if [ -f "${REFGENIESERVER_PID_FILE}" ] && kill -0 "$(cat ${REFGENIESERVER_PID_FILE})" 2>/dev/null; then
        echo "  refgenieserver: RUNNING (PID $(cat ${REFGENIESERVER_PID_FILE}), port ${REFGENIESERVER_PORT})"
    else
        echo "  refgenieserver: NOT RUNNING"
    fi
}

case "$1" in
    start)
        echo "=== Verifying PEPATAC Test Environment ==="
        echo ""
        echo "Checking bulker..."
        check_bulker
        echo ""
        echo "Checking crate..."
        check_crate_cached
        echo ""
        echo "Checking tools..."
        check_tools
        echo ""
        echo "Starting services..."
        start_refgenieserver
        echo ""
        echo "Environment ready!"
        ;;
    stop)
        echo "=== Stopping test services ==="
        stop_refgenieserver
        ;;
    status)
        echo "=== PEPATAC Test Environment Status ==="
        echo ""
        check_bulker 2>/dev/null || echo "  bulker: NOT INSTALLED"
        check_crate_cached 2>/dev/null || echo "  Crate: NOT CACHED"
        echo ""
        echo "Tool availability:"
        check_tools 2>/dev/null || true
        echo ""
        echo "Services:"
        check_refgenieserver
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        echo ""
        echo "Environment variables:"
        echo "  PEPATAC_TEST_BULKER_CRATE            - Bulkers crate (default: bulker/pepatac:1.1.1)"
        echo "  PEPATAC_TEST_REFGENIESERVER_PORT     - Local server port (default: 8765)"
        echo "  PEPATAC_TEST_REFGENIE_DATA           - Local refgenie data dir (default: tests/data/refgenie)"
        exit 1
        ;;
esac
