"""Utilities for PEPATAC summarizer."""

from pathlib import Path
import yaml
import pandas as pd


def load_stats_summary(yaml_path: str | Path) -> pd.DataFrame | None:
    """Load and parse the project stats summary YAML.

    Converts the nested YAML structure to a flat DataFrame matching R's yamlToDT.

    Args:
        yaml_path: Path to {project}_stats_summary.yaml

    Returns:
        DataFrame with one row per sample and stats columns, or None if not found
    """
    yaml_path = Path(yaml_path)
    if not yaml_path.exists():
        print(f"Warning: Stats summary file not found: {yaml_path}")
        return None

    with open(yaml_path) as f:
        data = yaml.safe_load(f)

    if not data or "PEPATAC" not in data:
        return None

    samples_data = data["PEPATAC"].get("sample", {})
    if not samples_data:
        return None

    rows = []
    for sample_name, stats in samples_data.items():
        row = {"sample_name": sample_name}
        if isinstance(stats, dict):
            row.update(_flatten_dict(stats))
        rows.append(row)

    if not rows:
        return None

    df = pd.DataFrame(rows)
    # fillna/replace on these heterogeneous (object-dtype) stat columns
    # triggers pandas' deprecated silent-downcast FutureWarning; opt into the
    # future behavior and downcast explicitly via infer_objects.
    with pd.option_context("future.no_silent_downcasting", True):
        df = df.fillna(0).infer_objects(copy=False)
        df = df.replace("", 0).infer_objects(copy=False)
    return df


def _flatten_dict(d: dict, prefix: str = "") -> dict:
    """Flatten nested dict with underscore-joined keys."""
    items = {}
    for k, v in d.items():
        key = f"{prefix}_{k}" if prefix else k
        if isinstance(v, dict):
            items.update(_flatten_dict(v, key))
        else:
            items[key] = v
    return items


def get_prealignments(stats: pd.DataFrame) -> list[str]:
    """Extract prealignment genome names from stats columns."""
    prealignments = []
    for col in stats.columns:
        if col.startswith("Aligned_reads_") and col != "Aligned_reads":
            genome = col.replace("Aligned_reads_", "")
            if genome not in ["human_repeats", "rCRSd"]:
                prealignments.append(genome)
    return prealignments


def round_up_nice(x: float) -> float:
    """Round up to a nice number for axis limits."""
    if x <= 0:
        return 1
    magnitude = 10 ** int(f"{x:.0e}".split("e")[1])
    return ((x // magnitude) + 1) * magnitude
