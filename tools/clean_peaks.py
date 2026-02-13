#!/usr/bin/env python3
"""
Clean narrowPeak files: clip outlier scores, rescale, and optionally
clamp to chromosome boundaries.

Two modes:
  fseq  - For fseq/fseq2 output: clips signalValue, rescales score [100,1000]
  bigbed - For bigBed prep: clips V5 (score), rescales [0,1000], optional chrom clamp
"""

import sys
from argparse import ArgumentParser

import numpy as np
import pandas as pd


def rescale(n, after=(0, 1), before=()):
    if not before:
        before = (min(n), max(n))
    if (before[1] - before[0]) == 0:
        return n
    return ((after[1] - after[0]) * (n - before[0]) /
            (before[1] - before[0])) + after[0]


def clean_fseq(peak_file, output_path):
    df = pd.read_csv(peak_file, sep='\t', header=None,
                     names=("chr", "start", "end", "name", "score",
                            "strand", "signalValue", "pValue",
                            "qValue", "peak"))
    nn = df['signalValue'].quantile(q=0.99)
    df.loc[df['signalValue'] > nn, 'signalValue'] = nn
    df['score'] = rescale(np.log(df['signalValue']), [100, 1000])
    df['score'] = pd.to_numeric(df['score'].round(), downcast='integer')
    df.to_csv(output_path, sep='\t', header=False, index=False)


def clean_bigbed(peak_file, output_path, chrom_sizes=None):
    df = pd.read_csv(peak_file, sep='\t', header=None,
                     names=("V1","V2","V3","V4","V5","V6",
                            "V7","V8","V9","V10"))
    nn = df['V5'].quantile(q=0.99)
    df.loc[df['V5'] > nn, 'V5'] = nn
    df['V5'] = rescale(np.log(df['V5']), [0, 1000])

    if chrom_sizes is not None:
        cs = pd.read_csv(chrom_sizes, sep='\t', header=None,
                         names=("V1", "V2"))
        df = df.merge(cs, on="V1")
        df.columns = ["V1","V2","V3","V4","V5","V6",
                      "V7","V8","V9","V10","V11"]
        n = np.array(df['V3'].values.tolist())
        df['V3'] = np.where(n > df['V11'], df['V11'], n).tolist()
        df = df.drop(columns=["V11"])

    df['V5'] = pd.to_numeric(df['V5'].round(), downcast='integer')
    df.to_csv(output_path, sep='\t', header=False, index=False)


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument('-i', '--infile', required=True)
    parser.add_argument('-o', '--outfile', required=True)
    parser.add_argument('-s', '--chrom-sizes', default=None)
    parser.add_argument('-m', '--mode', choices=['fseq', 'bigbed'],
                        default='bigbed')
    args = parser.parse_args()

    if args.mode == 'fseq':
        clean_fseq(args.infile, args.outfile)
    else:
        clean_bigbed(args.infile, args.outfile, args.chrom_sizes)


if __name__ == "__main__":
    main()
