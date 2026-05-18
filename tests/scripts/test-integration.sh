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
TESTS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

SERVICES_SCRIPT="$SCRIPT_DIR/services.sh"
# Full crate identifier including tag — `bulker exec` is strict about the
# tag (bare 'bulker/pepatac' resolves to 'bulker/pepatac:default' and goes
# hub-shopping). Must track the `version:` field in tests/bulker_manifest.yaml.
BULKER_CRATE="${PEPATAC_TEST_BULKER_CRATE:-bulker/pepatac:1.1.1}"

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

# Bootstrap test venv with refgenie if needed
VENV_DIR="$TESTS_DIR/.venv"
if [ ! -d "$VENV_DIR" ]; then
    echo -e "${YELLOW}Creating test venv at ${VENV_DIR}...${NC}"
    python3 -m venv "$VENV_DIR"
fi
if [ ! -f "$VENV_DIR/bin/refgenie" ]; then
    echo -e "${YELLOW}Installing refgenie into test venv...${NC}"
    "$VENV_DIR/bin/pip" install refgenie > /dev/null 2>&1 || echo -e "${RED}Failed to install refgenie${NC}"
fi
export PEPATAC_TEST_VENV="$VENV_DIR"

# Install crate from local manifest if not already exec-able. The earlier
# `bulker crate list | grep` check was format-sensitive: bulker prints
# crate and tag in separate whitespace-delimited columns, so a literal
# 'bulker/pepatac:1.1.1' grep never matches. Use `bulker exec -- true`
# instead — it directly tests what we care about (can we exec the crate?).
MANIFEST="$TESTS_DIR/bulker_manifest.yaml"
if ! bulker exec "${BULKER_CRATE}" -- true >/dev/null 2>&1; then
    if [ -f "$MANIFEST" ]; then
        echo -e "${YELLOW}Crate ${BULKER_CRATE} not exec-able. Installing from local manifest...${NC}"
        bulker crate install "$MANIFEST"
    else
        echo -e "${RED}ERROR: Crate ${BULKER_CRATE} not exec-able and no manifest at ${MANIFEST}${NC}"
        exit 1
    fi
fi

# Identify the python that has pepatac's runtime deps (pytest, pypiper,
# refgenconf, etc.) installed. We can't trust `command -v python3` alone
# -- on HPC where a `module load` fires AFTER `conda activate`, the
# module's PATH prepend can bury the conda env's bin/ behind a base
# install, so `python3` resolves to the base interpreter (no pytest)
# even when the user's conda-env prompt suggests otherwise.
#
# Strategy: walk a candidate list and pick the FIRST python that actually
# imports pytest. CONDA_PREFIX-based path is preferred, then PATH-based,
# then a few common conda layouts.
PYTHON_CANDIDATES=()
[ -n "$CONDA_PREFIX" ] && PYTHON_CANDIDATES+=("$CONDA_PREFIX/bin/python3")
[ -n "$VIRTUAL_ENV" ]  && PYTHON_CANDIDATES+=("$VIRTUAL_ENV/bin/python3")
PYTHON_CANDIDATES+=("$(command -v python3 2>/dev/null)")
PYTHON_CANDIDATES+=("$(command -v python 2>/dev/null)")

ACTIVE_PYTHON=""
for candidate in "${PYTHON_CANDIDATES[@]}"; do
    [ -z "$candidate" ] && continue
    [ -x "$candidate" ] || continue
    if "$candidate" -c "import pytest" >/dev/null 2>&1; then
        ACTIVE_PYTHON="$candidate"
        break
    fi
done

if [ -z "$ACTIVE_PYTHON" ]; then
    echo -e "${RED}ERROR: No python3 found with pytest installed. Tried:${NC}"
    for candidate in "${PYTHON_CANDIDATES[@]}"; do
        [ -n "$candidate" ] && echo "  - ${candidate}"
    done
    echo "Install pytest into your active conda/venv env: pip install pytest"
    exit 1
fi

# Verify environment
echo -e "${GREEN}Verifying test environment...${NC}"
"$SERVICES_SCRIPT" start

export BULKERCRATE="$BULKER_CRATE"
export RUN_INTEGRATION_TESTS=true

# Stop Python inside `bulker exec` (which is apptainer/singularity on HPC)
# from loading the host's user-site packages. By default apptainer mounts
# $HOME and Python auto-prepends ~/.local/lib/pythonX.Y/site-packages to
# sys.path, so a stale `pip install --user`-style package on the host can
# shadow the container's clean install (we hit this with an old MACS3
# 3.0.0b1 in ~/.local/ silently overriding the container's MACS3 3.0.3
# and crashing peak calling). Setting PYTHONNOUSERSITE=1 makes Python
# ignore user-site no matter what's in ~/.local/.
#
# IMPORTANT: apptainer/singularity does NOT pass host env vars through to
# the container by default -- it filters them at the container boundary.
# To force a var across, use the SINGULARITYENV_X / APPTAINERENV_X prefix
# convention (the var inside the container ends up as just X). Setting
# all three forms covers: parent process, singularity (older apptainer),
# and apptainer (current name).
export PYTHONNOUSERSITE=1
export SINGULARITYENV_PYTHONNOUSERSITE=1
export APPTAINERENV_PYTHONNOUSERSITE=1

# Same problem on the R side: apptainer's $HOME mount plus host
# R_LIBS_USER / R_LIBS / R_LIBS_SITE makes the container's R prefer
# host-built R packages over its own bundled ones. When the host packages
# were built against a different R version than the container's, package
# loading fails on ABI mismatches even though the container has the
# packages installed correctly. Override R_LIBS_USER so the container's R
# falls back to its bundled site-library.
export R_LIBS_USER=/dev/null
export SINGULARITYENV_R_LIBS_USER=/dev/null
export APPTAINERENV_R_LIBS_USER=/dev/null

# Enable local refgenieserver tests if --local was passed
if [ "$USE_LOCAL_SERVER" = true ]; then
    export RUN_LOCAL_REFGENIE_TESTS=true
    export PEPATAC_TEST_REFGENIESERVER_PORT="${PEPATAC_TEST_REFGENIESERVER_PORT:-8765}"
    echo -e "${GREEN}Using local refgenieserver on port ${PEPATAC_TEST_REFGENIESERVER_PORT}${NC}"
fi

echo -e "\n${GREEN}Running integration tests via bulker exec ${BULKER_CRATE}...${NC}"
echo "  Using python: ${ACTIVE_PYTHON}"
if [ "$USE_LOCAL_SERVER" = true ]; then
    echo "  Local refgenieserver: http://localhost:${PEPATAC_TEST_REFGENIESERVER_PORT}"
fi
echo ""

cd "$PROJECT_ROOT"

# Run pytest inside `bulker exec` so the crate's shim dir is on PATH for
# tool resolution (bowtie2, samtools, macs3, etc.), while pytest itself
# runs in the caller's python -- which already has pepatac's requirements.
#
# Default test target is the integration/ directory; user-supplied
# positional args (test file paths, -k filters, etc.) take precedence.
# Previously the script passed BOTH the default target AND $@, which
# could feed pytest two overlapping test roots and cause `tests/conftest.py`
# to be loaded twice (manifesting as duplicate pytest_addoption registration).
if [ $# -eq 0 ]; then
    PYTEST_TARGETS=("$TESTS_DIR/integration/")
else
    PYTEST_TARGETS=("$@")
fi

set +e
bulker exec "${BULKER_CRATE}" -- "${ACTIVE_PYTHON}" -m pytest -v "${PYTEST_TARGETS[@]}"
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
