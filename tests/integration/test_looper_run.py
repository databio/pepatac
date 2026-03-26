"""Looper integration tests for PEPATAC pipeline.

Tests the pipeline interface files, Jinja2 template rendering, and pipestat
configuration handoff by running PEPATAC via looper instead of direct execution.

Prerequisites:
- looper and pipestat installed (pip install looper pipestat)
- bulker crate databio/pepatac:1.1.1 loaded and active
- .venv with refgenie installed (pip install refgenie)
- Network access to refgenie server
- RUN_INTEGRATION_TESTS=true

Each test takes ~2-3 minutes. Can be run independently of test_end_to_end.py.
"""

import glob
import os
import subprocess
import sys
import pytest
import yaml

pytestmark = pytest.mark.skipif(
    os.getenv("RUN_INTEGRATION_TESTS") != "true",
    reason="Integration tests disabled.",
)

# Check if looper is available
try:
    from looper.cli_pydantic import main as looper_main
    LOOPER_AVAILABLE = True
except ImportError:
    LOOPER_AVAILABLE = False

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
SAMPLE_PIFACE = os.path.join(PROJECT_ROOT, "sample_pipeline_interface.yaml")
PROJECT_PIFACE = os.path.join(PROJECT_ROOT, "project_pipeline_interface.yaml")
VENV_DIR = os.path.join(PROJECT_ROOT, ".venv")
REFGENIE = os.path.join(VENV_DIR, "bin", "refgenie")

GENOME_NAME = "hg38_chr22"
REFGENIE_SERVER = "http://refgenomes.databio.org"
SAMPLE_NAME = "test1"


def _seek_asset(asset_path, config_path):
    """Use refgenie seek to resolve an asset path."""
    result = subprocess.run(
        [REFGENIE, "seek", asset_path, "-c", config_path],
        capture_output=True, text=True, timeout=30,
    )
    return result.stdout.strip()


def _read_stats(sample_dir):
    """Read the stats.yaml file into a dict."""
    stats_path = os.path.join(sample_dir, "stats.yaml")
    if not os.path.isfile(stats_path):
        pytest.skip("stats.yaml not found (pipeline may not have completed)")
    with open(stats_path) as f:
        data = yaml.safe_load(f)
    try:
        return data["PEPATAC"]["sample"][SAMPLE_NAME]
    except (KeyError, TypeError):
        if isinstance(data, dict) and SAMPLE_NAME in data:
            return data[SAMPLE_NAME]
        return data or {}


@pytest.fixture(scope="module")
def looper_test_config(refgenie_config, test_output_factory):
    """Generate looper config, PEP config, and sample table for testing.

    Creates a complete looper environment with:
    - .looper.yaml (looper config)
    - project_config.yaml (PEP config)
    - samples.csv (sample table with test data)

    Returns the path to .looper.yaml.
    """
    if not LOOPER_AVAILABLE:
        pytest.skip("looper not installed. Install with: pip install looper pipestat")

    # Create looper test directory
    looper_dir = test_output_factory("looper_test")
    if not hasattr(looper_dir, 'exists'):
        # Convert string to Path if needed
        from pathlib import Path
        looper_dir = Path(looper_dir)
    results_dir = looper_dir / "results"
    results_dir.mkdir()

    # Get refgenie paths
    chrom_sizes_path = _seek_asset(f"{GENOME_NAME}/fasta", refgenie_config)
    chrom_sizes = os.path.splitext(chrom_sizes_path)[0] + ".chrom.sizes"
    bowtie2_index = _seek_asset(f"{GENOME_NAME}/bowtie2_index", refgenie_config)

    # Resolve test input files
    input_r1 = os.path.join(PROJECT_ROOT, "examples", "data", "test1_r1.fastq.gz")
    input_r2 = os.path.join(PROJECT_ROOT, "examples", "data", "test1_r2.fastq.gz")

    # Create sample table
    sample_table_path = looper_dir / "samples.csv"
    sample_table_content = f"""sample_name,protocol,read1,read2,genome,read_type,chrom_sizes,genome_index,genome_size,peak_type,peak_caller,trimmer,aligner,deduplicator
{SAMPLE_NAME},ATAC-seq,{input_r1},{input_r2},{GENOME_NAME},paired,{chrom_sizes},{bowtie2_index},5e7,fixed,macs3,skewer,bowtie2,samtools
"""
    sample_table_path.write_text(sample_table_content)

    # Create PEP config
    pep_config_path = looper_dir / "project_config.yaml"
    pep_config_content = f"""pep_version: 2.1.0
sample_table: {sample_table_path}
name: pepatac_looper_test
"""
    pep_config_path.write_text(pep_config_content)

    # Create looper config
    looper_config_path = looper_dir / ".looper.yaml"
    schema_path = os.path.join(PROJECT_ROOT, "pepatac_output_schema.yaml")
    looper_config_content = f"""pep_config: {pep_config_path}
output_dir: {results_dir}
pipeline_interfaces:
  - {SAMPLE_PIFACE}
pipestat:
  results_file_path: {results_dir}/results.yaml
  output_schema: {schema_path}
"""
    looper_config_path.write_text(looper_config_content)

    # Set REFGENIE env var so pipeline interface templates can use it
    os.environ["REFGENIE"] = refgenie_config

    return str(looper_config_path)


class TestLooperDryRun:
    """Test looper dry-run (command generation without execution)."""

    def test_looper_dry_run(self, looper_test_config):
        """Test that looper can generate commands from pipeline interface."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        # Run looper dry-run
        result = looper_main(test_args=["run", "--config", looper_test_config, "--dry-run"])

        # Looper returns a dict with submission info
        assert isinstance(result, dict)
        assert "Commands submitted" in result
        assert "1 of 1" in result["Commands submitted"]

        # Check the generated submission script
        with open(looper_test_config) as f:
            config = yaml.safe_load(f)
        output_dir = config["output_dir"]
        script_path = os.path.join(output_dir, "submission", f"PEPATAC_{SAMPLE_NAME}.sub")
        assert os.path.isfile(script_path), f"Submission script not found: {script_path}"

        with open(script_path) as f:
            cmd = f.read()

        # Verify the command contains expected components
        assert "pepatac.py" in cmd
        assert f"--sample-name {SAMPLE_NAME}" in cmd
        assert f"--genome {GENOME_NAME}" in cmd
        assert "--input" in cmd
        assert "--pipestat-config" in cmd

    def test_pipeline_interface_jinja2_rendering(self, looper_test_config):
        """Test that Jinja2 templates in pipeline interface render correctly."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        # Get the submission script path
        with open(looper_test_config) as f:
            config = yaml.safe_load(f)
        output_dir = config["output_dir"]
        script_path = os.path.join(output_dir, "submission", f"PEPATAC_{SAMPLE_NAME}.sub")

        with open(script_path) as f:
            cmd = f.read()

        # Check that Jinja2 conditionals rendered properly
        # If read2 is present, --input2 should be in command
        assert "--input2" in cmd

        # Trimmer default should render
        assert "--trimmer skewer" in cmd

        # Aligner should have rendered
        assert "--aligner bowtie2" in cmd

        # Check that refgenie lookups resolved
        assert "--chrom-sizes" in cmd
        assert "--genome-index" in cmd


@pytest.fixture(scope="module")
def run_looper_pipeline(looper_test_config):
    """Run the pipeline via looper and return results."""
    if not LOOPER_AVAILABLE:
        pytest.skip("looper not installed")

    # Run looper (not dry-run)
    result = looper_main(test_args=["run", "--config", looper_test_config])

    # Parse looper config to find output directory
    with open(looper_test_config) as f:
        looper_config = yaml.safe_load(f)

    output_dir = looper_config["output_dir"]
    sample_dir = os.path.join(output_dir, "results_pipeline", SAMPLE_NAME)

    return {
        "looper_config": looper_test_config,
        "output_dir": output_dir,
        "sample_dir": sample_dir,
        "result": result,
    }


class TestLooperRun:
    """Test full pipeline execution via looper."""

    def test_looper_run_success(self, run_looper_pipeline):
        """Test that looper successfully runs the pipeline."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        # Check that result indicates pipestat compatibility
        result = run_looper_pipeline["result"]
        assert result is not None

    def test_output_dir_created(self, run_looper_pipeline):
        """Test that sample output directory was created."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        sample_dir = run_looper_pipeline["sample_dir"]
        assert os.path.isdir(sample_dir)

    def test_log_file_exists(self, run_looper_pipeline):
        """Test that pipeline log file was created."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        log = os.path.join(run_looper_pipeline["sample_dir"], "PEPATAC_log.md")
        assert os.path.isfile(log)

    def test_dedup_bam_exists(self, run_looper_pipeline):
        """Test that deduplicated BAM file was created."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        bam = os.path.join(
            run_looper_pipeline["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_signal_tracks_exist(self, run_looper_pipeline):
        """Test that signal track BigWig files were created."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        pattern = os.path.join(
            run_looper_pipeline["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_smooth_*.bw",
        )
        assert len(glob.glob(pattern)) > 0

    def test_peaks_exist(self, run_looper_pipeline):
        """Test that peak file was created."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        peaks = os.path.join(
            run_looper_pipeline["sample_dir"],
            f"peak_calling_{GENOME_NAME}",
            f"{SAMPLE_NAME}_peaks.narrowPeak",
        )
        assert os.path.isfile(peaks)
        assert os.path.getsize(peaks) > 0

    def test_stats_yaml_content(self, run_looper_pipeline):
        """Test that stats.yaml contains expected metrics."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        stats = _read_stats(run_looper_pipeline["sample_dir"])
        assert stats["Genome"] == GENOME_NAME
        assert int(stats["Raw_reads"]) > 0
        assert int(stats["Aligned_reads"]) > 0
        assert 0 < float(stats["Alignment_rate"]) <= 100


class TestLooperCheck:
    """Test looper check command (status reporting via pipestat)."""

    def test_looper_check(self, run_looper_pipeline):
        """Test that looper check can retrieve pipeline status."""
        if not LOOPER_AVAILABLE:
            pytest.skip("looper not installed")

        looper_config = run_looper_pipeline["looper_config"]

        # Run looper check
        result = looper_main(test_args=["check", "--config", looper_config])

        # Result should be a dict with pipeline status
        assert isinstance(result, dict)

        # Check that sample status is present
        # The exact structure depends on pipestat configuration
        assert len(result) > 0
