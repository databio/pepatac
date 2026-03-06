#!/usr/bin/env python3
"""
Generate golden input/output files for clean_peaks.py regression tests.

Run this script once to create the golden files. Commit the results.
Re-run only if the algorithm intentionally changes.

Usage:
    python tests/golden/generate_golden.py
"""

import os
import sys

import numpy as np
import pandas as pd

# Add tools directory so we can import clean_peaks
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(os.path.dirname(SCRIPT_DIR))
sys.path.insert(0, os.path.join(REPO_ROOT, "tools"))
from clean_peaks import clean_bigbed, clean_fseq


def make_fseq_input(path, n=200):
    """Create a deterministic narrowPeak file for fseq mode."""
    np.random.seed(42)
    signal_values = np.random.exponential(scale=10.0, size=n) + 1.0
    rows = []
    for i in range(n):
        rows.append({
            "chr": "chr1",
            "start": i * 500,
            "end": i * 500 + 300,
            "name": f"peak_{i}",
            "score": 0,
            "strand": ".",
            "signalValue": signal_values[i],
            "pValue": -1.0,
            "qValue": -1.0,
            "peak": 150,
        })
    df = pd.DataFrame(rows)
    df.to_csv(path, sep="\t", header=False, index=False)
    print(f"  Wrote {path} ({len(df)} rows)")


def make_bigbed_input(path, n=200):
    """Create a deterministic narrowPeak file for bigbed mode (no chrom issues)."""
    np.random.seed(42)
    scores = np.random.exponential(scale=50.0, size=n) + 1.0
    rows = []
    for i in range(n):
        rows.append([
            "chr1",
            i * 500,
            i * 500 + 300,
            f"peak_{i}",
            scores[i],
            ".",
            1.5,
            -1.0,
            -1.0,
            150,
        ])
    df = pd.DataFrame(
        rows, columns=["V1", "V2", "V3", "V4", "V5", "V6",
                        "V7", "V8", "V9", "V10"]
    )
    df.to_csv(path, sep="\t", header=False, index=False)
    print(f"  Wrote {path} ({len(df)} rows)")


def make_bigbed_chrom_input(path, n=50):
    """Create a narrowPeak file with some chromEnd values exceeding chrom sizes."""
    np.random.seed(42)
    scores = np.random.exponential(scale=50.0, size=n) + 1.0
    chroms = ["chr1", "chr2"]
    rows = []
    for i in range(n):
        chrom = chroms[i % len(chroms)]
        # Deliberately create some chromEnd values that exceed boundaries
        # chr1 size = 55000, chr2 size = 30000
        end = i * 1200 + 300  # Will exceed chr2 size around i=25, chr1 around i=46
        rows.append([
            chrom,
            i * 500,
            end,
            f"peak_{i}",
            scores[i],
            ".",
            1.5,
            -1.0,
            -1.0,
            150,
        ])
    df = pd.DataFrame(
        rows, columns=["V1", "V2", "V3", "V4", "V5", "V6",
                        "V7", "V8", "V9", "V10"]
    )
    df.to_csv(path, sep="\t", header=False, index=False)
    print(f"  Wrote {path} ({len(df)} rows)")


def make_chrom_sizes(path):
    """Create a chromosome sizes file."""
    with open(path, "w") as f:
        f.write("chr1\t55000\n")
        f.write("chr2\t30000\n")
    print(f"  Wrote {path}")


def main():
    golden_dir = SCRIPT_DIR

    print("Generating golden input files...")
    fseq_input = os.path.join(golden_dir, "fseq_input.narrowPeak")
    bigbed_input = os.path.join(golden_dir, "bigbed_input.narrowPeak")
    bigbed_chrom_input = os.path.join(golden_dir, "bigbed_chrom_input.narrowPeak")
    chrom_sizes = os.path.join(golden_dir, "chrom.sizes")

    make_fseq_input(fseq_input)
    make_bigbed_input(bigbed_input)
    make_bigbed_chrom_input(bigbed_chrom_input)
    make_chrom_sizes(chrom_sizes)

    print("\nGenerating golden expected output files...")
    fseq_expected = os.path.join(golden_dir, "fseq_expected.narrowPeak")
    bigbed_expected = os.path.join(golden_dir, "bigbed_expected.narrowPeak")
    bigbed_chrom_expected = os.path.join(golden_dir, "bigbed_chrom_expected.narrowPeak")

    clean_fseq(fseq_input, fseq_expected)
    print(f"  Wrote {fseq_expected}")

    clean_bigbed(bigbed_input, bigbed_expected)
    print(f"  Wrote {bigbed_expected}")

    clean_bigbed(bigbed_chrom_input, bigbed_chrom_expected, chrom_sizes=chrom_sizes)
    print(f"  Wrote {bigbed_chrom_expected}")

    print("\nDone. Golden files are ready for regression testing.")


if __name__ == "__main__":
    main()
