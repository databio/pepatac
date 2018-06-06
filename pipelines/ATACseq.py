#!/usr/bin/env python
"""
ATACseq  pipeline
"""

__author__ = ["Jin Xu", "Nathan Sheffield"]
__email__ = "xujin937@gmail.com"
__version__ = "0.7.0-dev"


from argparse import ArgumentParser
import os
import sys
import tempfile
import pypiper
from pypiper import build_command

TOOLS_FOLDER = "tools"
PEAK_CALLERS = ["fseq", "macs2"]
TRIMMERS = ["trimmomatic", "pyadapt", "skewer"]


def parse_arguments():
    """
    Parse command-line arguments passed to the pipeline.
    """
    # Argument Parsing from yaml file
    ###########################################################################
    parser = ArgumentParser(description='Pipeline')
    parser = pypiper.add_pypiper_args(parser, all_args=True)

    # Pipeline-specific arguments
    parser.add_argument("-gs", "--genome-size", default="hs", type=str,
                        help="genome size for MACS2")

    parser.add_argument("--frip-ref-peaks", default=None,
                        dest="frip_ref_peaks", type=str,
                        help="Reference peak set for calculating FRIP")

    parser.add_argument("--peak-caller", dest="peak_caller",
                        default="macs2", choices=PEAK_CALLERS,
                        help="Name of peak caller; if 'fseq' fails to create "
                        "a peaks file and the log file indicates an "
                        "ArrayIndexOutOfBoundsException, this is likely "
                        "due to a low read count and can probably be "
                        "overcome by specifying fragment size with "
                        "fseq's -f option.")

    parser.add_argument("--trimmer", dest="trimmer",
                        default="skewer", choices=TRIMMERS,
                        help="Name of read trimming program")

    parser.add_argument("--prealignments", default=[], type=str, nargs="+",
                        help="Space-delimited list of reference genomes to "
                        "align to before primary alignment.")

    parser.add_argument("-V", "--version", action="version",
                        version="%(prog)s {v}".format(v=__version__))

    parser.add_argument("-c", "--image", default=None,
                        dest="image_name", type=str,
                        help="Run the pipeline commands in a container built"
                             " from a pipeline image, eliminating the need to"
                             " install dependencies.  Can be either a docker"
                             " or singularity image.")

    args = parser.parse_args()

    # TODO: determine if it's safe to handle this requirement with argparse.
    # It may be that communication between pypiper and a pipeline via
    # the pipeline interface (and/or) looper, and how the partial argument
    # parsing is handled, that makes this more favorable.
    if not args.input:
        parser.print_help()
        raise SystemExit

    return args


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


def _align_with_bt2(args, tools, unmap_fq1, unmap_fq2, assembly_identifier,
                    assembly_bt2, outfolder, aligndir=None, bt2_opts_txt=None):
    """
    A helper function to run alignments in series, so you can run one alignment
    followed by another; this is useful for successive decoy alignments.

    :param argparse.Namespace args: binding between option name and argument,
        e.g. from parsing command-line options
    :param looper.models.AttributeDict tools: binding between tool name and
        value, e.g. for tools/resources used by the pipeline
    :param str unmap_fq1: path to unmapped read1 FASTQ file
    :param str unmap_fq2: path to unmapped read2 FASTQ file
    :param str assembly_identifier: text identifying a genome assembly for the
        pipeline
    :param str assembly_bt2: assembly-specific bowtie2 folder (index, etc.)
    :param str outfolder: path to output directory for the pipeline
    :param str aligndir: name of folder for temporary output
    :param str bt2_opts_txt: command-line text for bowtie2 options
    :return (str, str): pair (R1, R2) of paths to FASTQ files
    """
    if os.path.exists(os.path.dirname(assembly_bt2)):
        pm.timestamp("### Map to " + assembly_identifier)
        if not aligndir:
            align_subdir = "aligned_{}_{}".format(args.genome_assembly,
                                                  assembly_identifier)
            sub_outdir = os.path.join(outfolder, align_subdir)
        else:
            sub_outdir = os.path.join(outfolder, aligndir)

        ngstk.make_dir(sub_outdir)
        bamname = "{}_{}.bam".format(args.sample_name, assembly_identifier)
        mapped_bam = os.path.join(sub_outdir, bamname)
        out_fastq_pre = os.path.join(
            sub_outdir, args.sample_name + "_unmap_" + assembly_identifier)
        # bowtie2 unmapped filename format
        out_fastq_bt2 = out_fastq_pre + '_R%.fq.gz'

        if not bt2_opts_txt:
            # Default options
            bt2_opts_txt = " -k 1"  # Return only 1 alignment
            bt2_opts_txt += " -D 20 -R 3 -N 1 -L 20 -i S,1,0.50"
            bt2_opts_txt += " -X 2000"

        # samtools sort needs a temporary directory
        tempdir = tempfile.mkdtemp(dir=sub_outdir)
        pm.clean_add(tempdir)

        # Build bowtie2 command
        cmd = tools.bowtie2 + " -p " + str(pm.cores)
        cmd += bt2_opts_txt
        cmd += " -x " + assembly_bt2
        cmd += " --rg-id " + args.sample_name
        if args.paired_end:
            cmd += " -1 " + unmap_fq1 + " -2 " + unmap_fq2
        else:
            cmd += " -U " + unmap_fq1
        cmd += " --un-conc-gz " + out_fastq_bt2
        # TODO: Pipes break singularity exec command... use shell?
        cmd += " | " + tools.samtools + " view -bS - -@ 1"  # convert to bam
        cmd += " | " + tools.samtools + " sort - -@ 1"  # sort output
        cmd += " -T " + tempdir
        cmd += " -o " + mapped_bam

        # In this samtools sort command we print to stdout and then use > to
        # redirect instead of  `+ " -o " + mapped_bam` because then samtools
        # uses a random temp file, so it won't choke if the job gets
        # interrupted and restarted at this step.

        # TODO: this follow command leads to a samtools not found error...
        #       likely need to modify _count_alignment function...
        pm.run(cmd, mapped_bam, follow=lambda: _count_alignment(
               assembly_identifier, mapped_bam, args.paired_end),
               container=pm.container)

        # filter genome reads not mapped
        # unmapped_bam = os.path.join(sub_outdir, args.sample_name +
        #                             "_unmap_" + assembly_identifier + ".bam")
        # cmd = tools.samtools + " view -b -@ " + str(pm.cores) + " -f 12  "
        # cmd +=  mapped_bam + " > " + unmapped_bam

        # cmd2, unmap_fq1, unmap_fq2 = \
        # ngstk.bam_to_fastq_awk(unmapped_bam, out_fastq_pre, args.paired_end)
        # pm.run([cmd,cmd2], unmap_fq2, container=pm.container)
        unmap_fq1 = out_fastq_pre + "_R1.fq.gz"
        unmap_fq2 = out_fastq_pre + "_R2.fq.gz"
        return unmap_fq1, unmap_fq2
    else:
        msg = "No {} index found in {}; skipping.".format(
            assembly_identifier, os.path.dirname(assembly_bt2))
        print(msg)
        return unmap_fq1, unmap_fq2


def _count_alignment(assembly_identifier, aligned_bam, paired_end):
    """
    This function counts the aligned reads and alignment rate and reports
    statistics. You must have previously reported a "Trimmed_reads" result to
    get alignment rates. It is useful as a follow function after any alignment
    step to quantify and report the number of reads aligning, and the alignment
    rate to that reference.

    :param str  aligned_bam: Path to the aligned bam file.
    :param str assembly_identifier: String identifying the reference to which
                                    you aligned (can be anything)
    :param bool paired_end: Whether the sequencing employed a paired-end
                            strategy.
    """
    ar = ngstk.count_mapped_reads(aligned_bam, paired_end)
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


def _get_bowtie2_index(genomes_folder, genome_assembly):
    """
    Create path to genome assembly folder with refgenie structure.

    Convenience function that returns the bowtie2 index prefix (to be passed
    to bowtie2) for a genome assembly that follows the folder structure
    produced by the RefGenie reference builder.

    :param str genomes_folder: path to central genomes directory, i.e. the
        root for multiple assembly subdirectories
    :param str genome_assembly: name of the specific assembly of interest,
        e.g. 'mm10'
    :return str: path to bowtie2 index subfolder within central assemblies
        home, for assembly indicated
    """
    return os.path.join(genomes_folder, genome_assembly,
                        "indexed_bowtie2", genome_assembly)


def tool_path(tool_name):
    """
    Return the path to a tool used by this pipeline.

    :param str tool_name: name of the tool (e.g., a script filename)
    :return str: real, absolute path to tool (expansion and symlink resolution)
    """

    return os.path.join(os.path.dirname(os.path.dirname(__file__)),
                        TOOLS_FOLDER, tool_name)


def main():
    """
    Main pipeline process.
    """

    args = parse_arguments()

    args.paired_end = args.single_or_paired == "paired"
    # TODO: for now, paired end sequencing input is required.
    # args.paired_end = True

    # Initialize, creating global PipelineManager and NGSTk instance for
    # access in ancillary functions outside of main().
    outfolder = os.path.abspath(
        os.path.join(args.output_parent, args.sample_name))
    global pm
    pm = pypiper.PipelineManager(
        name="ATACseq", outfolder=outfolder, args=args, version=__version__)
    global ngstk
    ngstk = pypiper.NGSTk(pm=pm)

    # Convenience alias
    tools = pm.config.tools
    param = pm.config.parameters
    res = pm.config.resources

    # Set up reference resource according to genome prefix.
    gfolder = os.path.join(res.genomes, args.genome_assembly)
    res.chrom_sizes = os.path.join(
        gfolder, args.genome_assembly + ".chromSizes")
    # res.TSS_file = os.path.join(gfolder, args.genome_assembly +
    #                             ".refseq.TSS.txt")
    res.TSS_file = os.path.join(gfolder, args.genome_assembly + "_TSS.tsv")
    res.blacklist = os.path.join(
        gfolder, args.genome_assembly + ".blacklist.bed")

    # Get bowtie2 indexes
    res.bt2_genome = _get_bowtie2_index(res.genomes, args.genome_assembly)

    # Adapter file can be set in the config; if left null, we use a default.
    res.adapters = res.adapters or tool_path("NexteraPE-PE.fa")

    param.outfolder = outfolder

    print("Local input file: " + args.input[0])
    if args.input2:
        print("Local input file: " + args.input2[0])

    container = None
    # if args.container_name is not None:
        # infolder = os.path.dirname(args.input[0])
        # mounts = [outfolder, infolder]
        # pm.get_container(args.container_name, mounts)
    # if args.docker.lower() in {'yes', 'true', 't', 'y'}:
        # # Set up some docker stuff
        # # Need to also pass symbolically linked folders!
        # infolder = os.path.dirname(args.input[0])
        # mounts = [outfolder, infolder]
        # # TODO: add the container name to yaml file instead...
        # pm.get_container("jpsmith5/pepatac", mounts)

    ###########################################################################

    pm.report_result(
        "File_mb",
        ngstk.get_file_size(
            [x for x in [args.input, args.input2] if x is not None]))
    pm.report_result("read_type", args.single_or_paired)
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
    cmd, out_fastq_pre, unaligned_fastq = ngstk.input_to_fastq(
        local_input_files, args.sample_name, args.paired_end, fastq_folder)
    pm.run(cmd, unaligned_fastq,
           follow=ngstk.check_fastq(
               local_input_files, unaligned_fastq, args.paired_end),
           container=pm.container)
    pm.clean_add(out_fastq_pre + "*.fastq", conditional=True)
    print(local_input_files)
    untrimmed_fastq1 = out_fastq_pre + "_R1.fastq"
    untrimmed_fastq2 = out_fastq_pre + "_R2.fastq" if args.paired_end else None

    ########################
    # Begin adapter trimming
    ########################
    pm.timestamp("### Adapter trimming: ")

    # Create names for trimmed FASTQ files.
    if args.trimmer == "trimmomatic":
        trimming_prefix = os.path.join(fastq_folder, args.sample_name)
    else:
        trimming_prefix = out_fastq_pre
    trimmed_fastq = trimming_prefix + "_R1.trim.fastq"
    trimmed_fastq_R2 = trimming_prefix + "_R2.trim.fastq"

    # Create trimming command(s).
    if args.trimmer == "pyadapt":
        if not args.paried_end:
            raise NotImplementedError(
                "pyadapt trimming requires paired-end reads.")
        # TODO: make pyadapt give options for output file name.
        trim_cmd_chunks = [
            tool_path("pyadapter_trim.py"),
            ("-a", local_input_files[0]),
            ("-b", local_input_files[1]),
            ("-o", out_fastq_pre),
            "-u"
        ]
        cmd = build_command(trim_cmd_chunks)

    elif args.trimmer == "skewer":
        # Create the primary skewer command.
        trim_cmd_chunks = [
            tools.skewer,  # + " --quiet"
            ("-f", "sanger"),
            ("-t", str(args.cores)),
            ("-m", "pe" if args.paired_end else "any"),
            ("-x", res.adapters),
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
        # Rename the logfile.
        # skewer_filename_pairs.append(
        #    ("{}-trimmed.log".format(out_fastq_pre), trimLog))

        # Pypiper submits the commands serially.
        cmd = [trimming_command] + trimming_renaming_commands

    else:
        # Default to trimmomatic.
        if pm.container is not None:
            trim_cmd_chunks = [
                "{java} -Xmx{mem} -jar {trim} {PE} -threads {cores}".format(
                    java=tools.java, mem=pm.mem,
                    trim="/home/src/Trimmomatic-0.36/trimmomatic-0.36.jar",
                    PE="PE" if args.paired_end else "",
                    cores=pm.cores),
                local_input_files[0],
                local_input_files[1],
                trimmed_fastq,
                trimming_prefix + "_R1_unpaired.fq",
                trimmed_fastq_R2 if args.paired_end else "",
                trimming_prefix + "_R2_unpaired.fq" if args.paired_end else "",
                "ILLUMINACLIP:" + res.adapters + ":2:30:10"
            ]
        else:
            trim_cmd_chunks = [
                "{java} -Xmx{mem} -jar {trim} {PE} -threads {cores}".format(
                    java=tools.java, mem=pm.mem,
                    trim=tools.trimmo,
                    PE="PE" if args.paired_end else "",
                    cores=pm.cores),
                local_input_files[0],
                local_input_files[1],
                trimmed_fastq,
                trimming_prefix + "_R1_unpaired.fq",
                trimmed_fastq_R2 if args.paired_end else "",
                trimming_prefix + "_R2_unpaired.fq" if args.paired_end else "",
                "ILLUMINACLIP:" + res.adapters + ":2:30:10"
            ]
        cmd = build_command(trim_cmd_chunks)

    pm.run(cmd, trimmed_fastq,
           follow=ngstk.check_trim(
               trimmed_fastq, args.paired_end, trimmed_fastq_R2,
               fastqc_folder=os.path.join(param.outfolder, "fastqc")),
           container=pm.container)

    pm.clean_add(os.path.join(fastq_folder, "*.fq"), conditional=True)
    pm.clean_add(os.path.join(fastq_folder, "*.log"), conditional=True)
    #########################
    # End adapter trimming
    #########################

    # Prepare variables for alignment step
    unmap_fq1 = trimmed_fastq
    unmap_fq2 = trimmed_fastq_R2

    # Map to any requested prealignments
    # We recommend mapping to chrM first for ATAC-seq data
    pm.timestamp("### Prealignments")
    if len(args.prealignments) == 0:
        print("You may use `--prealignments` to align to references before",
              "the genome alignment step. See docs.")
    else:
        print("Prealignment assemblies: " + str(args.prealignments))
        # Loop through any prealignment references and map to them sequentially
        for reference in args.prealignments:
            unmap_fq1, unmap_fq2 = _align_with_bt2(
                args, tools, unmap_fq1, unmap_fq2, reference,
                assembly_bt2=_get_bowtie2_index(res.genomes, reference),
                outfolder=param.outfolder, aligndir="prealignments")

    pm.timestamp("### Map to genome")
    map_genome_folder = os.path.join(
        param.outfolder, "aligned_" + args.genome_assembly)
    ngstk.make_dir(map_genome_folder)

    mapping_genome_bam = os.path.join(
        map_genome_folder, args.sample_name + ".pe.q10.sort.bam")
    mapping_genome_bam_temp = os.path.join(
        map_genome_folder, args.sample_name + ".temp.bam")
    unmap_genome_bam = os.path.join(
        map_genome_folder, args.sample_name + "_unmap.bam")

    bt2_options = " --very-sensitive"
    bt2_options += " -X 2000"

    # samtools sort needs a temporary directory
    tempdir = tempfile.mkdtemp(dir=map_genome_folder)
    pm.clean_add(tempdir)

    cmd = tools.bowtie2 + " -p " + str(pm.cores)
    cmd += bt2_options
    cmd += " --rg-id " + args.sample_name
    cmd += " -x " + res.bt2_genome
    if args.paired_end:
        cmd += " -1 " + unmap_fq1 + " -2 " + unmap_fq2
    else:
        cmd += " -U " + unmap_fq1
    cmd += " | " + tools.samtools + " view -bS - -@ 1 "
    # cmd += " -f 2 -q 10"  # quality and pairing filter
    cmd += " | " + tools.samtools + " sort - -@ 1"
    cmd += " -T " + tempdir
    cmd += " -o " + mapping_genome_bam_temp

    # Split genome mapping result bamfile into two: high-quality aligned
    # reads (keepers) and unmapped reads (in case we want to analyze the
    # altogether unmapped reads)
    cmd2 = "samtools view -q 10 -b -@ " + str(pm.cores) + " "
    if args.paired_end:
        # add a step to accept only reads mapped in proper pair
        cmd2 += "-f 2 "

    cmd2 += mapping_genome_bam_temp + " > " + mapping_genome_bam

    def check_alignment_genome():
        ar = ngstk.count_mapped_reads(mapping_genome_bam, args.paired_end)
        pm.report_result("Aligned_reads", ar)
        rr = float(pm.get_stat("Raw_reads"))
        tr = float(pm.get_stat("Trimmed_reads"))
        pm.report_result("Alignment_rate", round(float(ar) * 100 /
                         float(tr), 2))
        pm.report_result("Total_efficiency", round(float(ar) * 100 /
                         float(rr), 2))

    pm.run([cmd, cmd2], mapping_genome_bam, follow=check_alignment_genome,
           container=pm.container)

    # Now produce the unmapped file
    unmap_cmd = "samtools view -b -@ " + str(pm.cores)
    if args.paired_end:
        # require both read and mate unmapped
        unmap_cmd += " -f 12 "
    else:
        # require only read unmapped
        unmap_cmd += " -f 4 "

    unmap_cmd += " " + mapping_genome_bam_temp + " > " + unmap_genome_bam
    pm.run(unmap_cmd, unmap_genome_bam, container=pm.container)
    # Remove temporary bam file from unmapped file production
    pm.clean_add(mapping_genome_bam_temp)

    pm.timestamp("### Remove dupes, build bigwig and bedgraph files")

    def estimate_lib_size(picard_log):
        # In millions of reads; contributed by Ryan
        # NOTE: from Picard manual: without optical duplicate counts,
        #       library size estimation will be inaccurate.
        cmd = ("awk -F'\t' -f " + tool_path("extract_picard_lib.awk") +
               " " + picard_log)
        picard_est_lib_size = pm.checkprint(cmd)
        pm.report_result("Picard_est_lib_size", picard_est_lib_size)

    def post_dup_aligned_reads(picard_log):
        # Number of aligned reads post tools.picard REMOVE_DUPLICATES
        cmd = ("awk -F'\t' -f " +
               tool_path("extract_post_dup_aligned_reads.awk") + " " +
               picard_log)
        pdar = pm.checkprint(cmd)
        ar = float(pm.get_stat("Aligned_reads"))
        rr = float(pm.get_stat("Raw_reads"))
        tr = float(pm.get_stat("Trimmed_reads"))
        if pdar == "":
            pdar = ar

        dr = float(ar) - float(pdar)
        dar = round(float(pdar) * 100 / float(tr), 2)
        dte = round(float(pdar) * 100 / float(rr), 2)
        pm.report_result("Duplicate_reads", dr)
        pm.report_result("Dedup_aligned_reads", pdar)
        pm.report_result("Dedup_alignment_rate", dar)
        pm.report_result("Dedup_total_efficiency", dte)

    rmdup_bam = os.path.join(
        map_genome_folder, args.sample_name + ".pe.q10.sort.rmdup.bam")
    metrics_file = os.path.join(
        map_genome_folder, args.sample_name + "_picard_metrics_bam.txt")
    picard_log = os.path.join(
        map_genome_folder, args.sample_name + "_picard_metrics_log.txt")
    # the tools.picard command is being generated from OUTSIDE THE CONTAINER!!!
    # therefore, it doesn't know how to expand that variable!!!!
    # if I run as docker shell, it would expand, but not with exec!
    # This method works, but is messy
    # if pm.container is not None:
        # # target is a file, not output
        # picard_temp = os.path.join(map_genome_folder, "picard.txt")
        # cmd = "printenv PICARD >" + picard_temp
        # pm.run(cmd, picard_temp, container=pm.container, clean=True)
        # cmd = "cat " + picard_temp
        # picard = pm.checkprint(cmd).rstrip()
        # cmd3 = (tools.java + " -Xmx" + str(pm.javamem) + " -jar " + 
                # picard + " MarkDuplicates")
    # This also works, but is hard-coded...
    # TODO: Alternative thought, in pypiper, check if command uses shell,
    #       then check if command contains pipes...then if it does, split 
    #       on those pipes and add a singularity exec instance:// before
    #       each command, and let the host shell do the piping.
    if pm.container is not None:
        cmd3 = (tools.java + " -Xmx" + str(pm.javamem) + " -jar " + 
                "/home/tools/bin/picard.jar" + " MarkDuplicates")
    else:    
        cmd3 = (tools.java + " -Xmx" + str(pm.javamem) + " -jar " + 
                tools.picard + " MarkDuplicates")
    cmd3 += " INPUT=" + mapping_genome_bam
    cmd3 += " OUTPUT=" + rmdup_bam
    cmd3 += " METRICS_FILE=" + metrics_file
    cmd3 += " VALIDATION_STRINGENCY=LENIENT"
    cmd3 += " ASSUME_SORTED=true REMOVE_DUPLICATES=true > " + picard_log
    cmd4 = tools.samtools + " index " + rmdup_bam

    pm.run([cmd3, cmd4], rmdup_bam,
           follow=lambda: post_dup_aligned_reads(metrics_file),
           container=pm.container)

    # shift bam file and make bigwig file
    # this script is only compatible with paired-end at the moment
    if args.paired_end:
        shift_bed = os.path.join(
            map_genome_folder, args.sample_name + ".pe.q10.sort.rmdup.bed")
        cmd = tool_path("bam2bed_shift.pl") + " " + rmdup_bam
        pm.run(cmd, shift_bed, container=pm.container)
        bedGraph = os.path.join(map_genome_folder, args.sample_name +
                                ".pe.q10.sort.rmdup.bedGraph")
        cmd = tools.bedtools + " genomecov -bg -split"
        cmd += " -i " + shift_bed + " -g " + res.chrom_sizes + " > " + bedGraph
        norm_bedGraph = os.path.join(
            map_genome_folder, args.sample_name +
            ".pe.q10.sort.rmdup.norm.bedGraph")
        sort_bedGraph = os.path.join(
            map_genome_folder, args.sample_name +
            ".pe.q10.sort.rmdup.norm.sort.bedGraph")
        cmd2 = "{} {} {}".format(tool_path("norm_bedGraph.pl"),
                                 bedGraph, norm_bedGraph)
        bw_file = os.path.join(
            map_genome_folder, args.sample_name + ".pe.q10.rmdup.norm.bw")

        # bedGraphToBigWig requires lexicographical sort, which puts chr10
        # before chr2, for example
        # NOTE: original cmd3 is NOT container friendly...use bedSort instead
        #cmd3 = ("LC_COLLATE=C sort -k1,1 -k2,2n " + norm_bedGraph + " > " +
        #        sort_bedGraph)
        cmd3 = tools.bedSort + " " + norm_bedGraph + " " + sort_bedGraph
        cmd4 = (tools.bedGraphToBigWig + " " + sort_bedGraph + " " +
                res.chrom_sizes + " " + bw_file)
        pm.run([cmd, cmd2, cmd3, cmd4], bw_file, nofail=True,
               container=pm.container)

    # "Exact cuts" are what I call nucleotide-resolution tracks of exact bases
    # where the transposition (or DNAse cut) happened;
    # In the past I used wigToBigWig on a combined wig file, but this ends up
    # using a boatload of memory (more than 32GB); in contrast, running the
    # wig -> bw conversion on each chrom and then combining them with bigWigCat
    # requires much less memory. This was a memory bottleneck in the pipeline.
    pm.timestamp("### Computing exact sites")
    exact_folder = os.path.join(map_genome_folder + "_exact")
    temp_exact_folder = os.path.join(exact_folder, "temp")
    ngstk.make_dir(exact_folder)
    ngstk.make_dir(temp_exact_folder)
    temp_target = os.path.join(temp_exact_folder, "flag_completed")
    exact_target = os.path.join(exact_folder, args.sample_name + "_exact.bw")

    # this is the old way to do it (to be removed)
    # cmd = tool_path("bedToExactWig.pl")
    # cmd += " " + shift_bed
    # cmd += " " + res.chrom_sizes
    # cmd += " " + temp_exact_folder
    # cmd2 = "touch " + temp_target
    # pm.run([cmd, cmd2], temp_target, container=pm.container)

    # # Aside: since this bigWigCat command uses shell expansion, pypiper
    # # cannot profile memory. We could use glob.glob if we want to preserve
    # # memory; like so: glob.glob(os.path.join(...)). But I don't because
    # # bigWigCat uses little memory (<10GB).
    # # This also sets us up nicely to process chromosomes in parallel.
    # cmd = (tools.bigWigCat + " " + exact_target + " " +
    #        os.path.join(temp_exact_folder, "*.bw"))
    # pm.run(cmd, exact_target, container=pm.container)
    # pm.clean_add(os.path.join(temp_exact_folder, "*.bw"))

    cmd = tool_path("bamSitesToWig.py")
    cmd += " -b"  # request bed output
    cmd += " -i " + rmdup_bam
    cmd += " -c " + res.chrom_sizes
    cmd += " -o " + exact_target
    cmd += " -p " + str(max(1, int(pm.cores) * 2/3))
    cmd2 = "touch " + temp_target
    pm.run([cmd, cmd2], temp_target, container=pm.container)

    if not args.paired_end:
        # TODO, make this always (not just single-end)
        shift_bed = exact_target + ".bed"

    # TSS enrichment
    if not os.path.exists(res.TSS_file):
        print("Skipping TSS -- TSS enrichment requires TSS annotation file: {}"
              .format(res.TSS_file))
    else:
        pm.timestamp("### Calculate TSS enrichment")
        QC_folder = os.path.join(param.outfolder, "QC_" + args.genome_assembly)
        ngstk.make_dir(QC_folder)

        Tss_enrich = os.path.join(QC_folder, args.sample_name +
                                  ".TssEnrichment")
        cmd = tool_path("pyTssEnrichment.py")
        cmd += " -a " + rmdup_bam + " -b " + res.TSS_file + " -p ends"
        cmd += " -c " + str(pm.cores)
        cmd += " -e 2000 -u -v -s 4 -o " + Tss_enrich
        pm.run(cmd, Tss_enrich, nofail=True, container=pm.container)

        # Call Rscript to plot TSS Enrichment
        Tss_plot = os.path.join(QC_folder,  args.sample_name +
                                ".TssEnrichment.pdf")
        cmd = ("Rscript " +
               tool_path("ATAC_Rscript_TSSenrichmentPlot_pyPiper.R"))
        cmd += " " + Tss_enrich + " pdf"
        pm.run(cmd, Tss_plot, nofail=True, container=pm.container)

        # Always plot strand specific TSS enrichment.
        # added by Ryan 2/10/17 to calculate TSS score as numeric and to
        # include in summary stats. This could be done in prettier ways which
        # I'm open to. Just adding for the idea.
        with open(Tss_enrich) as f:
            floats = map(float, f)
        Tss_score = ((sum(floats[1950:2050]) / 100) /
                     (sum(floats[1:200]) / 200))
        pm.report_result("TSS_Score", Tss_score)
        try:
            # Just wrapping this in a try temporarily so that old versions of
            # pypiper will work. v0.6 release of pypiper adds this function
            pm.report_figure("TSS enrichment", Tss_plot)
            Tss_png = os.path.join(QC_folder,  args.sample_name +
                                ".TssEnrichment.png")
            pm.report_object("TSS enrichment", Tss_plot, anchor_image=Tss_png)
        except:
            pass

        # fragment  distribution
        fragL = os.path.join(QC_folder, args.sample_name + ".fragLen.txt")
        frag_dist_tool = tool_path("fragment_length_dist.pl")
        cmd = build_command([tools.perl, frag_dist_tool, rmdup_bam, fragL])
        frag_length_counts_file = args.sample_name + ".frag_count.txt"
        fragL_count = os.path.join(QC_folder, frag_length_counts_file)
        cmd1 = "sort -n  " + fragL + " | uniq -c  > " + fragL_count
        fragL_dis1 = os.path.join(QC_folder, args.sample_name +
                                  ".fragL.distribution.pdf")
        fragL_dis2 = os.path.join(QC_folder, args.sample_name +
                                  ".fragL.distribution.txt")
        cmd2 = build_command(
            [tools.Rscript, tool_path("fragment_length_dist.R"),
             fragL, fragL_count, fragL_dis1, fragL_dis2])
        pm.run([cmd, cmd1, cmd2], fragL_dis1, nofail=True,
               container=pm.container)
        try:
            fragL_png = os.path.join(QC_folder, args.sample_name +
                                  ".fragL.distribution.png")
            pm.report_figure("Fragment distribution", fragL_dis1)
            pm.report_object("Fragment distribution", fragL_dis1, anchor_image=fragL_png)
        except:
            pass

    # Peak calling

    pm.timestamp("### Call peaks")

    def report_peak_count():
        num_peaksfile_lines = int(ngstk.count_lines(peak_output_file).strip())
        num_peaks = max(0, num_peaksfile_lines - 1)
        pm.report_result("Peak_count", num_peaks)

    peak_folder = os.path.join(param.outfolder, "peak_calling_" +
                               args.genome_assembly)
    ngstk.make_dir(peak_folder)
    peak_output_file = os.path.join(peak_folder,  args.sample_name +
                                    "_peaks.narrowPeak")
    peak_input_file = shift_bed

    if args.peak_caller == "fseq":
        fseq_cmd_chunks = [tools.fseq, ("-o", peak_folder)]

        # Parse only a subset of fseq options.
        for fseq_opt in ["of", "l", "t", "s"]:
            fseq_value = param.fseq[fseq_opt]
            # TODO: use more natural try/except once PipelineManager parameters
            #       AD is strict.
            if fseq_value == fseq_opt:
                # Non-strict pipeline parameters AttributeDict returns key
                # itself if missing.
                continue
            # We're building a command, so even non-text values need no special
            # handling.
            fseq_optval = ("-{}".format(fseq_opt), fseq_value)
            fseq_cmd_chunks.append(fseq_optval)

        # Create the peak calling command
        fseq_cmd = build_command(fseq_cmd_chunks)

        # Create the file merge/delete commands.
        chrom_peak_files = os.path.join(peak_folder, "*.npf")
        merge_chrom_peaks_files = (
            "cat {peakfiles} > {combined_peak_file}"
            .format(peakfiles=chrom_peak_files,
                    combined_peak_file=peak_output_file))
        #delete_chrom_peaks_files = "rm {}".format(chrom_peak_files)
        pm.clean_add(chrom_peak_files)

        # Pypiper serially executes the commands.
        cmd = [fseq_cmd, merge_chrom_peaks_files, delete_chrom_peaks_files]

    else:
        # MACS2
        macs_cmd_chunks = [
            "{} callpeak".format(tools.macs2),
            ("-t", peak_input_file),
            "-f BED",
            ("-g", args.genome_size),
            ("--outdir", peak_folder),
            ("-n", args.sample_name),
            ("-q", param.macs2.q),
            ("--shift", param.macs2.shift),
            "--nomodel"
        ]
        # Note: required input file is non-positional ("treatment" file -t)
        cmd = build_command(macs_cmd_chunks)

    # Call peaks and report peak count.
    pm.run(cmd, peak_output_file, follow=report_peak_count,
           container=pm.container)

    # Filter peaks in blacklist.
    if os.path.exists(res.blacklist):
        filter_peak = os.path.join(peak_folder, args.sample_name +
                                   "_peaks.narrowPeak.rmBlacklist")
        cmd = (tools.bedtools + " intersect " + " -a " + peak_output_file +
               " -b " + res.blacklist + " -v  >" + filter_peak)

        pm.run(cmd, filter_peak, container=pm.container)

    pm.timestamp("### # Calculate fraction of reads in peaks (FRIP)")

    frip = calc_frip(rmdup_bam, peak_output_file, frip_func=ngstk.simple_frip,
                     pipeline_manager=pm)
    pm.report_result("FRIP", frip)

    if args.frip_ref_peaks and os.path.exists(args.frip_ref_peaks):
        # Use an external reference set of peaks instead of the peaks called
        # from this run
        frip_ref = calc_frip(rmdup_bam, args.frip_ref_peaks,
                             frip_func=ngstk.simple_frip, pipeline_manager=pm)
        pm.report_result("FRIP_ref", frip_ref)

    pm.stop_pipeline()


if __name__ == '__main__':
    pm = None
    # TODO: remove once ngstk become less instance-y, more function-y.
    ngstk = None
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        print("Pipeline aborted.")
        sys.exit(1)
