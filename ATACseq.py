#!/usr/bin/env python
"""
ATACseq  pipeline
"""
__author__="Jin Xu"
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
parser = pypiper.add_pypiper_args(parser, all_args=True)

#Add any pipeline-specific arguments
parser.add_argument('-gs', '--genome-size', default="hs", dest='genomeS',type=str, help='genome size for Macs2')
args = parser.parse_args()

 # it always paired seqencung for ATACseq
if args.single_or_paired == "paired":
	args.paired_end = True
else:
	args.paired_end = False

# Initialize
pm = pypiper.PipelineManager(name = "ATACseq", outfolder = os.path.abspath(os.path.join(args.output_parent, args.sample_name)), args = args)
# Convenience alias 
tools = pm.config.tools
param = pm.config.parameters
res = pm.config.resources

# Set up reference resouce according to genome prefix.
res.ref_genome_fasta = os.path.join(pm.config.resources.ref_pref + ".fa")
res.chrom_sizes = os.path.join(pm.config.resources.ref_pref + ".chrsize")
res.refGeene_TSS = os.path.join(pm.config.resources.ref_pref + ".refseq.TSS.txt")
res.blacklist = os.path.join(pm.config.resources.ref_pref + ".blaklist.bed")

output = os.path.join(args.output_parent, args.sample_name + "/")


################################################################################
print("Local input file: " + args.input[0]) 
print("Local input file: " + args.input2[0]) 
#ATACseq pipeline

# Adaptor trimming
pm.timestamp("### Adapter trimming: ")

trimmed_fastq= output + args.sample_name + "_R1_trimmed.fq"
trimmed_fastq_R2= output + args.sample_name + "_R2_trimmed.fq"
cmd = tools.java +" -Xmx" + str(pm.mem) +" -jar " + tools.trimmo + " PE " + " -threads " + str(pm.cores) + " "
cmd += args.input[0] + " "
cmd += args.input2[0] + " " 
cmd += trimmed_fastq + " "
cmd += output + args.sample_name + "_R1_unpaired.fq "
cmd += trimmed_fastq_R2 + " "
cmd += output +args.sample_name + "_R2_unpaired.fq "
#cmd +=  "ILLUMINACLIP:"+ paths.adaptor + ":2:30:10:LEADING:3TRAILING:3SLIDINGWINDOW:4:15MINLEN:36" 
cmd +=  "ILLUMINACLIP:"+ res.adaptor + ":2:30:10" 
#def check_trim():
        #n_trim = float(myngstk.count_reads(trimmed_fastq, args.paired_end))
#        rr = float(pm.get_stat("Raw_reads"))
#        pm.report_result("Trimmed_reads", n_trim)
#        pm.report_result("Trim_loss_rate", round((rr - n_trim) * 100 / rr, 2))
pm.run(cmd, trimmed_fastq)
# End of Adaptor trimming 
# Mapping 
mapping_sam= output + args.sample_name + ".sam"
cmd = tools.bowtie2 + " -p "  + str(param.bowtie2.p)
cmd+= " --very-sensitive " + " -x " +  res.ref_pref 
cmd+= " -1 " + trimmed_fastq  + " -2 " + trimmed_fastq_R2 + " -S " + mapping_sam
print(cmd)
pm.run(cmd,mapping_sam)
mapping_bam= output + args.sample_name + ".bam"
cmd= tools.samtools + " view -Sb " + mapping_sam +  "> " + mapping_bam  

pm.run(cmd,mapping_bam)
# filter genome reads 
filter_bam= output + args.sample_name + ".pe.q10.sort.bam"
cmd = "awk '$3!=\"chrM\"' "  + mapping_sam  + " | " + tools.samtools + " view -S -b -f 0x2 -q " 
cmd += str(param.samtools.q) + "- | " + tools.samtools + " sort - -o " + filter_bam 
chrM_bam = output + args.sample_name + ".chrM.bam"
cmd2 = "awk '$3==\"chrM\" || NF<10 ' " + mapping_sam + " | " + tools.samtools + " view -S -b - >" + chrM_bam
 
rmdup_bam =  output + args.sample_name + ".pe.q10.sort.rmdup.bam"
Metrics_file = output+args.sample_name + "picard_metrics_bam.txt"
picard_log = output+args.sample_name + "picard_metrics_log.txt"
cmd3 =  tools.java + " -Xmx4G " +  " -jar " + tools.MarkDuplicates  + " INPUT=" + filter_bam + " OUTPUT=" + rmdup_bam + " METRICS_FILE=" + Metrics_file + " VALIDATION_STRINGENCY=LENIENT"
cmd3 += " ASSUME_SORTED=true REMOVE_DUPLICATES=true > " +  picard_log
cmd4 = tools.samtools + " index " + rmdup_bam 

pm.run([cmd,cmd2,cmd3,cmd4],rmdup_bam)

# remove sam file 
cmd = "rm " + mapping_sam
pm.run(cmd,mapping_bam)

# shift bam file and make  bigwig file
shift_bed = output +  args.sample_name + ".pe.q10.sort.rmdup.bed"
cmd = tools.bam2bed_shift + " " +  rmdup_bam 
pm.run(cmd,shift_bed)
bedGraph = output + args.sample_name + ".pe.q10.sort.rmdup.bedGraph" 
cmd = tools.bedtools + " genomecov " + " -bg "  + " -split " + " -i " + shift_bed + " -g " + res.chrom_sizes + " > " + bedGraph  
norm_bedGraph = output + args.sample_name + ".pe.q10.sort.rmdup.bedGraph.norm"
cmd2 = tools.norm_bedGraph +  " "  + bedGraph + " " + norm_bedGraph
bw=  output + args.sample_name + ".pe.q10.rmdup.norm.bw"
cmd3 = tools.bed2bigwig + " " + norm_bedGraph + " " + res.chrom_sizes + " " + bw 
pm.run([cmd,cmd2,cmd3],bw)


# TSS enrichment 
Tss_enrich =  output +  args.sample_name + ".TssEnrichment" 
cmd = tools.pyMakeVplot + " -a " + rmdup_bam + " -b " + res.refGeene_TSS + " -p ends -e 2000 -u -v -o " + Tss_enrich
pm.run(cmd,Tss_enrich)
#python /seq/ATAC-seq/Code/pyMakeVplot.py -a $outdir_map/$output.pe.q10.sort.rmdup.bam -b /seq/chromosome/hg19/hg19_refseq_genes_TSS.txt -p ends -e 2000 -u -v -o $outdir_qc/$output.TSSenrich

# fragment  distribution
fragL= output +  args.sample_name +  ".fragLen.txt"
cmd = "perl " + tools.fragment_length_dist_pl + " " + rmdup_bam + " " +  fragL
fragL_count= output +  args.sample_name +  ".frag_count.txt"
cmd1 = "sort -n  " + fragL + " | uniq -c  > " + fragL_count
fragL_dis1= output +  args.sample_name +  ".fragL.distribution.pdf"
fragL_dis2= output +  args.sample_name +  ".fragL.distribution.txt"
cmd2 = "Rscript " +  tools.fragment_length_dist_R + " " +  fragL + " " + fragL_count + " " + fragL_dis1 + " "  + fragL_dis2 

pm.run([cmd,cmd1,cmd2],fragL_dis1)


#perl /seq/ATAC-seq/Code/fragment_length_dist.pl $outdir_map/$output.pe.q10.sort.rmdup.bam $outdir_qc/$output.fragL.txt
#sort -n $outdir_qc/$output.fragL.txt | uniq -c > $outdir_qc/$output.frag.sort.txt
#Rscript /seq/ATAC-seq/Code/fragment_length_dist.R $outdir_qc/$output.fragL.txt $outdir_qc/$output.frag.sort.txt $outdir_qc/$output.fragment_length_distribution.pdf $outdir_qc/$output.fragment_length_distribution.txt

# peak calling 
peak_file= output +  args.sample_name + "_peaks.narrowPeak"
cmd = tools.macs2 + " callpeak "
cmd += " -t  " + shift_bed 
cmd += " -f BED " 
cmd += " -g "  +  str(args.genomeS)
cmd +=  " --outdir " + output +  " -n " + args.sample_name 
cmd += "  -q " + str(param.macs2.q)
cmd +=  " --shift " + str(param.macs2.shift) + " --nomodel "  
pm.run(cmd, peak_file)


# filter peaks in blacklist 
filter_peak=  output +  args.sample_name + "_peaks.narrowPeak.rmBlacklist"
cmd = tools.bedtools  + " intersect " + " -a " + peak_file + " -b " + res.blacklist + " -v  >"  +  filter_peak

pm.run(cmd,filter_peak)
#bedtools intersect -a $outdir_peak/$peakFile -b /seq/ATAC-seq/Data/JDB_blacklist.bed -v > $outdir_peak/$output$filename.filterBL.bed

#macs2  callpeak -t  $outdir_map/$output.pe.q10.sort.rmdup.bed -f BED  -g $gsize --outdir $outdir_peak  -q 0.01 -n $outdir_peak/$output --nomodel  --shift # 0  
# remove blacklist
#Need to do

pm.stop_pipeline()
