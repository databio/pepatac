#!/usr/bin/env python3
"""
PEPATAC - ATACseq pipeline
"""

__author__ = ["Jin Xu", "Nathan Sheffield", "Jason Smith"]
__email__ = "jasonsmith@virginia.edu"
__version__ = "0.11.3"


from argparse import ArgumentParser
import os
import re
import sys
import tempfile
import pypiper
from pathlib import Path
import psutil
import pandas as pd
import numpy as np
from pypiper import build_command
from refgenconf import RefGenConf as RGC, select_genome_config

TOOLS_FOLDER = "tools"
ANNO_FOLDER = "anno"
ALIGNERS = ["bowtie2", "bwa"]
PEAK_CALLERS = ["fseq", "fseq2", "genrich", "hmmratac", "homer", "macs3"]
PEAK_TYPES = [ "fixed", "variable"]
DEDUPLICATORS = ["picard", "samblaster", "samtools"]
TRIMMERS = ["trimmomatic", "pyadapt", "skewer"]
GENOME_IDX_KEY = "bowtie2_index"


def parse_arguments():
    """
    Parse command-line arguments passed to the pipeline.
    """
    # Argument Parsing from yaml file
    ###########################################################################
    parser = ArgumentParser(description='PEPATAC version ' + __version__)
    parser = pypiper.add_pypiper_args(parser, groups=
        ['pypiper', 'looper', 'ngs'],
        required=["input", "genome", "sample_name", "output_parent",
                  "chrom_sizes", "genome_index"])

    # Pipeline-specific arguments
    parser.add_argument("--trimmer", dest="trimmer", type=str.lower,
                        default="skewer", choices=TRIMMERS,
                        help="Name of read trimming program.")

    parser.add_argument("--aligner", dest="aligner", type=str.lower,
                        default="bowtie2", choices=ALIGNERS,
                        help="Name of read aligner.")

    parser.add_argument("--deduplicator", dest="deduplicator", type=str.lower,
                        default="samblaster", choices=DEDUPLICATORS,
                        help="Name of deduplicator program.")

    parser.add_argument("--peak-caller", dest="peak_caller", type=str.lower,
                        default="macs3", choices=PEAK_CALLERS,
                        help="Name of peak caller.")

    parser.add_argument("-gs", "--genome-size", default="2.7e9", type=str.lower,
                        help="Effective genome size. It can be 1.0e+9 "
                        "or 1000000000: e.g. human (2.7e9), mouse (1.87e9), "
                        "C. elegans (9e7), fruitfly (1.2e8). Default:2.7e9")

    parser.add_argument("--peak-type", default="fixed",
                        dest="peak_type", choices=PEAK_TYPES, type=str.lower,
                        help="Call variable or fixed width peaks.\n"
                             "Fixed width requires MACS3.")

    parser.add_argument("--extend", default=250,
                        dest="extend", type=int,
                        help="How far to extend fixed width peaks up and "
                             "downstream.")

    parser.add_argument("--frip-ref-peaks", default=None,
                        dest="frip_ref_peaks", type=str,
                        help="Path to reference peak set (BED format) "
                             "for calculating FRiP.")

    parser.add_argument("--motif", action='store_true',
                        dest="motif",
                        help="Perform motif enrichment analysis.")

    parser.add_argument("--sob", action='store_true',
                        dest="sob", default=False,
                        help="Use seqOutBias to produce signal tracks, "
                             "incorporate mappability information, "
                             "and account for Tn5 bias.")
    
    parser.add_argument("--no-scale", action='store_true',
                        dest="no_scale", default=False,
                        help="Do not scale signal tracks: "
                             "Default is to scale by read count.\n"
                             "If using seqOutBias, scales by the expected/"
                             "observed cut frequency.")

    parser.add_argument("--prioritize", action='store_true', default=False,
                        dest="prioritize",
                        help="Plot cFRiF/FRiF using mutually exclusive priority"
                             " ranked features based on the order of feature"
                             " appearance in the feature annotation asset.")

    parser.add_argument("--keep", action='store_true',
                        dest="keep",
                        help="Enable this flag to keep prealignment BAM files.")
                    
    parser.add_argument("--noFIFO", action='store_true',
                        dest="no_fifo",
                        help="Do NOT use named pipes during prealignments.")

    parser.add_argument("--lite", dest="lite", action='store_true',
                        help="Only keep minimal, essential output to conserve "
                             "disk space.")

    parser.add_argument("--skipqc", dest="skipqc", action='store_true',
                        help="Skip FastQC. Useful for bugs in FastQC "
                             "that appear with some sequence read files.")

    # Prealignment genome assets
    parser.add_argument("--prealignment-names", default=[], type=str,
                        nargs="+",
                        help="Space-delimited list of prealignment genome "
                             "names to align to before primary alignment.")
    
    parser.add_argument("--prealignment-index", default=[], type=str,
                        nargs="+",
                        help="Space-delimited list of prealignment genome "
                             "name and index files delimited by an equals sign "
                             "to align to before primary alignment. "
                             "e.g. rCRSd=/path/to/bowtie2_index/.")
    # Genome assets
    parser.add_argument("--genome-index", default=None, required=True,
                        dest="genome_index", type=str,
                        help="Path to primary genome index file. Either a "
                             "bowtie2 or bwa index.")

    parser.add_argument("--fasta", default=None, required=False,
                        dest="fasta", type=str,
                        help="Path to primary genome fasta file. Required "
                              "with --sob.")
    
    parser.add_argument("--chrom-sizes", default=None, required=True,
                        dest="chrom_sizes", type=str,
                        help="Path to primary genome chromosome sizes file.")

    parser.add_argument("--TSS-name", default=None,
                        dest="TSS_name", type=str,
                        help="Path to TSS annotation file.")

    parser.add_argument("--blacklist", default=None,
                        dest="blacklist", type=str,
                        help="Path to genomic region blacklist file.")

    parser.add_argument("--anno-name", default=None,
                        dest="anno_name", type=str,
                        help="Path to reference annotation file (BED format) "
                             "for calculating FRiF.")

    parser.add_argument("--search-file", default=None,
                        dest="search_file", type=str,
                        help="Required for seqOutBias (--sob). "
                             "Path to tallymer index search file built "
                             "with the same read length as the input.")

    parser.add_argument("-V", "--version", action="version",
                        version="%(prog)s {v}".format(v=__version__))

    args = parser.parse_args()

    if not args.input:
        parser.print_help()
        raise SystemExit

    return args


def report_message(pm, report_file, message, annotation=None):
    """
    Writes a string to provided file in a safe way.
    
    :param PipelineManager pm: a pypiper PipelineManager object
    :param str report_file: name of the output file
    :param str message: string to write to the output file
    :param str annotation: By default, the message will be annotated with the
        pipeline name, so you can tell which pipeline records which stats.
        If you want, you can change this; use annotation='shared' if you
        need the stat to be used by another pipeline (using get_stat()).
    """
    # Default annotation is current pipeline name.
    annotation = str(annotation or pm.name)

    message = str(message).strip()
    
    message = "{message}\t{annotation}".format(
        message=message, annotation=annotation)

    # Just to be extra careful, let's lock the file while we we write
    # in case multiple pipelines write to the same file.
    pm._safe_write_to_file(report_file, message)


def calc_frip(bamfile, peakfile, frip_func, pipeline_manager,
              aligned_reads_key="Aligned_reads"):
    """
    Calculate the fraction of reads in peaks (FRIP).

    Use the given function and data from an aligned reads file and a called
    peaks file, along with a PipelineManager, to calculate FRIP.

    :param str peakfile: path to called peaks file
    :param callable frip_func: how to calculate the fraction of reads in peaks;
        this must accept the path to the aligned reads file and the path to
        the called peaks file as arguments.
    :param str bamfile: path to aligned reads file
    :param pypiper.PipelineManager pipeline_manager: the PipelineManager in use
        for the pipeline calling this function
    :param str aligned_reads_key: name of the key from a stats (key-value) file
        to use to fetch the count of aligned reads
    :return float: fraction of reads in peaks
    """
    frip_cmd = frip_func(bamfile, peakfile)
    num_peak_reads = pipeline_manager.checkprint(frip_cmd)
    num_aligned_reads = pipeline_manager.get_stat(aligned_reads_key)
    print(num_aligned_reads, num_peak_reads)
    return float(num_peak_reads) / float(num_aligned_reads)


def _align(args, tools, paired, useFIFO, unmap_fq1, unmap_fq2,
           assembly_identifier, assembly, outfolder,
           aligndir=None, bt2_opts_txt=None, bwa_opts_txt=None):
    """
    A helper function to run alignments in series, so you can run one alignment
    followed by another; this is useful for successive decoy alignments.

    :param argparse.Namespace args: binding between option name and argument,
        e.g. from parsing command-line options
    :param looper.models.AttributeDict tools: binding between tool name and
        value, e.g. for tools/resources used by the pipeline
    :param bool paired: if True, use paired-end alignment
    :param bool useFIFO: if True, use named pipe instead of file creation
    :param str unmap_fq1: path to unmapped read1 FASTQ file
    :param str unmap_fq2: path to unmapped read2 FASTQ file
    :param str assembly_identifier: text identifying a genome assembly for the
        pipeline
    :param str assembly: assembly-specific folder (index, etc.)
    :param str outfolder: path to output directory for the pipeline
    :param str aligndir: name of folder for temporary output
    :param str bt2_opts_txt: command-line text for bowtie2 options
    :param str bwa_opts_txt: command-line text for bwa options
    :return (str, str): pair (R1, R2) of paths to FASTQ files
    """
    pm.timestamp("### Map to " + assembly_identifier)
    if not aligndir:
        align_subdir = "aligned_{}_{}".format(args.genome_assembly,
                                              assembly_identifier)
        sub_outdir = os.path.join(outfolder, align_subdir)
    else:
        sub_outdir = os.path.join(outfolder, aligndir)

    ngstk.make_dir(sub_outdir)
    bamname = f"{args.sample_name}_{assembly_identifier}.bam"
    all_mapped_bam = os.path.join(sub_outdir, 
        args.sample_name + "_" + assembly_identifier + "_all.bam")
    mapped_bam = os.path.join(sub_outdir, bamname)
    unmapped_bam = os.path.join(sub_outdir, 
        args.sample_name + "_" + assembly_identifier + "_unmapped.bam")
    summary_name = "{}_{}_bt_aln_summary.log".format(args.sample_name,
                                                     assembly_identifier)
    summary_file = os.path.join(sub_outdir, summary_name)

    out_fastq_pre = os.path.join(
        sub_outdir, args.sample_name + "_" + assembly_identifier)

    out_fastq_r1    = out_fastq_pre + '_unmap_R1.fq'
    out_fastq_r1_gz = out_fastq_r1  + '.gz'

    out_fastq_r2    = out_fastq_pre + '_unmap_R2.fq'
    out_fastq_r2_gz = out_fastq_r2  + '.gz'

    if (useFIFO and
            paired and not
            args.keep and not
            args.aligner.lower() == "bwa"):
        out_fastq_tmp = os.path.join(sub_outdir,
                assembly_identifier + "_bt2")
        cmd = "mkfifo " + out_fastq_tmp

        if os.path.exists(out_fastq_tmp):
            os.remove(out_fastq_tmp)
        pm.run(cmd, out_fastq_tmp)
    else:
        out_fastq_tmp    = out_fastq_pre + '_unmap.fq'
        out_fastq_tmp_gz = out_fastq_tmp + ".gz"

    filter_pair = build_command([tools.perl,
        tool_path("filter_paired_fq.pl"), out_fastq_tmp,
        unmap_fq1, unmap_fq2, out_fastq_r1, out_fastq_r2])

    # samtools sort needs a temporary directory
    tempdir = tempfile.mkdtemp(dir=sub_outdir)
    os.chmod(tempdir, 0o771)
    pm.clean_add(tempdir)

    if args.aligner == "bwa":
        if not bwa_opts_txt:
            # Default options
            bwa_opts_txt = "-M"
            bwa_opts_txt += " -SP" # Treat as single end no matter source
            bwa_opts_txt += " -r 3" # Increase speed at cost of accuracy
        # build bwa command
        cmd1 = tools.bwa + " mem -t " + str(pm.cores)
        cmd1 += " " + bwa_opts_txt
        cmd1 += " " + assembly
        cmd1 += " " + unmap_fq1
        cmd1 += " | " + tools.samtools + " view -bS - -@ 1"  # convert to bam
        cmd1 += " | " + tools.samtools + " sort - -@ 1"      # sort output
        cmd1 += " -T " + tempdir
        cmd1 += " -o " + all_mapped_bam
        pm.clean_add(all_mapped_bam)

        # get unmapped reads
        cmd2 = tools.samtools + " view -bS -f 4 -@ " + str(pm.cores)
        cmd2 += " " +  all_mapped_bam
        cmd2 += " > " + unmapped_bam

        # get mapped reads (don't remove if args.keep)
        cmd3 = tools.samtools + " view -bS -F 4 -@ " + str(pm.cores)
        cmd3 += " " +  all_mapped_bam
        cmd3 += " > " + mapped_bam
        if not args.keep:
            pm.clean_add(mapped_bam)

        # Convert bam to fastq for bwa requirement
        cmd4 = tools.bedtools + " bamtofastq "
        cmd4 += " -i " + unmapped_bam
        cmd4 += " -fq " + out_fastq_tmp
        pm.clean_add(unmapped_bam)

        if paired:
            pm.run([cmd1, cmd2, cmd3, cmd4, filter_pair], out_fastq_r2_gz)
        else:
            if args.keep:
                pm.run(cmd, mapped_bam)
            else:
                pm.run(cmd, out_fastq_tmp_gz)

        cmd = tools.samtools + " view -c " + mapped_bam
        align_exact = pm.checkprint(cmd)       
    else:
        if not bt2_opts_txt:
            # Default options
            bt2_opts_txt = "-k 1"  # Return only 1 alignment
            bt2_opts_txt += " -D 20 -R 3 -N 1 -L 20 -i S,1,0.50"           

        # Build bowtie2 command
        cmd = "(" + tools.bowtie2 + " -p " + str(pm.cores)
        cmd += " " + bt2_opts_txt
        cmd += " -x " + assembly
        cmd += " --rg-id " + args.sample_name
        cmd += " -U " + unmap_fq1
        cmd += " --un " + out_fastq_tmp
        if args.keep: #  or not paired
            #cmd += " --un-gz " + out_fastq_bt2 
            # Drop this for paired...repairing with filter_paired_fq.pl
            # In this samtools sort command we print to stdout and then use > to
            # redirect instead of  `+ " -o " + mapped_bam` because then samtools
            # uses a random temp file, so it won't choke if the job gets
            # interrupted and restarted at this step.
            cmd += " | " + tools.samtools + " view -bS - -@ 1"  # convert to bam
            cmd += " | " + tools.samtools + " sort - -@ 1"      # sort output
            cmd += " -T " + tempdir
            cmd += " -o " + mapped_bam
        else:
            cmd += " > /dev/null"
        cmd += ") 2>" + summary_file

        if paired:
            if args.keep or not useFIFO:
                pm.run([cmd, filter_pair], mapped_bam)
            else:
                pm.wait = False
                pm.run(filter_pair, [summary_file, out_fastq_r2_gz])
                pm.wait = True
                pm.run(cmd, [summary_file, out_fastq_r2_gz])
        else:
            if args.keep:
                pm.run(cmd, mapped_bam)
            else:
                # TODO: switch to this once filter_paired_fq works with SE
                #pm.run(cmd2, summary_file)
                #pm.run(cmd1, out_fastq_r1)
                pm.run(cmd, out_fastq_tmp_gz)
        cmd = ("grep 'aligned exactly 1 time' " + summary_file +
               " | awk '{print $1}'")
        align_exact = pm.checkprint(cmd)

    pm.clean_add(out_fastq_tmp)
 
    # report aligned reads
    if align_exact:
        ar = float(align_exact)*2
    else:
        ar = 0
    pm.report_result("Aligned_reads_" + assembly_identifier, ar)
    try:
        # wrapped in try block in case Trimmed_reads is not reported in this
        # pipeline.
        tr = float(pm.get_stat("Trimmed_reads"))
    except:
        print("Trimmed reads is not reported.")
    else:
        res_key = "Alignment_rate_" + assembly_identifier
        pm.report_result(res_key, round(float(ar) * 100 / float(tr), 2))
    
    if paired:
        unmap_fq1 = out_fastq_r1
        unmap_fq2 = out_fastq_r2
    else:
        # Use alternate once filter_paired_fq is working with SE
        #unmap_fq1 = out_fastq_r1
        unmap_fq1 = out_fastq_tmp
        unmap_fq2 = ""

    return unmap_fq1, unmap_fq2


def tool_path(tool_name):
    """
    Return the path to a tool used by this pipeline.

    :param str tool_name: name of the tool (e.g., a script filename)
    :return str: real, absolute path to tool (expansion and symlink resolution)
    """

    return os.path.join(os.path.dirname(os.path.dirname(__file__)),
                        TOOLS_FOLDER, tool_name)


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


def check_commands(commands, ignore=''):
    """
    Check if command(s) can be called

    :param attributedict commands: dictionary of commands to check
    :param list ignore: list of commands that are optional and can be ignored
    """

    # Use `command` to see if command is callable, store exit code
    is_callable = True
    uncallable = []
    for name, command in commands.items():
        if command not in ignore:
            # if an environment variable is not expanded it means it points to
            # an uncallable command
            if '$' in command:
                # try to expand
                command = os.path.expandvars(os.path.expanduser(command))
                if not os.path.exists(command):
                    uncallable.append(command)

            # if a command is a java file, modify the command
            if '.jar' in command:
                command = "java -jar " + command

            code = os.system("command -v {0} >/dev/null 2>&1 || {{ exit 1; }}".format(command))
            # If exit code is not 0, track which command failed
            #print("{} code {}".format(command, code))  # DEBUG
            if code != 0:
                uncallable.append(command)
                is_callable = False
    if is_callable:
        return True
    else:
        print("The following required tool(s) are not callable: {0}".format(' '.join(uncallable)))
        return False


################################################################################
#                                 Pipeline MAIN                                #
################################################################################
def main():
    """
    Main pipeline process.
    """

    args = parse_arguments()

    args.paired_end = args.single_or_paired.lower() == "paired"

    # Initialize, creating global PipelineManager and NGSTk instance for
    # access in ancillary functions outside of main().
    outfolder = os.path.abspath(
        os.path.join(args.output_parent, args.sample_name))
    global pm
    pm = pypiper.PipelineManager(
        name="PEPATAC", outfolder=outfolder,pipestat_record_identifier=args.sample_name, args=args, version=__version__)
    global ngstk
    ngstk = pypiper.NGSTk(pm=pm)

    # Convenience alias
    tools = pm.config.tools
    param = pm.config.parameters
    param.outfolder = outfolder
    res = pm.config.resources

    ############################################################################
    #                Confirm required tools are all callable                   #
    ############################################################################
    opt_tools = ["fseq", "fseq2", "Genrich", "${HMMRATAC}", "${PICARD}",
                 "${TRIMMOMATIC}", "pyadapt", "findMotifsGenome.pl",
                 "findPeaks", "seqOutBias", "bigWigMerge", "bedGraphToBigWig",
                 "pigz", "bwa"]

    # Confirm compatible peak calling settings
    if args.peak_type == "fixed" and not args.peak_caller == "macs3":
        err_msg = ("Must use MACS3 with `--peak-type fixed` width peaks. " +
                   "Either change the " +
                   "`--peak-caller {}` or ".format(PEAK_CALLERS) +
                   "use `--peak-type variable`.")
        pm.fail_pipeline(RuntimeError(err_msg))

    # If using optional tools, remove those from the skipped checks
    if args.aligner == "bwa":
        if 'bwa' in opt_tools: opt_tools.remove('bwa')

    if args.trimmer == "trimmomatic":
        if '${TRIMMOMATIC}' in opt_tools: opt_tools.remove('${TRIMMOMATIC}')
        if not ngstk.check_command(tools.trimmomatic):
            err_msg = ("Unable to call trimmomatic as specified in the " +
                       "pipelines/pepatac.yaml configuration file: " +
                       "".join(str(tools.trimmomatic)))
            pm.fail_pipeline(RuntimeError(err_msg))

    if args.trimmer == "pyadapt":
        if 'pyadapt' in opt_tools: opt_tools.remove('pyadapt')

    if args.deduplicator == "picard":
        if '${PICARD}' in opt_tools: opt_tools.remove('${PICARD}')
        if not ngstk.check_command(tools.picard):
            err_msg = ("Unable to call picard as specified in the " +
                       "pipelines/pepatac.yaml configuration file: " +
                       "".join(str(tools.picard)))
            pm.fail_pipeline(RuntimeError(err_msg))

    if args.peak_caller == "fseq":
        if 'fseq' in opt_tools: opt_tools.remove('fseq')

    if args.peak_caller == "fseq2":
        if 'fseq2' in opt_tools: opt_tools.remove('fseq2')

    if args.peak_caller == "genrich":
        if 'Genrich' in opt_tools: opt_tools.remove('Genrich')

    if args.peak_caller == "hmmratac":
        if '${HMMRATAC}' in opt_tools: opt_tools.remove('${HMMRATAC}')
        if not ngstk.check_command(tools.hmmratac):
            err_msg = ("Unable to call hmmratac as specified in the " +
                       "pipelines/pepatac.yaml configuration file: " +
                       "".join(str(tools.hmmratac)))
            pm.fail_pipeline(RuntimeError(err_msg))
    
    if args.peak_caller == "homer":
        if 'findPeaks' in opt_tools: opt_tools.remove('findPeaks')

    if args.sob:
        if 'seqOutBias' in opt_tools: opt_tools.remove('seqOutBias')
        if 'bigWigMerge' in opt_tools: opt_tools.remove('bigWigMerge')
        if 'bedGraphToBigWig' in opt_tools: opt_tools.remove('bedGraphToBigWig')

    if args.motif:
        if 'findMotifsGenome.pl' in opt_tools: opt_tools.remove('findMotifsGenome.pl')

    # Check that the required tools are callable by the pipeline
    tool_list = [v for k,v in tools.items()]  # extract tool list
    if args.peak_caller == "homer":
        tool_list.append('makeTagDirectory')
        tool_list.append('pos2bed.pl')
    pm.debug(tool_list)  # DEBUG
    tool_list = [t.replace('seqoutbias', 'seqOutBias') for t in tool_list]
    tool_list = dict((t,t) for t in tool_list)  # convert back to dict

    if not check_commands(tool_list, opt_tools):
        err_msg = "Missing required tools. See message above."
        pm.fail_pipeline(RuntimeError(err_msg))

    if args.input2 and not args.paired_end:
        err_msg = (f"Incompatible settings: You specified single-end, "
                   f"but provided --input2.")
        pm.fail_pipeline(RuntimeError(err_msg))

    ############################################################################
    #                       Set up reference resources                         #
    ############################################################################
    if args.aligner.lower() == "bwa":
        GENOME_IDX_KEY = "bwa_index"
    else:
        GENOME_IDX_KEY = "bowtie2_index"

    # Add prealignment genome annotation files to resources
    if args.prealignment_index:
        pm.debug(f"prealignments: {args.prealignment_index}")
        res.prealignment_index = args.prealignment_index
    #else:
        #pm.info(f"prealignments: {args.prealignment_index}")
        #res.prealignment_index = None
    
    # Add primary genome annotation files to resources
    res.genome_index = args.genome_index

    if res.genome_index.endswith("."):
        # Replace last occurrence of . with genome name
        res.genome_index = os.path.abspath((
            res.genome_index[:res.genome_index.rfind(".")] + 
            args.genome_assembly)
        )
        if args.aligner.lower() == "bwa":
            res.genome_index += ".fa"
    pm.debug(f"primary genome index: {args.genome_index}")
    
    if (args.chrom_sizes and os.path.isfile(args.chrom_sizes) and
            os.stat(args.chrom_sizes).st_size > 0):
        res.chrom_sizes = os.path.abspath(args.chrom_sizes)

    # Add optional files to resources
    if args.sob and not args.search_file:
        err_msg = (f"You specified --sob but did not include the path to"
                   f"the tallymer index search file. Specify this with"
                   f"--search-file <path to search file>")
        pm.fail_pipeline(RuntimeError(err_msg))
    if (args.search_file and os.path.isfile(args.search_file) and
            os.stat(args.search_file).st_size > 0):
        res.search_file = os.path.abspath(args.search_file)
    
    if (args.blacklist and os.path.isfile(args.blacklist) and
            os.stat(args.blacklist).st_size > 0):
        res.blacklist = os.path.abspath(args.blacklist)
    if (args.TSS_name and os.path.isfile(args.TSS_name) and
            os.stat(args.TSS_name).st_size > 0):
        res.refgene_tss = os.path.abspath(args.TSS_name)
    if (args.anno_name and os.path.isfile(args.anno_name) and
            os.stat(args.anno_name).st_size > 0):
        res.feat_annotation = os.path.abspath(args.anno_name)
    if (args.frip_ref_peaks and os.path.isfile(args.frip_ref_peaks) and
            os.stat(args.frip_ref_peaks).st_size > 0):
        res.frip_ref_peaks = os.path.abspath(args.frip_ref_peaks)

    # Adapter file can be set in the config; if left null, we use a default.
    res.adapters = res.adapters or tool_path("NexteraPE-PE.fa")

    # Report utilized assets
    assets_file = os.path.join(param.outfolder, "assets.tsv")
    pm.debug(f"res: {res}")
    for asset in res:
        if isinstance(res[asset], list):
            for a in res[asset]:
                if a is not None:
                    message = "{}\t{}".format(asset, os.path.expandvars(a))
                    pm.debug(message)
                    report_message(pm, assets_file, message)
        else:
            if asset is not None:
                message = "{}\t{}".format(
                    asset, os.path.expandvars(res[asset]))
                pm.debug(message)
                report_message(pm, assets_file, message)

    if not args.prealignment_index:
        res.prealignment_index = None

    # Report primary genome
    message = "genome\t{}".format(args.genome_assembly)
    report_message(pm, assets_file, message)


    ############################################################################
    #          Check that the input file(s) exist before continuing            #
    ############################################################################
    if os.path.isfile(args.input[0]) and os.stat(args.input[0]).st_size > 0:
        print("Local input file: " + args.input[0])
    elif os.path.isfile(args.input[0]) and os.stat(args.input[0]).st_size == 0:
        # The read1 file exists but is empty
        err_msg = "File exists but is empty: {}"
        pm.fail_pipeline(IOError(err_msg.format(args.input[0])))
    else:
        # The read1 file does not exist
        err_msg = "Could not find: {}"
        pm.fail_pipeline(IOError(err_msg.format(args.input[0])))

    if args.input2:
        if (os.path.isfile(args.input2[0]) and
                os.stat(args.input2[0]).st_size > 0):
            print("Local input file: " + args.input2[0])
        elif (os.path.isfile(args.input2[0]) and
                os.stat(args.input2[0]).st_size == 0):
            # The read1 file exists but is empty
            err_msg = "File exists but is empty: {}"
            pm.fail_pipeline(IOError(err_msg.format(args.input2[0])))
        else:
            # The read1 file does not exist
            err_msg = "Could not find: {}"
            pm.fail_pipeline(IOError(err_msg.format(args.input2[0])))

    container = None  # legacy


    ############################################################################
    #                      Grab and prepare input files                        #
    ############################################################################
    pm.report_result(
        "File_mb",
        round(ngstk.get_file_size(
              [x for x in [args.input, args.input2] if x is not None])), 2)
    pm.report_result("Read_type", args.single_or_paired)
    pm.report_result("Genome", args.genome_assembly)

    # ATACseq pipeline
    # Each (major) step should have its own subfolder
    raw_folder = os.path.join(param.outfolder, "raw")
    fastq_folder = os.path.join(param.outfolder, "fastq")

    pm.timestamp("### Merge/link and fastq conversion: ")
    # This command will merge multiple inputs so you can use multiple
    # sequencing lanes in a single pipeline run.
    local_input_files = ngstk.merge_or_link(
        [args.input, args.input2], raw_folder, args.sample_name)
    # flatten nested list
    if any(isinstance(i, list) for i in local_input_files):
        local_input_files = [i for e in local_input_files for i in e]
    # maintain order and remove duplicate entries
    local_input_files = list(dict.fromkeys(local_input_files))

    cmd, out_fastq_pre, unaligned_fastq = ngstk.input_to_fastq(
        local_input_files, args.sample_name, args.paired_end, fastq_folder,
        zipmode=True)

    #print(f"{cmd}")  # DEBUG

    # flatten nested list
    if any(isinstance(i, list) for i in unaligned_fastq):
        unaligned_fastq = [i for e in unaligned_fastq for i in e]
    # maintain order and remove duplicate entries
    if any(isinstance(i, dict) for i in local_input_files):
        unaligned_fastq = list(dict.fromkeys(unaligned_fastq))

    pm.run(cmd, unaligned_fastq,
           follow=ngstk.check_fastq(
            local_input_files, unaligned_fastq, args.paired_end))
    pm.clean_add(out_fastq_pre + "*.fastq", conditional=True)

    if args.paired_end:
        untrimmed_fastq1 = unaligned_fastq[0]
        untrimmed_fastq2 = unaligned_fastq[1]
    else:
        untrimmed_fastq1 = unaligned_fastq
        untrimmed_fastq2 = None

    # Prepare alignment output folder
    map_genome_folder = os.path.join(param.outfolder,
                                     "aligned_" + args.genome_assembly)
    ngstk.make_dir(map_genome_folder)
    
    # Primary endpoint file following alignment and deduplication
    rmdup_bam = os.path.join(map_genome_folder,
                             args.sample_name + "_sort_dedup.bam")
    rmdup_idx = os.path.join(map_genome_folder,
                             args.sample_name + "_sort_dedup.bam.bai")


    ############################################################################
    #                          Begin adapter trimming                          #
    ############################################################################
    pm.timestamp("### Adapter trimming: ")

    # Create names for trimmed FASTQ files.
    if args.trimmer == "trimmomatic":
        trimming_prefix = os.path.join(fastq_folder, args.sample_name)
    else:
        trimming_prefix = out_fastq_pre
    trimmed_fastq = trimming_prefix + "_R1_trim.fastq"
    trimmed_fastq_R2 = trimming_prefix + "_R2_trim.fastq"
    fastqc_folder = os.path.join(param.outfolder, "fastqc")
    fastqc_report = os.path.join(fastqc_folder,
        args.sample_name + "_R1_trim_fastqc.html")
    fastqc_report_R2 = os.path.join(fastqc_folder,
        args.sample_name + "_R2_trim_fastqc.html")
    if ngstk.check_command(tools.fastqc):
        ngstk.make_dir(fastqc_folder)

    # Create trimming command(s).
    if args.trimmer == "pyadapt":
        if not args.paired_end:
            raise NotImplementedError(
                "pyadapt trimming requires paired-end reads.")
        # TODO: make pyadapt give options for output file name.
        trim_cmd_chunks = [
            tool_path("pyadapter_trim.py"),
            ("-a", untrimmed_fastq1),
            ("-b", untrimmed_fastq2),
            ("-o", out_fastq_pre),
            "-u"
        ]
        trim_cmd = build_command(trim_cmd_chunks)

    elif args.trimmer == "skewer":
        # Create the primary skewer command.
        # Don't compress output at this stage, because the pre-alignment mechanism
        # requires unzipped fastq.
        trim_cmd_chunks = [
            tools.skewer,  # + " --quiet"
            ("-f", "sanger"),
            ("-t", str(args.cores)),
            ("-m", "pe" if args.paired_end else "any"),
            ("-x", res.adapters),
            # "-z",  # compress output
            "--quiet",
            ("-o", out_fastq_pre),
            untrimmed_fastq1,
            untrimmed_fastq2 if args.paired_end else None
        ]
        trimming_command = build_command(trim_cmd_chunks)

        # Create the skewer file renaming commands.
        if args.paired_end:
            skewer_filename_pairs = \
                [("{}-trimmed-pair1.fastq".format(out_fastq_pre),
                 trimmed_fastq)]
            skewer_filename_pairs.append(
                ("{}-trimmed-pair2.fastq".format(out_fastq_pre),
                 trimmed_fastq_R2))
        else:
            skewer_filename_pairs = \
                [("{}-trimmed.fastq".format(out_fastq_pre), trimmed_fastq)]

        trimming_renaming_commands = [build_command(["mv", old, new])
                                      for old, new in skewer_filename_pairs]

        # Pypiper submits the commands serially.
        trim_cmd = [trimming_command] + trimming_renaming_commands

    else:
        # Default to trimmomatic.
        pm.info("trimmomatic local_input_files: {}".format(local_input_files))
        if not param.java_settings.params:
            java_settings = '-Xmx{mem}'.format(mem=pm.mem)
        else:
            java_settings = param.java_settings.params
        trim_cmd_chunks = [
            "{java} {settings} -jar {trim} {PE} -threads {cores}".format(
                java=tools.java, settings=java_settings,
                trim=tools.trimmomatic,
                PE="PE" if args.paired_end else "SE",
                cores=pm.cores),
            untrimmed_fastq1,
            untrimmed_fastq2 if args.paired_end else None,
            trimmed_fastq,
            trimming_prefix + "_R1_unpaired.fq" if args.paired_end else None,
            trimmed_fastq_R2 if args.paired_end else None,
            trimming_prefix + "_R2_unpaired.fq" if args.paired_end else None,
            "ILLUMINACLIP:" + res.adapters + ":2:30:10"
        ]
        trim_cmd = build_command(trim_cmd_chunks)

    def check_trim():
        pm.info("Evaluating read trimming")

        if args.paired_end and not trimmed_fastq_R2:
            pm.warning("Specified paired-end but no R2 file")

        n_trim = float(ngstk.count_reads(trimmed_fastq, args.paired_end))
        pm.report_result("Trimmed_reads", int(n_trim))
        try:
            rr = float(pm.get_stat("Raw_reads"))
        except:
            pm.warning("Can't calculate trim loss rate without raw read result.")
        else:
            pm.report_result(
                "Trim_loss_rate", round((rr - n_trim) * 100 / rr, 2))

        # Also run a fastqc (if installed/requested)
        if fastqc_folder and not args.skipqc:
            if fastqc_folder and os.path.isabs(fastqc_folder):
                ngstk.make_sure_path_exists(fastqc_folder)
            cmd = (tools.fastqc + " --noextract --outdir " +
                   fastqc_folder + " " + trimmed_fastq)
            pm.run(cmd, fastqc_report, nofail=False)
            pm.report_object("FastQC report r1", fastqc_report)

            if args.paired_end and trimmed_fastq_R2:
                cmd = (tools.fastqc + " --noextract --outdir " +
                       fastqc_folder + " " + trimmed_fastq_R2)
                pm.run(cmd, fastqc_report_R2, nofail=False)
                pm.report_object("FastQC report r2", fastqc_report_R2)

    if not os.path.exists(rmdup_bam) or args.new_start:
        pm.debug("trim_cmd: {}".format(trim_cmd))
        pm.run(trim_cmd, trimmed_fastq, follow=check_trim) 

    pm.clean_add(os.path.join(fastq_folder, "*.fastq"), conditional=True)
    pm.clean_add(os.path.join(fastq_folder, "*.log"), conditional=True)

    # Prepare variables for alignment step
    unmap_fq1 = trimmed_fastq
    unmap_fq2 = trimmed_fastq_R2


    ############################################################################
    #                    Map to any requested prealignments                    #
    ############################################################################

    # We recommend mapping to chrM (i.e. rCRSd) before primary genome alignment
    pm.timestamp("### Prealignments")
    # Set up mapped bam file names
    mapping_genome_bam = os.path.join(
        map_genome_folder, args.sample_name + "_sort.bam")
    mapping_genome_bam_temp = os.path.join(
        map_genome_folder, args.sample_name + "_temp.bam")
    failQC_genome_bam = os.path.join(
        map_genome_folder, args.sample_name + "_fail_qc.bam")
    unmap_genome_bam = os.path.join(
        map_genome_folder, args.sample_name + "_unmap.bam")

    to_compress = []
    if res.prealignment_index is None or len(res.prealignment_index) == 0:
        print("You may use `--prealignment-index` to align to references "
              "before the genome alignment step. "
              "See http://pepatac.databio.org/en/latest/ for documentation.")
    else:
        # Loop through any prealignment references and map to them sequentially
        for prealignment in res.prealignment_index:
            pm.debug(f"prealignment: {prealignment}")
            genome, genome_index = prealignment.split('=')
            if genome_index.endswith("."):
                # Replace last occurrence of . with genome name
                genome_index = genome_index[:genome_index.rfind(".")] + genome
                genome_index = os.path.abspath(genome_index)
                #genome_index = genome_index.replace('.',genome)
                if args.aligner.lower() == "bwa":
                    genome_index += ".fa"
            pm.debug(f"Aligning with {args.aligner} to {genome_index}")           
            if args.no_fifo:
                unmap_fq1, unmap_fq2 = _align(
                    args, tools, args.paired_end, False,
                    unmap_fq1, unmap_fq2, genome,
                    assembly=genome_index,
                    outfolder=param.outfolder,
                    aligndir="prealignments",
                    bt2_opts_txt=param.bowtie2_pre.params,
                    bwa_opts_txt=param.bwa_pre.params)
                to_compress.append(unmap_fq1)
                if args.paired_end:
                    to_compress.append(unmap_fq2)
            else:
                unmap_fq1, unmap_fq2 = _align(
                    args, tools, args.paired_end, True,
                    unmap_fq1, unmap_fq2, genome,
                    assembly=genome_index, 
                    outfolder=param.outfolder,
                    aligndir="prealignments",
                    bt2_opts_txt=param.bowtie2_pre.params,
                    bwa_opts_txt=param.bwa_pre.params)
                to_compress.append(unmap_fq1)
                if args.paired_end:
                    to_compress.append(unmap_fq2)

    pm.timestamp("### Compress all unmapped read files")
    # Confirm pairing is complete
    def no_handle(fq):
        fpath = str(Path(fq).resolve())
        pm.debug("fq: {}".format(fpath))
        for proc in psutil.process_iter():
            try:
                for item in proc.open_files():
                    pm.debug("item.path: {}".format(item.path))
                    if fpath == item.path:
                        pm.debug("{} is held. \n".format(fpath))
                        return False
            except Exception:
                pass
        pm.debug("{} is released! \n".format(os.path.abspath(fq)))
        return True
    
    if args.paired_end and not os.path.exists(mapping_genome_bam):
        if not pypiper.is_gzipped_fastq(unmap_fq1):
            checks = 1
            # Check unmap_fq1
            while not no_handle(unmap_fq1) and checks < 10000:
                checks += 1
                pm.debug("Check count fq1: {}".format(str(checks)))
            if checks > 100 and not no_handle(unmap_fq1):
                err_msg = ("Fastq filter_paired_fq.pl function did not "
                           "complete successfully. Try running the pipeline "
                           "with `--keep`.")
        if not pypiper.is_gzipped_fastq(unmap_fq2):
            checks = 1
            # Check unmap_fq2
            while not no_handle(unmap_fq2) and checks < 10000:
                checks += 1
                pm.debug("Check count fq2: {}".format(str(checks)))
            if checks > 100 and not no_handle(unmap_fq2):
                err_msg = ("Fastq filter_paired_fq.pl function did not "
                           "complete successfully. Try running the pipeline "
                           "with `--keep`.")
                pm.fail_pipeline(IOError(err_msg))

    for unmapped_fq in to_compress:
        # Compress unmapped fastq reads
        if not pypiper.is_gzipped_fastq(unmapped_fq) and not unmapped_fq == '':
            if os.path.exists(unmapped_fq):
                cmd = (ngstk.ziptool + " " + unmapped_fq)
                unmapped_fq = unmapped_fq + ".gz"
                pm.run(cmd, unmapped_fq)


    ############################################################################
    #                           Map to primary genome                          #
    ############################################################################
    pm.timestamp("### Map to genome")

    if args.aligner.lower() == "bwa":
        if not param.bwa.params:
            bwa_options = " -M "
        else:
            bwa_options = param.bwa.params
    else:
        if not param.bowtie2.params:
            bt2_options = " --very-sensitive "
            if args.paired_end:
                bt2_options += " -X 2000 "
        else:
            bt2_options = param.bowtie2.params    

    # samtools sort needs a temporary directory
    tempdir = tempfile.mkdtemp(dir=map_genome_folder)
    os.chmod(tempdir, 0o771)
    pm.clean_add(tempdir)

    # If there are no prealignments, unmap_fq1 will be unzipped
    if os.path.exists(unmap_fq1 + ".gz"):
        unmap_fq1 = unmap_fq1 + ".gz"
    if os.path.exists(unmap_fq2 + ".gz"):
        unmap_fq2 = unmap_fq2 + ".gz"

    if args.aligner.lower() == "bwa":
        cmd = tools.bwa + " mem -t " + str(pm.cores)
        cmd += " " + bwa_options
        cmd += " " + res.genome_index
        cmd += " " + unmap_fq1
        if args.paired_end:
            cmd += " " + unmap_fq2
        cmd += " | " + tools.samtools + " view -bS - -@ 1"  # convert to bam
        cmd += " | " + tools.samtools + " sort - -@ 1"      # sort output
        cmd += " -T " + tempdir
        cmd += " -o " + mapping_genome_bam_temp
    else:
        cmd = tools.bowtie2 + " -p " + str(pm.cores)
        cmd += " " + bt2_options
        cmd += " --rg-id " + args.sample_name
        cmd += " -x " + res.genome_index
        if args.paired_end:
            cmd += " -1 " + unmap_fq1 + " -2 " + unmap_fq2
        else:
            cmd += " -U " + unmap_fq1
        cmd += " | " + tools.samtools + " view -bS - -@ 1 "
        cmd += " | " + tools.samtools + " sort - -@ 1"
        cmd += " -T " + tempdir
        cmd += " -o " + mapping_genome_bam_temp

    # Split genome mapping result bamfile into two: high-quality aligned
    # reads (keepers) and unmapped reads (in case we want to analyze the
    # altogether unmapped reads)
    # Default (samtools.params): skip alignments with MAPQ less than 10 (-q 10)
    cmd2 = (tools.samtools + " view -b " + param.samtools.params + " -@ " +
            str(pm.cores) + " -U " + failQC_genome_bam + " ")
    if args.paired_end:
        # add a step to accept only reads mapped in proper pair
        cmd2 += "-f 2 "

    cmd2 += mapping_genome_bam_temp + " > " + mapping_genome_bam

    def check_alignment_genome():
        mr = ngstk.count_mapped_reads(mapping_genome_bam_temp, args.paired_end)
        ar = ngstk.count_mapped_reads(mapping_genome_bam, args.paired_end)
        rr = float(pm.get_stat("Raw_reads"))
        tr = float(pm.get_stat("Trimmed_reads"))
        pm.report_result("Mapped_reads", mr)
        pm.report_result("QC_filtered_reads",
                         round(float(mr)) - round(float(ar)))
        pm.report_result("Aligned_reads", ar)
        pm.report_result("Alignment_rate", round(float(ar) * 100 /
                         float(tr), 2))
        pm.report_result("Total_efficiency", round(float(ar) * 100 /
                         float(rr), 2))

    pm.run([cmd, cmd2], rmdup_bam, follow=check_alignment_genome)

    # Index the temporary bam file and the sorted bam file
    temp_mapping_index   = os.path.join(mapping_genome_bam_temp + ".bai")
    mapping_genome_index = os.path.join(mapping_genome_bam + ".bai")
    cmd1 = tools.samtools + " index " + mapping_genome_bam_temp
    cmd2 = tools.samtools + " index " + mapping_genome_bam
    pm.run([cmd1, cmd2], rmdup_idx)
    pm.clean_add(temp_mapping_index)

    # If first run, use the temp bam file
    if (os.path.isfile(mapping_genome_bam_temp) and
            os.stat(mapping_genome_bam_temp).st_size > 0):
        bam_file = mapping_genome_bam_temp
    # Otherwise, use the final bam file previously generated
    else:
        bam_file = mapping_genome_bam

    # Determine mitochondrial read counts
    mito_name = ["chrM", "ChrM", "ChrMT", "chrMT", "M", "MT", "rCRSd"]

    if not pm.get_stat("Mitochondrial_reads") or args.new_start:
        cmd = (tools.samtools + " idxstats " + bam_file + " | grep")
        for name in mito_name:
            cmd += " -we '" + name + "'"
        cmd += "| cut -f 3"
        mr = pm.checkprint(cmd)

        # If there are mitochondrial reads, report and remove them
        if mr and float(mr.strip()) != 0:
            pm.report_result("Mitochondrial_reads", round(float(mr)))
            noMT_mapping_genome_bam = os.path.join(
                map_genome_folder, args.sample_name + "_noMT.bam")
            chr_bed = os.path.join(map_genome_folder, "chr_sizes.bed")

            cmd1 = (tools.samtools + " idxstats " + mapping_genome_bam +
                    " | cut -f 1-2 | awk '{print $1, 0, $2}' | grep")
            for name in mito_name:
                cmd1 += " -vwe '" + name + "'"
            cmd1 += (" > " + chr_bed)
            cmd2 = (tools.samtools + " view -L " + chr_bed + " -b -@ " +
                    str(pm.cores) + " " + mapping_genome_bam + " > " +
                    noMT_mapping_genome_bam)
            cmd3 = ("mv " + noMT_mapping_genome_bam + " " + mapping_genome_bam)
            # Reindex the sorted bam file now that mito reads are removed
            cmd4 = tools.samtools + " index " + mapping_genome_bam

            pm.run([cmd1, cmd2, cmd3, cmd4], noMT_mapping_genome_bam)
            pm.clean_add(chr_bed)
        else:
            pm.report_result("Mitochondrial_reads", 0)


    ############################################################################
    #         Calculate quality control metrics for the alignment file         #
    ############################################################################
    pm.timestamp("### Calculate NRF, PBC1, and PBC2")
    QC_folder = os.path.join(param.outfolder, "QC_" + args.genome_assembly)
    ngstk.make_dir(QC_folder)

    bamQC = os.path.join(QC_folder, args.sample_name + "_bamQC.tsv")
    cmd = tool_path("bamQC.py")
    cmd += " -i " + mapping_genome_bam
    cmd += " -c " + str(pm.cores)
    cmd += " -o " + bamQC

    def report_bam_qc(bamqc_log):
        # Reported BAM QC metrics via the bamQC metrics file
        if os.path.isfile(bamqc_log):
            cmd1 = ("awk '{ for (i=1; i<=NF; ++i) {" +
                    " if ($i ~ \"NRF\") c=i } getline; print $c }' " +
                    bamqc_log)
            cmd2 = ("awk '{ for (i=1; i<=NF; ++i) {" +
                    " if ($i ~ \"PBC1\") c=i } getline; print $c }' " +
                    bamqc_log)
            cmd3 = ("awk '{ for (i=1; i<=NF; ++i) {" +
                    " if ($i ~ \"PBC2\") c=i } getline; print $c }' " +
                    bamqc_log)
            nrf = pm.checkprint(cmd1)
            pbc1 = pm.checkprint(cmd2)
            pbc2 = pm.checkprint(cmd3)
        else:
            # there were no successful chromosomes yielding results
            nrf = 0
            pbc1 = 0
            pbc2 = 0

        pm.report_result("NRF", round(float(nrf),2))
        pm.report_result("PBC1", round(float(pbc1),2))
        pm.report_result("PBC2", round(float(pbc2), 2))

    pm.run(cmd, bamQC, follow=lambda: report_bam_qc(bamQC))

    # Now produce the unmapped file
    def count_unmapped_reads():
        # Report total number of unmapped reads (-f 4)
        cmd = (tools.samtools + " view -c -f 4 -@ " + str(pm.cores) +
               " " + mapping_genome_bam_temp)
        ur = pm.checkprint(cmd)
        pm.report_result("Unmapped_reads", round(float(ur)))

    unmap_cmd = tools.samtools + " view -b -@ " + str(pm.cores)
    if args.paired_end:
        # require both read and mate unmapped
        unmap_cmd += " -f 12 "
    else:
        # require only read unmapped
        unmap_cmd += " -f 4 "

    unmap_cmd += " " + mapping_genome_bam_temp + " > " + unmap_genome_bam
    
    if not pm.get_stat("Unmapped_reads") or args.new_start:
        pm.run(unmap_cmd, unmap_genome_bam, follow=count_unmapped_reads)

    # Remove temporary bam file from unmapped file production
    pm.clean_add(mapping_genome_bam_temp)

    pm.timestamp("### Remove duplicates and produce signal tracks")

    def estimate_lib_size(dedup_log):
        # In millions of reads; contributed by Ryan
        # NOTE: from Picard manual: without optical duplicate counts,
        #       library size estimation will be inaccurate.
        cmd = ("awk -F'\t' -f " + tool_path("extract_picard_lib.awk") +
               " " + dedup_log)
        picard_est_lib_size = pm.checkprint(cmd)
        pm.report_result("Picard_est_lib_size", picard_est_lib_size)

    def post_dup_aligned_reads(dedup_log):
        if args.deduplicator == "picard":
            cmd = ("grep -A2 'METRICS CLASS' " + dedup_log +
                   " | tail -n 1 | awk '{print $(NF-3)}'")
        elif args.deduplicator == "samblaster":
            cmd = ("grep 'Removed' " + dedup_log +
                   " | tr -s ' ' | cut -f 3 -d ' '")
        elif args.deduplicator == "samtools":
            cmd = ("grep 'DUPLICATE TOTAL' " + dedup_log +
                   " | tr -s ' ' | cut -f 3 -d ' '")
        else:
            cmd = ("grep 'Removed' " + dedup_log +
                   " | tr -s ' ' | cut -f 3 -d ' '")

        dr = pm.checkprint(cmd)
        ar = float(pm.get_stat("Aligned_reads"))
        rr = float(pm.get_stat("Raw_reads"))
        tr = float(pm.get_stat("Trimmed_reads"))

        if not dr and not dr.strip():
            pm.info("DEBUG: dr didn't work correctly")
            dr = ar
        if args.deduplicator == "samtools":
            dr = float(dr)/2
        
        pdar = float(ar) - float(dr)
        dar = round(float(pdar) * 100 / float(tr), 2)
        dte = round(float(pdar) * 100 / float(rr), 2)
        
        pm.report_result("Duplicate_reads", dr)
        pm.report_result("Dedup_aligned_reads", pdar)
        pm.report_result("Dedup_alignment_rate", dar)
        pm.report_result("Dedup_total_efficiency", dte)

    metrics_file = os.path.join(
        map_genome_folder, args.sample_name + "_dedup_metrics_bam.txt")
    dedup_log = os.path.join(
        map_genome_folder, args.sample_name + "_dedup_metrics_log.txt")

    # samtools sort needs a temporary directory
    tempdir = tempfile.mkdtemp(dir=map_genome_folder)
    os.chmod(tempdir, 0o771)
    pm.clean_add(tempdir)
    if not param.java_settings.params:
        java_settings = '-Xmx{mem}'.format(mem=pm.mem)
    else:
        java_settings = param.java_settings.params
    if args.deduplicator == "picard":
        cmd1 = (tools.java + " " + java_settings + " -jar " + 
                tools.picard + " MarkDuplicates")
        cmd1 += " INPUT=" + mapping_genome_bam
        cmd1 += " OUTPUT=" + rmdup_bam
        cmd1 += " METRICS_FILE=" + metrics_file
        cmd1 += " VALIDATION_STRINGENCY=LENIENT"
        cmd1 += " ASSUME_SORTED=true REMOVE_DUPLICATES=true > " + dedup_log
        cmd2 = tools.samtools + " index " + rmdup_bam
    elif args.deduplicator == "samblaster":
        nProc = max(int(pm.cores / 4), 1)
        samblaster_cmd_chunks = [
            "{} sort -n -@ {}".format(tools.samtools, str(nProc)),
            ("-T", tempdir),
            mapping_genome_bam,
            "|",
            "{} view -h - -@ {}".format(tools.samtools, str(nProc)),
            "|",
            "{} -r --ignoreUnmated 2> {}".format(tools.samblaster, dedup_log),
            "|",
            "{} view -b - -@ {}".format(tools.samtools, str(nProc)),
            "|",
            "{} sort - -@ {}".format(tools.samtools, str(nProc)),
            ("-T", tempdir),
            ("-o", rmdup_bam)
        ]
        cmd1 = build_command(samblaster_cmd_chunks)
        cmd2 = tools.samtools + " index " + rmdup_bam
        # no separate metrics file with samblaster
        metrics_file = dedup_log
    elif args.deduplicator == "samtools":
        nProc = max(int(pm.cores / 4), 1)
        samtools_cmd_chunks = [
            "{} sort -n -@ {} -T {}".format(tools.samtools, str(nProc),
                                            tempdir),
            mapping_genome_bam,
            "|",
            "{} fixmate -@ {} -m - - ".format(tools.samtools, str(nProc)),
            "|",
            "{} sort -@ {} -T {}".format(tools.samtools, str(nProc), tempdir),
            "|",
            "{} markdup -@ {} -T {} -rs -f {} - - ".format(tools.samtools,
                                                           str(nProc),
                                                           tempdir,
                                                           dedup_log),
            "|",
            "{} view -b - -@ {}".format(tools.samtools, str(nProc)),
            "|",
            "{} sort - -@ {} -T {}".format(tools.samtools, str(nProc), tempdir),
            ("-o", rmdup_bam)
        ]
        cmd1 = build_command(samtools_cmd_chunks)
        cmd2 = tools.samtools + " index " + rmdup_bam
        metrics_file = dedup_log
    else:
        pm.info("PEPATAC could not determine a valid deduplicator tool")
        pm.stop_pipeline()

    pm.run([cmd1, cmd2], rmdup_bam,
           follow=lambda: post_dup_aligned_reads(metrics_file))
    
    
    ############################################################################
    #           Determine distribution of reads across nucleosomes             #
    ############################################################################
    pm.timestamp("### Calculate distribution of reads across nucleosomes")

    # Use cutoff method original proposed in Buenrostro et al. 2013
    NFR_bam = os.path.join(map_genome_folder, args.sample_name + "_NFR.bam")
    mono_bam = os.path.join(map_genome_folder, args.sample_name + "_mono.bam")
    di_bam = os.path.join(map_genome_folder, args.sample_name + "_di.bam")
    tri_bam = os.path.join(map_genome_folder, args.sample_name + "_tri.bam")
    poly_bam = os.path.join(map_genome_folder, args.sample_name + "_poly.bam")
    
    # Need parenthesis outside of substr for pypiper split_shell_cmd parsing
    cmd1 = (tools.samtools + " view -h " + rmdup_bam + " | awk " +
            "'(substr($0,1,1)==\"@\" || ($9>= -100 && $9<=100))' | " +
            tools.samtools + " view -b > " + NFR_bam)
    cmd2 = (tools.samtools + " view -h " + rmdup_bam + " | awk " +
            "'(substr($0,1,1)==\"@\" || ($9>= 180 && $9<=247) || " +
            "($9<=-180 && $9>=-247))' | " + tools.samtools + " view -b > " +
            mono_bam)
    cmd3 = (tools.samtools + " view -h " + rmdup_bam + " | awk " +
            "'(substr($0,1,1)==\"@\" || ($9>= 315 && $9<=473) || " +
            "($9<=-315 && $9>=-473))' | " + tools.samtools + " view -b > " +
            di_bam)
    cmd4 = (tools.samtools + " view -h " + rmdup_bam + " | awk " +
            "'(substr($0,1,1)==\"@\" || ($9>= 558 && $9<=615) || " +
            "($9<=-558 && $9>=-615))' | " + tools.samtools + " view -b > " +
            tri_bam)        
    cmd5 = (tools.samtools + " view -h " + rmdup_bam + " | awk " +
            "'(substr($0,1,1)==\"@\" || ($9>= 615 || $9<=-615))' | " +
            tools.samtools + " view -b > " + poly_bam)
    pm.run(cmd1, NFR_bam)
    pm.run(cmd2, mono_bam)
    pm.run(cmd3, di_bam)
    pm.run(cmd4, tri_bam)
    pm.run(cmd5, poly_bam)
    
    cmd1 = tools.samtools + " view -c " + NFR_bam
    cmd2 = tools.samtools + " view -c " + mono_bam
    cmd3 = tools.samtools + " view -c " + di_bam
    cmd4 = tools.samtools + " view -c " + tri_bam
    cmd5 = tools.samtools + " view -c " + poly_bam
    nfr = pm.checkprint(cmd1)
    mono = pm.checkprint(cmd2)
    di = pm.checkprint(cmd3)
    tri = pm.checkprint(cmd4)
    poly = pm.checkprint(cmd5)
    
    dar = float(pm.get_stat("Dedup_aligned_reads"))
    NFR_frac = round(float(nfr) / float(dar), 4)
    mono_frac = round(float(mono) / float(dar), 4)
    di_frac = round(float(di) / float(dar), 4)
    tri_frac = round(float(tri) / float(dar), 4)
    poly_frac = round(float(poly) / float(dar), 4)
    
    pm.report_result("NFR_frac", NFR_frac)
    pm.report_result("mono_frac", mono_frac)
    pm.report_result("di_frac", di_frac)
    pm.report_result("tri_frac", tri_frac)
    pm.report_result("poly_frac", poly_frac)

    ############################################################################
    #       Determine maximum read length and add seqOutBias resource          #
    ############################################################################
    if not pm.get_stat("Read_length") or args.new_start:
        if (os.path.isfile(mapping_genome_bam)
            and os.stat(mapping_genome_bam).st_size > 0):
            cmd = (tools.samtools + " stats " + mapping_genome_bam +
                   " | grep '^SN' | cut -f 2- | grep 'maximum length:' " +
                   "| cut -f 2-")
            read_len = int(pm.checkprint(cmd))
        else:
            pm.warning("{} could not be found.".format(mapping_genome_bam))
            pm.stop_pipeline()
        pm.report_result("Read_length", read_len)
    else:
        read_len = int(pm.get_stat("Read_length"))

    # Calculate size of genome
    if not pm.get_stat("Genome_size") or args.new_start:
        genome_size = int(pm.checkprint(
            ("awk '{sum+=$2} END {printf \"%.0f\", sum}' " +
             res.chrom_sizes)))
        pm.report_result("Genome_size", genome_size)
    else:
        genome_size = int(pm.get_stat("Genome_size"))


    ############################################################################
    #                     Calculate library complexity                         #
    ############################################################################
    preseq_output = os.path.join(
        QC_folder, args.sample_name + "_preseq_out.txt")
    preseq_yield = os.path.join(
        QC_folder, args.sample_name + "_preseq_yield.txt")
    preseq_counts = os.path.join(
        QC_folder, args.sample_name + "_preseq_counts.txt")
    preseq_pdf = os.path.join(
        QC_folder, args.sample_name + "_preseq_plot.pdf")
    preseq_plot = os.path.join(
        QC_folder, args.sample_name + "_preseq_plot")
    preseq_png = os.path.join(
        QC_folder, args.sample_name + "_preseq_plot.png")

    if not os.path.exists(preseq_pdf) or args.new_start:
        if not os.path.exists(mapping_genome_index):
            cmd = tools.samtools + " index " + mapping_genome_bam
            pm.run(cmd, mapping_genome_index)
            pm.clean_add(mapping_genome_index)

        pm.timestamp("### Calculate library complexity")

        cmd1 = (tools.preseq + " c_curve -v -o " + preseq_output +
                " -B " + mapping_genome_bam)
        pm.run(cmd1, preseq_output)

        cmd2 = (tools.preseq + " lc_extrap -v -o " + preseq_yield +
                " -B " + mapping_genome_bam)
        pm.run(cmd2, preseq_yield, nofail=True)

        if os.path.exists(preseq_yield):
            cmd3 = ("echo '" + preseq_yield +
                    " '$(" + tools.samtools + " view -c -F 4 " + 
                    mapping_genome_bam + ")" + "' '" +
                    "$(" + tools.samtools + " view -c -F 4 " +
                    rmdup_bam + ") > " + preseq_counts)

            pm.run(cmd3, preseq_counts)

            cmd = (tools.Rscript + " " + tool_path("PEPATAC.R") +
                   " preseq " + "-i " + preseq_yield)
            cmd += (" -r " + preseq_counts + " -o " + preseq_plot)

            pm.run(cmd, [preseq_pdf, preseq_png], nofail=True)

            pm.report_object("Library complexity", preseq_pdf,
                             anchor_image=preseq_png)

            if not pm.get_stat('Frac_exp_unique_at_10M') or args.new_start:
                # Report the expected unique at 10M reads
                cmd = ("grep -w '^10000000' " + preseq_yield +
                       " | awk '{print $2}'")
                expected_unique = pm.checkprint(cmd)
                if expected_unique:
                    fraction_unique = float(expected_unique)/float(10000000)
                    pm.report_result("Frac_exp_unique_at_10M",
                                     round(fraction_unique, 4))
        else:
            print("Unable to calculate library complexity.")


    ############################################################################
    #                         Produce signal tracks                            #
    ############################################################################
    # "Exact cuts" are nucleotide-resolution tracks of exact bases
    # where the transposition (or DNAse cut) happened;
    # In the past I used wigToBigWig on a combined wig file, but this ends up
    # using a boatload of memory (more than 32GB); in contrast, running the
    # wig -> bw conversion on each chrom and then combining them with bigWigCat
    # requires much less memory. This was a memory bottleneck in the pipeline.
    pm.timestamp("### Produce signal tracks")

    exact_folder = os.path.join(map_genome_folder + "_exact")
    ngstk.make_dir(exact_folder)

    # TODO these may not need file extensions for the gtars version
    exact_header = os.path.join(exact_folder, args.sample_name + "_exact")
    exact_target = os.path.join(exact_folder, args.sample_name + "_exact_shift.bw")
    smooth_header = os.path.join(map_genome_folder, args.sample_name + "_smooth")
    smooth_target = os.path.join(map_genome_folder, args.sample_name + "_smooth_shift.bw")
    shift_bed_header = os.path.join(exact_folder, args.sample_name)
    shift_bed_target = os.path.join(exact_folder, args.sample_name + "_shift.bed")

    if not args.sob:
        #wig_cmd_callable = ngstk.check_command("wigToBigWig")
        gtars_cmd_callable = ngstk.check_command("gtars")

        #if wig_cmd_callable:
        if gtars_cmd_callable:
            # We actually need 3 separate commands to replace bamsitestowig with gtars
            # cmd = tool_path("bamSitesToWig.py")
            # cmd += " -i " + rmdup_bam
            # cmd += " -c " + res.chrom_sizes
            # cmd += " -e " + exact_folder
            # cmd += " -b " + shift_bed # request bed output
            # cmd += " -o " + exact_target
            # cmd += " -w " + smooth_target
            # cmd += " -m " + "atac"
            # cmd += " -p " + str(int(max(1, int(pm.cores) * 2/3)))
            # cmd += " --variable-step"
            # if not args.no_scale:
            #     ar = float(pm.get_stat("Aligned_reads"))
            #     if ar:
            #         cmd += " --scale " + str(ar)

            #gtars uniwig -f "/home/drc/Downloads/bam_files_for_rust_test/test1_chr1_chr2.bam"
            # -m 5
            # -s 1
            # -l /home/drc/outputs_gtars_bamsitestowig_nov2024/rust_created/
            # -y bw
            # -t bam
            # -p 6
            # -c /home/drc/pepatac_tutorial/genome/alias/hg38/fasta/default/hg38.chrom.sizes
            # -u all
            # TODO Scaling is not implemented in gtars uniwig 0.1.2. Therefore, no scaling will be done until that is updated.
            cmd_exact = tool_path("gtars") # gtars binary
            cmd_exact += " uniwig"
            cmd_exact += " -f " + rmdup_bam
            cmd_exact += " -c " + res.chrom_sizes
            cmd_exact += " -m " + "0" # this is smooth size NOT the shift a parameter as above, for exact, smoothing should be 0
            cmd_exact += " -s " + "5"  # this is step size
            cmd_exact += " -t " + "bam"  # input type which is bam
            cmd_exact += " -y " + "bw"  # output type is bw
            cmd_exact += " -p " + str(int(max(1, int(pm.cores) * 2/3)))  # number of processors
            cmd_exact += " -u " + "shift"
            cmd_exact += " -l " + exact_header

            cmd_smooth = tool_path("gtars") # gtars binary
            cmd_smooth += " uniwig"
            cmd_smooth += " -f " + rmdup_bam
            cmd_smooth += " -c " + res.chrom_sizes
            cmd_smooth += " -m " + "25" # this is smooth size NOT the shift a parameter as above, for exact, smoothing should be 0
            cmd_smooth += " -s " + "5"  # this is step size
            cmd_smooth += " -t " + "bam"  # input type which is bam
            cmd_smooth += " -y " + "bw"  # output type is bw
            cmd_smooth += " -p " + str(int(max(1, int(pm.cores) * 2/3)))  # number of processors
            cmd_smooth += " -u " + "shift"
            cmd_smooth += " -l " + smooth_header

            cmd_bed = tool_path("gtars") # gtars binary
            cmd_bed += " uniwig"
            cmd_bed += " -f " + rmdup_bam
            cmd_bed += " -c " + res.chrom_sizes
            cmd_bed += " -m " + "25" # this is smooth size NOT the shift a parameter as above, for exact, smoothing should be 0
            cmd_bed += " -s " + "5"  # this is step size
            cmd_bed += " -t " + "bam"  # input type which is bam
            cmd_bed += " -y " + "bed"  # output type is bed
            cmd_bed += " -p " + str(int(max(1, int(pm.cores) * 2/3)))  # number of processors
            cmd_bed += " -u " + "shift"
            cmd_bed += " -l " + shift_bed_header



            pm.run([cmd_exact, cmd_smooth, cmd_bed],[exact_target,smooth_target,shift_bed_target])


        else:
            pm.warning("Skipping signal track production:"
                       "Could not call \'gtars\'."
                       "Confirm the required gtar tools is in your PATH.")
    else:
        # seqOutBias needs a working directory, we'll make that temporary
        tempdir = tempfile.mkdtemp(dir=map_genome_folder)
        os.chmod(tempdir, 0o771)
        pm.clean_add(tempdir)

        # Tn5 correction requires separating by strand
        pm.timestamp("### Split BAM by strand")
        plus_bam = os.path.join(
            map_genome_folder, args.sample_name + "_plus.bam")
        minus_bam = os.path.join(
            map_genome_folder, args.sample_name + "_minus.bam")
        
        cmd1 = build_command([
            tools.samtools,
            "view",
            "-bh",
            ("-F", 20),
            rmdup_bam,
            (">", plus_bam)
        ])

        cmd2 = build_command([
            tools.samtools,
            "view",
            "-bh",
            ("-f", 16),
            rmdup_bam,
            (">", minus_bam)
        ])
        
        pm.run([cmd1, cmd2], [plus_bam, minus_bam], clean=True)

        # set up output files
        plus_exact_bw = os.path.join(
            exact_folder, args.sample_name + "_plus_exact.bw")
        minus_exact_bw = os.path.join(
            exact_folder, args.sample_name + "_minus_exact.bw")
        shift_plus_bed = os.path.join(
            map_genome_folder, args.sample_name + "_shift_plus.bed")
        fixed_plus_bed = os.path.join(
            map_genome_folder, args.sample_name + "_shift_plus_fixed.bed")
        shift_minus_bed = os.path.join(
            map_genome_folder, args.sample_name + "_shift_minus.bed")
        fixed_minus_bed = os.path.join(
            map_genome_folder, args.sample_name + "_shift_minus_fixed.bed")
        plus_table = os.path.join(
            map_genome_folder, (args.genome_assembly + "_plus.tbl"))
        minus_table = os.path.join(
            map_genome_folder, (args.genome_assembly + "_minus.tbl"))

        pm.timestamp("### Create mappability tables")
        plus_seqtable_cmd = build_command([
            (tools.seqOutBias, "seqtable"),
            res.fasta,
            str("--tallymer=" + res.search_file),
            str("--gt-workdir=" + tempdir),
            str("--read-size=" + str(read_len)),
            "--kmer-mask=NXNXXXCXXNNXNNNXXN",
            str("--out=" + plus_table)
        ])

        minus_seqtable_cmd = build_command([
            (tools.seqOutBias, "seqtable"),
            res.fasta,
            str("--tallymer=" + res.search_file),
            str("--gt-workdir=" + tempdir),
            str("--read-size=" + str(read_len)),
            "--kmer-mask=NXXNNNXNNXXCXXXNXN",
            str("--out=" + minus_table)
        ])
        pm.run([plus_seqtable_cmd, minus_seqtable_cmd], exact_target)
        pm.clean_add(plus_table)
        pm.clean_add(minus_table)

        # seqOutBias fails if bed output exists. Must remove on new_start.
        if os.path.exists(shift_plus_bed) or args.new_start:
            try:
                os.remove(shift_plus_bed)
            except OSError:
                pass
        if os.path.exists(shift_minus_bed) or args.new_start:
            try:
                os.remove(shift_minus_bed)
            except OSError:
                pass

        if not args.no_scale:
            pm.timestamp("### Produce scaled signal tracks")
            scale_plus_cmd = build_command([
                (tools.seqOutBias, "scale"),
                plus_table,
                plus_bam,
                str("--bed=" + shift_plus_bed),
                "--shift-counts",
                str("--bw=" + plus_exact_bw)
            ])

            scale_minus_cmd = build_command([
                (tools.seqOutBias, "scale"),
                minus_table,
                minus_bam,
                str("--bed=" + shift_minus_bed),
                "--shift-counts",
                str("--bw=" + minus_exact_bw),
            ])
        else:
            pm.timestamp("### Produce unscaled signal tracks")
            scale_plus_cmd = build_command([
                (tools.seqOutBias, "scale"),
                plus_table,
                plus_bam,
                "--no-scale",
                str("--bed=" + shift_plus_bed),
                "--shift-counts",
                str("--bw=" + plus_exact_bw)
            ])

            scale_minus_cmd = build_command([
                (tools.seqOutBias, "scale"),
                minus_table,
                minus_bam,
                "--no-scale",
                str("--bed=" + shift_minus_bed),
                "--shift-counts",
                str("--bw=" + minus_exact_bw),
            ])
        pm.run([scale_plus_cmd, scale_minus_cmd], exact_target)
        pm.clean_add(plus_exact_bw)
        pm.clean_add(minus_exact_bw)
        pm.clean_add(shift_plus_bed)
        pm.clean_add(shift_minus_bed)

        # merge stranded bigWigs
        exact_bedgraph = os.path.join(
            exact_folder, args.sample_name + "_exact.bedGraph")
        merge_cmd1 = build_command([
            tools.bigWigMerge,
            plus_exact_bw,
            minus_exact_bw,
            exact_bedgraph
        ])
        pm.run(merge_cmd1, exact_target)
        pm.clean_add(exact_bedgraph)

        #fix bed
        fix_cmd1 = build_command([
            "awk 'BEGIN{OFS=\"\t\";} {print $1, $2, $3, \"N\", $5, \"+\"}' ",
            shift_plus_bed,
            (" > ", fixed_plus_bed) 
        ])
        fix_cmd2 = build_command([
            "awk 'BEGIN{OFS=\"\t\";} {print $1, $2, $3, \"N\", $5, \"-\"}' ",
            shift_minus_bed,
            (" > ", fixed_minus_bed) 
        ])
        pm.run([fix_cmd1, fix_cmd2], exact_target)
        pm.clean_add(fixed_plus_bed)
        pm.clean_add(fixed_minus_bed)

        # merge beds
        merge_cmd2 = build_command([
            "cat",
            fixed_plus_bed,
            fixed_minus_bed,
            "|",
            "sort -k1,1 -k2,2n |",
            (tools.bedtools, "merge"),
            "-s -c 5,6 -o sum,distinct -prec 10 -delim \"\\t\"",
            ("-i",  "stdin"),
            " | awk 'BEGIN{OFS=\"\t\";} {print $1, $2, $3, \"N\", $4, $5}' ",
            (">", shift_bed_target)
        ])
        pm.run(merge_cmd2, exact_target)

        # sort merged bedGraph
        sort_bedgraph = os.path.join(
            exact_folder, args.sample_name + "_exact_sorted.bedGraph")
        sort_cmd = build_command([
            "sort -k1,1 -k2,2n",
            exact_bedgraph,
            ">",
            sort_bedgraph
        ])
        pm.run(sort_cmd, exact_target)
        pm.clean_add(sort_bedgraph)

        # convert bedGraph to bigWig
        convert_cmd = build_command([
            tools.bedGraphToBigWig,
            sort_bedgraph,
            res.chrom_sizes,
            exact_target
        ])
        pm.run(convert_cmd, exact_target)

        # Generate smooth signal track
        gtars_cmd_callable = ngstk.check_command("gtars")

        if gtars_cmd_callable:
            # cmd = tool_path("bamSitesToWig.py")
            # cmd += " -i " + rmdup_bam
            # cmd += " -c " + res.chrom_sizes
            # cmd += " -w " + smooth_target
            # cmd += " -m " + "atac"
            # cmd += " -p " + str(int(max(1, int(pm.cores) * 2/3)))
            # cmd += " --variable-step"
            # if not args.no_scale:
            #     ar = float(pm.get_stat("Aligned_reads"))
            #     if ar:
            #         cmd += " --scale " + str(ar)
            cmd_smooth = tool_path("gtars") # gtars binary
            cmd_smooth += " uniwig"
            cmd_smooth += " -f " + rmdup_bam
            cmd_smooth += " -c " + res.chrom_sizes
            cmd_smooth += " -m " + "5" # this is smooth size NOT the shift a parameter as above, for exact, smoothing should be 0
            cmd_smooth += " -s " + "1"  # this is step size
            cmd_smooth += " -t " + "bam"  # input type which is bam
            cmd_smooth += " -y " + "bw"  # output type is bw
            cmd_smooth += " -p " + str(int(max(1, int(pm.cores) * 2/3)))  # number of processors
            cmd_smooth += " -u " + "shift"  # TODO this does NOT account for shifted position, it needs to be updated in gtars
            cmd_smooth += " -l " + smooth_header
            pm.run(cmd_smooth, smooth_target)
        else:
            pm.warning("Skipping smooth signal track production:"
                       "Could not call \'gtars\'."
                       "Confirm the required gtar tool is in your PATH.")


    ############################################################################
    #                          Determine TSS enrichment                        #
    ############################################################################
    if not os.path.exists(res.refgene_tss):
        print("Skipping TSS -- TSS enrichment requires TSS annotation file: {}"
              .format(res.refgene_tss))
    else:
        pm.timestamp("### Calculate TSS enrichment")

        Tss_enrich = os.path.join(QC_folder, args.sample_name +
                                  "_TSS_enrichment.txt")
        cmd = tool_path("pyTssEnrichment.py")
        cmd += " -a " + rmdup_bam + " -b " + res.refgene_tss + " -p ends"
        cmd += " -c " + str(pm.cores)
        cmd += " -z -v -s 6 -o " + Tss_enrich
        pm.run(cmd, Tss_enrich, nofail=True)

        if not pm.get_stat('TSS_score') or args.new_start:
            with open(Tss_enrich) as f:
                floats = list(map(float, f))
            try:
                # If the TSS enrichment is 0, don't report
                list_len = 0.05*float(len(floats))
                normTSS = [x / (sum(floats[1:int(list_len)]) /
                           len(floats[1:int(list_len)])) for x in floats]
                max_index = normTSS.index(max(normTSS))

                if (((normTSS[max_index]/normTSS[max_index-1]) > 1.5) and
                    ((normTSS[max_index]/normTSS[max_index+1]) > 1.5)):
                    tmpTSS = list(normTSS)
                    del tmpTSS[max_index]
                    max_index = tmpTSS.index(max(tmpTSS)) + 1

                Tss_score = round(
                    (sum(normTSS[int(max_index-50):int(max_index+50)])) /
                    (len(normTSS[int(max_index-50):int(max_index+50)])), 1)

                pm.report_result("TSS_score", round(Tss_score, 1))
            except ZeroDivisionError:
                pm.report_result("TSS_score", 0)
                pass
        
        # Call Rscript to plot TSS Enrichment
        Tss_pdf = os.path.join(QC_folder,  args.sample_name +
                               "_TSS_enrichment.pdf")
        Tss_png = os.path.join(QC_folder,  args.sample_name +
                               "_TSS_enrichment.png")
        cmd = (tools.Rscript + " " + tool_path("PEPATAC.R") + 
               " tss -i " + Tss_enrich)
        pm.run(cmd, Tss_pdf, nofail=True)

        pm.report_object("TSS enrichment", Tss_pdf, anchor_image=Tss_png)


    ############################################################################
    #                         Fragment distribution                            #
    ############################################################################
    if args.paired_end:
        pm.timestamp("### Plot fragment distribution")
        frag_len = os.path.join(QC_folder,
                                args.sample_name + "_fragLen.txt")
        cmd1 = build_command([tools.perl,
                              tool_path("fragment_length_dist.pl"),
                              rmdup_bam,
                              frag_len])

        fragL_count = os.path.join(QC_folder,
                                   args.sample_name + "_fragCount.txt")
        cmd2 = ("sort -n  " + frag_len + " | uniq -c  > " + fragL_count)

        fragL_dis1 = os.path.join(QC_folder, args.sample_name +
                                  "_fragLenDistribution.pdf")
        fragL_png = os.path.join(QC_folder, args.sample_name +
                                 "_fragLenDistribution.png")
        fragL_dis2 = os.path.join(QC_folder, args.sample_name +
                                  "_fragLenDistribution.txt")

        cmd3 = (tools.Rscript + " " + tool_path("PEPATAC.R") +
                " frag -l " + frag_len + " -c " + fragL_count +
                " -p " + fragL_dis1 + " -t " + fragL_dis2)

        pm.run([cmd1, cmd2, cmd3], fragL_dis1, nofail=True)
        pm.report_object("Fragment distribution", fragL_dis1,
                         anchor_image=fragL_png)
    else: 
        print("Fragment distribution requires paired-end data")


    ############################################################################
    #                        Extract genomic features                          #
    ############################################################################
    # Generate local unzipped annotation file
    anno_local = os.path.join(raw_folder,
                              args.genome_assembly + "_annotations.bed")
    anno_zip = os.path.join(raw_folder,
                            args.genome_assembly + "_annotations.bed.gz")

    if (not os.path.exists(anno_local) and
        not os.path.exists(anno_zip) and
        os.path.exists(res.feat_annotation) or
        args.new_start):

        if res.feat_annotation.endswith(".gz"):
            cmd1 = ("ln -sf " + res.feat_annotation + " " + anno_zip)
            cmd2 = (ngstk.ziptool + " -d -c " + anno_zip +
                    " > " + anno_local)
            pm.run([cmd1, cmd2], anno_local)
            pm.clean_add(anno_local)
        elif res.feat_annotation.endswith(".bed"):
            cmd = ("ln -sf " + res.feat_annotation + " " + anno_local)
            pm.run(cmd, anno_local)
            pm.clean_add(anno_local)
        else:
            print("Skipping read and peak annotation...")
            print("This requires a {} annotation file."
                  .format(args.genome_assembly))
            print("Could not find the feat_annotation asset {}.`"
                  .format(str(os.path.dirname(res.feat_annotation))))


    ############################################################################
    #                               Peak calling                               #
    ############################################################################
    pm.timestamp("### Call peaks")

    def report_peak_count():
        num_peaksfile_lines = int(ngstk.count_lines(peak_output_file).strip())
        num_peaks = max(0, num_peaksfile_lines - 1)
        pm.report_result("Peak_count", num_peaks)
        
    name_sort_rmdup = os.path.join(map_genome_folder,
                                   args.sample_name + "_namesort_dedup.bam")

    peak_folder = os.path.join(param.outfolder, "peak_calling_" +
                               args.genome_assembly)
    ngstk.make_dir(peak_folder)
    peak_output_file = os.path.join(peak_folder,  args.sample_name +
                                    "_peaks.narrowPeak")
    peak_input_file = shift_bed_target
    shift_bed_gz = shift_bed_target + ".gz"
    peak_bed = os.path.join(peak_folder, args.sample_name + "_peaks.bed")
    summits_bed = os.path.join(peak_folder, args.sample_name + "_summits.bed")
    chr_order = os.path.join(peak_folder, "chr_order.txt")
    chr_keep = os.path.join(peak_folder, "chr_keep.txt")
    
    if not os.path.exists(chr_order) or args.new_start:
        pm.info("Generating chr_order file...")
        cmd = (tools.samtools + " view -H " + rmdup_bam +
               " | grep 'SN:' | awk -F':' '{print $2,$3}' | " +
               "awk -F' ' -v OFS='\t' '{print $1,$3}' > " + chr_order)
        pm.run(cmd, chr_order)
        pm.clean_add(chr_order) 

    # TODO: add chr_keep file and the same logic as in PEPPRO
    sort_peak_bed = os.path.join(peak_folder, args.sample_name +
                                 "_peaks_sort.bed")

    if os.path.isfile(shift_bed_gz):
        cmd = (ngstk.ziptool + " -d -c " +
               shift_bed_gz + " > " + peak_input_file)
        pm.run(cmd, peak_input_file)

    if not os.path.isfile(peak_input_file):
        print("Cannot call peaks, {} does not exist.".format(peak_input_file))
        print("Check your reads and alignment to primary genome.")
        pm.stop_pipeline()
    elif os.path.isfile(peak_input_file) and os.stat(peak_input_file).st_size == 0:
        print("Cannot call peaks, {} is empty".format(peak_input_file))
        print("Check your reads and alignment to primary genome.")
        pm.stop_pipeline()
    else:
        if args.peak_caller == "fseq":
            if args.peak_type == "fixed":
                err_msg = "Must use MACS3 when calling fixed width peaks."
                pm.fail_pipeline(RuntimeError(err_msg))
            else:
                fseq_cmd_chunks = [
                    tools.fseq,
                    ("-o", peak_folder),
                    param.fseq.params
                ]
                # Create the peak calling command
                fseq_cmd_chunks.append(peak_input_file)
                fseq_cmd = build_command(fseq_cmd_chunks)

                # Create the file merge/delete commands.
                chrom_peak_files = os.path.join(peak_folder, "*.npf")
                merge_chrom_peaks_files = (
                    "cat {peakfiles} > {combined_peak_file}"
                    .format(peakfiles=chrom_peak_files,
                            combined_peak_file=peak_output_file))
                pm.clean_add(chrom_peak_files)

                # Pypiper serially executes the commands.
                cmd = [fseq_cmd, merge_chrom_peaks_files]
        elif args.peak_caller == "fseq2":
            if args.peak_type == "fixed":
                err_msg = "Must use MACS3 when calling fixed width peaks."
                pm.fail_pipeline(RuntimeError(err_msg))
            else:
                fseq_cmd_chunks = [
                    tools.fseq,
                    "callpeak",
                    peak_input_file,
                    param.fseq2.params,
                    ("-name", args.sample_name),
                    ("-cpus", pm.cores)
                ]
                if args.paired_end:
                    fseq_cmd_chunks.append("-pe")
                    fseq_cmd_chunks.append("-pe_fragment_size_range auto")
                # Create the peak calling command
                fseq_cmd = build_command(fseq_cmd_chunks)
                cmd = fseq_cmd
        elif args.peak_caller == "hmmratac" and args.paired_end:
            if args.peak_type == "fixed":
                err_msg = "Must use MACS3 when calling fixed width peaks."
                pm.fail_pipeline(RuntimeError(err_msg))
            else:
                gapped_peak_file = os.path.join(peak_folder, args.sample_name +
                                                "_peaks.gappedPeak")
                fixed_header_bam = os.path.join(map_genome_folder,
                    args.sample_name + "_fixed_header.bam")
                fixed_header_index = os.path.join(map_genome_folder,
                    args.sample_name + "_fixed_header.bam.bai")
                cmd1 = (tools.samtools + " view -H " + rmdup_bam +
                        " | sed 's,^@RG.*,@RG\tID:" + args.sample_name +
                        "\tSM:None\tLB:None\tPL:Illumina,g' | " +
                        tools.samtools + " reheader - " + rmdup_bam +
                        " > " + fixed_header_bam)
                pm.run(cmd1, fixed_header_bam)
                cmd2 = tools.samtools + " index " + fixed_header_bam
                pm.run(cmd2, fixed_header_index)
                if not param.java_settings.params:
                    java_settings = '-Xmx{mem}'.format(mem=pm.mem)
                else:
                    java_settings = param.java_settings.params
                cmd3 = (tools.java + " " + java_settings +
                        " -jar " + tools.hmmratac)
                cmd3 += " --bam " + fixed_header_bam
                cmd3 += " --index " + fixed_header_index
                cmd3 += " --genome " + chr_order
                if os.path.exists(res.blacklist):
                    local_list = os.path.join(peak_folder, "blacklist.bed")
                    cmd = (ngstk.ziptool + " -d -c " + res.blacklist +
                           " > " + local_list)
                    pm.run(cmd, local_list)
                    cmd3 += " --blacklist " + local_list
                    pm.clean_add(local_list)
                cmd3 += " " + param.hmmratac.params
                cmd3 += " --output " 
                cmd3 += os.path.join(peak_folder,  args.sample_name)
                cmd = cmd3
        elif args.peak_caller == "hmmratac" and not args.paired_end:
            pm.info("HMMRATAC requires paired-end data. Defaulting to MACS3")
            cmd_base = [
                "{} callpeak".format(tools.macs3),
                ("-t", peak_input_file),
                ("-f", "BED"),
                ("--outdir", peak_folder),
                ("-n", args.sample_name),
                ("-g", args.genome_size)
            ]
            cmd_base.extend(param.macs3.params.split())
            cmd = build_command(cmd_base)
        elif args.peak_caller == "genrich":
            if args.peak_type == "fixed":
                err_msg = "Must use MACS3 when calling fixed width peaks."
                pm.fail_pipeline(RuntimeError(err_msg))
            else:
                cmd1 = (tools.samtools + " sort -n " + rmdup_bam + " > " +
                        name_sort_rmdup)
                cmd2 = tools.genrich + " -j -t " + name_sort_rmdup
                if os.path.exists(res.blacklist):
                    cmd2 += " -E " + res.blacklist
                cmd2 += param.genrich.params
                cmd2 += " -o " + peak_output_file
                pm.clean_add(name_sort_rmdup)
                cmd = [cmd1, cmd2]
        elif args.peak_caller == "homer":
            if args.peak_type == "fixed":
                err_msg = "Must use MACS3 when calling fixed width peaks."
                pm.fail_pipeline(RuntimeError(err_msg))
            else:
                tag_directory = os.path.join(peak_folder, "HOMER_tags")
                homer_peaks = os.path.join(peak_folder, args.sample_name +
                                           "_homer_peaks.tsv")
                cmd1 = ('makeTagDirectory ' + tag_directory + " " + rmdup_bam)
                cmd2 = (tools.homer_findpeaks + " " + tag_directory + " -o " +
                        homer_peaks + " -gsize " + str(genome_size) + " ")
                cmd2 += param.homer_findpeaks.params
                cmd3 = ("awk 'BEGIN{OFS=\"\t\";} /^[^#]/ " +
                        "{ print $2,$3,$4,$1,$8,$5 }' " + homer_peaks +
                        " | sort -k1,1 -k2,2n | " + tools.bedtools + " merge " + 
                        "-c 4,5,6 -o distinct,sum,distinct > " +
                        peak_output_file)
                # cmd3 = ('pos2bed.pl ' + homer_peaks + " | " + tools.bedtools +
                        # " sort | " + tools.bedtools + " merge > " + 
                        # peak_output_file)
                pm.clean_add(homer_peaks)
                pm.clean_add(tag_directory)
                cmd = [cmd1, cmd2, cmd3]
        else:
            # MACS3
            # Note: required input file is non-positional ("treatment" file -t)
            cmd_base = [
                "{} callpeak".format(tools.macs3),
                ("-t", peak_input_file),
                ("-f", "BED"),
                ("--outdir", peak_folder),
                ("-n", args.sample_name),
                ("-g", args.genome_size)
            ]
            if args.peak_type == "fixed":
                cmd_base.extend(param.macs3.params.split())
            elif args.peak_type == "variable":
                cmd_base.extend(param.macs3_variable.params.split())
            else:
                cmd_base.extend(param.macs3.params.split())
            cmd = build_command(cmd_base)

        # Call peaks and report peak count.
        # nofail true conditional on hmmratac/fseq2 which fails on small samples
        # TODO: there are downstream steps that require a peak file!
        #       maybe it should just fail?
        if args.peak_caller == "hmmratac":
            pm.run(cmd, peak_output_file, nofail=True)
            if os.path.exists(gapped_peak_file):
                # Drop HighCoveragePeaks [$13(e.g. the score)>1]
                # Use the score as the qValue for compatibility downstream
                cmd = ("awk -v OFS='\t' '$13>1 {print $1, $2, $3, $4, " +
                       "$13, $5, \".\", \".\", $13, \".\"}' " +
                       gapped_peak_file + " | sort -k1,1n -k2,2n > " +
                       peak_output_file)
                pm.run(cmd, peak_output_file)
            if os.path.exists(peak_output_file):
                line_count = int(ngstk.count_lines(peak_output_file).strip())
                num_peaks = max(0, line_count - 1)
                pm.report_result("Peak_count", num_peaks)
            else:
                # just touch an empty file? Homer creates an empty file...
                cmd = "touch " +  peak_output_file
                pm.run(cmd, peak_output_file)
                pm.warning("HMMRATAC failed to identify any peaks.")
        elif args.peak_caller == "fseq" or args.peak_caller == "fseq2":
            pm.run(cmd, peak_output_file, nofail=True)
            if (os.path.exists(peak_output_file) and 
                    os.stat(peak_output_file).st_size > 0):
                df = pd.read_csv(peak_output_file, sep='\t', header=None,
                                 names=("chr", "start", "end", "name", "score",
                                        "strand", "signalValue", "pValue",
                                        "qValue", "peak"))
                nineNine = df['signalValue'].quantile(q=0.99)
                df.loc[df['signalValue'] > nineNine, 'signalValue'] = nineNine

                # rescale score to be between 100 and 1000. 
                # See https://fureylab.web.unc.edu/software/fseq/
                df['score'] = rescale(np.log(df['signalValue']), [100, 1000])

                # ensure score is a whole integer value
                df['score'] = pd.to_numeric(df['score'].round(),
                                            downcast='integer')
                df.to_csv(peak_output_file, sep='\t',
                          header=False, index=False)

                line_count = int(ngstk.count_lines(peak_output_file).strip())
                num_peaks = max(0, line_count - 1)
                pm.report_result("Peak_count", num_peaks)
            else:
                # just touch an empty file? Homer creates an empty file...
                cmd = "touch " +  peak_output_file
                pm.run(cmd, peak_output_file)
                if args.peak_caller == "fseq":
                    pm.warning("FSeq failed to identify any peaks.")
                else:
                    pm.warning("FSeq2 failed to identify any peaks.")
        else:
            pm.run(cmd, peak_output_file, follow=report_peak_count)

        fixed_peak_file = os.path.join(peak_folder,  args.sample_name +
            "_peaks_fixedWidth.narrowPeak")
        # If using fixed peaks, extend from summit
        if args.peak_type == "fixed" and args.peak_caller == "macs3":
            temp = tempfile.NamedTemporaryFile(dir=peak_folder, delete=False)
            # extend peaks from summit by 'extend'
            # start extend from center of peak
            cmd1 = ("awk -v OFS='" + "\t" +
                   "' '{$2 = int(($3 - $2)/2 + $2 - " +
                   str(args.extend) + "); " +
                   "$3 = int($2 + " + str(2*args.extend) +
                   "); print $1, $2, $3}' " + summits_bed + " > " +
                   temp.name)
            # reconstruct narrowPeak file
            cmd2 = ("awk -v OFS='\t' '{print $4, $5, $6, $7, $8, $9, $10}' " +
                    peak_output_file + " | paste " + temp.name + " - " +
                    " > " + fixed_peak_file)
            peak_output_file = fixed_peak_file
            pm.run([cmd1, cmd2], peak_output_file)
            pm.clean_add(temp.name)

        # remove overlapping peaks, peaks extending beyond chromosomes,
        # and normalize score
        norm_peak_file = os.path.join(peak_folder,  args.sample_name +
            "_peaks_normalized.narrowPeak")
        cmd = build_command([tools.Rscript,
                             (tool_path("PEPATAC.R"), "reduce"),
                             ("-i", peak_output_file),
                             ("-s", args.sample_name),
                             ("-c", res.chrom_sizes),
                             "--normalize"
                            ])
        if os.path.exists(peak_output_file):
            if os.stat(peak_output_file).st_size > 0:
                pm.run(cmd, norm_peak_file, nofail=False)
                peak_output_file = norm_peak_file
            else:
                pm.info("{} contains no peaks.".format(peak_output_file))
        pm.clean_add(fixed_peak_file)
        
        # Filter peaks in blacklist.
        # TODO: improve documentation of using a blacklist
        if (os.path.exists(res.blacklist) and
                os.path.exists(peak_output_file) and
                os.stat(peak_output_file).st_size > 0):
            filter_peak = os.path.join(peak_folder, args.sample_name +
                                       "_peaks_rmBlacklist.narrowPeak")
            if not os.path.exists(filter_peak) or args.new_start:
                black_local = ''
                if res.blacklist.endswith(".gz"):
                    black_zip = os.path.join(raw_folder,
                                             args.genome_assembly +
                                             "_blacklist.bed.gz")
                    black_local = os.path.join(raw_folder,
                                               args.genome_assembly +
                                               "_blacklist.bed")
                    cmd1 = ("ln -sf " + res.blacklist + " " + black_zip)
                    cmd2 = (ngstk.ziptool + " -d -c " + black_zip +
                            " > " + black_local)
                    pm.run([cmd1, cmd2], black_local)
                    pm.clean_add(black_local)
                elif res.blacklist.endswith(".bed"):
                    black_local = os.path.join(raw_folder,
                                               args.genome_assembly +
                                               "_blacklist.bed")
                    cmd = ("ln -sf " + res.blacklist + " " + black_local)
                    pm.run(cmd, black_local)
                else:
                    print("Skipping peak filtering...")
                    print("This requires a {} blacklist file."
                          .format(args.genome_assembly))
                    print("Could not find {}.`"
                          .format(str(os.path.dirname(res.blacklist))))

                if os.path.exists(black_local):
                    # -v: Only report entries in A with NO overlap in
                    #     B (the blacklist), thereby removing blacklist regions
                    cmd = build_command([
                        (tools.bedtools, "intersect"),
                        ("-a", peak_output_file),
                        ("-b", black_local),
                        ("-v", ">"),
                        filter_peak
                    ])
                    pm.run(cmd, filter_peak)
                # rename file
                blacklist_target = os.path.join(peak_folder, "blacklist.flag")
                cmd1 = build_command([tools.Rscript,
                             (tool_path("PEPATAC.R"), "reduce"),
                             ("-i", filter_peak),
                             ("-s", args.sample_name),
                             ("-c", res.chrom_sizes)
                            ])
                cmd2 = ("touch " + blacklist_target)
                pm.run([cmd1, cmd2], blacklist_target)
                peak_output_file = filter_peak
        
        
        ########################################################################
        #                Determine the fraction of reads in peaks              #
        ########################################################################
        pm.timestamp("### Calculate fraction of reads in peaks (FRiP)")

        if pm.get_stat("FRiP") is None or args.new_start:
            frip = calc_frip(rmdup_bam, peak_output_file,
                             frip_func=ngstk.simple_frip,
                             pipeline_manager=pm)
            pm.report_result("FRiP", round(frip, 2))

        # if pm.get_stat("FRiP_Q1") is None or args.new_start:
            # score_sorted_peaks = os.path.join(peak_folder, args.sample_name +
                                              # "_score_sorted_peaks.narrowPeak")
            # score_q1_peaks = os.path.join(peak_folder, args.sample_name +
                                          # "_score_sorted_q1_peaks.narrowPeak")
            # cmd1 = ("sort -nrk 5 " + peak_output_file + " > " +
                    # score_sorted_peaks)
            # cmd2 = ("split -n l/1/4 " + score_sorted_peaks + " > " +
                    # score_q1_peaks)
            # pm.run([cmd1, cmd2], score_q1_peaks)
            # pm.clean_add(score_sorted_peaks)
            # pm.clean_add(score_q1_peaks)
            # frip = calc_frip(rmdup_bam, score_q1_peaks,
                             # frip_func=ngstk.simple_frip,
                             # pipeline_manager=pm)
            # pm.report_result("FRiP_Q1", round(frip, 2))

        if os.path.exists(res.frip_ref_peaks):
            if pm.get_stat("FRiP_ref") is None or args.new_start:
                # Use an external reference set of peaks instead of the peaks
                # called from this run
                frip_ref = calc_frip(rmdup_bam, res.frip_ref_peaks,
                                     frip_func=ngstk.simple_frip,
                                     pipeline_manager=pm)
                pm.report_result("FRiP_ref", round(frip_ref, 2))


        ########################################################################
        #                        Calculate peak coverage                       #
        ########################################################################
        pm.timestamp("### Calculate peak coverage")

        peak_coverage = os.path.join(peak_folder, args.sample_name +
                                     "_peaks_coverage.bed")
        norm_peak_coverage = os.path.join(peak_folder, args.sample_name +
                                          "_norm_peaks_coverage.bed")
        coverage_flag = os.path.join(peak_folder, "coverage.flag")

        ref_peak_coverage = os.path.join(peak_folder, args.sample_name +
                                         "_ref_peaks_coverage.bed")
        norm_ref_peak_coverage = os.path.join(peak_folder, args.sample_name +
                                              "_norm_ref_peaks_coverage.bed")
        ref_coverage_flag = os.path.join(peak_folder, "ref_coverage.flag")

        if not os.path.exists(coverage_flag) or args.new_start:
            cmd1 = ("cut -f 1-3 " + peak_output_file + " > " + peak_bed)
            cmd2 = (tools.samtools + " view -H " + rmdup_bam +
                    " | grep 'SN:' | awk -F':' '{print $2,$3}' | " +
                    "awk -F' ' -v OFS='\t' '{print $1,$3}' > " + chr_order)
            cmd3 = ("cut -f 1 " + chr_order + " > " + chr_keep)
            cmd4 = (tools.bedtools + " sort -i " + peak_bed + " -faidx " +
                    chr_order + " > " + sort_peak_bed)
            pm.run([cmd1, cmd2, cmd3, cmd4], sort_peak_bed,
                   nofail=True, clean=True)
        
        # If you include reference peaks, calculate coverage using those
        # normalize to 1M tags/reads: (base_counts/sum(base_counts))*1000000)
        # sum(base_counts) is just the total number of bases in peaks
        if os.path.exists(res.frip_ref_peaks):
            sort_frip_ref_peaks = os.path.join(peak_folder, 
                "sorted_reference_peaks.narrowPeak")
            cmd1 = (tools.bedtools + " sort -i " + res.frip_ref_peaks +
                    " -faidx " + chr_order + " > " + sort_frip_ref_peaks)
            cmd2 = (tools.bedtools + " coverage -sorted -a " +
                    sort_frip_ref_peaks + " -b " + rmdup_bam + " -g " +
                    chr_order + " | uniq > " + ref_peak_coverage)
            cmd3 = ("awk 'BEGIN{OFS=\"\\t\";} " +
                    "NR==FNR{sum += $12; next}{if (sum <= 0){sum = 1} " +
                    "print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, " +
                    "$12, $13, $14, ($12/sum*1000000)}' " +
                    ref_peak_coverage + " " + ref_peak_coverage +
                    " > " + norm_ref_peak_coverage)
            cmd4 = ("mv " + norm_ref_peak_coverage + " " + ref_peak_coverage)
            cmd5 = ("touch " + ref_coverage_flag)
            pm.run([cmd1, cmd2, cmd3, cmd4, cmd5],
                   ref_coverage_flag, nofail=True)
            pm.clean_add(sort_frip_ref_peaks)

        cmd1 = (tools.bedtools + " coverage -sorted -a " +
                sort_peak_bed + " -b " + rmdup_bam + " -g " + chr_order +
                " | uniq > " + peak_coverage)
        cmd2 = ("awk 'BEGIN{OFS=\"\\t\";} " +
                "NR==FNR{sum += $5; next}{if (sum <= 0){sum = 1} " +
                "print $1, $2, $3, $4, $5, $6, $7, ($5/sum*1000000)}' " +
                peak_coverage + " " + peak_coverage + " > " +
                norm_peak_coverage)
        cmd3 = ("mv " + norm_peak_coverage + " " + peak_coverage)
        cmd4 = ("touch " + coverage_flag)
        pm.run([cmd1, cmd2, cmd3, cmd4], coverage_flag, nofail=True)

        # Compress coverage file
        peak_coverage_gz = peak_coverage + ".gz"
        #norm_peak_coverage_gz = norm_peak_coverage + ".gz"
        cmd1 = (ngstk.ziptool + " " + peak_coverage + " > " + peak_coverage_gz)
        # cmd2 = (ngstk.ziptool + " " + norm_peak_coverage + " > " +
                # norm_peak_coverage_gz)
        #pm.run([cmd1, cmd2], norm_peak_coverage_gz)
        pm.run(cmd1, peak_coverage_gz)

        pm.clean_add(peak_bed)
        pm.clean_add(chr_keep)


        ########################################################################
        #           Produce bigBed (bigNarrowPeak) file from peak file         #
        ########################################################################
        pm.timestamp("### # Produce bigBed formatted narrowPeak file")

        bigNarrowPeak = os.path.join(peak_folder,
                                     args.sample_name + "_peaks.bigBed")
        temp = tempfile.NamedTemporaryFile(dir=peak_folder, delete=False)

        if not os.path.exists(bigNarrowPeak) or args.new_start:
            if (os.path.exists(peak_output_file) and 
                    os.stat(peak_output_file).st_size > 0):
                df = pd.read_csv(peak_output_file, sep='\t', header=None,
                                 names=("V1","V2","V3","V4","V5","V6",
                                        "V7","V8","V9","V10"))
                nineNine = df['V5'].quantile(q=0.99)
                df.loc[df['V5'] > nineNine, 'V5'] = nineNine

                # rescale score to be between 0 and 1000
                df['V5'] = rescale(np.log(df['V5']), [0, 1000])

                cs = pd.read_csv(res.chrom_sizes, sep='\t', header=None,
                                 names=("V1","V2"))
                df = df.merge(cs, on="V1")
                df.columns = ["V1","V2","V3","V4","V5","V6",
                              "V7","V8","V9","V10","V11"]
                # make sure 'chromEnd' positions are not greater than the 
                # max chrom_size
                n = np.array(df['V3'].values.tolist())
                df['V3'] = np.where(n > df['V11'], df['V11'], n).tolist()

                df = df.drop(columns=["V11"])
                # ensure score is a whole integer value
                df['V5'] = pd.to_numeric(df['V5'].round(), downcast='integer')
                df.to_csv(temp.name, sep='\t', header=False, index=False)
                pm.clean_add(temp.name)

                as_file = os.path.join(peak_folder, "bigNarrowPeak.as")
                cmd = ("echo 'table bigNarrowPeak\n" + 
                       "\"BED6+4 Peaks of signal enrichment based on pooled, normalized (interpreted) data.\"\n" +
                       "(\n" +
                       "     string chrom;        \"Reference sequence chromosome or scaffold\"\n" +
                       "     uint   chromStart;   \"Start position in chromosome\"\n" +
                       "     uint   chromEnd;     \"End position in chromosome\"\n" +
                       "     string name;         \"Name given to a region (preferably unique). Use . if no name is assigned\"\n" +
                       "     uint   score;        \"Indicates how dark the peak will be displayed in the browser (0-1000) \"\n" +
                       "     char[1]  strand;     \"+ or - or . for unknown\"\n" +
                       "     float  signalValue;  \"Measurement of average enrichment for the region\"\n" +
                       "     float  pValue;       \"Statistical significance of signal value (-log10). Set to -1 if not used.\"\n" +
                       "     float  qValue;       \"Statistical significance with multiple-test correction applied (FDR -log10). Set to -1 if not used.\"\n" +
                       "     int   peak;          \"Point-source called for this peak; 0-based offset from chromStart. Set to -1 if no point-source called.\"\n" +
                       ")' > " + as_file)
                pm.run(cmd, as_file, clean=True)

                cmd = (tools.bedToBigBed + " -as=" + as_file + " -type=bed6+4 " +
                       temp.name + " " + res.chrom_sizes + " " + bigNarrowPeak)
                pm.run(cmd, bigNarrowPeak, nofail=True)


        ########################################################################
        #                             Annotate peaks                           #
        ########################################################################
        pm.timestamp("### Annotate peaks")

        chr_PDF  = os.path.join(QC_folder, 
            args.sample_name + "_peak_chromosome_distribution.pdf")
        chr_PNG  = os.path.join(QC_folder,
            args.sample_name + "_peak_chromosome_distribution.png")
        TSSdist_PDF = os.path.join(QC_folder,
            args.sample_name + "_peak_TSS_distribution.pdf")
        TSSdist_PNG = os.path.join(QC_folder,
            args.sample_name + "_peak_TSS_distribution.png")
        gd_PDF  = os.path.join(QC_folder,
            args.sample_name + "_peak_genomic_distribution.pdf")
        gd_PNG  = os.path.join(QC_folder,
            args.sample_name + "_peak_genomic_distribution.png")

        cmd1 = build_command(
                [tools.Rscript,
                 (tool_path("PEPATAC.R"), "anno"),
                 ("-p", "chromosome"),
                 ("-i", peak_output_file),
                 ("-f", anno_local),
                 ("-g", args.genome_assembly),
                 ("-o", chr_PDF)
                ])
        cmd2 = build_command(
                [tools.Rscript,
                 (tool_path("PEPATAC.R"), "anno"),
                 ("-p", "tss"),
                 ("-i", peak_output_file),
                 ("-f", anno_local),
                 ("-g", args.genome_assembly),
                 ("-o", TSSdist_PDF)
                ])
        cmd3 = build_command(
                [tools.Rscript,
                 (tool_path("PEPATAC.R"), "anno"),
                 ("-p", "genomic"),
                 ("-i", peak_output_file),
                 ("-f", anno_local),
                 ("-g", args.genome_assembly),
                 ("-o", gd_PDF)
                ])

        if os.path.isfile(anno_local):
            if not os.path.exists(chr_PDF) or args.new_start:
                pm.run(cmd1, chr_PDF)
                pm.report_object("Peak chromosome distribution", chr_PDF,
                                 anchor_image=chr_PNG)
            if not os.path.exists(TSSdist_PDF) or args.new_start:
                pm.run(cmd2, TSSdist_PDF)
                pm.report_object("TSS distance distribution", TSSdist_PDF,
                                 anchor_image=TSSdist_PNG)
            if not os.path.exists(gd_PDF) or args.new_start:
                pm.run(cmd3, gd_PDF)
                pm.report_object("Peak partition distribution", gd_PDF,
                                 anchor_image=gd_PNG)


        ########################################################################
        #                       Perform motif analysis                         #
        ########################################################################
        if args.motif:
            pm.timestamp("### Motif analysis")

            # convert narrowPeak to BED6
            peak_bed_file = os.path.join(peak_folder,  args.sample_name +
                                         "_peaks.bed")
            if (os.path.exists(peak_output_file) and
                    os.stat(peak_output_file).st_size > 0):
                cmd = ("cut -f 1-6 " + peak_output_file + " > " + peak_bed_file)
                pm.run(cmd, peak_bed_file)
                pm.clean_add(peak_bed_file) 
                # create preparsed directory
                tempdir = tempfile.mkdtemp(dir=peak_folder)
                os.chmod(tempdir, 0o771)
                pm.clean_add(tempdir)
                # perform motif analysis
                motif_HTML  = os.path.join(peak_folder, "homer_motifs.html")
                cmd = (tools.homer_motif + " " + peak_bed_file + " " +
                       args.genome_assembly + " " + peak_folder)
                cmd += " " + param.homer_motif.params
                cmd += " -preparsedDir " + tempdir
                pm.run(cmd, motif_HTML)
                pm.report_object("Motif analysis", motif_HTML)
            elif not os.path.exists(peak_output_file):
                print("Cannot perform motif enrichment.")
                print("Could not find {}".format(peak_output_file))
                pm.stop_pipeline()
            elif os.stat(peak_output_file).st_size == 0:
                print("Cannot perform motif enrichment.")
                print("{} is empty.".format(peak_output_file))
                pm.stop_pipeline()
            else:
                print("Cannot perform motif enrichment.")
                print("Confirm peak calling was successful.")
                pm.stop_pipeline()


    ############################################################################ 
    #                  Determine genomic feature coverage                      #
    ############################################################################
    pm.timestamp("### Calculate read coverage")

    # Cummulative Fraction of Reads in Features (cFRiF)
    cFRiF_PDF = os.path.join(QC_folder, args.sample_name + "_cFRiF.pdf")
    cFRiF_PNG = os.path.join(QC_folder, args.sample_name + "_cFRiF.png")

    # Fraction of Reads in Feature (FRiF)
    FRiF_PDF = os.path.join(QC_folder, args.sample_name + "_FRiF.pdf")
    FRiF_PNG = os.path.join(QC_folder, args.sample_name + "_FRiF.png")

    if not os.path.exists(cFRiF_PDF) or args.new_start:
        anno_list = list()
        anno_files = list()

        if os.path.isfile(anno_local):
            # Get list of features
            if args.prioritize:
                cmd1 = ("cut -f 4 " + anno_local + " | uniq")
            else:
                cmd1 = ("cut -f 4 " + anno_local + " | sort -u")
            ft_list = pm.checkprint(cmd1, shell=True)
            ft_list = ft_list.splitlines()

            # Split annotation file on features
            cmd2 = ("awk -F'\t' '{print>\"" + QC_folder + "/\"$4}' " +
                    anno_local)

            if args.prioritize:
                if len(ft_list) >= 1:
                    for pos, anno in enumerate(ft_list):
                        # working files
                        anno_file = os.path.join(QC_folder, str(anno))
                        valid_name = str(re.sub('[^\w_.)( -]', '', anno).strip().replace(' ', '_'))
                        file_name = os.path.join(QC_folder, valid_name)
                        anno_sort = os.path.join(QC_folder,
                                                 valid_name + "_sort.bed")
                        anno_cov = os.path.join(QC_folder,
                                                args.sample_name + "_" +
                                                valid_name + "_coverage.bed")

                        # Extract feature files
                        pm.run(cmd2, anno_file)

                        # Rename files to valid file_names
                        # Avoid 'mv' "are the same file" error
                        if not os.path.exists(file_name):
                            cmd = 'mv "{old}" "{new}"'.format(old=anno_file,
                                                              new=file_name)
                            pm.run(cmd, file_name)

                        # Sort files (ensure only aligned chromosomes are kept)
                        # Need to cut -f 1-6 if you want strand information
                        # Not all features are stranded
                        # TODO: check for strandedness (*only works on some features)
                        if not os.path.exists(chr_order):
                            cmd = (tools.samtools + " view -H " + rmdup_bam +
                                   " | grep 'SN:' | awk -F':' '{print $2,$3}' | " +
                                   "awk -F' ' -v OFS='\t' '{print $1,$3}' > " + chr_order)
                            pm.run(cmd, chr_order)
                            pm.clean_add(chr_order)


                        cmd3 = ("cut -f 1 " + chr_order + " | grep -wf - " +
                                file_name + " | cut -f 1-3 | " +
                                "bedtools sort -i stdin -faidx " +
                                chr_order + " | bedtools merge -i stdin > " +                           
                                anno_sort)
                        # for future stranded possibilities include for merge
                        # "-c 4,5,6 -o collapse,collapse,collapse > " +
                        pm.run(cmd3, anno_sort)
                
                        anno_files.append(anno_sort)
                        anno_list.append(anno_cov)

                        pm.clean_add(file_name)
                        pm.clean_add(anno_sort)
                        pm.clean_add(anno_cov)

                    # Iteratively prioritize annotations by order presented
                    anno_files.reverse()
                    if len(anno_files) >= 1:
                        idx = list(range(0,len(anno_files)))
                        #idx.reverse()
                        file_count = 1
                        for annotation in anno_files:
                            del idx[0]
                            if file_count < len(anno_files):
                                file_count += 1
                                for i in idx:
                                    if annotation is not anno_files[i]:
                                        os.path.join(QC_folder)
                                        temp = tempfile.NamedTemporaryFile(dir=QC_folder, delete=False)
                                        #os.chmod(temp.name, 0o771)
                                        cmd1 = ("bedtools subtract -a " +
                                                annotation + " -b " +
                                                anno_files[i] + " > " + 
                                                temp.name)
                                        cmd2 = ("mv " + temp.name +
                                                " " + annotation)
                                        pm.run([cmd1, cmd2], cFRiF_PDF)
                                        temp.close()

                    anno_list.reverse()
                    if len(anno_files) >= 1:
                        for idx, annotation in enumerate(anno_files):
                            # Identifies unstranded coverage
                            # Would need to use '-s' flag to be stranded
                            if os.path.isfile(annotation) and os.stat(annotation).st_size > 0:
                                cmd3 = (tools.bedtools +
                                        " coverage -sorted -a " +
                                        annotation + " -b " + rmdup_bam +
                                        " -g " + chr_order + " > " +
                                        anno_list[idx])
                                pm.run(cmd3, cFRiF_PDF)
            else:
                if len(ft_list) >= 1:
                    for pos, anno in enumerate(ft_list):
                        # working files
                        anno_file = os.path.join(QC_folder, str(anno))
                        valid_name = str(re.sub('[^\w_.)( -]', '', anno).strip().replace(' ', '_'))
                        file_name = os.path.join(QC_folder, valid_name)
                        anno_sort = os.path.join(QC_folder,
                                                 valid_name + "_sort.bed")
                        anno_cov = os.path.join(QC_folder,
                                                args.sample_name + "_" +
                                                valid_name + "_coverage.bed")

                        # Extract feature files
                        pm.run(cmd2, anno_file)

                        # Rename files to valid file_names
                        # Avoid 'mv' "are the same file" error
                        if not os.path.exists(file_name):
                            cmd = 'mv "{old}" "{new}"'.format(old=anno_file,
                                                              new=file_name)
                            pm.run(cmd, file_name)

                        # Sort files (ensure only aligned chromosomes are kept)
                        # Need to cut -f 1-6 if you want strand information
                        # Not all features are stranded
                        # TODO: check for strandedness
                        if not os.path.exists(chr_order):
                            cmd = (tools.samtools + " view -H " + rmdup_bam +
                                   " | grep 'SN:' | awk -F':' '{print $2,$3}' | " +
                                   "awk -F' ' -v OFS='\t' '{print $1,$3}' > " + chr_order)
                            pm.run(cmd, chr_order)
                            pm.clean_add(chr_order)

                        cmd3 = ("cut -f 1 " + chr_order + " | grep -wf - " +
                                file_name + " | cut -f 1-3 | " +
                                "bedtools sort -i stdin -faidx " +
                                chr_order + " > " + anno_sort)
                        pm.run(cmd3, anno_sort)
                        
                        anno_list.append(anno_cov)
                        # Identifies unstranded coverage
                        # Would need to use '-s' flag to be stranded
                        cmd4 = (tools.bedtools + " coverage -sorted " +
                                " -a " + anno_sort + " -b " + rmdup_bam +
                                " -g " + chr_order + " > " + anno_cov)
                        pm.run(cmd4, anno_cov)

                        pm.clean_add(file_name)
                        pm.clean_add(anno_sort)
                        pm.clean_add(anno_cov)


    ############################################################################
    #                             Plot FRiF or FRiP                            #
    ############################################################################
    pm.timestamp("### Calculate cumulative and terminal fraction of reads in features (cFRiF/FRiF)")

    # Calculate size of genome
    if not pm.get_stat("Genome_size") or args.new_start:
        genome_size = int(pm.checkprint(
            ("awk '{sum+=$2} END {printf \"%.0f\", sum}' " +
             res.chrom_sizes)))
        pm.report_result("Genome_size", genome_size)
    else:
        genome_size = int(pm.get_stat("Genome_size"))

    if not os.path.exists(cFRiF_PDF) or args.new_start:
        if args.prioritize:
            # Count bases, not reads
            # return to original priority ranked order
            anno_list.reverse()
            count_cmd = (tools.bedtools + " genomecov -ibam " + rmdup_bam +
                         " -bg | awk '{sum+=($3-$2)}END{print sum}'")
        else:
            # Count reads
            count_cmd = (tools.samtools + " view -@ " + str(pm.cores) + " " +
                         param.samtools.params + " -c -F4 " + rmdup_bam)

        read_count = pm.checkprint(count_cmd)
        read_count = str(read_count).rstrip()

        cFRiF_cmd = [tools.Rscript, tool_path("PEPATAC.R"), "frif",
                     "-s", args.sample_name, "-z", str(genome_size).rstrip(),
                     "-n", read_count, "-y", "cfrif"]

        FRiF_cmd = [tools.Rscript, tool_path("PEPATAC.R"), "frif",
                    "-s", args.sample_name, "-z", str(genome_size).rstrip(),
                    "-n", read_count, "-y", "frif"]

        if not args.prioritize:
            # Use reads for calculation
            cFRiF_cmd.append("--reads")
            FRiF_cmd.append("--reads")

        cFRiF_cmd.append("-o")
        cFRiF_cmd.append(cFRiF_PDF)
        cFRiF_cmd.append("--bed")

        FRiF_cmd.append("-o")
        FRiF_cmd.append(FRiF_PDF)
        FRiF_cmd.append("--bed")

        if anno_list:
            for cov in anno_list:
                if os.path.isfile(cov) and os.stat(cov).st_size > 0:
                    cFRiF_cmd.append(cov)
                    FRiF_cmd.append(cov)
            cmd = build_command(cFRiF_cmd)
            pm.run(cmd, cFRiF_PDF, nofail=False)
            pm.report_object("cFRiF", cFRiF_PDF, anchor_image=cFRiF_PNG)

            cmd = build_command(FRiF_cmd)
            pm.run(cmd, FRiF_PDF, nofail=False)
            pm.report_object("FRiF", FRiF_PDF, anchor_image=FRiF_PNG)


    ############################################################################
    #            Remove all but final output files to save space               #
    ############################################################################
    if args.lite:
        # Remove everything but ultimate outputs
        pm.clean_add(frag_len)
        pm.clean_add(fragL_dis2)
        pm.clean_add(fragL_count)
        pm.clean_add(peak_coverage_gz)
        pm.clean_add(shift_bed_gz)
        pm.clean_add(Tss_enrich)
        pm.clean_add(mapping_genome_bam)
        pm.clean_add(mapping_genome_index)
        pm.clean_add(failQC_genome_bam)
        pm.clean_add(unmap_genome_bam)
        pm.clean_add(NFR_bam)
        pm.clean_add(mono_bam)
        pm.clean_add(di_bam)
        pm.clean_add(tri_bam)
        for unmapped_fq in to_compress:
            if not unmapped_fq:
                pm.clean_add(unmapped_fq + ".gz")


    ############################################################################
    #                            PIPELINE COMPLETE!                            #
    ############################################################################
    pm.stop_pipeline()


if __name__ == '__main__':
    pm = None
    # TODO: remove once ngstk become less instance-y, more function-y.
    ngstk = None
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        sys.exit("Pipeline aborted")
