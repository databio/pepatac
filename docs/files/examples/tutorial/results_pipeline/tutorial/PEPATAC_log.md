### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --sample-name tutorial --genome hg38 --input /project/shefflab/data//pepatac/tutorial_r1.fastq.gz --single-or-paired PAIRED -O /home/jps3dp/tutorial/results_pipeline -P 8 -M 12000 --input2 /project/shefflab/data//pepatac/tutorial_r2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --blacklist /nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz --peak-type fixed --extend 250 --frip-ref-peaks None -P 8 -M 8000`
*         Compute host:  udc-ba35-36
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /home/jps3dp/tutorial/results_pipeline/tutorial/
*  Pipeline started at:   (05-26 11:06:29) elapsed: 1.0 _TIME_

### Version log:

*       Python version:  3.6.6
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python3.6/site-packages/pypiper`
*      Pypiper version:  0.12.1
*         Pipeline dir:  `/sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.8.10-dev
*        Pipeline hash:  cbb01a4f15c4bb06ca2c6ba88a2907021c13bb5d
*      Pipeline branch:  * cfg2
*        Pipeline date:  2020-05-26 10:14:13 -0400
*        Pipeline diff:  1 file changed, 12 insertions(+), 8 deletions(-)

### Arguments passed to pipeline:

*           `TSS_name`:  `None`
*          `anno_name`:  `None`
*          `blacklist`:  `/nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz`
*        `config_file`:  `pepatac.yaml`
*              `cores`:  `8`
*       `deduplicator`:  `samblaster`
*              `dirty`:  `False`
*             `extend`:  `250`
*       `force_follow`:  `False`
*     `frip_ref_peaks`:  `None`
*    `genome_assembly`:  `hg38`
*        `genome_size`:  `hs`
*              `input`:  `['/project/shefflab/data//pepatac/tutorial_r1.fastq.gz']`
*             `input2`:  `['/project/shefflab/data//pepatac/tutorial_r2.fastq.gz']`
*               `keep`:  `False`
*               `lite`:  `False`
*             `logdev`:  `False`
*                `mem`:  `8000`
*              `motif`:  `False`
*          `new_start`:  `False`
*            `no_fifo`:  `False`
*           `no_scale`:  `False`
*      `output_parent`:  `/home/jps3dp/tutorial/results_pipeline`
*         `paired_end`:  `True`
*        `peak_caller`:  `macs2`
*          `peak_type`:  `fixed`
*      `prealignments`:  `['rCRSd', 'human_repeats']`
*         `prioritize`:  `False`
*            `recover`:  `False`
*        `sample_name`:  `tutorial`
*             `silent`:  `False`
*   `single_or_paired`:  `PAIRED`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

Local input file: /project/shefflab/data//pepatac/tutorial_r1.fastq.gz
Local input file: /project/shefflab/data//pepatac/tutorial_r2.fastq.gz

> `File_mb`	55	2	_RES_

> `Read_type`	PAIRED	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (05-26 11:06:31) elapsed: 2.0 _TIME_

Number of input file sets: 2
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz`  

> `ln -sf /project/shefflab/data//pepatac/tutorial_r1.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz` (121486)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 121486;	Command: ln;	Return code: 0;	Memory used: 0.0GB

Local input file: '/home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz'
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz`  

> `ln -sf /project/shefflab/data//pepatac/tutorial_r2.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz` (121487)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 121487;	Command: ln;	Return code: 0;	Memory used: 0.0GB

Local input file: '/home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq.gz', 'ln -sf /home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq.gz']
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq.gz`,`/home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq.gz`  

> `ln -sf /home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq.gz` (121492)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 121492;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `ln -sf /home/jps3dp/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq.gz` (121495)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 121495;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `Raw_reads`	2000000	PEPATAC	_RES_

> `Fastq_reads`	2000000	PEPATAC	_RES_

### Adapter trimming:  (05-26 11:06:40) elapsed: 9.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1_trim.fastq`  

> `skewer -f sanger -t 8 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq.gz /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq.gz` (121597)
<pre>
Parameters used:
-- 3' end adapter sequences in file (-x):	/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa
A:	[0;33mAGATGTGTATAAGAGACAG
[0mB:	[0;33mAGATGTGTATAAGAGACAG
[0mC:	[0;33mTCGTCGGCAGCGTCAGATGTGTATAAGAGACAG
[0mD:	[0;33mCTGTCTCTTATACACATCTGACGCTGCCGACGA
[0mE:	[0;33mGTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG
[0mF:	[0;33mCTGTCTCTTATACACATCTCCGAGCCCACGAGA
[0m-- maximum error ratio allowed (-r):	0.100
-- maximum indel error ratio allowed (-d):	0.030
-- minimum read length allowed after trimming (-l):	18
-- file format (-f):		Sanger/Illumina 1.8+ FASTQ 
-- number of concurrent threads (-t):	8
Tue May 26 11:06:41 2020[0;32m >> started[0m

Tue May 26 11:07:51 2020[0;32m >> done[0m (70.624s)
1000000 read pairs processed; of these:
      0 ( 0.00%) short read pairs filtered out after trimming by size control
      0 ( 0.00%) empty read pairs filtered out after trimming by size control
1000000 (100.00%) read pairs available; of these:
1000000 (100.00%) untrimmed read pairs available after processing
log has been saved to "/home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed.log".
</pre>
Command completed. Elapsed time: 0:01:11. Running peak memory: 0.004GB.  
  PID: 121597;	Command: skewer;	Return code: 0;	Memory used: 0.004GB


> `mv /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed-pair1.fastq /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1_trim.fastq` (122116)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.004GB.  
  PID: 122116;	Command: mv;	Return code: 0;	Memory used: 0.002GB


> `mv /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed-pair2.fastq /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2_trim.fastq` (122123)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.004GB.  
  PID: 122123;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	2000000	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Targetless command, running...  

> `fastqc --noextract --outdir /home/jps3dp/tutorial/results_pipeline/tutorial/fastqc /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1_trim.fastq` (122128)
<pre>
Started analysis of tutorial_R1_trim.fastq
Approx 5% complete for tutorial_R1_trim.fastq
Approx 10% complete for tutorial_R1_trim.fastq
Approx 15% complete for tutorial_R1_trim.fastq
Approx 20% complete for tutorial_R1_trim.fastq
Approx 25% complete for tutorial_R1_trim.fastq
Approx 30% complete for tutorial_R1_trim.fastq
Approx 35% complete for tutorial_R1_trim.fastq
Approx 40% complete for tutorial_R1_trim.fastq
Approx 45% complete for tutorial_R1_trim.fastq
Approx 50% complete for tutorial_R1_trim.fastq
Approx 55% complete for tutorial_R1_trim.fastq
Approx 60% complete for tutorial_R1_trim.fastq
Approx 65% complete for tutorial_R1_trim.fastq
Approx 70% complete for tutorial_R1_trim.fastq
Approx 75% complete for tutorial_R1_trim.fastq
Approx 80% complete for tutorial_R1_trim.fastq
Approx 85% complete for tutorial_R1_trim.fastq
Approx 90% complete for tutorial_R1_trim.fastq
Approx 95% complete for tutorial_R1_trim.fastq
Approx 100% complete for tutorial_R1_trim.fastq
Analysis complete for tutorial_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:22. Running peak memory: 0.147GB.  
  PID: 122128;	Command: fastqc;	Return code: 0;	Memory used: 0.147GB

> `FastQC report r1`	fastqc/tutorial_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Targetless command, running...  

> `fastqc --noextract --outdir /home/jps3dp/tutorial/results_pipeline/tutorial/fastqc /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2_trim.fastq` (122310)
<pre>
Started analysis of tutorial_R2_trim.fastq
Approx 5% complete for tutorial_R2_trim.fastq
Approx 10% complete for tutorial_R2_trim.fastq
Approx 15% complete for tutorial_R2_trim.fastq
Approx 20% complete for tutorial_R2_trim.fastq
Approx 25% complete for tutorial_R2_trim.fastq
Approx 30% complete for tutorial_R2_trim.fastq
Approx 35% complete for tutorial_R2_trim.fastq
Approx 40% complete for tutorial_R2_trim.fastq
Approx 45% complete for tutorial_R2_trim.fastq
Approx 50% complete for tutorial_R2_trim.fastq
Approx 55% complete for tutorial_R2_trim.fastq
Approx 60% complete for tutorial_R2_trim.fastq
Approx 65% complete for tutorial_R2_trim.fastq
Approx 70% complete for tutorial_R2_trim.fastq
Approx 75% complete for tutorial_R2_trim.fastq
Approx 80% complete for tutorial_R2_trim.fastq
Approx 85% complete for tutorial_R2_trim.fastq
Approx 90% complete for tutorial_R2_trim.fastq
Approx 95% complete for tutorial_R2_trim.fastq
Approx 100% complete for tutorial_R2_trim.fastq
Analysis complete for tutorial_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:21. Running peak memory: 0.147GB.  
  PID: 122310;	Command: fastqc;	Return code: 0;	Memory used: 0.145GB

> `FastQC report r2`	fastqc/tutorial_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (05-26 11:08:35) elapsed: 115.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (05-26 11:08:35) elapsed: 0.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2`  

> `mkfifo /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2` (122613)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.147GB.  
  PID: 122613;	Command: mkfifo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log`,`/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2 /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1_trim.fastq /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R2_trim.fastq /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq` (122614)
<pre>
</pre>
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log`,`/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id tutorial -U /home/jps3dp/tutorial/results_pipeline/tutorial/fastq/tutorial_R1_trim.fastq --un /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2 > /dev/null) 2>/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log` (122616)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:01:16. Running peak memory: 0.147GB.  
  PID: 122616;	Command: bowtie2;	Return code: 0;	Memory used: 0.116GB


> `grep 'aligned exactly 1 time' /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	199916.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	10.0	PEPATAC	_RES_

### Map to human_repeats (05-26 11:09:52) elapsed: 77.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2`  

> `mkfifo /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2` (123192)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.147GB.  
  PID: 123192;	Command: mkfifo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log`,`/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq` (123193)
<pre>
</pre>
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log`,`/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id tutorial -U /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq --un /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2 > /dev/null) 2>/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log` (123194)
<pre>
not gzipping output
99958 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:01:10. Running peak memory: 0.147GB.  
  PID: 123194;	Command: bowtie2;	Return code: 0;	Memory used: 0.125GB


> `grep 'aligned exactly 1 time' /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	39944.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	2.0	PEPATAC	_RES_

### Compress all unmapped read files (05-26 11:11:02) elapsed: 70.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 8 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq` (124165)
<pre>
</pre>
Command completed. Elapsed time: 0:00:20. Running peak memory: 0.147GB.  
  PID: 124165;	Command: pigz;	Return code: 0;	Memory used: 0.006GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 8 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq` (124282)
<pre>
19972 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:20. Running peak memory: 0.147GB.  
  PID: 124282;	Command: pigz;	Return code: 0;	Memory used: 0.006GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 8 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq` (124406)
<pre>
</pre>
Command completed. Elapsed time: 0:00:18. Running peak memory: 0.147GB.  
  PID: 124406;	Command: pigz;	Return code: 0;	Memory used: 0.006GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 8 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq` (124635)
<pre>
</pre>
Command completed. Elapsed time: 0:00:18. Running peak memory: 0.147GB.  
  PID: 124635;	Command: pigz;	Return code: 0;	Memory used: 0.006GB


### Map to genome (05-26 11:12:18) elapsed: 76.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`  

> `bowtie2 -p 8  --very-sensitive -X 2000 --rg-id tutorial -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq.gz -2 /home/jps3dp/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tmpz60jlhb_ -o /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam` (124762,124764,124765)
<pre>
880070 reads; of these:
  880070 (100.00%) were paired; of these:
    83 (0.01%) aligned concordantly 0 times
    806758 (91.67%) aligned concordantly exactly 1 time
    73229 (8.32%) aligned concordantly >1 times
    ----
    83 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    83 pairs aligned 0 times concordantly or discordantly; of these:
      166 mates make up the pairs; of these:
        124 (74.70%) aligned 0 times
        13 (7.83%) aligned exactly 1 time
        29 (17.47%) aligned >1 times
99.99% overall alignment rate
</pre>
Command completed. Elapsed time: 0:18:14. Running peak memory: 3.637GB.  
  PID: 124762;	Command: bowtie2;	Return code: 0;	Memory used: 3.637GB  
  PID: 124765;	Command: samtools;	Return code: 0;	Memory used: 0.441GB  
  PID: 124764;	Command: samtools;	Return code: 0;	Memory used: 0.004GB


> `samtools view -b -q 10 -@ 8 -U /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_fail_qc.bam -f 2 /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam > /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam` (133987)
<pre>
</pre>
Command completed. Elapsed time: 0:00:20. Running peak memory: 3.637GB.  
  PID: 133987;	Command: samtools;	Return code: 0;	Memory used: 0.014GB


> `Mapped_reads`	1760016	PEPATAC	_RES_

> `QC_filtered_reads`	7246	PEPATAC	_RES_

> `Aligned_reads`	1752770	PEPATAC	_RES_

> `Alignment_rate`	87.64	PEPATAC	_RES_

> `Total_efficiency`	87.64	PEPATAC	_RES_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam.bai`  

> `samtools index /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam` (134337)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.637GB.  
  PID: 134337;	Command: samtools;	Return code: 0;	Memory used: 0.02GB


> `samtools index /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam` (134362)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.637GB.  
  PID: 134362;	Command: samtools;	Return code: 0;	Memory used: 0.007GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam | grep -we 'chrM' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`

> `Mitochondrial_reads`	48	PEPATAC	_RES_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_noMT.bam`  

> `samtools idxstats /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/chr_sizes.bed` (134386,134387,134388,134389)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 134388;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 134386;	Command: samtools;	Return code: 0;	Memory used: 0.009GB  
  PID: 134389;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 134387;	Command: cut;	Return code: 0;	Memory used: 0.001GB


> `samtools view -L /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/chr_sizes.bed -b -@ 8 /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam > /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_noMT.bam` (134395)
<pre>
</pre>
Command completed. Elapsed time: 0:00:20. Running peak memory: 3.637GB.  
  PID: 134395;	Command: samtools;	Return code: 0;	Memory used: 0.015GB


> `mv /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_noMT.bam /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam` (134514)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 134514;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `samtools index /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam` (134515)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.637GB.  
  PID: 134515;	Command: samtools;	Return code: 0;	Memory used: 0.006GB


### Calculate NRF, PBC1, and PBC2 (05-26 11:31:33) elapsed: 1155.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam -c 8 -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv` (134534)
<pre>
Registering input file: '/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam'
Temporary files will be stored in: '/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tmp_tutorial_sort_8d58t2id'
Processing with 8 cores...
Discarding 135 chunk(s) of reads: ['chrM', 'chr1_KI270707v1_random', 'chr1_KI270708v1_random', 'chr1_KI270709v1_random', 'chr1_KI270710v1_random', 'chr1_KI270711v1_random', 'chr1_KI270712v1_random', 'chr2_KI270715v1_random', 'chr2_KI270716v1_random', 'chr3_GL000221v1_random', 'chr9_KI270717v1_random', 'chr9_KI270718v1_random', 'chr9_KI270720v1_random', 'chr11_KI270721v1_random', 'chr14_KI270723v1_random', 'chr14_KI270724v1_random', 'chr15_KI270727v1_random', 'chr17_KI270729v1_random', 'chr17_KI270730v1_random', 'chr22_KI270731v1_random', 'chr22_KI270734v1_random', 'chr22_KI270735v1_random', 'chr22_KI270737v1_random', 'chr22_KI270738v1_random', 'chr22_KI270739v1_random', 'chrY_KI270740v1_random', 'chrUn_KI270302v1', 'chrUn_KI270304v1', 'chrUn_KI270303v1', 'chrUn_KI270305v1', 'chrUn_KI270322v1', 'chrUn_KI270320v1', 'chrUn_KI270310v1', 'chrUn_KI270316v1', 'chrUn_KI270315v1', 'chrUn_KI270312v1', 'chrUn_KI270311v1', 'chrUn_KI270317v1', 'chrUn_KI270412v1', 'chrUn_KI270411v1', 'chrUn_KI270414v1', 'chrUn_KI270419v1', 'chrUn_KI270418v1', 'chrUn_KI270420v1', 'chrUn_KI270424v1', 'chrUn_KI270417v1', 'chrUn_KI270422v1', 'chrUn_KI270423v1', 'chrUn_KI270425v1', 'chrUn_KI270429v1', 'chrUn_KI270466v1', 'chrUn_KI270465v1', 'chrUn_KI270467v1', 'chrUn_KI270435v1', 'chrUn_KI270468v1', 'chrUn_KI270510v1', 'chrUn_KI270509v1', 'chrUn_KI270518v1', 'chrUn_KI270508v1', 'chrUn_KI270516v1', 'chrUn_KI270512v1', 'chrUn_KI270522v1', 'chrUn_KI270511v1', 'chrUn_KI270515v1', 'chrUn_KI270507v1', 'chrUn_KI270517v1', 'chrUn_KI270529v1', 'chrUn_KI270528v1', 'chrUn_KI270530v1', 'chrUn_KI270539v1', 'chrUn_KI270538v1', 'chrUn_KI270544v1', 'chrUn_KI270548v1', 'chrUn_KI270583v1', 'chrUn_KI270587v1', 'chrUn_KI270580v1', 'chrUn_KI270581v1', 'chrUn_KI270579v1', 'chrUn_KI270589v1', 'chrUn_KI270590v1', 'chrUn_KI270584v1', 'chrUn_KI270582v1', 'chrUn_KI270588v1', 'chrUn_KI270593v1', 'chrUn_KI270591v1', 'chrUn_KI270330v1', 'chrUn_KI270329v1', 'chrUn_KI270334v1', 'chrUn_KI270333v1', 'chrUn_KI270335v1', 'chrUn_KI270338v1', 'chrUn_KI270340v1', 'chrUn_KI270336v1', 'chrUn_KI270337v1', 'chrUn_KI270363v1', 'chrUn_KI270364v1', 'chrUn_KI270362v1', 'chrUn_KI270366v1', 'chrUn_KI270378v1', 'chrUn_KI270379v1', 'chrUn_KI270389v1', 'chrUn_KI270390v1', 'chrUn_KI270387v1', 'chrUn_KI270395v1', 'chrUn_KI270396v1', 'chrUn_KI270388v1', 'chrUn_KI270394v1', 'chrUn_KI270386v1', 'chrUn_KI270391v1', 'chrUn_KI270383v1', 'chrUn_KI270393v1', 'chrUn_KI270384v1', 'chrUn_KI270392v1', 'chrUn_KI270381v1', 'chrUn_KI270385v1', 'chrUn_KI270382v1', 'chrUn_KI270376v1', 'chrUn_KI270374v1', 'chrUn_KI270372v1', 'chrUn_KI270373v1', 'chrUn_KI270375v1', 'chrUn_KI270371v1', 'chrUn_KI270448v1', 'chrUn_KI270521v1', 'chrUn_GL000226v1', 'chrUn_KI270743v1', 'chrUn_KI270745v1', 'chrUn_KI270746v1', 'chrUn_KI270747v1', 'chrUn_KI270748v1', 'chrUn_KI270752v1', 'chrUn_KI270753v1', 'chrUn_KI270755v1', 'chrUn_KI270756v1', 'chrEBV']
Keeping 60 chunk(s) of reads: ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr19', 'chr20', 'chr21', 'chr22', 'chrX', 'chrY', 'chr1_KI270706v1_random', 'chr1_KI270713v1_random', 'chr1_KI270714v1_random', 'chr4_GL000008v2_random', 'chr5_GL000208v1_random', 'chr9_KI270719v1_random', 'chr14_GL000009v2_random', 'chr14_GL000225v1_random', 'chr14_KI270722v1_random', 'chr14_GL000194v1_random', 'chr14_KI270725v1_random', 'chr14_KI270726v1_random', 'chr16_KI270728v1_random', 'chr17_GL000205v2_random', 'chr22_KI270732v1_random', 'chr22_KI270733v1_random', 'chr22_KI270736v1_random', 'chrUn_KI270442v1', 'chrUn_KI270438v1', 'chrUn_KI270519v1', 'chrUn_GL000195v1', 'chrUn_GL000219v1', 'chrUn_GL000220v1', 'chrUn_GL000224v1', 'chrUn_KI270741v1', 'chrUn_GL000213v1', 'chrUn_KI270744v1', 'chrUn_KI270749v1', 'chrUn_KI270750v1', 'chrUn_KI270751v1', 'chrUn_KI270754v1', 'chrUn_KI270757v1', 'chrUn_GL000214v1', 'chrUn_KI270742v1', 'chrUn_GL000216v2', 'chrUn_GL000218v1']
Merging 60 files into output file: '/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:00:17. Running peak memory: 3.637GB.  
  PID: 134534;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 0.652GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

> `NRF`	1.0	PEPATAC	_RES_

> `PBC1`	1.0	PEPATAC	_RES_

> `PBC2`	876373.0	PEPATAC	_RES_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_unmap.bam`  

> `samtools view -b -@ 8 -f 12  /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam > /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_unmap.bam` (134661)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 134661;	Command: samtools;	Return code: 0;	Memory used: 0.007GB


> `samtools view -c -f 4 -@ 8 /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`

> `Unmapped_reads`	124	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (05-26 11:31:55) elapsed: 22.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`  

> `samtools sort -n -@ 2 -T /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tmpbb5uv8eq /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam | samtools view -h - -@ 2 | samblaster -r 2> /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_dedup_metrics_log.txt | samtools view -b - -@ 2 | samtools sort - -@ 2 -T /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tmpbb5uv8eq -o /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam` (134710,134711,134712,134713,134715)
<pre>
[bam_sort_core] merging from 0 files and 2 in-memory blocks...
[bam_sort_core] merging from 0 files and 2 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:01:27. Running peak memory: 3.637GB.  
  PID: 134710;	Command: samtools;	Return code: 0;	Memory used: 0.48GB  
  PID: 134712;	Command: samblaster;	Return code: 0;	Memory used: 0.012GB  
  PID: 134711;	Command: samtools;	Return code: 0;	Memory used: 0.007GB  
  PID: 134715;	Command: samtools;	Return code: 0;	Memory used: 0.441GB  
  PID: 134713;	Command: samtools;	Return code: 0;	Memory used: 0.009GB


> `samtools index /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam` (135203)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 135203;	Command: samtools;	Return code: 0;	Memory used: 0.007GB


> `grep 'Removed' /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_dedup_metrics_log.txt | cut -f 3 -d ' '`

> `Duplicate_reads`	0	PEPATAC	_RES_

> `Dedup_aligned_reads`	1752770.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	87.64	PEPATAC	_RES_

> `Dedup_total_efficiency`	87.64	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`

> `Read_length`	42	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (05-26 11:33:41) elapsed: 106.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_out.txt`  

> `preseq c_curve -v -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_out.txt -B /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam` (135327)
<pre>
BAM_INPUT
TOTAL READS     = 876373
COUNTS_SUM      = 876373
DISTINCT READS  = 872690
DISTINCT COUNTS = 5
MAX COUNT       = 5
COUNTS OF 1     = 869106
OBSERVED COUNTS (6)
1	869106
2	3493
3	84
4	6
5	1

</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 3.637GB.  
  PID: 135327;	Command: preseq;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_yield.txt`  

> `preseq lc_extrap -v -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_yield.txt -B /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam` (135469)
<pre>
BAM_INPUT
TOTAL READS     = 876373
DISTINCT READS  = 872690
DISTINCT COUNTS = 5
MAX COUNT       = 5
COUNTS OF 1     = 869106
MAX TERMS       = 4
OBSERVED COUNTS (6)
1	869106
2	3493
3	84
4	6
5	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
...................._.........._......................_................................................
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:00:27. Running peak memory: 3.637GB.  
  PID: 135469;	Command: preseq;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_counts.txt`  

> `echo '/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_yield.txt '$(samtools view -c -F 4 /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam)' '$(samtools view -c -F 4 /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam) > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_counts.txt` (135612)
<pre>
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 3.637GB.  
  PID: 135612;	Command: echo;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_plot.pdf`,`/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_plot.png`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_yield.txt -r /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_counts.txt -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_plot` (135663)
<pre>
INFO: Found real counts for tutorial - Total (M): 1.752746 Unique (M): 1.752746

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:16. Running peak memory: 3.637GB.  
  PID: 135663;	Command: Rscript;	Return code: 0;	Memory used: 0.394GB

> `Library complexity`	QC_hg38/tutorial_preseq_plot.pdf	Library complexity	QC_hg38/tutorial_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '10000000' /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9601	PEPATAC	_RES_

### Produce signal tracks (05-26 11:34:53) elapsed: 73.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw`,`/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -o /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw -w /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw -m atac -p 5 --variable-step --scale 1752770.0` (135766)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam'
Temporary files will be stored in: 'tmp_tutorial_sort_dedup_cuttrace_l6daebzv'
Processing with 2 cores...
Discarding 135 chunk(s) of reads: ['chrM', 'chr1_KI270707v1_random', 'chr1_KI270708v1_random', 'chr1_KI270709v1_random', 'chr1_KI270710v1_random', 'chr1_KI270711v1_random', 'chr1_KI270712v1_random', 'chr2_KI270715v1_random', 'chr2_KI270716v1_random', 'chr3_GL000221v1_random', 'chr9_KI270717v1_random', 'chr9_KI270718v1_random', 'chr9_KI270720v1_random', 'chr11_KI270721v1_random', 'chr14_KI270723v1_random', 'chr14_KI270724v1_random', 'chr15_KI270727v1_random', 'chr17_KI270729v1_random', 'chr17_KI270730v1_random', 'chr22_KI270731v1_random', 'chr22_KI270734v1_random', 'chr22_KI270735v1_random', 'chr22_KI270737v1_random', 'chr22_KI270738v1_random', 'chr22_KI270739v1_random', 'chrY_KI270740v1_random', 'chrUn_KI270302v1', 'chrUn_KI270304v1', 'chrUn_KI270303v1', 'chrUn_KI270305v1', 'chrUn_KI270322v1', 'chrUn_KI270320v1', 'chrUn_KI270310v1', 'chrUn_KI270316v1', 'chrUn_KI270315v1', 'chrUn_KI270312v1', 'chrUn_KI270311v1', 'chrUn_KI270317v1', 'chrUn_KI270412v1', 'chrUn_KI270411v1', 'chrUn_KI270414v1', 'chrUn_KI270419v1', 'chrUn_KI270418v1', 'chrUn_KI270420v1', 'chrUn_KI270424v1', 'chrUn_KI270417v1', 'chrUn_KI270422v1', 'chrUn_KI270423v1', 'chrUn_KI270425v1', 'chrUn_KI270429v1', 'chrUn_KI270466v1', 'chrUn_KI270465v1', 'chrUn_KI270467v1', 'chrUn_KI270435v1', 'chrUn_KI270468v1', 'chrUn_KI270510v1', 'chrUn_KI270509v1', 'chrUn_KI270518v1', 'chrUn_KI270508v1', 'chrUn_KI270516v1', 'chrUn_KI270512v1', 'chrUn_KI270522v1', 'chrUn_KI270511v1', 'chrUn_KI270515v1', 'chrUn_KI270507v1', 'chrUn_KI270517v1', 'chrUn_KI270529v1', 'chrUn_KI270528v1', 'chrUn_KI270530v1', 'chrUn_KI270539v1', 'chrUn_KI270538v1', 'chrUn_KI270544v1', 'chrUn_KI270548v1', 'chrUn_KI270583v1', 'chrUn_KI270587v1', 'chrUn_KI270580v1', 'chrUn_KI270581v1', 'chrUn_KI270579v1', 'chrUn_KI270589v1', 'chrUn_KI270590v1', 'chrUn_KI270584v1', 'chrUn_KI270582v1', 'chrUn_KI270588v1', 'chrUn_KI270593v1', 'chrUn_KI270591v1', 'chrUn_KI270330v1', 'chrUn_KI270329v1', 'chrUn_KI270334v1', 'chrUn_KI270333v1', 'chrUn_KI270335v1', 'chrUn_KI270338v1', 'chrUn_KI270340v1', 'chrUn_KI270336v1', 'chrUn_KI270337v1', 'chrUn_KI270363v1', 'chrUn_KI270364v1', 'chrUn_KI270362v1', 'chrUn_KI270366v1', 'chrUn_KI270378v1', 'chrUn_KI270379v1', 'chrUn_KI270389v1', 'chrUn_KI270390v1', 'chrUn_KI270387v1', 'chrUn_KI270395v1', 'chrUn_KI270396v1', 'chrUn_KI270388v1', 'chrUn_KI270394v1', 'chrUn_KI270386v1', 'chrUn_KI270391v1', 'chrUn_KI270383v1', 'chrUn_KI270393v1', 'chrUn_KI270384v1', 'chrUn_KI270392v1', 'chrUn_KI270381v1', 'chrUn_KI270385v1', 'chrUn_KI270382v1', 'chrUn_KI270376v1', 'chrUn_KI270374v1', 'chrUn_KI270372v1', 'chrUn_KI270373v1', 'chrUn_KI270375v1', 'chrUn_KI270371v1', 'chrUn_KI270448v1', 'chrUn_KI270521v1', 'chrUn_GL000226v1', 'chrUn_KI270743v1', 'chrUn_KI270745v1', 'chrUn_KI270746v1', 'chrUn_KI270747v1', 'chrUn_KI270748v1', 'chrUn_KI270752v1', 'chrUn_KI270753v1', 'chrUn_KI270755v1', 'chrUn_KI270756v1', 'chrEBV']
Keeping 60 chunk(s) of reads: ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr19', 'chr20', 'chr21', 'chr22', 'chrX', 'chrY', 'chr1_KI270706v1_random', 'chr1_KI270713v1_random', 'chr1_KI270714v1_random', 'chr4_GL000008v2_random', 'chr5_GL000208v1_random', 'chr9_KI270719v1_random', 'chr14_GL000009v2_random', 'chr14_GL000225v1_random', 'chr14_KI270722v1_random', 'chr14_GL000194v1_random', 'chr14_KI270725v1_random', 'chr14_KI270726v1_random', 'chr16_KI270728v1_random', 'chr17_GL000205v2_random', 'chr22_KI270732v1_random', 'chr22_KI270733v1_random', 'chr22_KI270736v1_random', 'chrUn_KI270442v1', 'chrUn_KI270438v1', 'chrUn_KI270519v1', 'chrUn_GL000195v1', 'chrUn_GL000219v1', 'chrUn_GL000220v1', 'chrUn_GL000224v1', 'chrUn_KI270741v1', 'chrUn_GL000213v1', 'chrUn_KI270744v1', 'chrUn_KI270749v1', 'chrUn_KI270750v1', 'chrUn_KI270751v1', 'chrUn_KI270754v1', 'chrUn_KI270757v1', 'chrUn_GL000214v1', 'chrUn_KI270742v1', 'chrUn_GL000216v2', 'chrUn_GL000218v1']
Reduce step (merge files)...
Merging 60 files into output file: '/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw'
Merging 60 files into output file: '/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw'
</pre>
Command completed. Elapsed time: 0:26:06. Running peak memory: 3.637GB.  
  PID: 135766;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 2.959GB


### Calculate TSS enrichment (05-26 12:01:00) elapsed: 1567.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_enrichment.txt`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 8 -z -v -s 6 -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_enrichment.txt` (164124)
<pre>
</pre>
Command completed. Elapsed time: 0:00:20. Running peak memory: 3.637GB.  
  PID: 164124;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 0.74GB

Missing stat 'TSS_score'

> `TSS_score`	13.8	PEPATAC	_RES_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_enrichment.txt` (164334)
<pre>

Generating TSS plot with /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 3.637GB.  
  PID: 164334;	Command: Rscript;	Return code: 0;	Memory used: 0.23GB

> `TSS enrichment`	QC_hg38/tutorial_TSS_enrichment.pdf	TSS enrichment	QC_hg38/tutorial_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (05-26 12:01:27) elapsed: 27.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt` (164396)
<pre>
</pre>
Command completed. Elapsed time: 0:00:09. Running peak memory: 3.637GB.  
  PID: 164396;	Command: perl;	Return code: 0;	Memory used: 0.006GB


> `sort -n  /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt | uniq -c  > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragCount.txt` (164452,164453)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 164452;	Command: sort;	Return code: 0;	Memory used: 0.099GB  
  PID: 164453;	Command: uniq;	Return code: 0;	Memory used: 0.002GB


> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt -c /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragCount.txt -p /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf -t /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.txt` (164540)
<pre>
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 3.637GB.  
  PID: 164540;	Command: Rscript;	Return code: 0;	Memory used: 0.234GB

> `Fragment distribution`	QC_hg38/tutorial_fragLenDistribution.pdf	Fragment distribution	QC_hg38/tutorial_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz` (164597)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 164597;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `pigz -f -p 8 -d -c /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz > /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed` (164598)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.637GB.  
  PID: 164598;	Command: pigz;	Return code: 0;	Memory used: 0.002GB


### Call peaks (05-26 12:01:46) elapsed: 19.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak`  

> `macs2 callpeak -t /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -f BED --outdir /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38 -n tutorial -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (164609)
<pre>
INFO  @ Tue, 26 May 2020 12:01:47: 
# Command line: callpeak -t /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -f BED --outdir /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38 -n tutorial -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = tutorial
# format = BED
# ChIP-seq file = ['/home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# pvalue cutoff = 1.00e-02
# qvalue will not be calculated and reported as -1 in the final output.
# The maximum gap between significant sites is assigned as the read length/tag size.
# The minimum length of peaks is assigned as the predicted fragment length "d".
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
# Searching for subpeak summits is on
 
INFO  @ Tue, 26 May 2020 12:01:47: #1 read tag files... 
INFO  @ Tue, 26 May 2020 12:01:47: #1 read treatment tags... 
INFO  @ Tue, 26 May 2020 12:01:47:  1000000 
INFO  @ Tue, 26 May 2020 12:01:48: #1 tag size is determined as 50 bps 
INFO  @ Tue, 26 May 2020 12:01:48: #1 tag size = 50.0 
INFO  @ Tue, 26 May 2020 12:01:48: #1  total tags in treatment: 1752746 
INFO  @ Tue, 26 May 2020 12:01:48: #1 finished! 
INFO  @ Tue, 26 May 2020 12:01:48: #2 Build Peak Model... 
INFO  @ Tue, 26 May 2020 12:01:48: #2 Skipped... 
INFO  @ Tue, 26 May 2020 12:01:48: #2 Use 150 as fragment length 
INFO  @ Tue, 26 May 2020 12:01:48: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Tue, 26 May 2020 12:01:48: #3 Call peaks... 
INFO  @ Tue, 26 May 2020 12:01:48: # local lambda is disabled! 
INFO  @ Tue, 26 May 2020 12:01:48: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Tue, 26 May 2020 12:01:48: #3 Going to call summits inside each peak ... 
INFO  @ Tue, 26 May 2020 12:01:48: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Tue, 26 May 2020 12:01:48: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Tue, 26 May 2020 12:01:50: #3 Call peaks for each chromosome... 
INFO  @ Tue, 26 May 2020 12:07:52: #4 Write output xls file... /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.xls 
INFO  @ Tue, 26 May 2020 12:07:57: #4 Write peak in narrowPeak format file... /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak 
INFO  @ Tue, 26 May 2020 12:08:00: #4 Write summits bed file... /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_summits.bed 
INFO  @ Tue, 26 May 2020 12:08:02: Done! 
</pre>
Command completed. Elapsed time: 0:06:16. Running peak memory: 3.637GB.  
  PID: 164609;	Command: macs2;	Return code: 0;	Memory used: 0.162GB


> `Peak_count`	972215	PEPATAC	_RES_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_fixedWidth.narrowPeak` (170793)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 170793;	Command: awk;	Return code: 0;	Memory used: 0.004GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (170808)
<pre>
Normalize: TRUE
NULL
</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 3.637GB.  
  PID: 170808;	Command: Rscript;	Return code: 0;	Memory used: 0.499GB


### Calculate fraction of reads in peaks (FRiP) (05-26 12:08:28) elapsed: 402.0 _TIME_

Missing stat 'FRiP'

> `samtools view -@ 4 -c -L /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_normalized.narrowPeak /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`
1752770 1608776

> `FRiP`	0.92	PEPATAC	_RES_

### Calculate peak coverage (05-26 12:08:30) elapsed: 3.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt`  

> `samtools view -H /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt` (171960,171962,171964,171966)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 171960;	Command: samtools;	Return code: 0;	Memory used: 0.0GB  
  PID: 171964;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 171962;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 171966;	Command: awk;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed`  

> `cut -f 1-3 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_normalized.narrowPeak > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed` (172002)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 172002;	Command: cut;	Return code: 0;	Memory used: 0.002GB


> `samtools view -H /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt` (172052,172054,172058,172061)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.637GB.  
  PID: 172052;	Command: samtools;	Return code: 0;	Memory used: 0.0GB  
  PID: 172058;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 172054;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 172061;	Command: awk;	Return code: 0;	Memory used: 0.0GB


> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_keep.txt` (172099)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 172099;	Command: cut;	Return code: 0;	Memory used: 0.0GB


> `bedtools sort -i /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed` (172111)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.637GB.  
  PID: 172111;	Command: bedtools;	Return code: 0;	Memory used: 0.206GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/coverage.flag`  

> `bedtools coverage -sorted -a /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | uniq > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed` (172251,172253)
<pre>
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 3.637GB.  
  PID: 172253;	Command: uniq;	Return code: 0;	Memory used: 0.002GB  
  PID: 172251;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB


> `awk 'BEGIN{OFS="\t";} NR==FNR{sum += $5; next}{if (sum <= 0){sum = 1} print $1, $2, $3, $4, $5, $6, $7, ($5/sum*1000000)}' /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_norm_peaks_coverage.bed` (173015)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 173015;	Command: awk;	Return code: 0;	Memory used: 0.005GB


> `mv /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_norm_peaks_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed` (173282)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 173282;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `touch /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/coverage.flag` (173293)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 173293;	Command: touch;	Return code: 0;	Memory used: 0.0GB


### # Produce bigBed formatted narrowPeak file (05-26 12:08:42) elapsed: 11.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/bigNarrowPeak.as`  

> `echo 'table bigNarrowPeak
"BED6+4 Peaks of signal enrichment based on pooled, normalized (interpreted) data."
(
     string chrom;        "Reference sequence chromosome or scaffold"
     uint   chromStart;   "Start position in chromosome"
     uint   chromEnd;     "End position in chromosome"
     string name;         "Name given to a region (preferably unique). Use . if no name is assigned"
     uint   score;        "Indicates how dark the peak will be displayed in the browser (0-1000) "
     char[1]  strand;     "+ or - or . for unknown"
     float  signalValue;  "Measurement of average enrichment for the region"
     float  pValue;       "Statistical significance of signal value (-log10). Set to -1 if not used."
     float  qValue;       "Statistical significance with multiple-test correction applied (FDR -log10). Set to -1 if not used."
     int   peak;          "Point-source called for this peak; 0-based offset from chromStart. Set to -1 if no point-source called."
)' > /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/bigNarrowPeak.as` (174205)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 174205;	Command: echo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bigBed`  

> `bedToBigBed -as=/home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/bigNarrowPeak.as -type=bed6+4 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tmpqp97aw2g /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bigBed` (174210)
<pre>
pass1 - making usageList (60 chroms): 123 millis
pass2 - checking and writing primary data (652555 records, 10 fields): 1433 millis
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 174210;	Command: bedToBigBed;	Return code: 0;	Memory used: 0.004GB


### Annotate peaks (05-26 12:08:52) elapsed: 10.0 _TIME_

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_chromosome_distribution.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R anno -p chromosome -i /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_normalized.narrowPeak -f /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed -g hg38 -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_chromosome_distribution.pdf` (174418)
<pre>
chromosome distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:37. Running peak memory: 3.637GB.  
  PID: 174418;	Command: Rscript;	Return code: 0;	Memory used: 0.522GB

> `Peak chromosome distribution`	QC_hg38/tutorial_chromosome_distribution.pdf	Peak chromosome distribution	QC_hg38/tutorial_chromosome_distribution.png	PEPATAC	_OBJ_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_distribution.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R anno -p tss -i /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_normalized.narrowPeak -f /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed -g hg38 -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TSS_distribution.pdf` (178550)
<pre>
tss distribution plot completed!

Warning message:
Vectorized input to `element_text()` is not officially supported.
Results may be unexpected or may change in future versions of ggplot2. 
</pre>
Command completed. Elapsed time: 0:00:24. Running peak memory: 3.637GB.  
  PID: 178550;	Command: Rscript;	Return code: 0;	Memory used: 0.456GB

> `TSS distance distribution`	QC_hg38/tutorial_TSS_distribution.pdf	TSS distance distribution	QC_hg38/tutorial_TSS_distribution.png	PEPATAC	_OBJ_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_genomic_distribution.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R anno -p genomic -i /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_normalized.narrowPeak -f /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed -g hg38 -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_genomic_distribution.pdf` (181263)
<pre>
3' UTR :	found 18188
5' UTR :	found 18665
Enhancer :	found 33045
Exon :	found 37629
Intron :	found 257761
Promoter :	found 7617
Promoter Flanking Region :	found 38565
genomic distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 3.637GB.  
  PID: 181263;	Command: Rscript;	Return code: 0;	Memory used: 0.526GB

> `Peak partition distribution`	QC_hg38/tutorial_genomic_distribution.pdf	Peak partition distribution	QC_hg38/tutorial_genomic_distribution.png	PEPATAC	_OBJ_

### Calculate read coverage (05-26 12:10:16) elapsed: 84.0 _TIME_


> `cut -f 4 /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed | sort -u`
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3' UTR`  

> `awk -F'	' '{print>"/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/"$4}' /home/jps3dp/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed` (184524)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 184524;	Command: awk;	Return code: 0;	Memory used: 0.002GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR`  

> `mv "/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3' UTR" "/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR"` (184847)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 184847;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed` (184862,184866,184869,184872)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.637GB.  
  PID: 184862;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 184869;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 184866;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 184872;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed` (185089)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 185089;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5' UTR`  
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR`  

> `mv "/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5' UTR" "/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR"` (185531)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 185531;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed` (185532,185533,185534,185535)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.637GB.  
  PID: 185532;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 185533;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 185535;	Command: bedtools;	Return code: 0;	Memory used: 0.011GB  
  PID: 185534;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed` (185543)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 185543;	Command: bedtools;	Return code: 0;	Memory used: 0.006GB

Target exists: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Enhancer`  
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Enhancer_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Enhancer | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Enhancer_sort.bed` (185566,185567,185568,185569)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 185566;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 185568;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 185567;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 185569;	Command: bedtools;	Return code: 0;	Memory used: 0.012GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Enhancer_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Enhancer_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Enhancer_coverage.bed` (185579)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 185579;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Exon`  
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Exon | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed` (185603,185604,185605,185606)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.637GB.  
  PID: 185603;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 185604;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 185606;	Command: bedtools;	Return code: 0;	Memory used: 0.158GB  
  PID: 185605;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed` (185648)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.637GB.  
  PID: 185648;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Intron`  
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Intron | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed` (185696,185697,185698,185699)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 185696;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 185699;	Command: bedtools;	Return code: 0;	Memory used: 0.071GB  
  PID: 185697;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 185698;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed` (185802)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.637GB.  
  PID: 185802;	Command: bedtools;	Return code: 0;	Memory used: 0.017GB

Target exists: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter`  
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed` (186009,186010,186012,186015)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.637GB.  
  PID: 186009;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 186010;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 186015;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB  
  PID: 186012;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed` (186039)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.637GB.  
  PID: 186039;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter Flanking Region`  
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region`  

> `mv "/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter Flanking Region" "/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region"` (186125)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.637GB.  
  PID: 186125;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed`  

> `cut -f 1 /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt | grep -wf - /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region | cut -f 1-3 | bedtools sort -i stdin -faidx /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed` (186127,186128,186129,186130)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.637GB.  
  PID: 186127;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 186129;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 186128;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 186130;	Command: bedtools;	Return code: 0;	Memory used: 0.048GB

Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`  

> `bedtools coverage -sorted  -a /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed -b /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /home/jps3dp/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed` (186138)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.637GB.  
  PID: 186138;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB


### Calculate cumulative and terminal fraction of reads in features (cFRiF/FRiF) (05-26 12:10:56) elapsed: 40.0 _TIME_


> `samtools view -@ 8 -q 10 -c -F4 /home/jps3dp/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_cFRiF.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frif -s tutorial -z 3099922541 -n 1752746 -y cfrif --reads -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_cFRiF.pdf --bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Enhancer_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed` (186278)
<pre>
FRiF plot completed!

</pre>
Command completed. Elapsed time: 0:00:41. Running peak memory: 3.637GB.  
  PID: 186278;	Command: Rscript;	Return code: 0;	Memory used: 0.5GB

> `cFRiF`	QC_hg38/tutorial_cFRiF.pdf	cFRiF	QC_hg38/tutorial_cFRiF.png	PEPATAC	_OBJ_
Target to produce: `/home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_FRiF.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frif -s tutorial -z 3099922541 -n 1752746 -y frif --reads -o /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_FRiF.pdf --bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Enhancer_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed /home/jps3dp/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed` (186644)
<pre>
FRiF plot completed!

</pre>
Command completed. Elapsed time: 0:00:32. Running peak memory: 3.637GB.  
  PID: 186644;	Command: Rscript;	Return code: 0;	Memory used: 0.491GB

> `FRiF`	QC_hg38/tutorial_FRiF.pdf	FRiF	QC_hg38/tutorial_FRiF.png	PEPATAC	_OBJ_
Starting cleanup: 38 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Cleaning up conditional list. . .

### Pipeline completed. Epilogue
*        Elapsed time (this run):  1:05:44
*  Total elapsed time (all runs):  1:46:28
*         Peak memory (this run):  3.6367 GB
*        Pipeline completed time: 2020-05-26 12:12:12
