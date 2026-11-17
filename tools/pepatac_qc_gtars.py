#!/usr/bin/env python
"""
PEPATAC QC calculations using gtars (Rust) backend.

This module provides gtars-based alternatives to the R/PEPATACr QC functions.
Each function produces the same output files as the R equivalent.

Usage:
    In pepatac.py, use --qc-backend gtars to enable these functions.
"""

import os
import re
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt


# --- Helpers ---------------------------------------------------------------

def _chrom_sort_key(name):
    """Natural sort key for chromosome names.

    Orders chr1, chr2, ... chr22, chrX, chrY, chrM, then any other (alt/un)
    contigs alphabetically.
    """
    raw = name.replace('chr', '')
    if raw.isdigit():
        return (0, int(raw), raw)
    if raw.upper() in ('X', 'Y', 'M', 'MT'):
        return (1, {'X': 0, 'Y': 1, 'M': 2, 'MT': 2}[raw.upper()], raw)
    return (2, 0, raw)


def _save_fig(fig, output_pdf, output_png=None, dpi=150):
    fig.savefig(output_pdf, format='pdf', dpi=dpi)
    if output_png:
        fig.savefig(output_png, format='png', dpi=dpi)
    plt.close(fig)


# --- TSS enrichment --------------------------------------------------------

def plot_tss_enrichment(tss_file, output_pdf, output_png=None):
    """Plot TSS enrichment from pre-computed values.

    The pyTssEnrichment.py script writes a per-bp signal vector (one value per
    line) symmetric around the TSS. This function normalizes to the baseline
    of the flanking 5% and plots the signal.
    """
    with open(tss_file) as f:
        values = [float(x.strip()) for x in f if x.strip()]

    if not values:
        return

    list_len = int(0.05 * len(values))
    if list_len > 1:
        flank = values[1:list_len]
        baseline = sum(flank) / len(flank) if flank else 0.0
        norm_values = [x / baseline for x in values] if baseline > 0 else values
    else:
        norm_values = values

    fig, ax = plt.subplots(figsize=(7, 7))
    half = len(norm_values) // 2
    x = np.arange(-half, len(norm_values) - half)
    ax.plot(x, norm_values, color='#1f77b4', linewidth=1.5)
    ax.set_xlabel('Distance from TSS (bp)')
    ax.set_ylabel('TSS enrichment score')
    ax.set_title('TSS enrichment')
    ax.axhline(y=1, color='gray', linestyle='--', alpha=0.5)
    ax.axvline(x=0, color='gray', linestyle='--', alpha=0.5)
    fig.tight_layout()
    _save_fig(fig, output_pdf, output_png)


# --- Fragment length distribution ------------------------------------------

def plot_fragment_distribution(frag_file, count_file, output_pdf, output_txt,
                               output_png=None):
    """Plot fragment length distribution.

    Reads `count_file` (output of `sort -n frag_file | uniq -c`), which has
    lines like:  "<count> <length>".

    Writes a small txt summary (total fragments, mean length) alongside the
    plot.
    """
    lengths = []
    counts = []
    with open(count_file) as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                try:
                    counts.append(int(parts[0]))
                    lengths.append(int(parts[1]))
                except ValueError:
                    continue

    if not lengths:
        return

    lengths = np.array(lengths)
    counts = np.array(counts)

    total = int(counts.sum())
    mean_len = float(np.average(lengths, weights=counts)) if total > 0 else 0.0
    median_idx = np.searchsorted(counts.cumsum(), total / 2)
    median_len = int(lengths[min(median_idx, len(lengths) - 1)]) if total > 0 else 0

    with open(output_txt, 'w') as f:
        f.write(f"Total fragments\t{total}\n")
        f.write(f"Mean fragment length\t{mean_len:.1f}\n")
        f.write(f"Median fragment length\t{median_len}\n")

    fig, ax = plt.subplots(figsize=(8, 6))
    ax.bar(lengths, counts, width=1, color='#1f77b4')
    ax.set_xlabel('Fragment length (bp)')
    ax.set_ylabel('Read count')
    ax.set_title('Fragment length distribution')
    upper = min(1000, int(lengths.max()) + 50)
    ax.set_xlim(0, upper)
    fig.tight_layout()
    _save_fig(fig, output_pdf, output_png)


# --- Peak chromosome distribution ------------------------------------------

def plot_chrom_distribution(query_bed, chrom_sizes, output_pdf, output_png=None):
    """Plot the per-chromosome peak count distribution.

    Restricts to canonical chromosomes (chr1-22, chrX, chrY, chrM) plus any
    non-canonical contig holding at least 1% of the maximum-bin peak count.
    Alt/unplaced contigs with negligible peak counts are dropped so the
    axis stays readable. `chrom_sizes` is accepted for API parity and is
    not currently used.
    """
    from gtars.models import RegionSet

    rs = RegionSet(query_bed)
    stats = rs.chromosome_statistics()

    counts_all = {c: stats[c].number_of_regions for c in stats}
    if not counts_all:
        return
    max_count = max(counts_all.values())
    threshold = max(1, int(0.01 * max_count))

    canonical = {f'chr{i}' for i in range(1, 23)} | {'chrX', 'chrY', 'chrM'}
    keep = [c for c, n in counts_all.items()
            if c in canonical or n >= threshold]
    keep.sort(key=_chrom_sort_key)
    counts = [counts_all[c] for c in keep]

    fig, ax = plt.subplots(figsize=(10, 6))
    ax.bar(range(len(keep)), counts, color='#1f77b4')
    ax.set_xticks(range(len(keep)))
    ax.set_xticklabels(keep, rotation=45, ha='right')
    ax.set_xlabel('Chromosome')
    ax.set_ylabel('Peak count')
    ax.set_title('Peak chromosome distribution')
    fig.tight_layout()
    _save_fig(fig, output_pdf, output_png)


# --- TSS distance distribution ---------------------------------------------

def plot_tss_distance(query_bed, tss_bed, output_pdf, output_png=None,
                      max_dist=100_000):
    """Plot the distribution of distances from each query region to the
    nearest TSS.

    Uses gtars TssIndex.calc_tss_distances(), then histograms the result on
    a symmetric log scale around 0. Distances beyond +/- `max_dist` are
    clipped into the outer bins.
    """
    from gtars.models import RegionSet, TssIndex

    tss_rs = RegionSet(tss_bed)
    idx = TssIndex.from_regionset(tss_rs)
    peaks = RegionSet(query_bed)
    # `calc_tss_distances` returns unsigned distances; peaks on chromosomes
    # with no TSS get the sentinel value u32::MAX. We filter those out.
    # (TssIndex.feature_distances returns signed distances but emits None
    # for missing-TSS chromosomes, which is awkward to clip; absolute is
    # sufficient for a QC histogram.)
    raw = idx.calc_tss_distances(peaks)
    SENTINEL = (1 << 32) - 1
    dists = [d for d in raw if d != SENTINEL]

    if not dists:
        return

    arr = np.asarray(dists, dtype=float)
    arr = np.clip(arr, 0, max_dist)

    fig, ax = plt.subplots(figsize=(8, 6))
    bins = np.linspace(0, max_dist, 51)
    ax.hist(arr, bins=bins, color='#1f77b4', edgecolor='none')
    ax.set_xlabel('Distance to nearest TSS (bp)')
    ax.set_ylabel('Peak count')
    ax.set_title('Peak TSS distance distribution')
    fig.tight_layout()
    _save_fig(fig, output_pdf, output_png)


# --- Peak genomic partition distribution -----------------------------------

# Partition order matches GenomicDistributions defaults: promoters at top,
# intergenic at the bottom of stacked bars.
_PARTITION_ORDER = [
    'promoterCore',
    'promoterProx',
    'fiveUTR',
    'threeUTR',
    'exon',
    'intron',
    'intergenic',
]


def _ordered_partitions(labels, counts):
    """Reorder partitions to match _PARTITION_ORDER; unknowns go at the end."""
    pairs = dict(zip(labels, counts))
    ordered = [(p, pairs[p]) for p in _PARTITION_ORDER if p in pairs]
    extras = [(p, pairs[p]) for p in pairs if p not in _PARTITION_ORDER]
    ordered.extend(extras)
    return zip(*ordered) if ordered else ([], [])


def plot_partition_distribution(query_bed, gene_model_gtf, genome, output_pdf,
                                output_png=None, expected=False,
                                core_prom=100, prox_prom=2000):
    """Plot the distribution of query regions across genomic partitions.

    Builds a PartitionList from a GTF (promoterCore / promoterProx / 5'UTR /
    3'UTR / exon / intron / intergenic) and produces a horizontal stacked bar
    plot of the bp-weighted partition fractions.

    `genome` is accepted for parity with the R signature; it isn't used by the
    gtars backend (partitions come from the GTF directly).
    """
    from gtars.models import RegionSet, PartitionList
    from gtars.genomic_distributions import calc_partitions

    rs = RegionSet(query_bed)
    pl = PartitionList.from_gtf(
        gene_model_gtf,
        core_prom=core_prom,
        prox_prom=prox_prom,
        filter_protein_coding=True,
        convert_ensembl_ucsc=True,
    )
    result = calc_partitions(rs, pl, bp_proportion=True)

    labels = list(result['partition'])
    counts = list(result['count'])
    total = float(result.get('total', sum(counts)))

    labels, counts = _ordered_partitions(labels, counts)
    labels = list(labels)
    counts = list(counts)
    fractions = [c / total * 100.0 if total > 0 else 0.0 for c in counts]

    fig, ax = plt.subplots(figsize=(9, 4))
    colors = plt.cm.Set2(np.linspace(0, 1, len(labels)))
    left = 0.0
    for label, frac, color in zip(labels, fractions, colors):
        ax.barh(['observed'], [frac], left=left, color=color, label=label,
                edgecolor='white')
        # Inline percentage labels for partitions wider than 3% so the chart
        # is readable without consulting the legend.
        if frac >= 3.0:
            ax.text(left + frac / 2, 0, f'{frac:.1f}%',
                    ha='center', va='center', fontsize=9, color='black')
        left += frac

    ax.set_xlim(0, 100)
    ax.set_xlabel('Percent of genome bp')
    ax.set_title('Peak genomic partition distribution')
    ax.legend(loc='upper center', bbox_to_anchor=(0.5, -0.15),
              ncol=min(len(labels), 4), frameon=False, fontsize=9)
    fig.tight_layout()
    _save_fig(fig, output_pdf, output_png)


# --- FRiF / cFRiF ----------------------------------------------------------

def _read_coverage_bed(path):
    """Sum read counts in a bedtools-coverage output file.

    Each line is:  chrom  start  end  [name strand]  count  bases_covered
                   total_size  fraction_covered

    PEPATAC's pipeline generates these with `bedtools coverage -sorted` over
    feature BED3 (cut -f 1-3), so the count column is column 4 and the
    bases-covered column is column 5. We use the bases-covered column for
    base-pair-weighted fractions and the count column for read-weighted
    fractions.
    """
    total_reads = 0
    total_bases = 0
    total_size = 0
    with open(path) as f:
        for line in f:
            parts = line.rstrip('\n').split('\t')
            if len(parts) < 7:
                continue
            try:
                total_reads += int(parts[3])
                total_bases += int(parts[4])
                total_size += int(parts[5])
            except (ValueError, IndexError):
                continue
    return total_reads, total_bases, total_size


def plot_frif(coverage_files, annotation_bed, output_pdf, output_png=None,
              cumulative=True, priority=False, reads=True,
              genome_size=None):
    """Plot Fraction of Reads in Features (FRiF) and cumulative FRiF (cFRiF).

    `coverage_files` is a list of `<sample>_<feature>_coverage.bed` files,
    each the output of `bedtools coverage -sorted -a feature_bed -b bam`.
    Feature name is parsed from the filename. Reads counts are computed
    directly from the coverage files; no gtars call is needed.

    `annotation_bed` is currently unused; we already have feature-split
    coverage files. Kept for API parity.

    Note: this is a simplified implementation. The R PEPATACr version
    additionally normalizes by genome size and total read count to get an
    "expected" fraction. We report observed feature fractions (each feature
    independent) and the cumulative running total, which is sufficient for
    visual QC.
    """
    if not coverage_files:
        return

    # Pull (feature_name, fraction) pairs from each coverage file.
    fractions = []
    for cov_file in coverage_files:
        name = os.path.basename(cov_file)
        # Strip sample prefix (sample_<feature>_coverage.bed) heuristically:
        # the suffix "_coverage.bed" is stripped, then we take what's left.
        name = re.sub(r'_coverage\.bed$', '', name)
        total_reads, total_bases, total_size = _read_coverage_bed(cov_file)
        if reads:
            value = total_reads
        else:
            value = total_bases
        fractions.append((name, value, total_size))

    if not fractions:
        return

    # If we have a denominator (genome size for bp, total read count for
    # reads), normalize to fractions in [0, 1].
    if reads:
        denom = sum(v for _, v, _ in fractions) if not genome_size else genome_size
    else:
        denom = genome_size if genome_size else sum(s for _, _, s in fractions)
    denom = denom or 1

    labels = [f for f, _, _ in fractions]
    values = [v / denom for _, v, _ in fractions]

    fig, ax = plt.subplots(figsize=(9, 6))
    if cumulative:
        cum = np.cumsum(values)
        ax.bar(range(len(labels)), cum, color='#1f77b4')
        ylabel = 'Cumulative fraction of reads in features'
        title = 'cFRiF'
    else:
        ax.bar(range(len(labels)), values, color='#1f77b4')
        ylabel = 'Fraction of reads in features'
        title = 'FRiF'

    ax.set_xticks(range(len(labels)))
    ax.set_xticklabels(labels, rotation=45, ha='right')
    ax.set_xlabel('Genomic feature')
    ax.set_ylabel(ylabel)
    ax.set_title(title)
    fig.tight_layout()
    _save_fig(fig, output_pdf, output_png)


# --- CLI -------------------------------------------------------------------

if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='PEPATAC QC with gtars backend')
    subparsers = parser.add_subparsers(dest='command')

    tss_parser = subparsers.add_parser('tss', help='Plot TSS enrichment')
    tss_parser.add_argument('-i', '--input', required=True, help='TSS enrichment file')
    tss_parser.add_argument('-o', '--output', required=True, help='Output PDF')

    frag_parser = subparsers.add_parser('frag', help='Plot fragment distribution')
    frag_parser.add_argument('-l', '--lengths', required=True, help='Fragment lengths file')
    frag_parser.add_argument('-c', '--counts', required=True, help='Fragment counts file')
    frag_parser.add_argument('-p', '--pdf', required=True, help='Output PDF')
    frag_parser.add_argument('-t', '--txt', required=True, help='Output stats file')

    chrom_parser = subparsers.add_parser('chrom', help='Plot peak chromosome distribution')
    chrom_parser.add_argument('-i', '--input', required=True, help='Peak BED/narrowPeak')
    chrom_parser.add_argument('-c', '--chrom-sizes', required=False, help='Chromosome sizes file')
    chrom_parser.add_argument('-o', '--output', required=True, help='Output PDF')

    tssdist_parser = subparsers.add_parser('tssdist', help='Plot peak TSS distance distribution')
    tssdist_parser.add_argument('-i', '--input', required=True, help='Peak BED/narrowPeak')
    tssdist_parser.add_argument('-t', '--tss', required=True, help='TSS BED file')
    tssdist_parser.add_argument('-o', '--output', required=True, help='Output PDF')

    part_parser = subparsers.add_parser('part', help='Plot peak partition distribution')
    part_parser.add_argument('-i', '--input', required=True, help='Peak BED/narrowPeak')
    part_parser.add_argument('-g', '--gtf', required=True, help='Gene model GTF')
    part_parser.add_argument('-G', '--genome', default='hg38', help='Genome name')
    part_parser.add_argument('-o', '--output', required=True, help='Output PDF')

    frif_parser = subparsers.add_parser('frif', help='Plot FRiF / cFRiF')
    frif_parser.add_argument('-c', '--cov', nargs='+', required=True, help='Coverage BED files')
    frif_parser.add_argument('-o', '--output', required=True, help='Output PDF')
    frif_parser.add_argument('--cumulative', action='store_true', help='Plot cumulative FRiF')

    args = parser.parse_args()

    def _png_for(pdf):
        return os.path.splitext(pdf)[0] + '.png'

    if args.command == 'tss':
        plot_tss_enrichment(args.input, args.output, _png_for(args.output))
    elif args.command == 'frag':
        plot_fragment_distribution(args.lengths, args.counts, args.pdf,
                                   args.txt, _png_for(args.pdf))
    elif args.command == 'chrom':
        plot_chrom_distribution(args.input, args.chrom_sizes, args.output,
                                _png_for(args.output))
    elif args.command == 'tssdist':
        plot_tss_distance(args.input, args.tss, args.output, _png_for(args.output))
    elif args.command == 'part':
        plot_partition_distribution(args.input, args.gtf, args.genome,
                                    args.output, _png_for(args.output))
    elif args.command == 'frif':
        plot_frif(args.cov, None, args.output, _png_for(args.output),
                  cumulative=args.cumulative)
    else:
        parser.print_help()
