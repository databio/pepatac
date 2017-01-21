#!/usr/bin/env python
"""
ATACseq  pipeline
"""
__author__=["Jin Xu", "Nathan Sheffield"]
__email__="xujin937@gmail.com"

from argparse import ArgumentParser
import os,re
import sys
import os.path
import subprocess
import pypiper
import yaml 
from datetime import datetime

# Argument Parsing from yaml file 
# #######################################################################################
parser = ArgumentParser(description='Pipeline')
parser = pypiper.add_pypiper_args(parser, all_args = True)
#parser = pypiper.add_pypiper_args(parser, groups = ['all'])  # future version

#Add any pipeline-specific arguments
parser.add_argument('-gs', '--genome-size', default="hs", dest='genomeS',type=str, help='genome size for MACS2')
args = parser.parse_args()

 # it always paired seqencung for ATACseq
if args.single_or_paired == "paired":
	args.paired_end = True
else:
	args.paired_end = False

# Initialize
outfolder = os.path.abspath(os.path.join(args.output_parent, args.sample_name))
pm = pypiper.PipelineManager(name = "ATACseq", outfolder = outfolder, args = args)
ngstk = pypiper.NGSTk(pm=pm)

# Do some cores math for split processes
# 50/50 split
pm.cores1of2a = int(pm.cores) / 2 + int(pm.cores) % 2
pm.cores1of2 = int(pm.cores) / 2

# 75/25 split
pm.cores1of4 = int(pm.cores) / 4
pm.cores3of4 = int(pm.cores) - int(pm.cores1of4)

pm.cores1of8 = int(pm.cores) / 8
pm.cores7of8 = int(pm.cores) - int(pm.cores1of8)


# Convenience alias 
tools = pm.config.tools
param = pm.config.parameters
res = pm.config.resources

def get_bowtie2_index(genomes_folder, genome_assembly):
	"""
	Convenience function
	Retuns the bowtie2 index prefix (to be passed to bowtie2) for a genome assembly that follows
	the folder structure produced by the RefGenie reference builder.
	"""
	return(os.path.join(genomes_folder, genome_assembly, "indexed_bowtie2", genome_assembly))


def count_alignment(assembly_identifier, aligned_bam, paired_end = args.paired_end):
	""" 
	This function counts the aligned reads and alignment rate and reports statistics. You
	must have previously reported a "Trimmed_reads" result to get alignment rates. It is useful
	as a follow function after any alignment step to quantify and report the number of reads
	aligning, and the alignment rate to that reference.
	:param:	aligned_bam	String pointing to the aligned bam file.
	:param: assembly_identifier	String identifying the reference to which you aligned (can be anything)
	"""
	ar = ngstk.count_mapped_reads(aligned_bam, paired_end)
	pm.report_result("Aligned_reads_" + assembly_identifier, ar)
	try:
		# wrapped in try block in case Trimmed_reads is not reported in this pipeline.
		tr = float(pm.get_stat("Trimmed_reads"))
		pm.report_result("Alignment_rate_" + assembly_identifier, round(float(ar) *
 100 / float(tr), 2))
	except:

		pass



# Set up reference resource according to genome prefix.
gfolder = os.path.join(res.genomes, args.genome_assembly)
res.chrom_sizes = os.path.join(gfolder, args.genome_assembly + ".chromSizes")
res.TSS_file = os.path.join(gfolder, args.genome_assembly + ".refseq.TSS.txt")
res.blacklist = os.path.join(gfolder, args.genome_assembly + ".blacklist.bed")

# Bowtie2 indexes for various assemblies
res.bt2_chrM = get_bowtie2_index(res.genomes, args.genome_assembly + "_chrM2x")
res.bt2_alu = get_bowtie2_index(res.genomes, args.genome_assembly + "_alu")
res.bt2_repbase = get_bowtie2_index(res.genomes, args.genome_assembly + "_repbase")
res.bt2_rDNA = get_bowtie2_index(res.genomes, args.genome_assembly + "_rDNA")
res.bt2_alphasat = get_bowtie2_index(res.genomes, args.genome_assembly + "_alphasat")
res.bt2_genome = get_bowtie2_index(res.genomes, args.genome_assembly)

# Set up a link to relative scripts included in the repo
tools.scripts_dir = os.path.join(os.path.dirname(os.path.dirname(os.path.realpath(__file__))), "tools")

# Adapter file can be set in the config; but if left null, we use a default.
if not res.adapter:
	res.adapter = os.path.join(tools.scripts_dir, "NexteraPE-PE.fa")


output = outfolder
param.outfolder = outfolder

################################################################################
print("Local input file: " + args.input[0]) 
print("Local input file: " + args.input2[0]) 

pm.report_result("File_mb", ngstk.get_file_size([args.input, args.input2]))
pm.report_result("Read_type", args.single_or_paired)
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

# Adapter trimming
pm.timestamp("### Adapter trimming: ")

trimming_prefix = os.path.join(fastq_folder, args.sample_name)
trimmed_fastq = trimming_prefix + "_R1_trimmed.fq"
trimmed_fastq_R2 = trimming_prefix + "_R2_trimmed.fq"
cmd = tools.java +" -Xmx" + str(pm.mem) +" -jar " + tools.trimmo + " PE " + " -threads " + str(pm.cores) + " "
cmd += local_input_files[0] + " "
cmd += local_input_files[1] + " " 
cmd += trimmed_fastq + " "
cmd += trimming_prefix + "_R1_unpaired.fq "
cmd += trimmed_fastq_R2 + " "
cmd += trimming_prefix + "_R2_unpaired.fq "
#cmd +=  "ILLUMINACLIP:"+ paths.adapter + ":2:30:10:LEADING:3TRAILING:3SLIDINGWINDOW:4:15MINLEN:36" 
cmd +=  "ILLUMINACLIP:"+ res.adapter + ":2:30:10" 
#def check_trim():
        #n_trim = float(myngstk.count_reads(trimmed_fastq, args.paired_end))
#        rr = float(pm.get_stat("Raw_reads"))
#        pm.report_result("Trimmed_reads", n_trim)
#        pm.report_result("Trim_loss_rate", round((rr - n_trim) * 100 / rr, 2))
pm.run(cmd, trimmed_fastq,
	follow = ngstk.check_trim(trimmed_fastq, trimmed_fastq_R2, args.paired_end,
		fastqc_folder = os.path.join(param.outfolder, "fastqc/")))

pm.clean_add(os.path.join(fastq_folder, "*.fq"), conditional=True)
pm.clean_add(os.path.join(fastq_folder, "*.log"), conditional = True)
# End of Adapter trimming 

# Mapping to chrM first 
pm.timestamp("### Map to chrM")
#if os.path.exists(os.path.dirname(res.bt2_chrM)):

map_chrM_folder = os.path.join(param.outfolder, "aligned_" + args.genome_assembly + "_chrM")
ngstk.make_dir(map_chrM_folder)


def check_alignment_chrM():
	ar = ngstk.count_mapped_reads(mapping_chrM_bam, args.paired_end)
	pm.report_result("Aligned_reads_chrM", ar)
	tr = float(pm.get_stat("Trimmed_reads"))
	pm.report_result("Alignment_rate_chrM", round(float(ar) *
 100 / float(tr), 2))
	#rr = float(pm.get_stat("Raw_reads"))
	#pm.report_result("Total_efficiency", round(float(ar) * 100 / float(rr), 2))

mapping_chrM_bam = os.path.join(map_chrM_folder, args.sample_name + "_chrM.bam")
# combine all in one
cmd = tools.bowtie2 + " -p " + str(pm.cores)
cmd += " -k 1"  # Return only 1 alignment on the mitochondria. Deals with 2x circular fix.
cmd += " -x " +  res.bt2_chrM
cmd += " -D 20 -R 3 -N 1 -L 20 -i S,1,0.50"
cmd += " -X 2000"
cmd += " -1 " + trimmed_fastq  + " -2 " + trimmed_fastq_R2
cmd += " | samtools view -bS - -@ 0"
cmd += " > " + mapping_chrM_bam
pm.run(cmd, mapping_chrM_bam, follow = check_alignment_chrM)

# filter genome reads that are not mapped to chrM 
unmapchrM_bam = os.path.join(map_chrM_folder, args.sample_name + ".unmap.chrM.bam")
cmd = tools.samtools + " view -@ " + str(pm.cores) + " -b -f 12 " +  mapping_chrM_bam + " > " + unmapchrM_bam
# -F 2 filters "read mapped in proper pair"
# -f 4 filters "read unmapped" -- problem with this is that it includes mates of reads that mapped.
# -f 12 filters "read unmapped and mate unmapped" -- this will exclude reads whose mates mapped.

# Now convert the unaligned reads into fastq format for the next alignment step
unmap_fq1 = os.path.join(map_chrM_folder, args.sample_name + ".unmapchrM_R1.fastq")
unmap_fq2 = os.path.join(map_chrM_folder, args.sample_name + ".unmapchrM_R2.fastq")
cmd2 = tools.bedtools + " bamtofastq  -i " + unmapchrM_bam + " -fq " + unmap_fq1 + " -fq2 "  + unmap_fq2
pm.run([cmd,cmd2], unmap_fq2)


def align(unmap_fq1, unmap_fq2, assembly_identifier, assembly_bt2, cmd = None):
	"""
	A helper function to run alignments in series, so you can run one alignment followed
	by another; this is useful for successive decoy alignments.
	"""
	if os.path.exists(os.path.dirname(assembly_bt2)):
		pm.timestamp("### Map to " + assembly_identifier)
		
		sub_outdir = os.path.join(param.outfolder, "aligned_" + args.genome_assembly + "_" + assembly_identifier)
		ngstk.make_dir(sub_outdir)
		mapped_bam = os.path.join(sub_outdir, args.sample_name + "_" + assembly_identifier + ".bam")
		
		if not cmd: 
			cmd = tools.bowtie2 + " -p " + str(pm.cores)
			cmd += " -k 1"  # Return only 1 alignment
			cmd += " -x " + assembly_bt2
			cmd += " -D 20 -R 3 -N 1 -L 20 -i S,1,0.50"
			cmd += " -X 2000"
			cmd += " -1 " + unmap_fq1  + " -2 " + unmap_fq2
			cmd += " | " + tools.samtools + " view -bS - -@ 1"  # convert to bam
			cmd += " | " + tools.samtools + " sort - -@ 1" + " -o " + mapped_bam  # sort output
			cmd += " > " + mapped_bam

		pm.run(cmd, mapped_bam, follow = lambda: count_alignment(assembly_identifier, mapped_bam))

		# filter genome reads not mapped 
		unmapped_bam = os.path.join(sub_outdir, args.sample_name + "_unmap_" + assembly_identifier + ".bam")
		cmd = tools.samtools + " view -b -@ " + str(pm.cores) + " -f 12  "
		cmd +=  mapped_bam + " > " + unmapped_bam

		out_fastq_pre = os.path.join(sub_outdir, args.sample_name + "_unmap_" + assembly_identifier)
		cmd2, unmap_fq1, unmap_fq2 = ngstk.bam_to_fastq_awk(unmapped_bam, out_fastq_pre, args.paired_end)
		pm.run([cmd,cmd2],unmap_fq2)
		return unmap_fq1, unmap_fq2
	else:
		print("No " + assembly_identifier + " index found at " + os.path.dirname(assembly_bt2))
		return unmap_fq1, unmap_fq2

# Map to alu
unmap_fq1, unmap_fq2 = align(unmap_fq1, unmap_fq2, "alu", res.bt2_alu)

# Map to rDNA
if os.path.exists(os.path.dirname(res.bt2_rDNA)):
	pm.timestamp("### Map to rDNA")

	map_rDNA_folder = os.path.join(param.outfolder, "aligned_" + args.genome_assembly + "_rDNA")
	ngstk.make_dir(map_rDNA_folder)
	mapping_rDNA_sam = os.path.join(map_rDNA_folder, args.sample_name + "_rDNA.sam")
	mapping_rDNA_bam = os.path.join(map_rDNA_folder, args.sample_name + "_rDNA.bam")

	cmd = tools.bowtie2 + " -p " + str(pm.cores) #+ str(param.bowtie2.p)
	cmd += " --very-sensitive " + " -x " +  res.bt2_rDNA
	cmd += " -X 2000"
	cmd += " -1 " + unmap_fq1  + " -2 " + unmap_fq2# + " -S " + mapping_rDNA_sam
	cmd += " | " + tools.samtools + " view -bS - -@ 1" # convert to bam
	cmd += " | " + tools.samtools + " sort - -@ 1" + " -o " + mapping_rDNA_bam
	pm.run(cmd, mapping_rDNA_bam, follow = lambda: count_alignment("rDNA", mapping_rDNA_bam))

	# filter genome reads not mapped to rDNA 
	unmap_bam = os.path.join(map_rDNA_folder, args.sample_name + "_unmap_rDNA.bam")
	cmd = tools.samtools + " view -b -@ " + str(pm.cores) + " -f 12  "
	cmd +=  mapping_rDNA_bam + " > " + unmap_bam

	unmap_fq1 = os.path.join(map_rDNA_folder, args.sample_name + "_unmap_rDNA_R1.fastq")
	unmap_fq2 = os.path.join(map_rDNA_folder, args.sample_name + "_unmap_rDNA_R2.fastq")
	cmd2 = tools.bedtools + " bamtofastq  -i " + unmap_bam + " -fq " + unmap_fq1 + " -fq2 "  + unmap_fq2
	pm.run([cmd,cmd2],unmap_fq2)
else:
	print("Skipping: No rDNA index found at " + os.path.dirname(res.bt2_rDNA))

unmap_fq1, unmap_fq2 = align(unmap_fq1, unmap_fq2, "alphasat", res.bt2_alphasat)
unmap_fq1, unmap_fq2 = align(unmap_fq1, unmap_fq2, "repbase", res.bt2_repbase)


# Mapping to genome 
pm.timestamp("### Map to genome")

map_genome_folder = os.path.join(param.outfolder, "aligned_" + args.genome_assembly)
ngstk.make_dir(map_genome_folder)

mapping_genome_bam = os.path.join(map_genome_folder, args.sample_name + "pe.q10.sort.bam")
mapping_genome_bam_temp = os.path.join(map_genome_folder, args.sample_name + ".temp.bam")
unmap_genome_bam = os.path.join(map_genome_folder, args.sample_name + "_unmap.bam")
cmd = tools.bowtie2 + " -p " + str(pm.cores)
cmd += " --very-sensitive " + " -x " +  res.bt2_genome
cmd += " -1 " + unmap_fq1  + " -2 " + unmap_fq2
cmd += " -X 2000"
cmd += " | " + tools.samtools + " view -bS - -@ 1 "
#cmd += " -f 2 -q 10"  # quality and pairing filter
cmd += " | " + tools.samtools + " sort - -@ 1" + " -o " + mapping_genome_bam_temp

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

# End of mapping to genome 
 
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

pm.run([cmd3,cmd4], rmdup_bam)

# shift bam file and make bigwig file
shift_bed = os.path.join(map_genome_folder ,  args.sample_name + ".pe.q10.sort.rmdup.bed")
cmd = os.path.join(tools.scripts_dir, "bam2bed_shift.pl " +  rmdup_bam)
pm.run(cmd,shift_bed)
bedGraph = os.path.join( map_genome_folder , args.sample_name + ".pe.q10.sort.rmdup.bedGraph") 
cmd = tools.bedtools + " genomecov -bg -split"
cmd += " -i " + shift_bed + " -g " + res.chrom_sizes + " > " + bedGraph
norm_bedGraph = os.path.join(map_genome_folder , args.sample_name + ".pe.q10.sort.rmdup.norm.bedGraph")
sort_bedGraph = os.path.join(map_genome_folder , args.sample_name + ".pe.q10.sort.rmdup.norm.sort.bedGraph")
cmd2 = os.path.join(tools.scripts_dir, "norm_bedGraph.pl "  + bedGraph + " " + norm_bedGraph)
bw =  os.path.join(map_genome_folder , args.sample_name + ".pe.q10.rmdup.norm.bw")

# bedGraphToBigWig requires lexographical sort, which puts chr10 before chr2, for example
cmd3 = "LC_COLLATE=C sort -k1,1 -k2,2n " + norm_bedGraph + " > " + sort_bedGraph
cmd4 = tools.bedGraphToBigWig + " " + sort_bedGraph + " " + res.chrom_sizes + " " + bw
pm.run([cmd, cmd2, cmd3, cmd4], bw)


# Exact cuts are more precise.


# TSS enrichment 

if os.path.exists(res.TSS_file):

	QC_folder = os.path.join(param.outfolder, "QC_" + args.genome_assembly)
	ngstk.make_dir(QC_folder)

	Tss_enrich =  os.path.join(QC_folder ,  args.sample_name + ".TssEnrichment") 
	cmd = os.path.join(tools.scripts_dir, "pyMakeVplot.py")
	cmd += " -a " + rmdup_bam + " -b " + res.TSS_file + " -p ends -e 2000 -u -v -o " + Tss_enrich
	pm.run(cmd, Tss_enrich)
	#python /seq/ATAC-seq/Code/pyMakeVplot.py -a $outdir_map/$output.pe.q10.sort.rmdup.bam -b /seq/chromosome/hg19/hg19_refseq_genes_TSS.txt -p ends -e 2000 -u -v -o $outdir_qc/$output.TSSenrich

	# fragment  distribution
	fragL= os.path.join(QC_folder ,  args.sample_name +  ".fragLen.txt")
	cmd = os.path.join("perl " + tools.scripts_dir, "fragment_length_dist.pl " + rmdup_bam + " " +  fragL)
	fragL_count= os.path.join(QC_folder ,  args.sample_name +  ".frag_count.txt")
	cmd1 = "sort -n  " + fragL + " | uniq -c  > " + fragL_count
	fragL_dis1= os.path.join(QC_folder ,  args.sample_name +  ".fragL.distribution.pdf")
	fragL_dis2= os.path.join(QC_folder ,  args.sample_name +  ".fragL.distribution.txt")
	cmd2 = "Rscript " +  tools.scripts_dir + "fragment_length_dist.R " +  fragL + " " + fragL_count + " " + fragL_dis1 + " "  + fragL_dis2 

	pm.run([cmd,cmd1,cmd2], fragL_dis1)

else:
	# If the TSS annotation is missing, print a message
	print("TSS enrichment calculation requires a TSS annotation file here:" + res.TSS_file)

#perl /seq/ATAC-seq/Code/fragment_length_dist.pl $outdir_map/$output.pe.q10.sort.rmdup.bam $outdir_qc/$output.fragL.txt
#sort -n $outdir_qc/$output.fragL.txt | uniq -c > $outdir_qc/$output.frag.sort.txt
#Rscript /seq/ATAC-seq/Code/fragment_length_dist.R $outdir_qc/$output.fragL.txt $outdir_qc/$output.frag.sort.txt $outdir_qc/$output.fragment_length_distribution.pdf $outdir_qc/$output.fragment_length_distribution.txt

# peak calling 
peak_folder = os.path.join(param.outfolder, "peak_calling_" + args.genome_assembly )
ngstk.make_dir(peak_folder)

peak_file= os.path.join(peak_folder ,  args.sample_name + "_peaks.narrowPeak")
cmd = tools.macs2 + " callpeak "
cmd += " -t  " + shift_bed 
cmd += " -f BED " 
cmd += " -g "  +  str(args.genomeS)
cmd +=  " --outdir " + peak_folder +  " -n " + args.sample_name 
cmd += "  -q " + str(param.macs2.q)
cmd +=  " --shift " + str(param.macs2.shift) + " --nomodel "  
pm.run(cmd, peak_file)


# filter peaks in blacklist 
if os.path.exists(res.blacklist):
	filter_peak = os.path.join(peak_folder ,  args.sample_name + "_peaks.narrowPeak.rmBlacklist")
	cmd = tools.bedtools  + " intersect " + " -a " + peak_file + " -b " + res.blacklist + " -v  >"  +  filter_peak

	pm.run(cmd,filter_peak)
#bedtools intersect -a $outdir_peak/$peakFile -b /seq/ATAC-seq/Data/JDB_blacklist.bed -v > $outdir_peak/$output$filename.filterBL.bed

#macs2  callpeak -t  $outdir_map/$output.pe.q10.sort.rmdup.bed -f BED  -g $gsize --outdir $outdir_peak  -q 0.01 -n $outdir_peak/$output --nomodel  --shift # 0  
# remove blacklist
#Need to do



# Calculate fraction of reads in peaks (FRIP)
cmd = ngstk.simple_frip(rmdup_bam, peak_file)
rip = pm.checkprint(cmd)
ar = pm.get_stat("Aligned_reads")
print(ar, rip)
pm.report_result("FRIP", float(rip) / float(ar))





pm.stop_pipeline()



# Old way to do mapping and bam conversion in two steps.
# mapping_chrM_sam = os.path.join(map_chrM_folder, args.sample_name + ".chrM.sam")
# cmd = tools.bowtie2 + " -p " + str(pm.cores)
# cmd += " -k 1"  # Return only 1 alignment on the mitochondria. Deals with 2x circular fix.
# cmd += " --very-sensitive " + " -x " +  res.bt2_chrM
# cmd += " -1 " + trimmed_fastq  + " -2 " + trimmed_fastq_R2 + " -S " + mapping_chrM_sam
# pm.run(cmd, mapping_chrM_sam, follow = check_alignment_chrM)
# # convert to bam
# mapping_chrM_bam = os.path.join(map_chrM_folder, args.sample_name + ".chrM.bam")
# cmd = tools.samtools + " view -Sb -@ " + str(pm.cores)
# cmd += " " + mapping_chrM_sam + " > " + mapping_chrM_bam
# pm.run(cmd, mapping_chrM_bam)

# # clean up sam files
# pm.clean_add(mapping_chrM_sam)

# mapping_genome_sam = os.path.join(map_genome_folder, args.sample_name + ".genome.sam")
# cmd = tools.bowtie2 + " -p " + str(pm.cores) # + str(param.bowtie2.p)
# cmd += " --very-sensitive " + " -x " +  res.ref_pref
# cmd += " -1 " + unmap_fq1  + " -2 " + unmap_fq2 + " -S " + mapping_genome_sam
# pm.run(cmd, mapping_genome_sam, follow = check_alignment_genome)
# # convert to bam
# mapping_genome_bam = os.path.join(map_genome_folder, args.sample_name + ".genome.bam")
# # Filter only properly paired
# cmd = tools.samtools + " view -Sb -@ " + str(pm.cores) + " -f 2 -q 10 " + mapping_genome_sam 
# cmd += " | " + tools.samtools + " sort - -@ " + str(pm.cores) + " -o " + mapping_genome_bam  
# pm.run(cmd, mapping_genome_bam)#	Need to added
# # clean up sam files
# pm.clean_add(mapping_genome_sam)
