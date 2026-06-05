"""Peak counts table generation using bedtools multicov."""

import subprocess
from pathlib import Path
import pandas as pd


def _ensure_indexed(bam_path: Path) -> None:
    """bedtools multicov requires a BAM index; create one if missing."""
    if not Path(f"{bam_path}.bai").exists():
        subprocess.run(["samtools", "index", str(bam_path)], check=True)


def calculate_peak_counts(
    sample_table: pd.DataFrame,
    summary_dir: str,
    results_subdir: str,
    project_name: str,
    consensus_peaks: dict[str, str],
    normalized: bool = False,
    poverlap: bool = False,
) -> dict[str, str]:
    """Generate a peak counts table per genome using ``bedtools multicov``.

    For each genome, count the reads from every sample's deduplicated BAM
    that overlap each consensus peak, producing a chr/start/end x sample
    coverage table.

    Note: this previously used ``gtars.models.RegionSet.from_bam`` /
    ``count_overlaps``, but no released gtars (through 0.8.0) provides those
    APIs, so the counts step silently produced zeros. Reimplemented with
    ``bedtools multicov`` (already a PEPATAC dependency). Revisit if a future
    gtars adds BAM-to-RegionSet support.

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

        # Read peaks for the chr/start/end anchor columns + row count.
        peaks_df = pd.read_csv(
            consensus_file, sep="\t", header=None,
            names=["chr", "start", "end", "name", "score", "strand",
                   "signalValue", "pValue", "qValue", "peak"][:10]
        )

        if peaks_df.empty:
            continue

        n_peaks = len(peaks_df)
        counts_data = {
            "chr": peaks_df["chr"].tolist(),
            "start": peaks_df["start"].tolist(),
            "end": peaks_df["end"].tolist(),
        }

        # Resolve each sample's dedup BAM; collect the present (indexed) ones
        # for a single bedtools multicov call. Default every sample to zeros
        # so missing/failed BAMs still get a column.
        sample_counts = {s: [0] * n_peaks for s in genome_samples["sample_name"]}
        present_samples = []
        present_bams = []
        for _, row in genome_samples.iterrows():
            sample = row["sample_name"]
            bam_path = (
                results_path / sample / f"aligned_{genome}" /
                f"{sample}_sort_dedup.bam"
            )
            if not bam_path.exists():
                print(f"BAM not found: {bam_path}")
                continue
            try:
                _ensure_indexed(bam_path)
            except subprocess.CalledProcessError as e:
                print(f"Could not index {bam_path}: {e}; skipping {sample}")
                continue
            present_samples.append(sample)
            present_bams.append(str(bam_path))

        # bedtools multicov appends one count column per -bams entry (in the
        # given order) to each input BED region, preserving the peaks order.
        if present_bams:
            try:
                result = subprocess.run(
                    ["bedtools", "multicov", "-bams", *present_bams,
                     "-bed", str(consensus_file)],
                    capture_output=True, text=True, check=True,
                )
                n = len(present_bams)
                cols = {s: [] for s in present_samples}
                for line in result.stdout.splitlines():
                    if not line.strip():
                        continue
                    fields = line.split("\t")
                    for sample, value in zip(present_samples, fields[-n:]):
                        cols[sample].append(int(value))
                for sample, col in cols.items():
                    if len(col) != n_peaks:
                        print(f"multicov row count mismatch for {sample} "
                              f"({len(col)} vs {n_peaks}); leaving zeros")
                        continue
                    if normalized:
                        total = sum(col)
                        if total > 0:
                            col = [c / total * 1e6 for c in col]
                    sample_counts[sample] = col
            except (subprocess.CalledProcessError, ValueError) as e:
                print(f"bedtools multicov failed for {genome}: {e}")

        # Emit sample columns in sample-table order.
        for sample in genome_samples["sample_name"]:
            counts_data[sample] = sample_counts[sample]

        counts_df = pd.DataFrame(counts_data)
        output_file = summary_path / f"{project_name}_{genome}_peaks_coverage.tsv"
        counts_df.to_csv(output_file, sep="\t", index=False)
        count_files[genome] = str(output_file)
        print(f"Counts table: {output_file}")

    return count_files
