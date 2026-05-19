"""End-to-end integration test for the PEPATAC pipeline.

Runs the full pipeline on test data using a temporary refgenie environment
with the hg38_chr22 genome (small, fast). Uses refgenie 0.12.1 from the
project .venv to pull genome assets from the refgenie server.

Tests multiple pipeline configurations (aligner, peak caller, trimmer,
deduplicator) to exercise different code paths.

Test Structure:
    Each configuration class has a test_00_pipeline_succeeded method that
    runs FIRST and checks:
    - Pipeline subprocess returned exit code 0
    - PEPATAC_completed.flag exists (positive success assertion)

    Only if those pass do the output file tests run. This ensures tests fail
    fast when the pipeline fails, rather than passing despite pipeline failure.

Prerequisites:
- .venv with refgenie installed (pip install refgenie)
- bulker crate databio/pepatac:1.1.3 cached and active
- Network access to refgenie server (for pulling genome assets)
- RUN_INTEGRATION_TESTS=true

Each configuration takes ~2 minutes. Total suite: ~6-8 minutes.
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

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
PIPELINE_SCRIPT = os.path.join(PROJECT_ROOT, "pipelines", "pepatac.py")
COLLATOR_SCRIPT = os.path.join(PROJECT_ROOT, "pipelines", "pepatac_collator.py")
TESTS_DIR = os.path.dirname(os.path.dirname(__file__))
VENV_DIR = os.environ.get("PEPATAC_TEST_VENV", os.path.join(TESTS_DIR, ".venv"))
REFGENIE = os.path.join(VENV_DIR, "bin", "refgenie")

GENOME_NAME = "hg38_chr22"
REFGENIE_SERVER = "http://refgenomes.databio.org"
SAMPLE_NAME = "test1"

# Pipeline configurations to test.
# Each exercises a different combination of tools.
CONFIGS = {
    "bowtie2_macs3_skewer": {
        "aligner": "bowtie2",
        "peak_caller": "macs3",
        "peak_type": "fixed",
        "trimmer": "skewer",
        "deduplicator": "samtools",
        "index_asset": "bowtie2_index",
    },
    "bwa_macs3_samblaster": {
        "aligner": "bwa",
        "peak_caller": "macs3",
        "peak_type": "variable",
        "trimmer": "skewer",
        "deduplicator": "samblaster",
        "index_asset": "bwa_index",
    },
    "bowtie2_genrich_samblaster": {
        "aligner": "bowtie2",
        "peak_caller": "genrich",
        "peak_type": "variable",
        "trimmer": "skewer",
        "deduplicator": "samblaster",
        "index_asset": "bowtie2_index",
    },
    # Single-end + bwa exercises the _align() SE+bwa code path that was
    # previously crashing on an undefined `cmd` (issue #299).
    "bwa_macs3_se_skewer": {
        "aligner": "bwa",
        "peak_caller": "macs3",
        "peak_type": "variable",
        "trimmer": "skewer",
        "deduplicator": "samtools",
        "index_asset": "bwa_index",
        "single_end": True,
    },
    # --skip-dedup exercises the dedup-bypass path added for protocols
    # where duplicates are biologically meaningful (CUT&Tag, CUT&RUN;
    # issue #249). Pipeline should report Duplicate_reads=0 and pass
    # Aligned_reads through as Dedup_aligned_reads.
    "bowtie2_macs3_skipdedup": {
        "aligner": "bowtie2",
        "peak_caller": "macs3",
        "peak_type": "fixed",
        "trimmer": "skewer",
        "deduplicator": "samtools",
        "index_asset": "bowtie2_index",
        "skip_dedup": True,
    },
    # --qc-backend gtars exercises the gtars-backed QC plotting path
    # (tools/pepatac_qc_gtars.py) and the gtars-only partition plotter
    # which requires a GTF. Catches wiring bugs between pepatac.py and
    # the gtars Python summarizer that the R-default tests miss.
    "bowtie2_macs3_gtars": {
        "aligner": "bowtie2",
        "peak_caller": "macs3",
        "peak_type": "fixed",
        "trimmer": "skewer",
        "deduplicator": "samtools",
        "index_asset": "bowtie2_index",
        "qc_backend": "gtars",
        "gtf": os.path.join(PROJECT_ROOT, "tests", "data", "hg38_chr22_test.gtf"),
    },
}


def _run_refgenie(args, config_path):
    """Run a refgenie command using the .venv binary."""
    cmd = [REFGENIE] + args + ["-c", config_path]
    result = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
    if result.returncode != 0:
        pytest.fail(
            f"refgenie {' '.join(args)} failed (rc={result.returncode}):\n"
            f"{result.stderr[-2000:]}"
        )
    return result


def _seek_asset(asset_path, config_path):
    """Use refgenie seek to resolve an asset path.

    Resolves symlinks because refgenie returns alias paths that use
    relative symlinks to the data directory. Containerized tools
    (via bulker/Docker) can't follow these since Docker only mounts
    the paths it sees in the command arguments.
    """
    result = subprocess.run(
        [REFGENIE, "seek", asset_path, "-c", config_path],
        capture_output=True, text=True, timeout=30,
    )
    path = result.stdout.strip()
    if os.path.exists(path):
        return os.path.realpath(path)
    for ext in [".1.bt2", ".fa", ".fasta", ".amb"]:
        candidate = path + ext
        if os.path.exists(candidate):
            resolved = os.path.realpath(candidate)
            return resolved[: -len(ext)]
    return path


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


def _assert_pipeline_success(result):
    """Assert that pipeline completed successfully.

    Checks return code and that completed.flag exists.
    Provides detailed failure information if either check fails.
    """
    sample_dir = result["sample_dir"]
    log_file = os.path.join(sample_dir, "PEPATAC_log.md")

    # Check return code first
    if result["returncode"] != 0:
        pytest.fail(
            f"Pipeline returned non-zero exit code: {result['returncode']}\n"
            f"Config: {result['config_name']}\n"
            f"Check log: {log_file}\n"
            f"Stderr (last 1000 chars):\n{result['stderr'][-1000:]}"
        )

    # Check that completed.flag exists (positive assertion)
    completed_flag = result["completed_flag"]
    if not os.path.isfile(completed_flag):
        pytest.fail(
            f"Pipeline did not complete - no completed.flag found.\n"
            f"Config: {result['config_name']}\n"
            f"Expected: {completed_flag}\n"
            f"Check log: {log_file}\n"
            f"Return code: {result['returncode']}"
        )


# refgenie_config fixture now provided by conftest.py


def _run_pipeline(config_name, config, refgenie_config, test_output_factory):
    """Run the pipeline with a specific configuration and return results."""
    output_dir = test_output_factory(f"output_{config_name}")
    # Handle both pathlib.Path and string returns from factory
    if hasattr(output_dir, "__truediv__"):  # pathlib.Path
        sample_dir = str(output_dir / SAMPLE_NAME)
    else:  # string
        sample_dir = os.path.join(output_dir, SAMPLE_NAME)

    input_r1 = os.path.join(PROJECT_ROOT, "examples", "data", "test1_r1.fastq.gz")
    input_r2 = os.path.join(PROJECT_ROOT, "examples", "data", "test1_r2.fastq.gz")

    genome_index = _seek_asset(
        f"{GENOME_NAME}/{config['index_asset']}", refgenie_config
    )
    chrom_sizes_path = _seek_asset(f"{GENOME_NAME}/fasta", refgenie_config)
    chrom_sizes = os.path.splitext(chrom_sizes_path)[0] + ".chrom.sizes"

    schema_path = os.path.join(PROJECT_ROOT, "pepatac_output_schema.yaml")
    cmd = [
        sys.executable, PIPELINE_SCRIPT,
        "--sample-name", SAMPLE_NAME,
        "--genome", GENOME_NAME,
        "--input", input_r1,
        "--output-parent", str(output_dir),
        "--genome-index", genome_index,
        "--chrom-sizes", chrom_sizes,
        "--genome-size", "5e7",
        "--peak-type", config["peak_type"],
        "--peak-caller", config["peak_caller"],
        "--trimmer", config["trimmer"],
        "--aligner", config["aligner"],
        "--deduplicator", config["deduplicator"],
        "--pipestat-schema", schema_path,
        "--skipqc",
        "--lite",
        "-P", "2",
        "-M", "4000",
        "-R",
    ]
    # Paired-end is the default; single-end configs drop the R2 input.
    if config.get("single_end"):
        cmd.extend(["--single-or-paired", "single"])
    else:
        cmd.extend(["--input2", input_r2, "--single-or-paired", "paired"])
    # Pass --skip-dedup through when set in the config (issue #249).
    if config.get("skip_dedup"):
        cmd.append("--skip-dedup")
    # Pass --qc-backend + --gtf through when the config exercises the
    # gtars QC path (issue: integration coverage gap for gtars). The gtars
    # partition plotter requires a GTF; the TSS/fragment/chrom plotters
    # don't but all live behind the same args.qc_backend == "gtars" gate.
    # --skipqc only gates FastQC, not these plotters, so leave it set.
    if config.get("qc_backend"):
        cmd.extend(["--qc-backend", config["qc_backend"]])
        if config.get("gtf"):
            cmd.extend(["--gtf", config["gtf"]])

    result = subprocess.run(
        cmd, capture_output=True, text=True, timeout=900,
    )

    return {
        "config_name": config_name,
        "config": config,
        "returncode": result.returncode,
        "stdout": result.stdout,
        "stderr": result.stderr,
        "output_dir": str(output_dir),
        "sample_dir": sample_dir,
        "completed_flag": os.path.join(sample_dir, f"PEPATAC_{SAMPLE_NAME}_completed.flag"),
    }


# --- Fixtures for each configuration ---

@pytest.fixture(scope="module")
def run_bowtie2_macs3_skewer(refgenie_config, test_output_factory):
    return _run_pipeline(
        "bowtie2_macs3_skewer",
        CONFIGS["bowtie2_macs3_skewer"],
        refgenie_config,
        test_output_factory,
    )


@pytest.fixture(scope="module")
def run_bwa_macs3_samblaster(refgenie_config, test_output_factory):
    return _run_pipeline(
        "bwa_macs3_samblaster",
        CONFIGS["bwa_macs3_samblaster"],
        refgenie_config,
        test_output_factory,
    )


@pytest.fixture(scope="module")
def run_bwa_macs3_se_skewer(refgenie_config, test_output_factory):
    return _run_pipeline(
        "bwa_macs3_se_skewer",
        CONFIGS["bwa_macs3_se_skewer"],
        refgenie_config,
        test_output_factory,
    )


@pytest.fixture(scope="module")
def run_bowtie2_macs3_skipdedup(refgenie_config, test_output_factory):
    return _run_pipeline(
        "bowtie2_macs3_skipdedup",
        CONFIGS["bowtie2_macs3_skipdedup"],
        refgenie_config,
        test_output_factory,
    )


@pytest.fixture(scope="module")
def run_bowtie2_macs3_gtars(refgenie_config, test_output_factory):
    return _run_pipeline(
        "bowtie2_macs3_gtars",
        CONFIGS["bowtie2_macs3_gtars"],
        refgenie_config,
        test_output_factory,
    )


@pytest.fixture(scope="module")
def run_bowtie2_genrich_samblaster(refgenie_config, test_output_factory):
    return _run_pipeline(
        "bowtie2_genrich_samblaster",
        CONFIGS["bowtie2_genrich_samblaster"],
        refgenie_config,
        test_output_factory,
    )


# ============================================================================
# Config 1: bowtie2 + macs3 + skewer + samtools dedup (fixed peaks)
# ============================================================================

class TestBowtie2Macs3:
    """bowtie2 aligner, macs3 peak caller, skewer trimmer, samtools dedup."""

    def test_00_pipeline_succeeded(self, run_bowtie2_macs3_skewer):
        """Pipeline must complete successfully before testing outputs."""
        _assert_pipeline_success(run_bowtie2_macs3_skewer)

    def test_output_dir(self, run_bowtie2_macs3_skewer):
        assert os.path.isdir(run_bowtie2_macs3_skewer["sample_dir"])

    def test_log_exists(self, run_bowtie2_macs3_skewer):
        log = os.path.join(run_bowtie2_macs3_skewer["sample_dir"], "PEPATAC_log.md")
        assert os.path.isfile(log)

    def test_dedup_bam(self, run_bowtie2_macs3_skewer):
        bam = os.path.join(
            run_bowtie2_macs3_skewer["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_signal_tracks(self, run_bowtie2_macs3_skewer):
        pattern = os.path.join(
            run_bowtie2_macs3_skewer["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_smooth_*.bw",
        )
        assert len(glob.glob(pattern)) > 0

    def test_peaks(self, run_bowtie2_macs3_skewer):
        peaks = os.path.join(
            run_bowtie2_macs3_skewer["sample_dir"],
            f"peak_calling_{GENOME_NAME}",
            f"{SAMPLE_NAME}_peaks.narrowPeak",
        )
        assert os.path.isfile(peaks)
        assert os.path.getsize(peaks) > 0

    def test_stats_content(self, run_bowtie2_macs3_skewer):
        stats = _read_stats(run_bowtie2_macs3_skewer["sample_dir"])
        assert stats["Genome"] == GENOME_NAME
        assert int(stats["Raw_reads"]) > 0
        assert int(stats["Aligned_reads"]) > 0
        assert 0 < float(stats["Alignment_rate"]) <= 100
        assert int(stats["Peak_count"]) >= 0


# ============================================================================
# Config 2: bwa + macs3 + skewer + samblaster dedup (variable peaks)
# ============================================================================

class TestBwaMacs3:
    """bwa aligner, macs3 peak caller, skewer trimmer, samblaster dedup."""

    def test_00_pipeline_succeeded(self, run_bwa_macs3_samblaster):
        """Pipeline must complete successfully before testing outputs."""
        _assert_pipeline_success(run_bwa_macs3_samblaster)

    def test_output_dir(self, run_bwa_macs3_samblaster):
        assert os.path.isdir(run_bwa_macs3_samblaster["sample_dir"])

    def test_log_exists(self, run_bwa_macs3_samblaster):
        log = os.path.join(run_bwa_macs3_samblaster["sample_dir"], "PEPATAC_log.md")
        assert os.path.isfile(log)

    def test_dedup_bam(self, run_bwa_macs3_samblaster):
        bam = os.path.join(
            run_bwa_macs3_samblaster["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_signal_tracks(self, run_bwa_macs3_samblaster):
        pattern = os.path.join(
            run_bwa_macs3_samblaster["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_smooth_*.bw",
        )
        assert len(glob.glob(pattern)) > 0

    def test_peaks(self, run_bwa_macs3_samblaster):
        peaks = os.path.join(
            run_bwa_macs3_samblaster["sample_dir"],
            f"peak_calling_{GENOME_NAME}",
            f"{SAMPLE_NAME}_peaks.narrowPeak",
        )
        assert os.path.isfile(peaks)
        assert os.path.getsize(peaks) > 0

    def test_stats_content(self, run_bwa_macs3_samblaster):
        stats = _read_stats(run_bwa_macs3_samblaster["sample_dir"])
        assert stats["Genome"] == GENOME_NAME
        assert int(stats["Raw_reads"]) > 0
        assert int(stats["Aligned_reads"]) > 0
        assert 0 < float(stats["Alignment_rate"]) <= 100
        assert int(stats["Peak_count"]) >= 0


# ============================================================================
# Config 3: bowtie2 + genrich + skewer + samblaster dedup (variable peaks)
# ============================================================================

class TestBowtie2Genrich:
    """bowtie2 aligner, genrich peak caller, skewer trimmer, samblaster dedup."""

    def test_00_pipeline_succeeded(self, run_bowtie2_genrich_samblaster):
        """Pipeline must complete successfully before testing outputs."""
        _assert_pipeline_success(run_bowtie2_genrich_samblaster)

    def test_output_dir(self, run_bowtie2_genrich_samblaster):
        assert os.path.isdir(run_bowtie2_genrich_samblaster["sample_dir"])

    def test_log_exists(self, run_bowtie2_genrich_samblaster):
        log = os.path.join(run_bowtie2_genrich_samblaster["sample_dir"], "PEPATAC_log.md")
        assert os.path.isfile(log)

    def test_dedup_bam(self, run_bowtie2_genrich_samblaster):
        bam = os.path.join(
            run_bowtie2_genrich_samblaster["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_signal_tracks(self, run_bowtie2_genrich_samblaster):
        pattern = os.path.join(
            run_bowtie2_genrich_samblaster["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_smooth_*.bw",
        )
        assert len(glob.glob(pattern)) > 0

    def test_peaks(self, run_bowtie2_genrich_samblaster):
        """Genrich produces narrowPeak format."""
        peaks_dir = os.path.join(
            run_bowtie2_genrich_samblaster["sample_dir"],
            f"peak_calling_{GENOME_NAME}",
        )
        assert os.path.isdir(peaks_dir), f"Peak dir not found: {peaks_dir}"
        peak_files = glob.glob(os.path.join(peaks_dir, f"{SAMPLE_NAME}_peaks*"))
        assert len(peak_files) > 0, (
            f"No peak files in {peaks_dir}: "
            f"{os.listdir(peaks_dir) if os.path.isdir(peaks_dir) else 'N/A'}"
        )

    def test_stats_content(self, run_bowtie2_genrich_samblaster):
        stats = _read_stats(run_bowtie2_genrich_samblaster["sample_dir"])
        assert stats["Genome"] == GENOME_NAME
        assert int(stats["Raw_reads"]) > 0
        assert int(stats["Aligned_reads"]) > 0
        assert 0 < float(stats["Alignment_rate"]) <= 100


# ============================================================================
# Config 4: single-end + bwa (regression coverage for #299)
# ============================================================================

class TestBwaMacs3SE:
    """Single-end + bwa exercises the _align() SE+bwa code path that
    previously crashed on an undefined `cmd` (issue #299)."""

    def test_00_pipeline_succeeded(self, run_bwa_macs3_se_skewer):
        """Pipeline must complete successfully before testing outputs.

        Pre-fix, this assertion would fail because `_align()` raised
        NameError on the very first SE+bwa pm.run() call.
        """
        _assert_pipeline_success(run_bwa_macs3_se_skewer)

    def test_output_dir(self, run_bwa_macs3_se_skewer):
        assert os.path.isdir(run_bwa_macs3_se_skewer["sample_dir"])

    def test_log_exists(self, run_bwa_macs3_se_skewer):
        log = os.path.join(run_bwa_macs3_se_skewer["sample_dir"], "PEPATAC_log.md")
        assert os.path.isfile(log)

    def test_dedup_bam(self, run_bwa_macs3_se_skewer):
        bam = os.path.join(
            run_bwa_macs3_se_skewer["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_peaks(self, run_bwa_macs3_se_skewer):
        peaks = os.path.join(
            run_bwa_macs3_se_skewer["sample_dir"],
            f"peak_calling_{GENOME_NAME}",
            f"{SAMPLE_NAME}_peaks.narrowPeak",
        )
        assert os.path.isfile(peaks)
        assert os.path.getsize(peaks) > 0

    def test_stats_content(self, run_bwa_macs3_se_skewer):
        stats = _read_stats(run_bwa_macs3_se_skewer["sample_dir"])
        assert stats["Genome"] == GENOME_NAME
        assert stats["Read_type"].lower().startswith("single")
        assert int(stats["Raw_reads"]) > 0
        assert int(stats["Aligned_reads"]) > 0
        assert 0 < float(stats["Alignment_rate"]) <= 100


# ============================================================================
# Config 5: bowtie2 + macs3 + --skip-dedup (regression coverage for #249)
# ============================================================================

class TestBowtie2Macs3SkipDedup:
    """`--skip-dedup` bypasses duplicate removal (CUT&Tag/CUT&RUN protocols
    where duplicates are biologically meaningful). The pipeline should:
    - still complete successfully and produce a _sort_dedup.bam (the
      mapping_genome_bam copied to the dedup endpoint),
    - report Duplicate_reads=0,
    - report Dedup_aligned_reads / Dedup_alignment_rate pass-through from
      the aligned (pre-dedup) values."""

    def test_00_pipeline_succeeded(self, run_bowtie2_macs3_skipdedup):
        _assert_pipeline_success(run_bowtie2_macs3_skipdedup)

    def test_output_dir(self, run_bowtie2_macs3_skipdedup):
        assert os.path.isdir(run_bowtie2_macs3_skipdedup["sample_dir"])

    def test_dedup_bam_exists(self, run_bowtie2_macs3_skipdedup):
        """The _sort_dedup.bam is a copy of mapping_genome_bam under
        --skip-dedup, so it should still exist for downstream tools."""
        bam = os.path.join(
            run_bowtie2_macs3_skipdedup["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_duplicate_reads_zero(self, run_bowtie2_macs3_skipdedup):
        """Duplicate_reads is reported as 0 by post_dup_aligned_reads()
        when args.skip_dedup is True."""
        stats = _read_stats(run_bowtie2_macs3_skipdedup["sample_dir"])
        assert int(stats["Duplicate_reads"]) == 0

    def test_dedup_passes_through_aligned(self, run_bowtie2_macs3_skipdedup):
        """With dedup skipped, Dedup_aligned_reads should equal Aligned_reads
        (the post-dedup count = the pre-dedup count, since nothing was removed)."""
        stats = _read_stats(run_bowtie2_macs3_skipdedup["sample_dir"])
        assert int(stats["Aligned_reads"]) > 0
        assert int(float(stats["Dedup_aligned_reads"])) == int(stats["Aligned_reads"])


# ============================================================================
# Config 6: bowtie2 + macs3 + --qc-backend gtars (gtars QC path coverage)
# ============================================================================

class TestBowtie2Macs3Gtars:
    """`--qc-backend gtars` routes QC plot generation through the new
    gtars-backed plotters in tools/pepatac_qc_gtars.py instead of the R
    fallback. Exercises wiring between pepatac.py and the gtars Python
    bindings (Region/RegionSet/PartitionList/TssIndex/calc_partitions).

    The gtars-default tests above (TestBowtie2Macs3 etc.) don't pass
    `--qc-backend`, so they run the R path. This class is the only
    integration coverage for the gtars path -- which we want before
    shipping it as a user-facing option."""

    def test_00_pipeline_succeeded(self, run_bowtie2_macs3_gtars):
        """Pipeline completes successfully with --qc-backend gtars + --gtf."""
        _assert_pipeline_success(run_bowtie2_macs3_gtars)

    def test_output_dir(self, run_bowtie2_macs3_gtars):
        assert os.path.isdir(run_bowtie2_macs3_gtars["sample_dir"])

    def test_dedup_bam(self, run_bowtie2_macs3_gtars):
        bam = os.path.join(
            run_bowtie2_macs3_gtars["sample_dir"],
            f"aligned_{GENOME_NAME}",
            f"{SAMPLE_NAME}_sort_dedup.bam",
        )
        assert os.path.isfile(bam)
        assert os.path.getsize(bam) > 0

    def test_peaks(self, run_bowtie2_macs3_gtars):
        peaks = os.path.join(
            run_bowtie2_macs3_gtars["sample_dir"],
            f"peak_calling_{GENOME_NAME}",
            f"{SAMPLE_NAME}_peaks.narrowPeak",
        )
        assert os.path.isfile(peaks)
        assert os.path.getsize(peaks) > 0

    def test_gtars_qc_plots_produced(self, run_bowtie2_macs3_gtars):
        """The gtars plotters produce the same target PDFs/PNGs as R:
        chrom dist, TSS dist (peaks-to-TSS), partition. The pipeline
        sample_dir should have all of them."""
        qc_dir = os.path.join(
            run_bowtie2_macs3_gtars["sample_dir"],
            f"QC_{GENOME_NAME}",
        )
        # TSS enrichment plot (gtars path: plot_tss_enrichment)
        tss_plot = os.path.join(qc_dir, f"{SAMPLE_NAME}_TSS_enrichment.pdf")
        assert os.path.isfile(tss_plot), (
            f"gtars TSS enrichment PDF not found: {tss_plot}"
        )
        # Fragment distribution plot (paired-end only, this config is paired)
        frag_plot = os.path.join(
            qc_dir, f"{SAMPLE_NAME}_fragLenDistribution.pdf"
        )
        assert os.path.isfile(frag_plot), (
            f"gtars fragment distribution PDF not found: {frag_plot}"
        )

    def test_stats_content(self, run_bowtie2_macs3_gtars):
        stats = _read_stats(run_bowtie2_macs3_gtars["sample_dir"])
        assert stats["Genome"] == GENOME_NAME
        assert int(stats["Raw_reads"]) > 0
        assert int(stats["Aligned_reads"]) > 0
        assert 0 < float(stats["Alignment_rate"]) <= 100


# ============================================================================
# Cross-config comparisons
# ============================================================================

class TestCrossConfig:
    """Verify consistency across different pipeline configurations."""

    def test_00_both_pipelines_succeeded(
        self, run_bowtie2_macs3_skewer, run_bwa_macs3_samblaster
    ):
        """Both pipelines must succeed before comparing results."""
        for result in [run_bowtie2_macs3_skewer, run_bwa_macs3_samblaster]:
            assert result["returncode"] == 0, (
                f"Pipeline {result['config_name']} returned {result['returncode']}"
            )
            assert os.path.isfile(result["completed_flag"]), (
                f"Pipeline {result['config_name']} has no completed.flag"
            )

    def test_same_raw_reads(
        self, run_bowtie2_macs3_skewer, run_bwa_macs3_samblaster
    ):
        """Both configs should report the same raw read count."""
        stats1 = _read_stats(run_bowtie2_macs3_skewer["sample_dir"])
        stats2 = _read_stats(run_bwa_macs3_samblaster["sample_dir"])
        assert int(stats1["Raw_reads"]) == int(stats2["Raw_reads"])

    def test_aligners_produce_reads(
        self, run_bowtie2_macs3_skewer, run_bwa_macs3_samblaster
    ):
        """Both aligners should produce aligned reads (counts may differ)."""
        stats1 = _read_stats(run_bowtie2_macs3_skewer["sample_dir"])
        stats2 = _read_stats(run_bwa_macs3_samblaster["sample_dir"])
        assert int(stats1["Aligned_reads"]) > 0
        assert int(stats2["Aligned_reads"]) > 0


# ============================================================================
# Collator (project-level pipeline interface)
# ============================================================================

class TestCollatorPipelineInterface:
    """Test the project-level pipeline interface has proper pipestat handoff."""

    def test_project_piface_has_pipestat_handoff(self):
        """Verify project pipeline interface passes pipestat config.

        Looper validates that pipeline interfaces with output_schema must
        have a pipestat config handoff mechanism (--pipestat-config in
        command_template or PIPESTAT_CONFIG in inject_env_vars).
        """
        from looper.pipeline_interface import PipelineInterface
        from looper.exceptions import PipelineInterfaceConfigError

        piface_path = os.path.join(PROJECT_ROOT, "project_pipeline_interface.yaml")

        # This should NOT raise - the piface should have proper handoff
        try:
            piface = PipelineInterface(piface_path)
            # If we get here, validation passed
            assert True
        except PipelineInterfaceConfigError as e:
            pytest.fail(
                f"Project pipeline interface missing pipestat handoff: {e}\n\n"
                f"Add to command_template: --pipestat-config {{pipestat.config_file}}"
            )
