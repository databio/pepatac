#!/usr/bin/env python3
"""
PEPATAC Collator - ATAC-seq project-level pipeline 
"""

__author__ = ["Jason Smith", "Michal Stolarczyk"]
__email__ = "jasonsmith@virginia.edu"
__version__ = "0.0.3"

from argparse import ArgumentParser
import os
import sys
import pypiper
from ubiquerg import VersionInHelpParser

def tool_path(tool_name):
    """
    Return the path to a tool used by this pipeline.

    :param str tool_name: name of the tool (e.g., a script file_name)
    :return str: real, absolute path to tool (expansion and symlink resolution)
    """

    return os.path.join(os.path.dirname(os.path.dirname(__file__)),
                        "tools", tool_name)


def parse_arguments():
    """
    Creat parser instance and parse command-line arguments passed to the pipeline

    :return argparse.Namespace: parsed arguments namespace
    """
    parser = VersionInHelpParser(prog="PEPATAC_collator",
        description='PEPATAC collator' , version=__version__)
    parser = pypiper.add_pypiper_args(parser, groups=['pypiper', 'looper'])
    parser.add_argument("-n", "--name",
                        help="Name of the project to use.", type=str)
    parser.add_argument("-r", "--results",
                        help="Output results sub directory path.", type=str)
    parser.add_argument("--skip-consensus", action='store_true',
                        dest="skip_consensus", default=False,
                        help="Do not calculate consensus peaks.")
    parser.add_argument("--skip-table", action='store_true',
                        dest="skip_table", default=False,
                        help="Do not calculate peak counts table.")
    parser.add_argument("--poverlap", action='store_true',
                        dest="poverlap", default=False,
                        help="Calculate the percentage overlap of reads " +
                             "in peaks for the counts table.")
    parser.add_argument("--normalized", action='store_true',
                        dest="normalized", default=False,
                        help="Use normalized read counts in peak table.")
    parser.add_argument("-m", "--cutoff", default=2,
                        help="Only keep peaks present in at least this " +
                             "number of samples.")
    args = parser.parse_args()
    return args


def main():
    args = parse_arguments()
    outfolder = os.path.abspath(os.path.join(args.output_parent, "summary"))
    
    pm = pypiper.PipelineManager(name="PEPATAC_collator", outfolder=outfolder,
                                 args=args, version=__version__)

    cmd = "Rscript {R_file} {cfg_file} {out_dir} {results_dir} {cutoff}".format(
        R_file=tool_path("PEPATAC_summarizer.R"),
        cfg_file=args.config_file,
        out_dir=args.output_parent,
        results_dir=args.results,
        cutoff=args.cutoff)
    if args.new_start:
        cmd += " --new-start"
    if args.skip_consensus:
        cmd += " --skip-consensus"
    if args.skip_table:
        cmd += " --skip-table"
    if args.poverlap:
        cmd += " --poverlap"
    if args.normalized:
        cmd += " --normalized"

    complexity_file = os.path.join(
        outfolder, "{name}_libComplexity.pdf".format(name=args.name))
    consensus_peaks_file = os.path.join(
        outfolder, "{name}_*_consensusPeaks.narrowPeak".format(name=args.name))
    peak_coverage_file = os.path.join(
        outfolder, "{name}_peaks_coverage.tsv".format(name=args.name))

    pm.run(cmd, [complexity_file, consensus_peaks_file, peak_coverage_file])
    pm.stop_pipeline()


if __name__ == '__main__':
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        print("Pipeline aborted.")
        sys.exit(1)
