#!/bin/bash
# Seed a local refgenie configuration with test genome assets.
# These assets will be served by a local refgenieserver instance.
#
# This script:
# 1. Initializes a local refgenie config in the test directory
# 2. Pulls the hg38_chr22 assets from the remote server (one-time setup)
# 3. Runs `refgenieserver archive` to prepare the assets for local serving
#
# Usage:
#   ./tests/scripts/seed-local-refgenie.sh
#
# Environment variables:
#   PEPATAC_TEST_REFGENIE_DATA  Path to local refgenie test data
#                                (default: tests/data/refgenie)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
VENV_DIR="${PROJECT_ROOT}/.venv"
REFGENIE="${VENV_DIR}/bin/refgenie"
REFGENIESERVER="${VENV_DIR}/bin/refgenieserver"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Local test data directory
TEST_DATA_DIR="${PEPATAC_TEST_REFGENIE_DATA:-${PROJECT_ROOT}/tests/data/refgenie}"
CONFIG_PATH="${TEST_DATA_DIR}/genome_config.yaml"

GENOME_NAME="hg38_chr22"
REMOTE_SERVER="http://refgenomes.databio.org"
ASSETS_TO_PULL="fasta bowtie2_index bwa_index"

echo -e "${GREEN}=== Seeding Local Refgenie Test Data ===${NC}"

# Check tools exist
if [ ! -f "${REFGENIE}" ]; then
    echo -e "${RED}ERROR: refgenie not found at ${REFGENIE}${NC}"
    echo "  Install with: ${VENV_DIR}/bin/pip install refgenie"
    echo "  Or run: ./tests/scripts/install-dev-refgenie.sh"
    exit 1
fi

if [ ! -f "${REFGENIESERVER}" ]; then
    echo -e "${RED}ERROR: refgenieserver not found at ${REFGENIESERVER}${NC}"
    echo "  Install with: ${VENV_DIR}/bin/pip install refgenieserver"
    echo "  Or run: ./tests/scripts/install-dev-refgenie.sh"
    exit 1
fi

mkdir -p "${TEST_DATA_DIR}"

# Initialize config if not exists
if [ ! -f "${CONFIG_PATH}" ]; then
    echo -e "${YELLOW}Initializing refgenie config...${NC}"
    "${REFGENIE}" init -c "${CONFIG_PATH}" -s "${REMOTE_SERVER}"

    # Add genome_archive_folder for refgenieserver
    ARCHIVE_DIR="${TEST_DATA_DIR}/archive"
    mkdir -p "${ARCHIVE_DIR}"
    echo -e "${YELLOW}Adding genome_archive_folder to config...${NC}"
    # Append archive folder to the config
    echo "genome_archive_folder: ${ARCHIVE_DIR}" >> "${CONFIG_PATH}"
fi

# Pull needed assets from remote (one-time)
for asset in ${ASSETS_TO_PULL}; do
    if ! "${REFGENIE}" list -c "${CONFIG_PATH}" 2>/dev/null | grep -q "${GENOME_NAME}/${asset}"; then
        echo -e "${YELLOW}Pulling ${GENOME_NAME}/${asset}...${NC}"
        "${REFGENIE}" pull "${GENOME_NAME}/${asset}" -c "${CONFIG_PATH}" --no-large
    else
        echo -e "${GREEN}${GENOME_NAME}/${asset} already present${NC}"
    fi
done

# Archive assets for serving
echo -e "${YELLOW}Archiving assets for local serving...${NC}"
"${REFGENIESERVER}" archive -c "${CONFIG_PATH}" --force

echo ""
echo -e "${GREEN}Local refgenie test data seeded at: ${TEST_DATA_DIR}${NC}"
echo "Config: ${CONFIG_PATH}"
