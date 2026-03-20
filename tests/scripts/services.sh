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

# Refgenieserver configuration
REFGENIESERVER_PORT="${PEPATAC_TEST_REFGENIESERVER_PORT:-8765}"
REFGENIESERVER_PID_FILE="/tmp/refgenieserver-pepatac-test.pid"
TEST_DATA_DIR="${PEPATAC_TEST_REFGENIE_DATA:-${PROJECT_ROOT}/tests/data/refgenie}"
REFGENIE_CONFIG="${TEST_DATA_DIR}/archive/genome_config.yaml"
REFGENIESERVER="${PROJECT_ROOT}/.venv/bin/refgenieserver"

check_bulker() {
    if ! command -v bulker &>/dev/null; then
        echo "ERROR: bulker is not installed."
        return 1
    fi
    echo "  bulker: $(bulker --version 2>&1 | head -1)"
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
        echo ""
        echo "Services:"
        check_refgenieserver
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        echo ""
        echo "Environment variables:"
        echo "  PEPATAC_TEST_REFGENIESERVER_PORT     - Local server port (default: 8765)"
        echo "  PEPATAC_TEST_REFGENIE_DATA           - Local refgenie data dir (default: tests/data/refgenie)"
        exit 1
        ;;
esac
