#!/bin/bash
# Integration Test Runner for PEPATAC
# Activates the bulker crate, then runs pytest integration tests with
# bioinformatics tools available via containerized commands.
#
# Usage:
#   ./scripts/test-integration.sh                     # Run all integration tests
#   ./scripts/test-integration.sh --local              # Run with local refgenieserver
#   ./scripts/test-integration.sh -k "test_parse"      # Run specific tests
#   ./scripts/test-integration.sh --keep-test-outputs   # Preserve outputs in tests/test_outputs/

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TESTS_DIR="$SCRIPT_DIR/.."

SERVICES_SCRIPT="$SCRIPT_DIR/services.sh"
BULKER_MANIFEST="$TESTS_DIR/bulker_manifest.yaml"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Parse our custom flags before passing rest to pytest
USE_LOCAL_SERVER=false
PYTEST_ARGS=()
while [[ $# -gt 0 ]]; do
    case $1 in
        --local)
            USE_LOCAL_SERVER=true
            shift
            ;;
        *)
            PYTEST_ARGS+=("$1")
            shift
            ;;
    esac
done
# Restore positional parameters for pytest
set -- "${PYTEST_ARGS[@]}"

echo -e "${GREEN}=== PEPATAC Integration Tests ===${NC}"

# Optional: Install dev versions of looper/pipestat for looper integration tests
if [ "$INSTALL_DEV_LOOPER" = "true" ]; then
    echo -e "${YELLOW}Installing dev looper and pipestat...${NC}"

    # Check if looper repo is available (sibling or ~/code)
    LOOPER_REPO=""
    PIPESTAT_REPO=""

    if [ -d "$PROJECT_ROOT/../../looper" ]; then
        LOOPER_REPO="$(cd "$PROJECT_ROOT/../../looper" && pwd)"
    elif [ -d "$HOME/code/looper" ]; then
        LOOPER_REPO="$HOME/code/looper"
    fi

    if [ -d "$PROJECT_ROOT/../../pipestat" ]; then
        PIPESTAT_REPO="$(cd "$PROJECT_ROOT/../../pipestat" && pwd)"
    elif [ -d "$HOME/code/pipestat" ]; then
        PIPESTAT_REPO="$HOME/code/pipestat"
    fi

    if [ -n "$LOOPER_REPO" ]; then
        echo "  Installing looper from: $LOOPER_REPO"
        pip install -e "$LOOPER_REPO" > /dev/null 2>&1 || echo -e "${RED}Failed to install looper${NC}"
    else
        echo "  Installing looper from PyPI..."
        pip install looper > /dev/null 2>&1 || echo -e "${RED}Failed to install looper${NC}"
    fi

    if [ -n "$PIPESTAT_REPO" ]; then
        echo "  Installing pipestat from: $PIPESTAT_REPO"
        pip install -e "$PIPESTAT_REPO" > /dev/null 2>&1 || echo -e "${RED}Failed to install pipestat${NC}"
    else
        echo "  Installing pipestat from PyPI..."
        pip install pipestat > /dev/null 2>&1 || echo -e "${RED}Failed to install pipestat${NC}"
    fi
fi

# Verify environment
echo -e "${GREEN}Verifying test environment...${NC}"
"$SERVICES_SCRIPT" start

export RUN_INTEGRATION_TESTS=true

# Enable local refgenieserver tests if --local was passed
if [ "$USE_LOCAL_SERVER" = true ]; then
    export RUN_LOCAL_REFGENIE_TESTS=true
    export PEPATAC_TEST_REFGENIESERVER_PORT="${PEPATAC_TEST_REFGENIESERVER_PORT:-8765}"
    echo -e "${GREEN}Using local refgenieserver on port ${PEPATAC_TEST_REFGENIESERVER_PORT}${NC}"
fi

echo -e "\n${GREEN}Running integration tests...${NC}"
echo ""

cd "$PROJECT_ROOT"

# Activate bulker crate (prepends shims to PATH)
if command -v bulker &> /dev/null && [ -f "$BULKER_MANIFEST" ]; then
    echo -e "${GREEN}Activating bulker crate: $BULKER_MANIFEST${NC}"
    eval "$(bulker activate --echo "$BULKER_MANIFEST")"
else
    echo -e "${YELLOW}bulker not found; running tests without containerized tools (some may skip)${NC}"
fi

set +e
python3 -m pytest "$TESTS_DIR/integration/" -v "$@"
PYTEST_EXIT=$?
set -e

# Stop refgenieserver if we started it
if [ "$USE_LOCAL_SERVER" = true ]; then
    "$SERVICES_SCRIPT" stop 2>/dev/null || true
fi

if [ $PYTEST_EXIT -eq 0 ]; then
    echo -e "\n${GREEN}Integration tests completed successfully!${NC}"
else
    echo -e "\n${RED}Integration tests failed (exit code: ${PYTEST_EXIT})${NC}"
fi
exit $PYTEST_EXIT
