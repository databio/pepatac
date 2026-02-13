#!/bin/bash
# Install development versions of refgenie tools into the PEPATAC test venv.
# Run from PEPATAC project root.
#
# This installs editable versions of refgenconf, refgenie, and refgenieserver
# from the refgenie workspace. Install order matters: refgenconf first (no
# pepkit deps), then refgenie, then server.
#
# Usage:
#   ./tests/scripts/install-dev-refgenie.sh
#
# Environment variables:
#   REFGENIE_DEV_WORKSPACE  Path to refgenie workspace repos dir
#                           (default: /home/nsheff/Dropbox/workspaces/refgenie/repos)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
VENV_DIR="${PROJECT_ROOT}/.venv"
PIP="${VENV_DIR}/bin/pip"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Dev repo locations (can be overridden via environment)
REFGENIE_WORKSPACE="${REFGENIE_DEV_WORKSPACE:-/home/nsheff/Dropbox/workspaces/refgenie/repos}"
REFGENCONF_PATH="${REFGENIE_WORKSPACE}/refgenconf"
REFGENIE_PATH="${REFGENIE_WORKSPACE}/refgenie"
REFGENIESERVER_PATH="${REFGENIE_WORKSPACE}/refgenieserver"

echo -e "${GREEN}=== Installing Dev Refgenie Tools ===${NC}"

# Check venv exists
if [ ! -f "${PIP}" ]; then
    echo -e "${RED}ERROR: pip not found at ${PIP}${NC}"
    echo "  Create venv: python3 -m venv ${VENV_DIR}"
    exit 1
fi

# Check dev repos exist
for repo_path in "${REFGENCONF_PATH}" "${REFGENIE_PATH}" "${REFGENIESERVER_PATH}"; do
    if [ ! -d "${repo_path}" ]; then
        echo -e "${RED}ERROR: Dev repo not found at ${repo_path}${NC}"
        echo "  Set REFGENIE_DEV_WORKSPACE to the directory containing refgenconf, refgenie, refgenieserver"
        exit 1
    fi
done

# Install order matters: refgenconf first (no pepkit deps), then refgenie, then server
echo -e "${YELLOW}Installing refgenconf from: ${REFGENCONF_PATH}${NC}"
"${PIP}" install -e "${REFGENCONF_PATH}" > /dev/null 2>&1

echo -e "${YELLOW}Installing refgenie from: ${REFGENIE_PATH}${NC}"
"${PIP}" install -e "${REFGENIE_PATH}" > /dev/null 2>&1

echo -e "${YELLOW}Installing refgenieserver from: ${REFGENIESERVER_PATH}${NC}"
"${PIP}" install -e "${REFGENIESERVER_PATH}" > /dev/null 2>&1

echo ""
echo -e "${GREEN}Installed dev refgenie tools:${NC}"
"${PIP}" show refgenconf refgenie refgenieserver 2>/dev/null | grep -E "^(Name|Version|Location):"

echo ""
echo -e "${GREEN}Done!${NC}"
