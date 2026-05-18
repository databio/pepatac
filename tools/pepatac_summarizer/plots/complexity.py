"""Library complexity plots from preseq output."""

from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')

from .theme import apply_pepatac_theme


def plot_complexity_curves(
    sample_names: list,
    genomes: list,
    results_subdir: str,
    output_dir: str,
    project_name: str
) -> str | None:
    """Plot library complexity curves from preseq output.

    Args:
        sample_names: List of sample names
        genomes: Corresponding genome for each sample
        results_subdir: Path to sample results
        output_dir: Output directory for plots
        project_name: Project name for output files

    Returns:
        Path to output PDF, or None if no data
    """
    results_path = Path(results_subdir)
    output_path = Path(output_dir)

    palette = [
        "#999999", "#FFC107", "#27C6AB", "#004D40",
        "#B97BC8", "#009E73", "#C92404", "#E3E550",
        "#372B4C", "#E3DAC7", "#27CAE6", "#B361BC",
        "#897779", "#6114F8", "#19C42B", "#56B4E9"
    ]

    fig, ax = plt.subplots(figsize=(10, 7))
    curves_found = 0

    for i, (sample, genome) in enumerate(zip(sample_names, genomes)):
        yield_file = results_path / sample / f"QC_{genome}" / f"{sample}_preseq_yield.txt"
        counts_file = results_path / sample / f"QC_{genome}" / f"{sample}_preseq_counts.txt"

        if not yield_file.exists():
            continue

        try:
            df = pd.read_csv(yield_file, sep="\t")
            if "TOTAL_READS" not in df.columns or "EXPECTED_DISTINCT" not in df.columns:
                if "total_reads" in df.columns:
                    df = df.rename(columns={
                        "total_reads": "TOTAL_READS",
                        "distinct_reads": "EXPECTED_DISTINCT"
                    })
                else:
                    continue

            color = palette[i % len(palette)]
            ax.plot(
                df["TOTAL_READS"] / 1e6,
                df["EXPECTED_DISTINCT"] / 1e6,
                label=sample,
                color=color
            )

            if counts_file.exists():
                counts_df = pd.read_csv(counts_file, sep="\t")
                if len(counts_df) >= 1:
                    total = counts_df.iloc[0, 1] if counts_df.shape[1] > 1 else 0
                    unique = counts_df.iloc[0, 2] if counts_df.shape[1] > 2 else 0
                    if total > 0:
                        ax.scatter(
                            [total / 1e6], [unique / 1e6],
                            marker='d', s=50, color=color, zorder=5
                        )

            curves_found += 1

        except Exception as e:
            print(f"Error processing {sample}: {e}")
            continue

    if curves_found == 0:
        print("No samples have available library complexity files.")
        plt.close()
        return None

    xlim = ax.get_xlim()
    ax.plot([0, xlim[1]], [0, xlim[1]], "k--", alpha=0.5, label="_nolegend_")

    ax.set_xlabel("Total reads (M) (incl. duplicates)")
    ax.set_ylabel("Unique reads (M)")
    ax.legend(loc="upper left", fontsize=8)
    ax.set_aspect("equal", adjustable="box")
    apply_pepatac_theme(ax)

    plt.tight_layout()

    output_pdf = output_path / f"{project_name}_libComplexity.pdf"
    output_png = output_path / f"{project_name}_libComplexity.png"

    fig.savefig(output_pdf)
    fig.savefig(output_png, dpi=100)
    plt.close()

    print(f"Library complexity plot: {output_pdf}")
    return str(output_pdf)
