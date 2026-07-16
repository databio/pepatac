"""Assets summary generation."""

from pathlib import Path
import warnings
import pandas as pd

ASSETS_COLUMNS = ["sample_name", "asset", "path", "annotation"]


def create_assets_summary(sample_names: list, results_subdir: str) -> pd.DataFrame:
    """Generate project assets summary.

    Reads the per-sample assets.tsv that pepatac.py writes. Those are the
    reference assets the run resolved (chrom_sizes, fasta, blacklist, ...),
    which live outside the results tree and so cannot be discovered by
    globbing the sample output folders.

    Args:
        sample_names: List of sample names
        results_subdir: Path to results subdirectory

    Returns:
        DataFrame with columns: sample_name, asset, path, annotation
    """
    frames = []
    missing_files = 0
    results_path = Path(results_subdir)

    for sample in sample_names:
        assets_file = results_path / sample / "assets.tsv"

        if not assets_file.is_file():
            missing_files += 1
            continue

        table = pd.read_csv(assets_file, sep="\t", header=None,
                            names=["asset", "path", "annotation"])
        # pepatac.py appends to assets.tsv, so re-running a sample leaves
        # earlier rows behind; the last occurrence is the current one.
        table = table.drop_duplicates(subset=["asset", "path", "annotation"],
                                      keep="last")
        table["sample_name"] = sample
        frames.append(table[ASSETS_COLUMNS])

    if missing_files > 0:
        warnings.warn(f"Assets files missing for {missing_files} samples.")

    if not frames:
        return pd.DataFrame(columns=ASSETS_COLUMNS)

    return pd.concat(frames, ignore_index=True)
