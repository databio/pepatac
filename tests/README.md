
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

## Running tests in an HPC environment

PEPATAC's tests target a developer machine by default. HPC nodes
(SLURM-managed, container runtime is Singularity/Apptainer instead of
Docker, modules layered on top of conda) introduce a handful of
gotchas. Most are already handled in `tests/scripts/test-integration.sh`;
collected here so the next person picking up the test suite on HPC
doesn't have to re-discover them.

### Container runtime: Singularity / Apptainer instead of Docker

`bulker` auto-detects the container runtime available on the host. On
HPC nodes that's typically `apptainer` (or older `singularity`) instead
of Docker; no extra config needed on bulker's side. The script's host-env
hardening (next sections) is what differs between the two runtimes.

### Active python may not be on `$PATH` first

A subsequent `module load <foo>` after `conda activate <env>` can push
the env's `bin/` behind the module's PATH prepend, so `command -v
python3` resolves to a Python that doesn't have the test deps. The
script tries `$CONDA_PREFIX/bin/python3`, `$VIRTUAL_ENV/bin/python3`,
and PATH-based candidates in order, picking the first one that imports
`pytest`. You shouldn't have to set anything for this -- if the
banner shows the wrong python, that's a real bug.

### Host user-site leaks into containers

By default apptainer/singularity mounts `$HOME` into the container, so
Python and R *inside* the container see the *host's* `~/.local/lib/...`
(Python user-site) and `~/.Renviron`/`~/.Rprofile` (R user config). A
stale `pip install --user <pkg>` or `R_LIBS_USER` setting on the host
silently shadows the container's matching package and, if built against
a different runtime version, crashes on ABI mismatch.

The script defends against this by exporting the appropriate "no
user-site" env var **plus the apptainer-prefixed alias** so it crosses
the container boundary:

```bash
export PYTHONNOUSERSITE=1
export SINGULARITYENV_PYTHONNOUSERSITE=1
export APPTAINERENV_PYTHONNOUSERSITE=1

export R_LIBS_USER=/dev/null
export R_ENVIRON_USER=/dev/null
export R_PROFILE_USER=/dev/null
export SINGULARITYENV_R_LIBS_USER=/dev/null
export SINGULARITYENV_R_ENVIRON_USER=/dev/null
export SINGULARITYENV_R_PROFILE_USER=/dev/null
export APPTAINERENV_R_LIBS_USER=/dev/null
export APPTAINERENV_R_ENVIRON_USER=/dev/null
export APPTAINERENV_R_PROFILE_USER=/dev/null
```

R is trickier than Python: `R_LIBS_USER` alone is not enough because R
sources `~/.Renviron` *after* reading existing env vars, so any
`R_LIBS_USER` set there silently overrides the one we passed in. Block
the user config files with `R_ENVIRON_USER=/dev/null` and
`R_PROFILE_USER=/dev/null` as well.

If you hit "package or namespace load failed" in R or "module not
found" / "No such file or directory" in Python *despite* the package
being installed in the container, suspect a host leak.

### Looper compute package: don't inherit the system `$DIVCFG`

Looper integration fixtures call `looper run` without specifying a
compute package. On HPC nodes with `$DIVCFG` pointing at a SLURM-defaulting
divvy config, that defaults to `sbatch` submission with whatever
partition/account combo the divcfg specifies -- usually one the test
user doesn't have access to. Always pass `-p local` to fixtures running
the pipeline in tests (matches the pattern in
`tests/integration/test_looper_run.py::run_looper_pipeline`).

### C++ runtime ABI mismatch (`GLIBCXX_*` errors)

Compiled Python wheels (e.g. matplotlib's `_c_internal_utils.so`)
built against a newer libstdc++ won't load on RHEL/Rocky HPC nodes
whose `/lib64/libstdc++.so.6` is older. The conda env almost certainly
ships a newer `libstdc++.so.6` under `$CONDA_PREFIX/lib/`; force its
use by prepending the env's lib dir to `LD_LIBRARY_PATH`. The
integration runner already does this and propagates it through the
apptainer boundary:

```bash
export LD_LIBRARY_PATH="$CONDA_PREFIX/lib:$LD_LIBRARY_PATH"
export SINGULARITYENV_LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
export APPTAINERENV_LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
```

For ad-hoc test runs outside the runner (e.g. running the summarizer
tests directly), the first export alone is usually enough:

```bash
LD_LIBRARY_PATH="$CONDA_PREFIX/lib:$LD_LIBRARY_PATH" \
    "$CONDA_PREFIX/bin/python3" -m pytest tests/test_summarizer.py -v
```

Verify the env has a sufficient `libstdc++`:

```bash
strings "$CONDA_PREFIX"/lib/libstdc++.so.6 | grep GLIBCXX_3.4.<NN>
```

(replace `<NN>` with the version the failing extension demands; the
error message tells you which.) If the conda env's `libstdc++` is
also too old, `conda install -n <env> -c conda-forge libstdcxx-ng`.

### Pipestat dep coordination

Newer pipestat (≥0.13.0) permits shared schema keys across `samples:`
and `project:` blocks, which matters for `Time` and `Success`. Older
pipestat (0.12.x) raises `SchemaError: Overlap between project- and
sample-level keys` on the same schema. Newer pipestat also pulls in a
newer `yacman` that requires `refgenconf>=0.13.1` to import. Coordinated
upgrade: bump pipestat and refgenconf together in the env you run tests
in. `requirements.txt` pins `refgenconf>=0.13.1`; if your env is older
than that, upgrade before running tests.
