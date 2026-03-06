#!/bin/bash
# Test Services Management Script for PEPATAC
# Manages bulker crate activation and local refgenieserver for integration tests.
#
# PEPATAC integration tests need bioinformatics tools available via bulker,
# and optionally a local refgenieserver for dev testing without network access.
#
# Usage:
#   ./scripts/services.sh start    # Verify bulker crate and start refgenieserver
#   ./scripts/services.sh stop     # Stop refgenieserver
#   ./scripts/services.sh status   # Show crate, tool, and server status

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Bulker crate configuration
BULKER_CRATE="${PEPATAC_TEST_BULKER_CRATE:-databio/pepatac:1.0.14}"

# Required tools for basic pipeline execution
REQUIRED_TOOLS=(bowtie2 samtools macs3 skewer samblaster bedtools)

# Refgenieserver configuration
REFGENIESERVER_PORT="${PEPATAC_TEST_REFGENIESERVER_PORT:-8765}"
REFGENIESERVER_PID_FILE="/tmp/refgenieserver-pepatac-test.pid"
TEST_DATA_DIR="${PEPATAC_TEST_REFGENIE_DATA:-${PROJECT_ROOT}/tests/data/refgenie}"
REFGENIE_CONFIG="${TEST_DATA_DIR}/archive/genome_config.yaml"
REFGENIESERVER="${PROJECT_ROOT}/.venv/bin/refgenieserver"

# Export for child processes
export PEPATAC_TEST_BULKER_CRATE="$BULKER_CRATE"

check_bulker() {
    if ! command -v bulker &>/dev/null; then
        echo "ERROR: bulker is not installed. Install with: pip install bulker"
        return 1
    fi
    echo "  bulker: $(bulker --version 2>&1 | head -1)"
}

check_crate_loaded() {
    if ! bulker list 2>/dev/null | grep -q "${BULKER_CRATE}"; then
        echo "ERROR: Bulker crate ${BULKER_CRATE} is not loaded."
        echo "  Load it with: bulker load ${BULKER_CRATE} -r"
        return 1
    fi
    echo "  Crate loaded: ${BULKER_CRATE}"
}

check_tools() {
    local crate_path
    crate_path=$(bulker list 2>/dev/null | grep "${BULKER_CRATE}" | sed 's/.* -- //')
    local missing=()

    for tool in "${REQUIRED_TOOLS[@]}"; do
        if [ -x "${crate_path}/${tool}" ]; then
            echo "  ${tool}: OK"
        else
            echo "  ${tool}: MISSING"
            missing+=("$tool")
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        echo "WARNING: Missing tools: ${missing[*]}"
        echo "  These tools may not be available in the crate."
        return 1
    fi
}

get_bulker_path() {
    # Output the PATH export needed to activate the bulker crate
    bulker activate "${BULKER_CRATE}" -e 2>/dev/null | grep "^export PATH=" || true
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
        check_crate_loaded
        echo ""
        echo "Checking tools..."
        check_tools
        echo ""
        echo "Starting services..."
        start_refgenieserver
        echo ""
        echo "Environment ready!"
        echo ""
        echo "To activate manually:"
        echo "  bulker activate ${BULKER_CRATE}"
        ;;
    stop)
        echo "=== Stopping test services ==="
        stop_refgenieserver
        ;;
    status)
        echo "=== PEPATAC Test Environment Status ==="
        echo ""
        check_bulker 2>/dev/null || echo "  bulker: NOT INSTALLED"
        check_crate_loaded 2>/dev/null || echo "  Crate: NOT LOADED"
        echo ""
        echo "Tool availability:"
        check_tools 2>/dev/null || true
        echo ""
        echo "Services:"
        check_refgenieserver
        ;;
    path)
        # Internal: output the bulker PATH for use by test-integration.sh
        get_bulker_path
        ;;
    *)
        echo "Usage: $0 {start|stop|status|path}"
        echo ""
        echo "Environment variables:"
        echo "  PEPATAC_TEST_BULKER_CRATE            - Bulker crate (default: databio/pepatac:1.0.14)"
        echo "  PEPATAC_TEST_REFGENIESERVER_PORT     - Local server port (default: 8765)"
        echo "  PEPATAC_TEST_REFGENIE_DATA           - Local refgenie data dir (default: tests/data/refgenie)"
        exit 1
        ;;
esac
