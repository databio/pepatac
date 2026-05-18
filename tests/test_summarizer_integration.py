"""Integration tests for the Python summarizer module with synthetic data."""

import pytest
import tempfile
from pathlib import Path
import sys
import yaml

sys.path.insert(0, str(Path(__file__).parent.parent / "tools"))

from pepatac_summarizer.assets import create_assets_summary
from pepatac_summarizer.consensus import calculate_consensus_peaks, collapse_peaks
from pepatac_summarizer.plots import plot_complexity_curves


@pytest.fixture
def multi_sample_project(tmp_path):
    """Create a minimal multi-sample project with synthetic PEPATAC outputs."""
    results_dir = tmp_path / "results"

    for i, sample in enumerate(["sample1", "sample2", "sample3"]):
        sample_dir = results_dir / sample
        aligned_dir = sample_dir / "aligned_hg38"
        peak_dir = sample_dir / "peak_calling_hg38"
        qc_dir = sample_dir / "QC_hg38"

        aligned_dir.mkdir(parents=True)
        peak_dir.mkdir(parents=True)
        qc_dir.mkdir(parents=True)

        (aligned_dir / f"{sample}_sort_dedup.bam").touch()
        (aligned_dir / f"{sample}_sort_dedup.bam.bai").touch()
        (aligned_dir / "hg38.chrom.sizes").write_text(
            "chr1\t248956422\nchr2\t242193529\nchr22\t50818468\n"
        )

        offset = i * 100
        peaks = [
            f"chr1\t{1000+offset}\t{2000+offset}\tpeak1\t{100-i*10}\t.\t50.0\t10.0\t5.0\t500",
            f"chr1\t{5000+offset}\t{6000+offset}\tpeak2\t{80-i*5}\t.\t40.0\t8.0\t4.0\t500",
            f"chr22\t{10000+offset}\t{11000+offset}\tpeak3\t{90-i*5}\t.\t45.0\t9.0\t4.5\t500",
        ]
        (peak_dir / f"{sample}_peaks_normalized.narrowPeak").write_text("\n".join(peaks) + "\n")

        preseq = "TOTAL_READS\tEXPECTED_DISTINCT\n"
        for j in range(1, 11):
            preseq += f"{j*1000000}\t{int(j*800000*(1-j*0.02))}\n"
        (qc_dir / f"{sample}_preseq_yield.txt").write_text(preseq)

        counts = f"V1\tV2\tV3\n{sample}\t{5000000+i*100000}\t{4000000+i*80000}\n"
        (qc_dir / f"{sample}_preseq_counts.txt").write_text(counts)

        (sample_dir / "stats.yaml").write_text(yaml.dump({
            "PEPATAC": {"sample": {sample: {"aligned_reads": 5000000}}}
        }))

    config_file = tmp_path / "project_config.yaml"
    sample_table_file = tmp_path / "samples.csv"

    sample_table_file.write_text(
        "sample_name,genome\nsample1,hg38\nsample2,hg38\nsample3,hg38\n"
    )

    config = {
        "name": "test_project",
        "pep_version": "2.1.0",
        "sample_table": str(sample_table_file),
    }
    config_file.write_text(yaml.dump(config))

    return {
        "config": str(config_file),
        "output": str(tmp_path),
        "results": str(results_dir),
        "tmp_path": tmp_path,
    }


def test_full_summarizer_pipeline(multi_sample_project):
    """Test complete summarizer pipeline with synthetic multi-sample project."""
    project = multi_sample_project
    summary_dir = Path(project["output"]) / "summary"

    sample_table = {
        "sample_name": ["sample1", "sample2", "sample3"],
        "genome": ["hg38", "hg38", "hg38"]
    }

    # Test assets
    assets = create_assets_summary(
        ["sample1", "sample2", "sample3"],
        project["results"]
    )
    assert not assets.empty
    assert len(assets) >= 9

    # Test consensus peaks
    consensus_files = calculate_consensus_peaks(
        sample_table,
        str(summary_dir),
        project["results"],
        "test_project",
        min_samples=2,
        min_score=5.0,
        min_olap=1
    )

    assert "hg38" in consensus_files
    with open(consensus_files["hg38"]) as f:
        lines = [l for l in f if l.strip()]
    assert len(lines) >= 1

    # Test plots
    plot_file = plot_complexity_curves(
        ["sample1", "sample2", "sample3"],
        ["hg38", "hg38", "hg38"],
        project["results"],
        str(summary_dir),
        "test_project"
    )

    assert plot_file is not None
    assert Path(plot_file).exists()


def test_consensus_with_chr22_peaks(tmp_path):
    """Test consensus specifically with chr22 peaks (accbase-style)."""
    peaks1 = tmp_path / "s1.narrowPeak"
    peaks2 = tmp_path / "s2.narrowPeak"
    peaks3 = tmp_path / "s3.narrowPeak"

    peaks1.write_text(
        "chr22\t16050000\t16051000\tp1\t100\t.\t50\t10\t5\t500\n"
        "chr22\t20000000\t20001000\tp2\t80\t.\t40\t8\t4\t500\n"
    )
    peaks2.write_text(
        "chr22\t16050100\t16051100\tp1\t90\t.\t45\t9\t4.5\t500\n"
        "chr22\t20000050\t20001050\tp2\t85\t.\t42\t8.5\t4.2\t500\n"
    )
    peaks3.write_text(
        "chr22\t16050200\t16051200\tp1\t95\t.\t48\t9.5\t4.8\t500\n"
        "chr22\t30000000\t30001000\tp3\t70\t.\t35\t7\t3.5\t500\n"
    )

    chrom_sizes = {"chr22": 50818468}

    result = collapse_peaks(
        [str(peaks1), str(peaks2), str(peaks3)],
        ["s1", "s2", "s3"],
        chrom_sizes,
        min_samples=2,
        min_score=5.0,
        min_olap=1
    )

    assert len(result) >= 2
    # Check we got chr22 peaks
    chr22_count = sum(1 for line in result if line.startswith("chr22"))
    assert chr22_count >= 2
