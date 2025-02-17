#!/usr/bin/env python

from argparse import ArgumentParser
import sys
import pandas as pd
import numpy as np

def parse_args(cmdl):
    parser = ArgumentParser()
    parser.add_argument('-i', '--infile', dest='peak_output_file', required=True)
    parser.add_argument('-o', '--outfile', dest='output_path', required=True)
    parser.add_argument('-s', '--chrom-sizes', dest='chrom_sizes', default=None)

    return parser.parse_args(cmdl)


def rescale(n, after=[0,1], before=[]):
    """
    Helper function to rescale a vector between specified range of values
    
    :param numpy array n: a vector of numbers to be rescale 
    :param list after: range of values to which to scale n 
    :param list before: range of values in which n is contained
    """
    if not before:
        before=[min(n), max(n)]
    if (before[1] - before[0]) == 0:
        return n
    return (((after[1] - after[0]) * (n - before[0]) / 
             (before[1] - before[0])) + after[0])


def main(peak_output_file, chrom_sizes, output_path):
    df = pd.read_csv(peak_output_file, sep='\t', header=None,
                     names=("V1","V2","V3","V4","V5","V6","V7","V8","V9","V10"))
    nineNine = df['V5'].quantile(q=0.99)
    df.loc[df['V5'] > nineNine, 'V5'] = nineNine

    # rescale score to be between 0 and 1000
    df['V5'] = rescale(np.log(df['V5']), [0, 1000])

    if chrom_sizes is not None:
        cs = pd.read_csv(chrom_sizes, sep='\t', header=None, names=("V1","V2"))
        df = df.merge(cs, on="V1")
        df.columns = ["V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11"]
        # make sure 'chromEnd' positions are not greater than the 
        # max chrom_size
        n = np.array(df['V3'].values.tolist())
        df['V3'] = np.where(n > df['V11'], df['V11'], n).tolist()

        df = df.drop(columns=["V11"])

    # ensure score is a whole integer value
    df['V5'] = pd.to_numeric(df['V5'].round(), downcast='integer')
    df.to_csv(output_path, sep='\t', header=False, index=False)

if __name__ == "__main__":
    args = parse_args(sys.argv[1:])
    main(peak_output_file=args.peak_output_file, chrom_sizes=args.chrom_sizes, output_path=args.output_path)
