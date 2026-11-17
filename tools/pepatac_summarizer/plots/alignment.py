"""Alignment statistics plots."""

from pathlib import Path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')

from .theme import apply_pepatac_theme, get_color_gradient


def plot_aligned_raw(
    stats: pd.DataFrame,
    output_dir: str | Path,
    project_name: str
) -> str | None:
    """Plot raw alignment counts as stacked horizontal bar chart.

    Args:
        stats: DataFrame with alignment statistics per sample
        output_dir: Output directory for plots
        project_name: Project name for output files

    Returns:
        Path to output PDF, or None if no data
    """
    output_path = Path(output_dir)

    if stats.empty or "sample_name" not in stats.columns:
        return None

    required = ["Fastq_reads", "Aligned_reads"]
    if not all(col in stats.columns for col in required):
        print("Missing required columns for alignment plot")
        return None

    samples = stats["sample_name"].tolist()
    n_samples = len(samples)

    fastq = pd.to_numeric(stats["Fastq_reads"], errors="coerce").fillna(0)
    aligned = pd.to_numeric(stats["Aligned_reads"], errors="coerce").fillna(0)
    duplicates = pd.to_numeric(stats.get("Duplicate_reads", 0), errors="coerce").fillna(0)

    prealign_cols = [c for c in stats.columns if c.startswith("Aligned_reads_") and c != "Aligned_reads"]
    prealign_reads = {}
    for col in prealign_cols:
        genome = col.replace("Aligned_reads_", "")
        prealign_reads[genome] = pd.to_numeric(stats[col], errors="coerce").fillna(0)

    unaligned = fastq - aligned
    for genome, reads in prealign_reads.items():
        unaligned = unaligned - reads

    genome_cols = [c for c in stats.columns if c == "Genome"]
    genomes = stats["Genome"].unique().tolist() if "Genome" in stats.columns else []

    aligned_by_genome = {}
    for genome in genomes:
        mask = stats["Genome"] == genome
        dedup_col = "Dedup_aligned_reads"
        if dedup_col in stats.columns:
            counts = pd.to_numeric(stats.loc[mask, dedup_col], errors="coerce").fillna(0)
        else:
            counts = aligned[mask]
        aligned_by_genome[genome] = pd.Series(0, index=stats.index)
        aligned_by_genome[genome].loc[mask] = counts

    data = {"sample": samples, "unaligned": (unaligned / 1e6).tolist()}
    for genome, reads in prealign_reads.items():
        data[genome] = (reads / 1e6).tolist()
    data["duplicates"] = (duplicates / 1e6).tolist()
    for genome in genomes:
        data[genome] = (aligned_by_genome[genome] / 1e6).tolist()

    df = pd.DataFrame(data)
    df = df.set_index("sample")

    fig_height = max(4, n_samples * 0.4)
    fig, ax = plt.subplots(figsize=(10, fig_height))

    colors = ["#1a1a1a"]
    if prealign_reads:
        colors.extend(get_color_gradient(len(prealign_reads), "#FFE595", "#F6F2A6", "#F6CAA6"))
    colors.append("#FC1E25")
    if genomes:
        colors.extend(get_color_gradient(len(genomes), "#4876FF", "#7648FF", "#94D9CE"))

    df.plot(kind="barh", stacked=True, ax=ax, color=colors[:len(df.columns)], edgecolor="black", linewidth=0.25)

    ax.set_xlabel("Number of reads (M)")
    ax.set_ylabel("")
    ax.legend(loc="upper right", reverse=True)
    ax.invert_yaxis()
    apply_pepatac_theme(ax)

    plt.tight_layout()

    output_pdf = output_path / f"{project_name}_alignmentRaw.pdf"
    output_png = output_path / f"{project_name}_alignmentRaw.png"

    fig.savefig(output_pdf)
    fig.savefig(output_png, dpi=100)
    plt.close()

    print(f"Alignment raw plot: {output_pdf}")
    return str(output_pdf)


def plot_aligned_pct(
    stats: pd.DataFrame,
    output_dir: str | Path,
    project_name: str
) -> str | None:
    """Plot alignment percentages as stacked horizontal bar chart.

    Args:
        stats: DataFrame with alignment statistics per sample
        output_dir: Output directory for plots
        project_name: Project name for output files

    Returns:
        Path to output PDF, or None if no data
    """
    output_path = Path(output_dir)

    if stats.empty or "sample_name" not in stats.columns:
        return None

    if "Alignment_rate" not in stats.columns:
        print("Missing Alignment_rate column for percent alignment plot")
        return None

    samples = stats["sample_name"].tolist()
    n_samples = len(samples)

    align_rate = pd.to_numeric(stats["Alignment_rate"], errors="coerce").fillna(0)
    dedup_rate = pd.to_numeric(stats.get("Dedup_alignment_rate", 0), errors="coerce").fillna(0)

    prealign_cols = [c for c in stats.columns if c.startswith("Alignment_rate_") and c != "Alignment_rate"]
    prealign_rates = {}
    for col in prealign_cols:
        genome = col.replace("Alignment_rate_", "")
        prealign_rates[genome] = pd.to_numeric(stats[col], errors="coerce").fillna(0)

    unaligned = 100 - align_rate
    for genome, rate in prealign_rates.items():
        unaligned = unaligned - rate

    duplicates = align_rate - dedup_rate
    duplicates = duplicates.clip(lower=0)

    genomes = stats["Genome"].unique().tolist() if "Genome" in stats.columns else []

    dedup_by_genome = {}
    for genome in genomes:
        mask = stats["Genome"] == genome
        rate = dedup_rate[mask].values
        vals = pd.Series(0.0, index=stats.index)
        vals.loc[mask] = rate
        dedup_by_genome[genome] = vals

    data = {"sample": samples, "unaligned": unaligned.tolist()}
    for genome, rate in prealign_rates.items():
        data[genome] = rate.tolist()
    data["duplicates"] = duplicates.tolist()
    for genome in genomes:
        data[genome] = dedup_by_genome[genome].tolist()

    df = pd.DataFrame(data)
    df = df.set_index("sample")

    fig_height = max(4, n_samples * 0.4)
    fig, ax = plt.subplots(figsize=(10, fig_height))

    colors = ["#1a1a1a"]
    if prealign_rates:
        colors.extend(get_color_gradient(len(prealign_rates), "#FFE595", "#F6F2A6", "#F6CAA6"))
    colors.append("#FC1E25")
    if genomes:
        colors.extend(get_color_gradient(len(genomes), "#4876FF", "#7648FF", "#94D9CE"))

    df.plot(kind="barh", stacked=True, ax=ax, color=colors[:len(df.columns)], edgecolor="black", linewidth=0.25)

    ax.set_xlabel("Percent of reads")
    ax.set_ylabel("")
    ax.set_xlim(0, 103)
    ax.legend(loc="upper right", reverse=True)
    ax.invert_yaxis()
    apply_pepatac_theme(ax)

    plt.tight_layout()

    output_pdf = output_path / f"{project_name}_alignmentPercent.pdf"
    output_png = output_path / f"{project_name}_alignmentPercent.png"

    fig.savefig(output_pdf)
    fig.savefig(output_png, dpi=100)
    plt.close()

    print(f"Alignment percent plot: {output_pdf}")
    return str(output_pdf)
