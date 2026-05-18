
# PEPATAC Tests

There are two ways to test PEPATAC:

## 1. Unit tests

No setup required. Run from the project root:

```bash
pytest tests/ --ignore=tests/integration -v
```

## 2. Integration tests

Integration tests verify pipeline execution with real bioinformatics tools via bulker containers.

### Prerequisites

- **bulker** installed: `cargo install bulker`
- A container runtime that bulker can dispatch to:
  - **Docker** (typical on developer machines), or
  - **Singularity** / **Apptainer** (typical on HPC). Bulker auto-detects.

Everything else (venv, refgenie, crate) is bootstrapped automatically by the script.

### Running

```bash
./tests/scripts/test-integration.sh
```

The script automatically:
1. Creates `tests/.venv` and installs refgenie if needed
2. Installs the bulker crate from the local manifest if not cached
3. Verifies bulker tools are available
4. Sets `RUN_INTEGRATION_TESTS=true`
5. Runs `pytest tests/integration/ -v`

### Options

```bash
# Run specific tests
./tests/scripts/test-integration.sh -k "test_help_flag"

# Preserve outputs for debugging (writes to tests/test_outputs/)
./tests/scripts/test-integration.sh --keep-test-outputs

# Skip slow end-to-end tests
./tests/scripts/test-integration.sh --ignore=tests/integration/test_end_to_end.py

# Install dev looper/pipestat from local repos
INSTALL_DEV_LOOPER=true ./tests/scripts/test-integration.sh

# Use local refgenieserver instead of remote
./tests/scripts/test-integration.sh --local
```

### Test categories

| File | Tests |
|------|-------|
| `test_integration.py` | Argument parsing, tool resolution, PEP config loading, schema validation, bulker tool availability, pipeline execution, output validation |
| `test_end_to_end.py` | Full pipeline across 3 aligner/peak-caller configurations with refgenie assets |
| `test_looper_run.py` | Pipeline execution via looper, Jinja2 template rendering, pipestat integration |
| `test_local_refgenieserver.py` | Tests with dev refgenie tools and local server (requires `--local` flag) |

### Helper scripts

| Script | Purpose |
|--------|---------|
| `scripts/services.sh` | Manage bulker crate and local refgenieserver (`start`, `stop`, `status`) |
| `scripts/install-dev-refgenie.sh` | Install editable refgenie tools from the refgenie workspace into `tests/.venv` |
| `scripts/seed-local-refgenie.sh` | Download test genome assets and prepare them for local serving |

### Environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PEPATAC_TEST_BULKER_CRATE` | `databio/pepatac:1.1.3` | Full crate identifier (most recent published tag on hub.bulker.io — `bulker exec` requires an exact tag match) |
| `PEPATAC_TEST_REFGENIESERVER_PORT` | `8765` | Local refgenieserver port |
| `PEPATAC_TEST_REFGENIE_DATA` | `tests/data/refgenie` | Local refgenie test data directory |
| `REFGENIE_DEV_WORKSPACE` | `/home/nsheff/Dropbox/workspaces/refgenie/repos` | Path to refgenie dev repos |
| `INSTALL_DEV_LOOPER` | (unset) | Set to `true` to install dev looper/pipestat |
