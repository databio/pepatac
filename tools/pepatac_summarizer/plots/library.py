"""Library size plots."""

from pathlib import Path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')

from .theme import apply_pepatac_theme


def plot_lib_sizes(
    stats: pd.DataFrame,
    output_dir: str | Path,
    project_name: str
) -> str | None:
    """Plot estimated library sizes as bar chart.

    Args:
        stats: DataFrame with Picard_est_lib_size column
        output_dir: Output directory for plots
        project_name: Project name for output files

    Returns:
        Path to output PDF, or None if no data
    """
    output_path = Path(output_dir)

    if stats.empty or "sample_name" not in stats.columns:
        return None

    if "Picard_est_lib_size" not in stats.columns:
        print("Missing Picard_est_lib_size column for library size plot")
        return None

    samples = stats["sample_name"].tolist()

    lib_sizes_raw = stats["Picard_est_lib_size"].replace("Unknown", 0)
    lib_sizes = pd.to_numeric(lib_sizes_raw, errors="coerce").fillna(0)

    if lib_sizes.sum() == 0:
        print("No library size data available")
        return None

    lib_sizes_millions = (lib_sizes / 1e6).tolist()
    n_samples = len(samples)

    fig_height = max(4, n_samples * 0.4)
    fig, ax = plt.subplots(figsize=(10, fig_height))

    y_pos = range(len(samples))
    ax.barh(y_pos, lib_sizes_millions, color="#4876FF", edgecolor="black", linewidth=0.25)

    ax.set_yticks(y_pos)
    ax.set_yticklabels(samples)
    ax.set_xlabel("Estimated Library Size (M)")
    ax.set_ylabel("")
    ax.invert_yaxis()
    apply_pepatac_theme(ax)

    plt.tight_layout()

    output_pdf = output_path / f"{project_name}_libSizes.pdf"
    output_png = output_path / f"{project_name}_libSizes.png"

    fig.savefig(output_pdf)
    fig.savefig(output_png, dpi=100)
    plt.close()

    print(f"Library sizes plot: {output_pdf}")
    return str(output_pdf)
