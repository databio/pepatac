"""Tests for the Python summarizer module."""

import pytest
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).parent.parent / "tools"))

from pepatac_summarizer.assets import create_assets_summary
from pepatac_summarizer.consensus import collapse_peaks, parse_narrowpeak_line


@pytest.fixture
def sample_results(tmp_path):
    """Create a minimal sample results structure."""
    sample_dir = tmp_path / "sample1"
    aligned_dir = sample_dir / "aligned_hg38"
    peak_dir = sample_dir / "peak_calling_hg38"
    qc_dir = sample_dir / "QC_hg38"

    aligned_dir.mkdir(parents=True)
    peak_dir.mkdir(parents=True)
    qc_dir.mkdir(parents=True)

    (aligned_dir / "sample1_sort_dedup.bam").touch()
    (aligned_dir / "sample1_sort_dedup.bam.bai").touch()
    (aligned_dir / "sample1_smooth_shift.bw").touch()

    peak_content = "chr1\t1000\t2000\tpeak1\t100\t.\t50.0\t10.0\t5.0\t500\n"
    (peak_dir / "sample1_peaks_normalized.narrowPeak").write_text(peak_content)

    preseq_content = "TOTAL_READS\tEXPECTED_DISTINCT\n1000000\t800000\n2000000\t1500000\n"
    (qc_dir / "sample1_preseq_yield.txt").write_text(preseq_content)

    # pepatac.py records the resolved reference assets here and appends, so a
    # re-run of the sample repeats every row verbatim.
    rows = (
        "chrom_sizes\t/genomes/hg38/fasta/default/hg38.chrom.sizes\tPEPATAC\n"
        "genome_config\t/genomes/genomes.yaml\tPEPATAC\n"
        "fasta\t/genomes/hg38/fasta/default/hg38.fa\tPEPATAC\n"
        "genome\thg38\tPEPATAC\n"
    )
    (sample_dir / "assets.tsv").write_text(rows + rows)

    return tmp_path


def test_create_assets_summary(sample_results):
    """Test assets summary generation."""
    assets = create_assets_summary(["sample1"], str(sample_results))

    assert not assets.empty
    assert list(assets.columns) == ["sample_name", "asset", "path", "annotation"]
    assert "sample1" in assets["sample_name"].values

    # reference assets come from assets.tsv, not from globbing outputs
    assert {"chrom_sizes", "genome_config", "fasta", "genome"} <= set(assets["asset"])

    # the re-run's repeated rows collapse to one each
    chrom_sizes = assets.loc[assets["asset"] == "chrom_sizes", "path"].tolist()
    assert chrom_sizes == ["/genomes/hg38/fasta/default/hg38.chrom.sizes"]
    assert len(assets) == 4
    assert (assets["annotation"] == "PEPATAC").all()


def test_create_assets_summary_missing_file(tmp_path):
    """Samples without an assets.tsv are skipped with a warning."""
    (tmp_path / "sample1").mkdir()

    with pytest.warns(UserWarning, match="missing for 1 samples"):
        assets = create_assets_summary(["sample1"], str(tmp_path))

    assert assets.empty
    assert list(assets.columns) == ["sample_name", "asset", "path", "annotation"]


def test_parse_narrowpeak_line():
    """Test narrowPeak line parsing."""
    line = "chr1\t1000\t2000\tpeak1\t100\t.\t50.0\t10.0\t5.0\t500"
    chrom, start, end, name, score, rest = parse_narrowpeak_line(line)

    assert chrom == "chr1"
    assert start == 1000
    assert end == 2000
    assert name == "peak1"
    assert score == 100.0


def test_collapse_peaks_single_file(sample_results):
    """Test collapse with single file returns empty (need 2+ samples)."""
    peak_file = sample_results / "sample1" / "peak_calling_hg38" / "sample1_peaks_normalized.narrowPeak"
    chrom_sizes = {"chr1": 248956422}

    result = collapse_peaks(
        [str(peak_file)], ["sample1"], chrom_sizes,
        min_samples=2, min_score=5.0, min_olap=1
    )
    assert len(result) == 0


def test_collapse_peaks_two_overlapping(tmp_path):
    """Test consensus with two overlapping peak files."""
    peak1 = tmp_path / "sample1.narrowPeak"
    peak2 = tmp_path / "sample2.narrowPeak"

    peak1.write_text("chr1\t1000\t2000\tpeak1\t100\t.\t50.0\t10.0\t5.0\t500\n")
    peak2.write_text("chr1\t1050\t2050\tpeak2\t80\t.\t40.0\t8.0\t4.0\t500\n")

    chrom_sizes = {"chr1": 248956422}

    result = collapse_peaks(
        [str(peak1), str(peak2)], ["sample1", "sample2"], chrom_sizes,
        min_samples=2, min_score=5.0, min_olap=1
    )

    assert len(result) == 1
    # Best score should be 100
    assert "100" in result[0]


def test_collapse_peaks_non_overlapping(tmp_path):
    """Test that non-overlapping peaks don't merge."""
    peak1 = tmp_path / "sample1.narrowPeak"
    peak2 = tmp_path / "sample2.narrowPeak"

    peak1.write_text("chr1\t1000\t2000\tpeak1\t100\t.\t50.0\t10.0\t5.0\t500\n")
    peak2.write_text("chr1\t5000\t6000\tpeak2\t80\t.\t40.0\t8.0\t4.0\t500\n")

    chrom_sizes = {"chr1": 248956422}

    result = collapse_peaks(
        [str(peak1), str(peak2)], ["sample1", "sample2"], chrom_sizes,
        min_samples=2, min_score=5.0, min_olap=1
    )

    assert len(result) == 0


def test_collapse_peaks_min_score_filter(tmp_path):
    """Test min_score filtering."""
    peak1 = tmp_path / "sample1.narrowPeak"
    peak2 = tmp_path / "sample2.narrowPeak"

    peak1.write_text("chr1\t1000\t2000\tpeak1\t3\t.\t50.0\t10.0\t5.0\t500\n")
    peak2.write_text("chr1\t1050\t2050\tpeak2\t3\t.\t40.0\t8.0\t4.0\t500\n")

    chrom_sizes = {"chr1": 248956422}

    result = collapse_peaks(
        [str(peak1), str(peak2)], ["sample1", "sample2"], chrom_sizes,
        min_samples=2, min_score=5.0, min_olap=1
    )

    assert len(result) == 0
