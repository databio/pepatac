"""Integration test fixtures for PEPATAC pipeline.

These tests require:
- bulker crate databio/pepatac:1.0.13 loaded
- RUN_INTEGRATION_TESTS=true environment variable

Run via: tests/scripts/test-integration.sh
"""

import os
import sys
import shutil
import subprocess
import tempfile
import pytest

# Skip all integration tests unless explicitly enabled
pytestmark = pytest.mark.skipif(
    os.getenv("RUN_INTEGRATION_TESTS") != "true",
    reason="Integration tests disabled. Set RUN_INTEGRATION_TESTS=true to run.",
)

TESTS_DIR = os.path.dirname(os.path.dirname(__file__))
PROJECT_ROOT = os.path.dirname(TESTS_DIR)
PIPELINES_DIR = os.path.join(PROJECT_ROOT, "pipelines")
TOOLS_DIR = os.path.join(PROJECT_ROOT, "tools")
VENV_DIR = os.path.join(PROJECT_ROOT, ".venv")
REFGENIE = os.path.join(VENV_DIR, "bin", "refgenie")

# Add pipelines dir to path so we can import pepatac
sys.path.insert(0, PIPELINES_DIR)


@pytest.fixture(scope="session")
def project_root():
    """Path to the pepatac repo root."""
    return PROJECT_ROOT


@pytest.fixture(scope="session")
def pipelines_dir():
    """Path to the pipelines directory."""
    return PIPELINES_DIR


@pytest.fixture(scope="session")
def tools_dir():
    """Path to the tools directory."""
    return TOOLS_DIR


@pytest.fixture
def temp_outdir(tmp_path, keep_test_outputs):
    """Provide a temporary output directory for pipeline runs.

    If --keep-test-outputs is enabled, outputs are preserved in
    tests/test_outputs/ instead of tmp_path.
    """
    if keep_test_outputs:
        outdir_base = os.path.join(TESTS_DIR, "test_outputs", "pepatac_test_output")
        os.makedirs(outdir_base, exist_ok=True)
        return outdir_base
    else:
        outdir = tmp_path / "pepatac_test_output"
        outdir.mkdir()
        return str(outdir)


@pytest.fixture(scope="session")
def test_fastq_dir():
    """Path to test FASTQ files (examples/data)."""
    data_dir = os.path.join(PROJECT_ROOT, "examples", "data")
    if not os.path.isdir(data_dir):
        pytest.skip("Test data directory not found: examples/data/")
    return data_dir


@pytest.fixture(scope="session")
def microtest_dir():
    """Path to the microtest data repository.

    Looks in standard locations: sibling of pepatac repo, or ~/code/microtest.
    """
    candidates = [
        os.path.join(PROJECT_ROOT, "..", "microtest"),
        os.path.expanduser("~/code/microtest"),
    ]
    for path in candidates:
        if os.path.isdir(path):
            return os.path.realpath(path)
    pytest.skip(
        "microtest repo not found. Clone it: "
        "git clone https://github.com/databio/microtest.git"
    )


@pytest.fixture(scope="session")
def refgenie_config(test_output_factory):
    """Set up a shared refgenie environment with genome assets.

    Pulls fasta, bowtie2_index, and bwa_index for hg38_chr22.
    Shared across test_end_to_end.py and test_looper_run.py.
    """
    if not os.path.isfile(REFGENIE):
        pytest.skip(
            f"refgenie not found at {REFGENIE}. "
            f"Run: python3 -m venv {VENV_DIR} && {VENV_DIR}/bin/pip install refgenie"
        )

    genome_dir = str(test_output_factory("refgenie"))
    config_path = os.path.join(genome_dir, "genome_config.yaml")

    # Initialize refgenie
    subprocess.run(
        [REFGENIE, "init", "-c", config_path, "-s", "http://refgenomes.databio.org"],
        capture_output=True, text=True, timeout=30,
    )
    assert os.path.isfile(config_path), f"refgenie init failed"

    # Pull genome assets (all assets needed by any test)
    needed_assets = ["fasta", "bowtie2_index", "bwa_index"]
    for asset in needed_assets:
        result = subprocess.run(
            [REFGENIE, "pull", f"hg38_chr22/{asset}", "--no-large", "-c", config_path],
            capture_output=True, text=True, timeout=300,
        )
        if result.returncode != 0:
            pytest.fail(
                f"refgenie pull hg38_chr22/{asset} failed (rc={result.returncode}):\n"
                f"{result.stderr[-2000:]}"
            )

    return config_path
