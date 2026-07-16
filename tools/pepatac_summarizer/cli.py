#!/usr/bin/env python3
"""PEPATAC Project Summarizer CLI - Python replacement for PEPATAC_summarizer.R"""

import argparse
from pathlib import Path
import pandas as pd
import peppy

from .assets import create_assets_summary
from .consensus import calculate_consensus_peaks
from .counts import calculate_peak_counts
from .utils import load_stats_summary
from .plots import (
    plot_aligned_raw,
    plot_aligned_pct,
    plot_tss_scores,
    plot_lib_sizes,
    plot_complexity_curves,
)


def main():
    parser = argparse.ArgumentParser(description="PEPATAC Project Summarizer")
    parser.add_argument("config", help="PEP project config YAML")
    parser.add_argument("output", help="Project output directory")
    parser.add_argument("results", help="Results subdirectory path")
    parser.add_argument("-N", "--new-start", action="store_true",
                        help="Start over, run every command")
    parser.add_argument("-P", "--skip-consensus", action="store_true",
                        help="Do not calculate consensus peaks")
    parser.add_argument("-T", "--skip-table", action="store_true",
                        help="Do not calculate peak counts table")
    parser.add_argument("-m", "--cutoff", type=int, default=2,
                        help="Min samples for consensus peaks")
    parser.add_argument("-s", "--min-score", type=float, default=None,
                        help="Min peak score. If unset, defaults to 5 for "
                             "'legacy' (released behavior) and 0 for "
                             "'reproducible' (reproducibility gates inclusion; "
                             "set this to re-impose a score floor).")
    parser.add_argument("-l", "--min-olap", type=int, default=1,
                        help="Min overlap bases")
    parser.add_argument("-C", "--consensus-method",
                        choices=["legacy", "reproducible"], default="reproducible",
                        help="Consensus peak method. 'reproducible' (default) "
                             "gates inclusion on cross-sample reproducibility "
                             "(rescues weak-but-reproducible peaks; min_score "
                             "becomes an optional floor) and writes a confidence "
                             "sidecar. 'legacy' reproduces the released "
                             "collapsePeaks behavior exactly (for recreating "
                             "prior consensus peak sets).")
    parser.add_argument("--repro-cutoff", type=float, default=0.6,
                        help="reproducible method: keep a peak called in at "
                             "least this fraction of samples regardless of "
                             "score (default 0.6).")
    parser.add_argument("--no-recenter", action="store_false", dest="recenter",
                        help="reproducible method: disable the default signal-max "
                             "recentering of off-center consensus peaks. By "
                             "default, off-center peaks are shifted onto their "
                             "signal max (overlap-guarded, so a recenter never "
                             "collides with a neighbor); this requires pyBigWig "
                             "and the per-sample coverage tracks (it is skipped "
                             "gracefully if they are absent).")
    parser.add_argument("--distinct", choices=["none", "drop", "trim"],
                        default="drop",
                        help="reproducible method: make consensus peaks "
                             "non-overlapping. 'drop' (default) drops the "
                             "lower-confidence peak of each overlap, keeping "
                             "fixed width (matches the fixed-width count-"
                             "comparability rationale; ~1%% fewer peaks). 'trim' "
                             "trims overlaps to their midpoint (keeps every peak "
                             "but yields sub-500bp widths). 'none' leaves "
                             "overlaps. Distinct peaks avoid read double-counting "
                             "in the counts step.")
    parser.add_argument("-F", "--frip-ref-peaks",
                        help="Reference peak set for counts table")
    parser.add_argument("-V", "--poverlap", action="store_true",
                        help="Calculate percentage overlap in counts table")
    parser.add_argument("-Z", "--normalized", action="store_true",
                        help="Use normalized read counts")

    args = parser.parse_args()

    project = peppy.Project(args.config)
    project_name = project.name

    sample_table = pd.DataFrame({
        "sample_name": project.sample_table["sample_name"],
        "genome": project.sample_table["genome"]
    })

    results_subdir = Path(args.results)
    if not results_subdir.exists():
        print(f"Error: Results subdirectory does not exist: {results_subdir}")
        return 1

    output_dir = Path(args.output)
    summary_dir = output_dir / "summary"
    summary_dir.mkdir(parents=True, exist_ok=True)

    assets = create_assets_summary(
        list(project.sample_table["sample_name"]),
        str(results_subdir)
    )

    if assets.empty:
        print("No assets found - exiting")
        return 1

    assets_file = output_dir / f"{project_name}_assets_summary.tsv"
    assets.to_csv(assets_file, sep="\t", index=False, header=False)
    print(f"Summary (n={len(assets['sample_name'].unique())}): {assets_file}")

    stats_file = output_dir / f"{project_name}_stats_summary.yaml"
    stats = load_stats_summary(stats_file)

    if stats is not None and not stats.empty:
        print("Creating summary plots...")
        plot_aligned_raw(stats, str(summary_dir), project_name)
        plot_aligned_pct(stats, str(summary_dir), project_name)
        plot_tss_scores(stats, str(summary_dir), project_name)
        plot_lib_sizes(stats, str(summary_dir), project_name)
    else:
        print("Warning: No stats summary available, skipping summary plots")

    sample_names = list(project.sample_table["sample_name"])
    genomes = list(project.sample_table["genome"])
    plot_complexity_curves(
        sample_names, genomes,
        str(results_subdir), str(summary_dir), project_name
    )

    # Method-aware min_score default: legacy keeps the released floor of 5;
    # reproducible defaults to 0 so reproducibility (not score) gates inclusion.
    min_score = args.min_score
    if min_score is None:
        min_score = 5.0 if args.consensus_method == "legacy" else 0.0

    consensus_files = {}
    if not args.skip_consensus:
        consensus_files = calculate_consensus_peaks(
            sample_table, str(summary_dir), str(results_subdir), project_name,
            min_samples=args.cutoff, min_score=min_score, min_olap=args.min_olap,
            method=args.consensus_method, repro_cutoff=args.repro_cutoff,
            recenter=args.recenter, distinct=args.distinct
        )

    if not args.skip_table and consensus_files:
        calculate_peak_counts(
            sample_table, str(summary_dir), str(results_subdir), project_name,
            consensus_files, normalized=args.normalized, poverlap=args.poverlap
        )

    print("Successfully produced project summary.")
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())
