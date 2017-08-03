#!/usr/bin/env python
"""
ATACseq  pipeline
"""

__author__ = ["Jin Xu", "Nathan Sheffield"]
__email__ = "xujin937@gmail.com"
__version__ = "0.5.0-dev"


from argparse import ArgumentParser
import os
import sys
import tempfile
import pypiper



PEAK_CALLERS = ["fseq", "macs2"]
TRIMMERS = ["trimmomatic", "pyadapt", "skewer"]



def parse_arguments():
	"""
	Parse command-line arguments passed to the pipeline.
	"""
	# Argument Parsing from yaml file 
	# #######################################################################################
	parser = ArgumentParser(description='Pipeline')
	parser = pypiper.add_pypiper_args(parser, all_args = True)
	#parser = pypiper.add_pypiper_args(parser, groups = ['all'])  # future version

	# Pipeline-specific arguments
	parser.add_argument("-gs", "--genome-size", default="hs", type=str,
						help="genome size for MACS2")

	parser.add_argument("--frip-ref-peaks", default=None,
						dest="frip_ref_peaks", type=str,
						help="Reference peak set for calculating FRIP")

	parser.add_argument("--peak-caller", dest="peak_caller",
						default="macs2", choices=PEAK_CALLERS,
						help="Name of peak caller")

	parser.add_argument("--trimmer", dest="trimmer",
						default="trimmomatic", choices=TRIMMERS,
						help="Name of read trimming program")

	parser.add_argument("--prealignments", default=[], type=str, nargs="+",
						help="Space-delimited list of reference genomes to align to before primary alignment.")

	parser.add_argument("-V", "--version", action="version",
	          			version="%(prog)s {v}".format(v=__version__))

	args = parser.parse_args()

    # TODO: determine if it's safe to handle this requirement with argparse.
	# It may be that communication between pypiper and a pipeline via
	# the pipeline interface (and/or) looper, and how the partial argument
	# parsing is handled, that makes this more favorable.
	if not args.input:
		parser.print_help()
		raise SystemExit

	return args



def build_command(chunks):
	"""
	Create a command from various parts.

	The parts provided may include a base, flags, option-bound arguments, and
	positional arguments. Each element must be either a string or a two-tuple.
	Raw strings are interpreted as either the command base, a pre-joined
	pair (or multiple pairs) of option and argument, a series of positional
	arguments, or a combination of those elements. The only modification they
	undergo is trimming of any space characters from each end.

	:param Iterable[str | (str, str | NoneType)] chunks: the collection of the
		command components to interpret, modify, and join to create a
		single meaningful command
	:return str: the single meaningful command built from the given components
	:raise ValueError: if no command parts are provided
	"""

	if not chunks:
		raise ValueError("No command parts: {} ({})".format(chunks, type(chunks)))

	if isinstance(chunks, str):
		return chunks

	parsed_pieces = []

	for cmd_part in chunks:
		if cmd_part is None:
			continue
		try:
			# Trim just space, not all whitespace.
			# This prevents damage to an option that specifies,
			# say, tab as a delimiter.
			parsed_pieces.append(cmd_part.strip(" "))
		except AttributeError:
			option, argument = cmd_part
			if argument is not None:
				option, argument = option.strip(" "), str(argument).strip(" ")
				parsed_pieces.append("{} {}".format(option, argument))

	return " ".join(parsed_pieces)



def main():
	"""
	Main pipeline process.
	"""

	args = parse_arguments()

    # TODO: for now, paired end sequencing input is required.
	if args.single_or_paired == "paired":
		args.paired_end = True
	else:
		args.paired_end = True

	# Initialize
	outfolder = os.path.abspath(os.path.join(args.output_parent, args.sample_name))
	pm = pypiper.PipelineManager(name="ATACseq", outfolder=outfolder, args=args, version=__version__)
	ngstk = pypiper.NGSTk(pm=pm)

	# Convenience alias 
	tools = pm.config.tools
	param = pm.config.parameters
	res = pm.config.resources

	def get_bowtie2_index(genomes_folder, genome_assembly):
		"""
		Convenience function
		Returns the bowtie2 index prefix (to be passed to bowtie2) for a genome assembly that follows
		the folder structure produced by the RefGenie reference builder.
		"""
		return(os.path.join(genomes_folder, genome_assembly, "indexed_bowtie2", genome_assembly))


	def count_alignment(assembly_identifier, aligned_bam, paired_end):
		""" 
		This function counts the aligned reads and alignment rate and reports statistics. You
		must have previously reported a "Trimmed_reads" result to get alignment rates. It is useful
		as a follow function after any alignment step to quantify and report the number of reads
		aligning, and the alignment rate to that reference.

		:param str	aligned_bam: Path to the aligned bam file.
		:param str assembly_identifier:	String identifying the reference to which you aligned (can be anything)
		:param bool paired_end: Whether the sequencing employed a paired-end strategy.
		"""
		ar = ngstk.count_mapped_reads(aligned_bam, paired_end)
		pm.report_result("Aligned_reads_" + assembly_identifier, ar)
		try:
			# wrapped in try block in case Trimmed_reads is not reported in this pipeline.
			tr = float(pm.get_stat("Trimmed_reads"))
			pm.report_result("Alignment_rate_" + assembly_identifier, round(float(ar) * 100 / float(tr), 2))
		except:
			pass


	def align(unmap_fq1, unmap_fq2, assembly_identifier, assembly_bt2, aligndir=None, bt2_options=None):
		"""
		A helper function to run alignments in series, so you can run one alignment followed
		by another; this is useful for successive decoy alignments.
		"""
		if os.path.exists(os.path.dirname(assembly_bt2)):
			pm.timestamp("### Map to " + assembly_identifier)
			if not aligndir:
				sub_outdir = os.path.join(param.outfolder, "aligned_" + args.genome_assembly + "_" + assembly_identifier)
			else:
				sub_outdir = os.path.join(param.outfolder, aligndir)

			ngstk.make_dir(sub_outdir)
			mapped_bam = os.path.join(sub_outdir, args.sample_name + "_" + assembly_identifier + ".bam")
			out_fastq_pre = os.path.join(sub_outdir, args.sample_name + "_unmap_" + assembly_identifier)
			out_fastq_bt2 = out_fastq_pre + '_R%.fq.gz'  # bowtie2 unmapped filename format
			
			if not bt2_options:
				# Default options
				bt2_options = " -k 1"  # Return only 1 alignment
				bt2_options += " -D 20 -R 3 -N 1 -L 20 -i S,1,0.50"
				bt2_options += " -X 2000"

			# samtools sort needs a temporary directory
			tempdir = tempfile.mkdtemp(dir=sub_outdir)
			pm.clean_add(tempdir)

			# Build bowtie2 command
			cmd = tools.bowtie2 + " -p " + str(pm.cores)
			cmd += bt2_options
			cmd += " -x " + assembly_bt2
			cmd += " --rg-id " + args.sample_name
			cmd += " -1 " + unmap_fq1  + " -2 " + unmap_fq2
			cmd += " --un-conc-gz " + out_fastq_bt2
			cmd += " | " + tools.samtools + " view -bS - -@ 1"  # convert to bam
			cmd += " | " + tools.samtools + " sort - -@ 1" # sort output
			cmd += " -T " + tempdir
			cmd += " -o " + mapped_bam

			# In this samtools sort command we print to stdout and then use > to
			# redirect instead of  `+ " -o " + mapped_bam` because then samtools
			# uses a random temp file, so it won't choke if the job gets
			# interrupted and restarted at this step.

			pm.run(cmd, mapped_bam, follow = lambda: count_alignment(assembly_identifier, mapped_bam, args.paired_end))

			# filter genome reads not mapped 
			#unmapped_bam = os.path.join(sub_outdir, args.sample_name + "_unmap_" + assembly_identifier + ".bam")
			#cmd = tools.samtools + " view -b -@ " + str(pm.cores) + " -f 12  "
			#cmd +=  mapped_bam + " > " + unmapped_bam

			#cmd2, unmap_fq1, unmap_fq2 = ngstk.bam_to_fastq_awk(unmapped_bam, out_fastq_pre, args.paired_end)
			#pm.run([cmd,cmd2], unmap_fq2)
			unmap_fq1 = out_fastq_pre + "_R1.fq.gz"
			unmap_fq2 = out_fastq_pre + "_R2.fq.gz"
			return unmap_fq1, unmap_fq2
		else:
			print("No " + assembly_identifier + " index found at " + os.path.dirname(assembly_bt2) + ". Skipping.")
			return unmap_fq1, unmap_fq2


	# Set up reference resource according to genome prefix.
	gfolder = os.path.join(res.genomes, args.genome_assembly)
	res.chrom_sizes = os.path.join(gfolder, args.genome_assembly + ".chromSizes")
	#res.TSS_file = os.path.join(gfolder, args.genome_assembly + ".refseq.TSS.txt")
	res.TSS_file = os.path.join(gfolder, args.genome_assembly + "_TSS.tsv")
	res.blacklist = os.path.join(gfolder, args.genome_assembly + ".blacklist.bed")

	# Get bowtie2 indexes
	res.bt2_genome = get_bowtie2_index(res.genomes, args.genome_assembly)

	# Set up a link to relative scripts included in the repo
	tools.scripts_dir = os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), "tools")

	# Adapter file can be set in the config; but if left null, we use a default.
	if not res.adapter:
		res.adapter = os.path.join(tools.scripts_dir, "NexteraPE-PE.fa")


	param.outfolder = outfolder

	################################################################################
	print("Local input file: " + args.input[0]) 
	print("Local input file: " + args.input2[0]) 

	pm.report_result("File_mb", ngstk.get_file_size([args.input, args.input2]))
	pm.report_result("read_type", args.single_or_paired)
	pm.report_result("Genome", args.genome_assembly)

	# ATACseq pipeline
	# Each (major) step should have its own subfolder

	raw_folder = os.path.join(param.outfolder, "raw/")
	fastq_folder = os.path.join(param.outfolder, "fastq/")

	pm.timestamp("### Merge/link and fastq conversion: ")
	# This command will merge multiple inputs so you can use multiple sequencing lanes
	# in a single pipeline run. 
	local_input_files = ngstk.merge_or_link([args.input, args.input2], raw_folder, args.sample_name)
	cmd, out_fastq_pre, unaligned_fastq = ngstk.input_to_fastq(local_input_files, args.sample_name, args.paired_end, fastq_folder)
	pm.run(cmd, unaligned_fastq, 
		follow=ngstk.check_fastq(local_input_files, unaligned_fastq, args.paired_end))
	pm.clean_add(out_fastq_pre + "*.fastq", conditional = True)
	print(local_input_files)


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
		# TODO: make pyadapt give options for output file name.
		trim_cmd_chunks = [
			os.path.join(tools.scripts_dir, "pyadapter_trim.py")
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
			("-x", res.adapter),
			"--quiet",
			("-o", out_fastq_pre),
			local_input_files[0],
			local_input_files[1] if args.paired_end else None
		]
		trimming_command = build_command(trim_cmd_chunks)

		# Create the skewer file renaming commands.
		skewer_filename_pairs = [("{}-trimmed-pair1.fastq".format(out_fastq_pre), trimmed_fastq)]
		if args.paired_end:
			skewer_filename_pairs.append(("{}-trimmed-pair2.fastq".format(out_fastq_pre), trimmed_fastq_R2))
		trimming_renaming_commands = [build_command(["mv", old, new]) for old, new in skewer_filename_pairs]
		# Rename the logfile.
		#skewer_filename_pairs.append(("{}-trimmed.log".format(out_fastq_pre), trimLog))

		# Pypiper submits the commands serially.
		cmd = [trimming_command] + trimming_renaming_commands

	else:
		# Default to trimmomatic.
		trim_cmd_chunks = [
			"{java} -Xmx{mem} -jar {trim} PE -threads {cores}".format(
				java=tools.java, mem=pm.mem, trim=tools.trimmo, cores=pm.cores),
			local_input_files[0],
			local_input_files[1],
			trimmed_fastq,
			trimming_prefix + "_R1_unpaired.fq",
			trimmed_fastq_R2,
			trimming_prefix + "_R2_unpaired.fq",
			"ILLUMINACLIP:" + res.adapter + ":2:30:10"
		]
		cmd = build_command(trim_cmd_chunks)

	pm.run(cmd, trimmed_fastq,
			follow=ngstk.check_trim(trimmed_fastq, trimmed_fastq_R2, args.paired_end,
			fastqc_folder=os.path.join(param.outfolder, "fastqc/")))

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
		print("You may use `--prealignments` to align to references before the genome alignment step. See docs.")
	else:
		print("Prealignment assemblies: " + str(args.prealignments))
		# Loop through any prealignment references and map to them sequentially
		for reference in args.prealignments:
			unmap_fq1, unmap_fq2 = align(unmap_fq1, unmap_fq2, reference, 
				get_bowtie2_index(res.genomes, reference),
				aligndir="prealignments")

	pm.timestamp("### Map to genome")
	map_genome_folder = os.path.join(param.outfolder, "aligned_" + args.genome_assembly)
	ngstk.make_dir(map_genome_folder)

	mapping_genome_bam = os.path.join(map_genome_folder, args.sample_name + ".pe.q10.sort.bam")
	mapping_genome_bam_temp = os.path.join(map_genome_folder, args.sample_name + ".temp.bam")
	unmap_genome_bam = os.path.join(map_genome_folder, args.sample_name + "_unmap.bam")

	bt2_options = " --very-sensitive"
	bt2_options += " -X 2000"

	# samtools sort needs a temporary directory
	tempdir = tempfile.mkdtemp(dir=map_genome_folder)
	pm.clean_add(tempdir)

	cmd = tools.bowtie2 + " -p " + str(pm.cores)
	cmd += bt2_options
	cmd += " --rg-id " + args.sample_name
	cmd += " -x " +  res.bt2_genome
	cmd += " -1 " + unmap_fq1  + " -2 " + unmap_fq2
	cmd += " | " + tools.samtools + " view -bS - -@ 1 "
	#cmd += " -f 2 -q 10"  # quality and pairing filter
	cmd += " | " + tools.samtools + " sort - -@ 1"
	cmd += " -T " + tempdir
	cmd += " -o " + mapping_genome_bam_temp

	# Split genome mapping result bamfile into two: high-quality aligned reads (keepers)
	# and unmapped reads (in case we want to analyze the altogether unmapped reads)
	cmd2 = "samtools view -f 2 -q 10 -b -@ " + str(pm.cores) + " " + mapping_genome_bam_temp
	cmd2 += " > " + mapping_genome_bam 

	def check_alignment_genome():
		ar = ngstk.count_mapped_reads(mapping_genome_bam, args.paired_end)
		pm.report_result("Aligned_reads", ar)
		rr = float(pm.get_stat("Raw_reads"))
		tr = float(pm.get_stat("Trimmed_reads"))
		pm.report_result("Alignment_rate", round(float(ar) *
	 100 / float(tr), 2))
		pm.report_result("Total_efficiency", round(float(ar) * 100 / float(rr), 2))

	pm.run([cmd, cmd2], mapping_genome_bam, follow = check_alignment_genome)

	cmd = "samtools view -f 12 -b -@ " + str(pm.cores) + " " + mapping_genome_bam_temp
	cmd += " > " + unmap_genome_bam
	pm.run(cmd, unmap_genome_bam)

	pm.timestamp("### Remove dupes, build bigwig and bedgraph files")

	def estimate_lib_size(picard_log):
		# In millions of reads; contributed by Ryan
		cmd = "awk -F'\t' -f " + os.path.join(tools.scripts_dir, "extract_picard_lib.awk") + " " + picard_log
		picard_est_lib_size = pm.checkprint(cmd)
		pm.report_result("Picard_est_lib_size", picard_est_lib_size)
	 
	rmdup_bam =  os.path.join(map_genome_folder, args.sample_name + ".pe.q10.sort.rmdup.bam")
	metrics_file = os.path.join(map_genome_folder, args.sample_name + "_picard_metrics_bam.txt")
	picard_log = os.path.join(map_genome_folder, args.sample_name + "_picard_metrics_log.txt")
	cmd3 =  tools.java + " -Xmx" + str(pm.javamem) +  " -jar " + tools.picard + " MarkDuplicates"
	cmd3 += " INPUT=" + mapping_genome_bam 
	cmd3 += " OUTPUT=" + rmdup_bam 
	cmd3 += " METRICS_FILE=" + metrics_file 
	cmd3 += " VALIDATION_STRINGENCY=LENIENT"
	cmd3 += " ASSUME_SORTED=true REMOVE_DUPLICATES=true > " +  picard_log
	cmd4 = tools.samtools + " index " + rmdup_bam 

	pm.run([cmd3,cmd4], rmdup_bam, follow = lambda: estimate_lib_size(metrics_file))

	# shift bam file and make bigwig file
	shift_bed = os.path.join(map_genome_folder, args.sample_name + ".pe.q10.sort.rmdup.bed")
	cmd = os.path.join(tools.scripts_dir, "bam2bed_shift.pl " +  rmdup_bam)
	pm.run(cmd,shift_bed)
	bedGraph = os.path.join( map_genome_folder , args.sample_name + ".pe.q10.sort.rmdup.bedGraph") 
	cmd = tools.bedtools + " genomecov -bg -split"
	cmd += " -i " + shift_bed + " -g " + res.chrom_sizes + " > " + bedGraph
	norm_bedGraph = os.path.join(map_genome_folder , args.sample_name + ".pe.q10.sort.rmdup.norm.bedGraph")
	sort_bedGraph = os.path.join(map_genome_folder , args.sample_name + ".pe.q10.sort.rmdup.norm.sort.bedGraph")
	cmd2 = os.path.join(tools.scripts_dir, "norm_bedGraph.pl "  + bedGraph + " " + norm_bedGraph)
	bw_file =  os.path.join(map_genome_folder , args.sample_name + ".pe.q10.rmdup.norm.bw")

	# bedGraphToBigWig requires lexographical sort, which puts chr10 before chr2, for example
	cmd3 = "LC_COLLATE=C sort -k1,1 -k2,2n " + norm_bedGraph + " > " + sort_bedGraph
	cmd4 = tools.bedGraphToBigWig + " " + sort_bedGraph + " " + res.chrom_sizes + " " + bw_file
	pm.run([cmd, cmd2, cmd3, cmd4], bw_file)


	# "Exact cuts" are what I call nucleotide-resolution tracks of exact bases where the
	# transposition (or DNAse cut) happened;
	# In the past I used wigToBigWig on a combined wig file, but this ends up using a boatload
	# of memory (more than 32GB); in contrast, running the wig -> bw conversion on each chrom
	# and then combining them with bigWigCat requires much less memory. This was a memory bottleneck
	# in the pipeline.
	pm.timestamp("### Computing exact sites")
	exact_folder = os.path.join(map_genome_folder + "_exact")
	temp_exact_folder = os.path.join(exact_folder, "temp")
	ngstk.make_dir(exact_folder)
	ngstk.make_dir(temp_exact_folder)
	temp_target = os.path.join(temp_exact_folder, "flag_completed")
	exact_target = os.path.join(exact_folder, args.sample_name + "_exact.bw")

	# cmd = os.path.join(tools.scripts_dir, "bedToExactWig.pl")
	# cmd += " " + shift_bed
	# cmd += " " + res.chrom_sizes
	# cmd += " " + temp_exact_folder
	# cmd2 = "touch " + temp_target
	# pm.run([cmd, cmd2], temp_target)

	# # Aside: since this bigWigCat command uses shell expansion, pypiper cannot profile memory.
	# # we could use glob.glob if we want to preserve memory. like so: glob.glob(os.path.join(...))
	# # But I don't because bigWigCat uses little memory (<10GB).
	# # This also sets us up nicely to process chromosomes in parallel.
	# cmd = tools.bigWigCat + " " + exact_target + " " + os.path.join(temp_exact_folder, "*.bw")
	# pm.run(cmd, exact_target)
	# pm.clean_add(os.path.join(temp_exact_folder, "*.bw"))

	cmd = os.path.join(tools.scripts_dir, "bamSitesToWig.py")
	cmd += " -i " + rmdup_bam
	cmd += " -c " + res.chrom_sizes
	cmd += " -o " + exact_target
	cmd += " -p " + str(max(1, int(pm.cores) * 2/3))
	cmd2 = "touch " + temp_target
	pm.run([cmd, cmd2], temp_target)

	# TSS enrichment
	if not os.path.exists(res.TSS_file):
		print("Skipping TSS -- TSS enrichment requires TSS annotation file: {}".format(res.TSS_file))
	else:
		pm.timestamp("### Calculate TSS enrichment")
		QC_folder = os.path.join(param.outfolder, "QC_" + args.genome_assembly)
		ngstk.make_dir(QC_folder)

		Tss_enrich =  os.path.join(QC_folder,  args.sample_name + ".TssEnrichment")
		cmd = os.path.join(tools.scripts_dir, "pyTssEnrichment.py")
		cmd += " -a " + rmdup_bam + " -b " + res.TSS_file + " -p ends -e 2000 -u -v -s 4 -o " + Tss_enrich
		pm.run(cmd, Tss_enrich, nofail=True)
		
		#Call Rscript to plot TSS Enrichment
		Tss_plot = os.path.join(QC_folder ,  args.sample_name + ".TssEnrichment.pdf")
		cmd = "Rscript " + os.path.join(tools.scripts_dir, "ATAC_Rscript_TSSenrichmentPlot_pyPiper.R")
		cmd += " " + Tss_enrich + " pdf"
		pm.run(cmd, Tss_plot, nofail=True)

		# Always plot strand specific TSS enrichment. 
		# added by Ryan 2/10/17 to calculate TSS score as numeric and to include in summary stats
		# This could be done in prettier ways which I'm open to. Just adding for the idea
		with open(Tss_enrich) as f:
			floats = map(float,f)
		Tss_score = (sum(floats[1950:2050])/100)/(sum(floats[1:200])/200)
		pm.report_result("TSS_Score", Tss_score)
		
		# fragment  distribution
		fragL= os.path.join(QC_folder ,  args.sample_name +  ".fragLen.txt")
		cmd = os.path.join("perl " + tools.scripts_dir, "fragment_length_dist.pl " + rmdup_bam + " " +  fragL)
		fragL_count= os.path.join(QC_folder ,  args.sample_name +  ".frag_count.txt")
		cmd1 = "sort -n  " + fragL + " | uniq -c  > " + fragL_count
		fragL_dis1= os.path.join(QC_folder, args.sample_name +  ".fragL.distribution.pdf")
		fragL_dis2= os.path.join(QC_folder, args.sample_name +  ".fragL.distribution.txt")
		cmd2 = "Rscript " +  os.path.join(tools.scripts_dir, "fragment_length_dist.R") + " " + fragL + " " + fragL_count + " " + fragL_dis1 + " "  + fragL_dis2 

		pm.run([cmd,cmd1,cmd2], fragL_dis1, nofail=True)

	# Peak calling
	peak_folder = os.path.join(param.outfolder, "peak_calling_" + args.genome_assembly)
	ngstk.make_dir(peak_folder)
	peak_output_file = os.path.join(peak_folder,  args.sample_name + "_peaks.narrowPeak")
	peak_input_file = shift_bed

	if args.peak_caller == "fseq":
		fseq_cmd_chunks = [tools.fseq, ("-o", peak_folder)]

		# Parse only a subset of fseq options.
		for fseq_opt in ["of", "l", "t", "s"]:
			fseq_value = param.fseq[fseq_opt]
			# TODO: use more natural try/except once PipelineManager parameters AD is strict.
			if fseq_value == fseq_opt:
				# Non-strict pipeline parameters AttributeDict returns key itself if missing.
				continue
			# We're building a command, so even non-text values need no special handling.
			fseq_optval = ("-{}".format(fseq_opt), fseq_value)
			fseq_cmd_chunks.append(fseq_optval)

		# Create the peak calling command
		fseq_cmd = build_command(fseq_cmd_chunks)

		# Create the file merge/delete commands.
		chrom_peak_files = os.path.join(peak_folder, "*.npf")
		merge_chrom_peaks_files = "cat {peakfiles} > {combined_peak_file}".format(
			peakfiles=chrom_peak_files, combined_peak_file=peak_output_file)
		delete_chrom_peaks_files = "rm {}".format(chrom_peak_files)

		# Pypiper serially exectutes the commands.
		cmd = [fseq_cmd, merge_chrom_peaks_files, delete_chrom_peaks_files]
		pm.run(cmd, peak_output_file, nofail=True)
		if not os.path.exists(peak_output_file):
			pm.fail_pipeline(Exception(
				"Failed to create peaks file with fseq; if the log file "
				"indicates an ArrayIndexOutOfBoundsException, this is likely "
				"due to a low read count and can probably be overcome be "
				"specifying fragment size with the fseq -f option."))

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
		pm.run(cmd, peak_output_file)

	def report_peak_count():
		num_peaksfile_lines = int(ngstk.count_lines(peak_output_file).strip())
		num_peaks = max(0, num_peaksfile_lines - 1)
		pm.report_result("Peak_count", num_peaks)

	# Call peaks and report peak count.
	pm.run(cmd, peak_output_file, follow=report_peak_count)

	# Filter peaks in blacklist.
	if os.path.exists(res.blacklist):
		filter_peak = os.path.join(peak_folder,  args.sample_name + "_peaks.narrowPeak.rmBlacklist")
		cmd = tools.bedtools  + " intersect " + " -a " + peak_output_file + " -b " + res.blacklist + " -v  >"  +  filter_peak

		pm.run(cmd, filter_peak)

	pm.timestamp("### # Calculate fraction of reads in peaks (FRIP)")

	cmd = ngstk.simple_frip(rmdup_bam, peak_output_file)
	rip = pm.checkprint(cmd)
	ar = pm.get_stat("Aligned_reads")
	print(ar, rip)
	pm.report_result("FRIP", float(rip) / float(ar))

	if args.frip_ref_peaks and os.path.exists(args.frip_ref_peaks):
		# Use an external reference set of peaks instead of the peaks called from this run
		cmd = ngstk.simple_frip(rmdup_bam, args.frip_ref_peaks)
		rip = pm.checkprint(cmd)
		ar = pm.get_stat("Aligned_reads")
		print(ar, rip)
		pm.report_result("FRIP_ref", float(rip) / float(ar))

	pm.stop_pipeline()



if __name__ == '__main__':
	try:
		sys.exit(main())
	except KeyboardInterrupt:
		print("Program canceled by user!")
		sys.exit(1)
