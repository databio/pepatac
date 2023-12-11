#!/usr/bin/env python3
"""
PEPATAC Collator - ATAC-seq project-level pipeline 
"""

__author__ = ["Jason Smith", "Michal Stolarczyk"]
__email__ = "jasonsmith@virginia.edu"
__version__ = "0.0.5"

from argparse import ArgumentParser
import os
import sys
import pypiper
import peppy
from peppy.utils import load_yaml
import yaml
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
    parser = pypiper.add_pypiper_args(parser, groups=['pypiper', 'looper', 'common'])
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
    parser.add_argument("-s", "--min-score", default=5,
                        help="A minimum peak score to keep an " +
                             "individual peak.")
    parser.add_argument("-l", "--min-olap", default=1,
                        help="A minimum number of overlapping bases to " +
                             "defined peaks as overlapping.")
    args = parser.parse_args()
    return args


def main():
    args = parse_arguments()

    outfolder = os.path.abspath(os.path.join(args.output_parent, "summary"))
    
    pm = pypiper.PipelineManager(name="PEPATAC", outfolder=outfolder, pipestat_sample_name="PEPATAC_Collator", pipestat_pipeline_type="project",
                                 args=args, version=__version__)

    pm.debug(f"\nargs: {args}\n")

    project = peppy.Project(args.config_file)
    #results_subdir = "/home/jps3dp/processed/pepatac_tutorial//processed/results_pipeline"
    #stats_yaml_files.append(os.path.join(args.results, sample, "stats.yaml"))
    # project._project_data['_config']['looper']['output_dir']
    project_stats_file = os.path.join(args.output_parent, f"{project.name}_stats_summary.yaml")
    stats_yaml_files = []
    sample_names = []
    for sample in project.sample_table.sample_name:
        pm.debug(f"sample name: {sample}")
        sample_names.append(sample)
        stats_yaml_files.append(os.path.join(args.results, sample, "stats.yaml"))
    num_samples = len(sample_names)
    yaml_dict = load_yaml(stats_yaml_files[0])
    if num_samples > 1:
        sample_names = sample_names[1:]
        stats_yaml_files = stats_yaml_files[1:]
    for i in range(len(stats_yaml_files)):
        pm.debug(f"i: {i}")
        sample_name = sample_names[i]
        yaml_tmp = load_yaml(stats_yaml_files[i])
        yaml_dict['PEPATAC']['sample'][sample_name] = yaml_tmp['PEPATAC']['sample'][sample_name]
    with open(project_stats_file, 'w') as file:
        yaml.dump(yaml_dict, file)
    print(f"Summary (n={num_samples}: {project_stats_file})")

    cmd = (f"Rscript {tool_path('PEPATAC_summarizer.R')} "
           f"{args.config_file} {args.output_parent} "
           f"{args.results} {args.cutoff} {args.min_score} {args.min_olap}")
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

    pm.report_object("Library complexity", complexity_file)
    pm.report_object("consensus_peaks_file", consensus_peaks_file)
    pm.report_object("counts_table", peak_coverage_file)

    pm.stop_pipeline()


if __name__ == '__main__':
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        print("Pipeline aborted.")
        sys.exit(1)
