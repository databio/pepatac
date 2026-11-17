#!/usr/bin/env bash
#
# Audit refgenconf / refgenie surface area in this repo.
# Used by the refgenie1 migration plan to enumerate every place that needs
# to change. Runs from the repo root.
#
# Categories assigned per hit (best-effort):
#   (a) Python import / call site
#   (b) Pipeline interface declaration
#   (c) Documentation
#   (d) Example config
#   (e) Test fixture / test code
#   (f) Requirements / setup
#   (g) Other (logs, caches, README, etc.)

set -euo pipefail

cd "$(dirname "$0")/.."

PATTERN='refgenconf|RefGenConf|looper_refgenie_populate|REFGENIE'

echo "=== Audit: refgenconf surface area ==="
echo "pattern: ${PATTERN}"
echo

grep -rnE "${PATTERN}" \
    --include='*.py' \
    --include='*.yaml' \
    --include='*.yml' \
    --include='*.txt' \
    --include='*.toml' \
    --include='*.md' \
    --exclude-dir='.venv' \
    --exclude-dir='tests/.venv' \
    --exclude-dir='.git' \
    --exclude-dir='node_modules' \
    --exclude-dir='__pycache__' \
    --exclude-dir='build' \
    --exclude-dir='dist' \
    .
