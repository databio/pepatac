"""TSS enrichment score plots."""

from pathlib import Path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')

from .theme import apply_pepatac_theme, get_color_gradient


def plot_tss_scores(
    stats: pd.DataFrame,
    output_dir: str | Path,
    project_name: str,
    cutoff: float = 6.0
) -> str | None:
    """Plot TSS enrichment scores as bar chart.

    Samples below cutoff are shown in red, above in green.

    Args:
        stats: DataFrame with TSS_score column
        output_dir: Output directory for plots
        project_name: Project name for output files
        cutoff: Score threshold (below = low quality)

    Returns:
        Path to output PDF, or None if no data
    """
    output_path = Path(output_dir)

    if stats.empty or "sample_name" not in stats.columns:
        return None

    if "TSS_score" not in stats.columns:
        print("Missing TSS_score column for TSS plot")
        return None

    samples = stats["sample_name"].tolist()
    scores = pd.to_numeric(stats["TSS_score"], errors="coerce").fillna(0).tolist()
    n_samples = len(samples)

    colors = []
    for score in scores:
        if score < cutoff:
            t = min(score / cutoff, 1)
            r = int(175 + (228 - 175) * t)
            g = int(0 + (14 - 0) * t)
            b = int(0 + (0 - 0) * t)
            colors.append(f"#{r:02x}{g:02x}{b:02x}")
        else:
            t = min((score - cutoff) / 24, 1)
            r = int(180 + (0 - 180) * t)
            g = int(232 + (59 - 232) * t)
            b = int(150 + (0 - 150) * t)
            colors.append(f"#{r:02x}{g:02x}{b:02x}")

    fig_height = max(4, n_samples * 0.4)
    fig, ax = plt.subplots(figsize=(10, fig_height))

    y_pos = range(len(samples))
    bars = ax.barh(y_pos, scores, color=colors, edgecolor="black", linewidth=0.25)

    ax.axvline(x=cutoff, color="#666666", linestyle="--", linewidth=1, alpha=0.7)

    ax.set_yticks(y_pos)
    ax.set_yticklabels(samples)
    ax.set_xlabel("TSS Enrichment Score")
    ax.set_ylabel("")
    ax.invert_yaxis()
    apply_pepatac_theme(ax)

    plt.tight_layout()

    output_pdf = output_path / f"{project_name}_TSSEnrichment.pdf"
    output_png = output_path / f"{project_name}_TSSEnrichment.png"

    fig.savefig(output_pdf)
    fig.savefig(output_png, dpi=100)
    plt.close()

    print(f"TSS enrichment plot: {output_pdf}")
    return str(output_pdf)
