"""Peak counts table generation using gtars."""

from pathlib import Path
import pandas as pd
from gtars.models import RegionSet, Region


def calculate_peak_counts(
    sample_table: pd.DataFrame,
    summary_dir: str,
    results_subdir: str,
    project_name: str,
    consensus_peaks: dict[str, str],
    normalized: bool = False,
    poverlap: bool = False,
) -> dict[str, str]:
    """Generate peak counts table per genome using gtars.

    Args:
        sample_table: DataFrame with sample_name and genome columns
        summary_dir: Output directory
        results_subdir: Path to sample results
        project_name: Project name for output files
        consensus_peaks: Dict mapping genome -> consensus peak file
        normalized: Use normalized read counts (CPM)
        poverlap: Calculate percentage overlap (not yet implemented)

    Returns:
        Dict mapping genome -> counts table file path
    """
    summary_path = Path(summary_dir)
    results_path = Path(results_subdir)
    count_files = {}

    for genome, consensus_file in consensus_peaks.items():
        if not Path(consensus_file).exists():
            print(f"Consensus file not found: {consensus_file}")
            continue

        genome_samples = sample_table[sample_table["genome"] == genome]

        # Load peaks into RegionSet
        peaks_df = pd.read_csv(
            consensus_file, sep="\t", header=None,
            names=["chr", "start", "end", "name", "score", "strand",
                   "signalValue", "pValue", "qValue", "peak"][:10]
        )

        if peaks_df.empty:
            continue

        peak_regions = [
            Region(row["chr"], int(row["start"]), int(row["end"]), "")
            for _, row in peaks_df.iterrows()
        ]
        peaks_rs = RegionSet.from_regions(peak_regions)

        counts_data = {
            "chr": peaks_df["chr"].tolist(),
            "start": peaks_df["start"].tolist(),
            "end": peaks_df["end"].tolist(),
        }

        for _, row in genome_samples.iterrows():
            sample = row["sample_name"]
            bam_path = (
                results_path / sample / f"aligned_{genome}" /
                f"{sample}_sort_dedup.bam"
            )

            if not bam_path.exists():
                print(f"BAM not found: {bam_path}")
                counts_data[sample] = [0] * len(peaks_df)
                continue

            try:
                # Read BAM as RegionSet and count overlaps
                reads_rs = RegionSet.from_bam(str(bam_path))
                sample_counts = list(peaks_rs.count_overlaps(reads_rs))

                if normalized and sample_counts:
                    total = sum(sample_counts)
                    if total > 0:
                        sample_counts = [c / total * 1e6 for c in sample_counts]

                counts_data[sample] = sample_counts

            except Exception as e:
                print(f"Failed to count reads for {sample}: {e}")
                counts_data[sample] = [0] * len(peaks_df)

        counts_df = pd.DataFrame(counts_data)
        output_file = summary_path / f"{project_name}_{genome}_peaks_coverage.tsv"
        counts_df.to_csv(output_file, sep="\t", index=False)
        count_files[genome] = str(output_file)
        print(f"Counts table: {output_file}")

    return count_files
