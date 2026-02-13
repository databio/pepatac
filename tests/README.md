
# PEPATAC Tests

## Unit Tests

Run the existing unit tests (command builder tests) with:

```bash
pytest tests/test_build_command.py -v
```

## Integration Tests

Integration tests verify the pipeline's argument parsing, tool resolution, PEP config loading, schema validation, and bioinformatics tool availability via bulker.

### Prerequisites

1. **bulker** installed and configured: `pip install bulker`
2. **PEPATAC bulker crate** loaded: `bulker load databio/pepatac:1.0.13 -r`
3. **microtest** repo cloned (for config loading tests): `git clone https://github.com/databio/microtest.git ~/code/microtest`

### Running integration tests

```bash
./tests/scripts/test-integration.sh
```

This script:
1. Verifies the bulker crate is loaded and tools are available
2. Activates the bulker crate (adds containerized tools to PATH)
3. Sets `RUN_INTEGRATION_TESTS=true`
4. Runs `pytest tests/integration/ -v`

#### Preserving test outputs for debugging

By default, test outputs are written to temporary directories that pytest cleans up automatically. To preserve outputs for debugging test failures, use the `--keep-test-outputs` flag:

```bash
./tests/scripts/test-integration.sh --keep-test-outputs
```

This writes all test outputs to `tests/test_outputs/` (gitignored) instead of temp directories. The directory is cleared at the start of each test run. Useful for inspecting pipeline outputs, logs, and intermediate files when debugging failed tests.

### Running specific tests

```bash
./tests/scripts/test-integration.sh -k "test_help_flag"
./tests/scripts/test-integration.sh -k "TestBulkerToolAvailability"
```

### Test categories

| Class | What it tests | File |
|-------|---------------|------|
| `TestArgumentParsing` | Pipeline `--help` flag and version output | `test_integration.py` |
| `TestToolResolution` | `tool_path()` and `check_commands()` functions | `test_integration.py` |
| `TestPepConfigLoading` | PEP configs load correctly with peppy | `test_integration.py` |
| `TestSchemaValidation` | Configs validate against input/output schemas with eido | `test_integration.py` |
| `TestBulkerToolAvailability` | Required bioinformatics tools are callable via bulker | `test_integration.py` |
| `TestPipelineExecution` | Pipeline runs to completion on test data | `test_integration.py` |
| `TestOutputDirectoryStructure` | Expected output directories are created | `test_integration.py` |
| `TestOutputFiles` | Key output files (BAM, peaks, BigWig, stats) are produced | `test_integration.py` |
| `TestStatsContent` | Stats file contains expected metrics with valid values | `test_integration.py` |
| `TestLooperDryRun` | Looper command generation and Jinja2 template rendering | `test_looper_run.py` |
| `TestLooperRun` | Full pipeline execution via looper with pipestat | `test_looper_run.py` |
| `TestLooperCheck` | Looper status reporting via pipestat | `test_looper_run.py` |

### End-to-end test (`test_end_to_end.py`)

The end-to-end test runs the full PEPATAC pipeline across 3 configurations:

| Config | Aligner | Peak Caller | Deduplicator | Trimmer | Peak Type |
|--------|---------|-------------|--------------|---------|-----------|
| bowtie2_macs3_skewer | bowtie2 | macs3 | samtools | skewer | fixed |
| bwa_macs3_samblaster | bwa | macs3 | samblaster | skewer | variable |
| bowtie2_genrich_samblaster | bowtie2 | genrich | samblaster | skewer | variable |

It creates a temporary refgenie environment, pulls `hg38_chr22` genome assets (fasta, bowtie2_index, bwa_index) from the refgenie server, runs the pipeline on `examples/data/test1` reads, and verifies output files (BAM, peaks, BigWig, stats).

**Key details:**
- Uses refgenie 0.12.1 from pip (installed in project `.venv`)
- Local bulker manifest at `tests/bulker_manifest.yaml` (self-contained, gtars 0.6.0)
- Requires network access (refgenie asset pulls) and Docker (bulker crate)
- 23 tests total, runs in ~3 minutes with warm Docker cache

To run only the fast tests:
```bash
./tests/scripts/test-integration.sh --ignore=tests/integration/test_end_to_end.py
```

To run only the end-to-end test:
```bash
./tests/scripts/test-integration.sh -k "test_end_to_end"
```

### Looper integration tests (`test_looper_run.py`)

The looper integration tests verify that PEPATAC works correctly when run via looper instead of direct execution. These tests validate:

- Pipeline interface Jinja2 template rendering
- Pipestat configuration handoff
- Looper command generation (dry-run)
- Full pipeline execution via looper
- Status reporting via looper check

**Prerequisites:**
- looper and pipestat installed: `pip install looper pipestat`
- Same bulker/refgenie setup as end-to-end tests

**To install dev versions of looper/pipestat:**
```bash
INSTALL_DEV_LOOPER=true ./tests/scripts/test-integration.sh -k "test_looper"
```

The script will look for looper/pipestat repos in standard locations (sibling directories or `~/code/`), or fall back to PyPI.

**To run only looper tests:**
```bash
./tests/scripts/test-integration.sh -k "test_looper"
```

**What's tested:**

| Test | What it checks |
|------|----------------|
| `test_looper_dry_run` | Looper generates valid commands from pipeline interface |
| `test_pipeline_interface_jinja2_rendering` | Jinja2 conditionals and refgenie lookups render correctly |
| `test_looper_run_success` | Pipeline completes successfully via looper |
| `test_output_dir_created` | Sample output directory is created |
| `test_log_file_exists` | Pipeline log file is generated |
| `test_sorted_bam_exists` | Sorted BAM file is produced |
| `test_dedup_bam_exists` | Deduplicated BAM file is produced |
| `test_signal_tracks_exist` | Signal track BigWig files are produced |
| `test_peaks_exist` | Peak file is generated |
| `test_stats_yaml_content` | Stats file contains valid metrics |
| `test_looper_check` | Looper can retrieve pipeline status via pipestat |

These tests use the same refgenie fixture as `test_end_to_end.py`, so genome assets are shared.

### Dev refgenie testing (`test_local_refgenieserver.py`)

Tests PEPATAC with development versions of the refgenie tool stack (refgenconf, refgenie, refgenieserver) using a local refgenieserver instead of the remote server. Useful for catching breaking changes in refgenie tools before release.

#### Quick start

```bash
# 1. Install dev refgenie tools into the PEPATAC .venv
./tests/scripts/install-dev-refgenie.sh

# 2. Seed local test genome data (one-time)
./tests/scripts/seed-local-refgenie.sh

# 3. Start services (bulker + local refgenieserver)
./tests/scripts/services.sh start

# 4. Run tests with local server
./tests/scripts/test-integration.sh --local
```

#### Scripts

| Script | Purpose |
|--------|---------|
| `install-dev-refgenie.sh` | Installs editable versions of refgenconf, refgenie, and refgenieserver from the refgenie workspace into `.venv`. Override workspace location with `REFGENIE_DEV_WORKSPACE=/path/to/repos` |
| `seed-local-refgenie.sh` | Downloads `hg38_chr22` test genome assets and runs `refgenieserver archive` to prepare them for local serving. One-time setup. |
| `services.sh` | Manages bulker crate and local refgenieserver (`start`, `stop`, `status`). Server is optional - tests work without it. |

#### Tests

| Test | What it checks |
|------|----------------|
| `test_server_responds` | Local refgenieserver is running |
| `test_genome_available` | Test genome is available on local server |
| `test_fasta_asset_available` | Fasta asset is servable |
| `test_refgenie_version` | Dev refgenie is installed |
| `test_refgenie_pull_from_local` | Assets pull from local server |
| `test_seek_fasta` | Fasta asset path resolution |
| `test_seek_bowtie2_index` | Bowtie2 index path resolution |
| `test_pipeline_with_local_assets` | Full pipeline run with locally-served assets |

#### Environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| `REFGENIE_DEV_WORKSPACE` | `/home/nsheff/Dropbox/workspaces/refgenie/repos` | Path to refgenie workspace repos dir |
| `PEPATAC_TEST_REFGENIESERVER_PORT` | `8765` | Port for local refgenieserver |
| `PEPATAC_TEST_REFGENIE_DATA` | `tests/data/refgenie` | Local refgenie test data directory |
| `RUN_LOCAL_REFGENIE_TESTS` | (unset) | Set to `true` to enable local server tests |

#### Troubleshooting

**refgenieserver fails to start:**
- Check that assets are archived: `refgenieserver archive -c tests/data/refgenie/genome_config.yaml --force`
- Check port is free: `lsof -i :8765`
- Try a different port: `PEPATAC_TEST_REFGENIESERVER_PORT=9876 ./tests/scripts/services.sh start`

**refgenie pull fails from local server:**
- Verify server is running: `curl http://localhost:8765/v3/genomes/list`
- Check server logs in the terminal where `services.sh start` was run

**Tests skip with "Local refgenieserver tests disabled":**
- Use `--local` flag: `./tests/scripts/test-integration.sh --local`
- Or set manually: `RUN_LOCAL_REFGENIE_TESTS=true pytest tests/integration/test_local_refgenieserver.py`

### Environment gating

Integration tests are **skipped by default** when running `pytest` normally. They only run when `RUN_INTEGRATION_TESTS=true` is set, which the `test-integration.sh` script handles automatically. Local refgenieserver tests require `RUN_LOCAL_REFGENIE_TESTS=true` (set by `--local` flag).

### Checking environment without running tests

```bash
./tests/scripts/services.sh status
```

## Basic MicroTests

#### Execution time should be less than 5 minutes.

This test assumes you've pulled the microtest repository and that it is parallel with the pepatac folder.
`https://github.com/databio/microtest.git`

Navigate to this folder and run:

`looper run -c .looper_microtest_basic.yaml`

For a 2nd set of options, run:

`looper run -c .looper_microtest_basic_02.yaml`

For the 2nd test, you will need to set the paths to the picard and trimmomatic jar files:
`export PICARD=/picard-2.27.5-0/picard.jar`
`export TRIMMOMATIC=/trimmomatic-0.39-2/trimmomatic.jar`
