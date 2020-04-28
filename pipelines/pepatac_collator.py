#!/usr/bin/env python3
"""
PEPATAC Collator - ATAC-seq project-level pipeline 
"""

__author__ = ["Jason Smith", "Michal Stolarczyk"]
__email__ = "jasonsmith@virginia.edu"
__version__ = "0.0.1"

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
    parser = VersionInHelpParser(prog="PEPATAC collator", description='PEPATAC collator' , version=__version__)
    parser = pypiper.add_pypiper_args(parser, groups=['pypiper', 'looper'])
    parser.add_argument("-n", "--name", help="Name of the project to use.", type=str)
    parser.add_argument("-o", "--output", help="Output dir path.", type=str)
    args = parser.parse_args()
    return args


def main():
    args = parse_arguments()
    outfolder = os.path.abspath(os.path.join(args.output, "summary"))
    
    pm = pypiper.PipelineManager(
        name="PEPATAC collator", outfolder=outfolder,
        args=args, version=__version__)

    cmd = "Rscript {} {}".format(tool_path("PEPATAC_summarizer.R"), args.config_file)

    pm.run(cmd, [os.path.join(outfolder, "{name}_libComplexity.pdf".format(name=args.name)),
                 os.path.join(outfolder, "{name}_*_consensusPeaks.narrowPeak".format(name=args.name)),
                 os.path.join(outfolder, "{name}_peaks_coverage.tsv".format(name=args.name))])
    pm.stop_pipeline()


if __name__ == '__main__':
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        print("Pipeline aborted.")
        sys.exit(1)
