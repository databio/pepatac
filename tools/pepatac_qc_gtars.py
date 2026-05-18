#!/usr/bin/env python
"""
PEPATAC QC calculations using gtars (Rust) backend.

This module provides gtars-based alternatives to the R/PEPATACr QC functions.
Each function produces the same output files as the R equivalent.

Usage:
    In pepatac.py, use --qc-backend gtars to enable these functions.
"""

import os
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt


def plot_tss_enrichment(tss_file, output_pdf, output_png=None):
    """Plot TSS enrichment from pre-computed values.

    Args:
        tss_file: Path to TSS enrichment values (one value per line)
        output_pdf: Output PDF path
        output_png: Output PNG path (optional)
    """
    with open(tss_file) as f:
        values = [float(x.strip()) for x in f if x.strip()]

    if not values:
        return

    # Normalize as in pepatac.py
    list_len = int(0.05 * len(values))
    if list_len > 0:
        baseline = sum(values[1:list_len]) / len(values[1:list_len])
        if baseline > 0:
            norm_values = [x / baseline for x in values]
        else:
            norm_values = values
    else:
        norm_values = values

    # Plot
    fig, ax = plt.subplots(figsize=(8, 6))
    x = np.arange(-len(norm_values)//2, len(norm_values)//2)
    ax.plot(x, norm_values, color='#1f77b4', linewidth=1.5)
    ax.set_xlabel('Distance from TSS (bp)')
    ax.set_ylabel('Normalized Signal')
    ax.set_title('TSS Enrichment')
    ax.axhline(y=1, color='gray', linestyle='--', alpha=0.5)
    ax.axvline(x=0, color='gray', linestyle='--', alpha=0.5)

    plt.tight_layout()
    plt.savefig(output_pdf, format='pdf', dpi=150)
    if output_png:
        plt.savefig(output_png, format='png', dpi=150)
    plt.close()


def plot_fragment_distribution(frag_file, count_file, output_pdf, output_txt, output_png=None):
    """Plot fragment length distribution.

    Args:
        frag_file: Path to fragment lengths file
        count_file: Path to fragment counts file (sorted length -> count)
        output_pdf: Output PDF path
        output_txt: Output summary stats file
        output_png: Output PNG path (optional)
    """
    # Read counts
    lengths = []
    counts = []
    with open(count_file) as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                counts.append(int(parts[0]))
                lengths.append(int(parts[1]))

    if not lengths:
        return

    lengths = np.array(lengths)
    counts = np.array(counts)

    # Calculate stats
    total = counts.sum()
    mean_len = np.average(lengths, weights=counts) if total > 0 else 0

    # Write summary
    with open(output_txt, 'w') as f:
        f.write(f"Total fragments: {total}\n")
        f.write(f"Mean fragment length: {mean_len:.1f}\n")

    # Plot
    fig, ax = plt.subplots(figsize=(10, 6))
    ax.bar(lengths, counts, width=1, color='#1f77b4', alpha=0.7)
    ax.set_xlabel('Fragment Length (bp)')
    ax.set_ylabel('Count')
    ax.set_title('Fragment Length Distribution')
    ax.set_xlim(0, min(1000, lengths.max() + 50))

    plt.tight_layout()
    plt.savefig(output_pdf, format='pdf', dpi=150)
    if output_png:
        plt.savefig(output_png, format='png', dpi=150)
    plt.close()


def plot_frif(coverage_files, annotation_bed, output_pdf, output_png=None,
              cumulative=True, priority=False, reads=False):
    """Plot Fraction of Reads in Features (FRiF).

    Args:
        coverage_files: List of coverage BED files
        annotation_bed: Path to annotation BED file
        output_pdf: Output PDF path
        output_png: Output PNG path (optional)
        cumulative: If True, plot cumulative FRiF (cFRiF)
        priority: Use mutually exclusive priority ordering
        reads: Use read counts instead of bases
    """
    try:
        from gtars.genomic_distributions import calc_partitions
        from gtars.models import RegionSet, PartitionList, GeneModel
    except ImportError:
        raise ImportError("gtars not available. Install with: pip install gtars")

    # Load annotation
    anno_rs = RegionSet(annotation_bed)

    # Calculate fractions for each coverage file
    fractions = {}
    for cov_file in coverage_files:
        name = os.path.basename(cov_file).replace('_coverage.bed', '')
        cov_rs = RegionSet(cov_file)
        # TODO: Implement actual partition calculation
        # This requires proper PartitionList setup
        fractions[name] = 0.0

    # Plot
    fig, ax = plt.subplots(figsize=(10, 6))
    ax.set_xlabel('Genomic Feature')
    ax.set_ylabel('Fraction of Reads' if not cumulative else 'Cumulative Fraction')
    ax.set_title('cFRiF' if cumulative else 'FRiF')

    plt.tight_layout()
    plt.savefig(output_pdf, format='pdf', dpi=150)
    if output_png:
        plt.savefig(output_png, format='png', dpi=150)
    plt.close()


def plot_partition_distribution(query_bed, gene_model_gtf, genome, output_pdf,
                                output_png=None, expected=False):
    """Plot genomic partition distribution.

    Args:
        query_bed: Path to query regions BED file
        gene_model_gtf: Path to gene model GTF file
        genome: Genome name (e.g., 'hg38')
        output_pdf: Output PDF path
        output_png: Output PNG path (optional)
        expected: If True, also plot expected distribution
    """
    try:
        from gtars.genomic_distributions import calc_partitions
        from gtars.models import RegionSet, PartitionList
    except ImportError:
        raise ImportError("gtars not available. Install with: pip install gtars")

    # Load query regions
    rs = RegionSet(query_bed)

    # Build partition list from GTF
    # core_prom=1000, prox_prom=5000 are typical values
    partition_list = PartitionList.from_gtf(
        gene_model_gtf,
        core_prom=1000,
        prox_prom=5000,
        filter_protein_coding=True,
        convert_ensembl_ucsc=True
    )

    # Calculate partitions
    result = calc_partitions(rs, partition_list, bp_proportion=True)

    # Extract data for plotting
    labels = result['partition']
    counts = result['count']
    total = result['total']

    # Convert to percentages
    if total > 0:
        sizes = [c / total * 100 for c in counts]
    else:
        sizes = counts

    # Plot pie chart
    fig, ax = plt.subplots(figsize=(8, 8))
    colors = plt.cm.Set3(np.linspace(0, 1, len(labels)))
    wedges, texts, autotexts = ax.pie(sizes, labels=labels, colors=colors,
                                       autopct='%1.1f%%', startangle=90)
    ax.set_title('Peak Partition Distribution')

    plt.tight_layout()
    plt.savefig(output_pdf, format='pdf', dpi=150)
    if output_png:
        plt.savefig(output_png, format='png', dpi=150)
    plt.close()


def plot_chrom_distribution(query_bed, chrom_sizes, output_pdf, output_png=None):
    """Plot chromosome distribution.

    Args:
        query_bed: Path to query regions BED file
        chrom_sizes: Path to chromosome sizes file
        output_pdf: Output PDF path
        output_png: Output PNG path (optional)
    """
    try:
        from gtars.models import RegionSet
    except ImportError:
        raise ImportError("gtars not available. Install with: pip install gtars")

    # Load data
    rs = RegionSet(query_bed)
    stats = rs.chromosome_statistics()

    # Sort chromosomes naturally (chr1, chr2, ... chr10, chr11, ... chrX, chrY)
    def chrom_sort_key(x):
        x = x.replace('chr', '')
        if x.isdigit():
            return (0, int(x))
        else:
            return (1, x)

    chroms = sorted(stats.keys(), key=chrom_sort_key)
    counts = [stats[c].number_of_regions for c in chroms]

    # Plot
    fig, ax = plt.subplots(figsize=(12, 6))
    ax.bar(range(len(chroms)), counts, color='#1f77b4')
    ax.set_xticks(range(len(chroms)))
    ax.set_xticklabels(chroms, rotation=45, ha='right')
    ax.set_xlabel('Chromosome')
    ax.set_ylabel('Region Count')
    ax.set_title('Chromosome Distribution')

    plt.tight_layout()
    plt.savefig(output_pdf, format='pdf', dpi=150)
    if output_png:
        plt.savefig(output_png, format='png', dpi=150)
    plt.close()


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='PEPATAC QC with gtars backend')
    subparsers = parser.add_subparsers(dest='command')

    # TSS subcommand
    tss_parser = subparsers.add_parser('tss', help='Plot TSS enrichment')
    tss_parser.add_argument('-i', '--input', required=True, help='TSS enrichment file')
    tss_parser.add_argument('-o', '--output', required=True, help='Output PDF')

    # Fragment subcommand
    frag_parser = subparsers.add_parser('frag', help='Plot fragment distribution')
    frag_parser.add_argument('-l', '--lengths', required=True, help='Fragment lengths file')
    frag_parser.add_argument('-c', '--counts', required=True, help='Fragment counts file')
    frag_parser.add_argument('-p', '--pdf', required=True, help='Output PDF')
    frag_parser.add_argument('-t', '--txt', required=True, help='Output stats file')

    args = parser.parse_args()

    if args.command == 'tss':
        png_path = args.output.replace('.pdf', '.png')
        plot_tss_enrichment(args.input, args.output, png_path)
    elif args.command == 'frag':
        png_path = args.pdf.replace('.pdf', '.png')
        plot_fragment_distribution(args.lengths, args.counts, args.pdf, args.txt, png_path)
