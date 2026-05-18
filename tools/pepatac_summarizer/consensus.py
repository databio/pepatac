"""Consensus peak calculation using gtars."""

from pathlib import Path
from gtars.models import RegionSet, Region


def parse_narrowpeak_line(line: str) -> tuple[str, int, int, str, float, str]:
    """Parse a narrowPeak line into components."""
    parts = line.strip().split("\t")
    chrom = parts[0]
    start = int(parts[1])
    end = int(parts[2])
    name = parts[3] if len(parts) > 3 else "."
    score = float(parts[4]) if len(parts) > 4 else 0.0
    rest = "\t".join(parts[3:]) if len(parts) > 3 else ""
    return chrom, start, end, name, score, rest


def collapse_peaks(
    peak_files: list[str],
    sample_names: list[str],
    chrom_sizes: dict[str, int],
    min_samples: int = 2,
    min_score: float = 5.0,
    min_olap: int = 1
) -> list[str]:
    """Collapse overlapping peaks using gtars AIList.

    Args:
        peak_files: List of narrowPeak file paths
        sample_names: Corresponding sample names
        chrom_sizes: Dict mapping chromosome -> size
        min_samples: Minimum samples a peak must appear in
        min_score: Minimum score to keep a peak
        min_olap: Minimum overlap in bp

    Returns:
        List of narrowPeak lines for consensus peaks
    """
    # Parse all peaks with metadata
    all_regions = []
    peak_data = []  # (sample_id, score, full_line)

    for sample_id, (pf, sample) in enumerate(zip(peak_files, sample_names)):
        try:
            with open(pf) as f:
                for line in f:
                    if not line.strip():
                        continue
                    chrom, start, end, name, score, rest = parse_narrowpeak_line(line)
                    all_regions.append(Region(chrom, start, end, ""))
                    peak_data.append((sample_id, score, line.strip()))
        except (FileNotFoundError, IOError):
            continue

    if len(all_regions) < 2:
        return []

    # Build RegionSets
    combined_rs = RegionSet.from_regions(all_regions)
    merged_rs = combined_rs.reduce()

    # Use gtars find_overlaps
    overlap_indices = merged_rs.find_overlaps(combined_rs)

    consensus_lines = []
    for indices in overlap_indices:
        if not indices:
            continue

        # Find best peak and count samples
        samples_seen = set()
        best_score = -1.0
        best_line = ""

        for idx in indices:
            sample_id, score, line = peak_data[idx]
            samples_seen.add(sample_id)
            if score > best_score:
                best_score = score
                best_line = line

        if len(samples_seen) >= min_samples and best_score >= min_score:
            consensus_lines.append(best_line)

    return consensus_lines


def calculate_consensus_peaks(
    sample_table,  # Can be dict or DataFrame
    summary_dir: str,
    results_subdir: str,
    project_name: str,
    min_samples: int = 2,
    min_score: float = 5.0,
    min_olap: int = 1
) -> dict[str, str]:
    """Calculate consensus peaks per genome using gtars.

    Args:
        sample_table: Dict or DataFrame with sample_name and genome
        summary_dir: Output directory for consensus files
        results_subdir: Path to sample results
        project_name: Project name for output files
        min_samples: Minimum samples for reproducibility
        min_score: Minimum peak score
        min_olap: Minimum overlap bases

    Returns:
        Dict mapping genome -> consensus peak file path
    """
    summary_path = Path(summary_dir)
    summary_path.mkdir(exist_ok=True)
    results_path = Path(results_subdir)

    # Handle both dict and DataFrame input
    if hasattr(sample_table, 'iterrows'):
        samples = [(row["sample_name"], row["genome"]) for _, row in sample_table.iterrows()]
    else:
        samples = [(s, g) for s, g in zip(sample_table["sample_name"], sample_table["genome"])]

    # Group by genome
    genome_samples: dict[str, list[str]] = {}
    for sample, genome in samples:
        genome_samples.setdefault(genome, []).append(sample)

    consensus_files = {}

    for genome, sample_list in genome_samples.items():
        peak_files = []
        sample_names = []
        chrom_sizes = {}

        for sample in sample_list:
            peak_file = (
                results_path / sample / f"peak_calling_{genome}" /
                f"{sample}_peaks_normalized.narrowPeak"
            )
            if peak_file.exists():
                peak_files.append(str(peak_file))
                sample_names.append(sample)

            # Load chrom sizes once
            if not chrom_sizes:
                chrom_dir = results_path / sample / f"aligned_{genome}"
                for cs_file in chrom_dir.glob("*.chrom.sizes"):
                    with open(cs_file) as f:
                        for line in f:
                            parts = line.strip().split("\t")
                            if len(parts) >= 2:
                                chrom_sizes[parts[0]] = int(parts[1])
                    break

        if len(peak_files) < 2:
            print(f"Found only {len(peak_files)} valid peak file(s) for {genome}, skipping consensus.")
            continue

        print(f"Calculating {genome} consensus peak set from {len(peak_files)} samples...")

        consensus_lines = collapse_peaks(
            peak_files, sample_names, chrom_sizes,
            min_samples=min_samples, min_score=min_score, min_olap=min_olap
        )

        if not consensus_lines:
            print(f"Warning: No consensus peaks found for {genome}")
            continue

        output_file = summary_path / f"{project_name}_{genome}_consensusPeaks.narrowPeak"
        with open(output_file, "w") as f:
            # Remove duplicates while preserving order
            seen = set()
            for line in consensus_lines:
                if line not in seen:
                    seen.add(line)
                    f.write(line + "\n")

        consensus_files[genome] = str(output_file)
        print(f"Consensus peak set: {output_file}")

    return consensus_files
