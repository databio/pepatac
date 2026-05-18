"""Assets summary generation."""

from pathlib import Path
import pandas as pd

ASSET_PATTERNS = {
    "aligned_bam": "aligned_*/{}*_sort_dedup.bam",
    "aligned_bam_index": "aligned_*/{}*_sort_dedup.bam.bai",
    "peaks_bed": "peak_calling_*/{}*_peaks.narrowPeak",
    "peaks_normalized": "peak_calling_*/{}*_peaks_normalized.narrowPeak",
    "bigwig": "signal_*/{}*_smooth.bw",
    "chrom_sizes": "aligned_*/*.chrom.sizes",
    "stats": "stats.yaml",
    "preseq_yield": "QC_*/{}*_preseq_yield.txt",
    "preseq_counts": "QC_*/{}*_preseq_counts.txt",
}


def create_assets_summary(sample_names: list, results_subdir: str) -> pd.DataFrame:
    """Generate project assets summary.

    Args:
        sample_names: List of sample names
        results_subdir: Path to results subdirectory

    Returns:
        DataFrame with columns: sample_name, asset, path
    """
    assets = []
    results_path = Path(results_subdir)

    for sample in sample_names:
        sample_dir = results_path / sample
        if not sample_dir.exists():
            continue

        for asset_type, pattern in ASSET_PATTERNS.items():
            search_pattern = pattern.format(sample)
            for path in sample_dir.glob(search_pattern):
                assets.append({
                    "sample_name": sample,
                    "asset": asset_type,
                    "path": str(path)
                })

    return pd.DataFrame(assets)
