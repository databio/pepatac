### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --sample-name gold2 --genome hg38 --input /project/shefflab/data/sra_fastq//SRR5210450_1.fastq.gz --single-or-paired PAIRED -O /project/shefflab/processed//pepatac/gold_atac/results_pipeline -P 32 -M 24000 --input2 /project/shefflab/data/sra_fastq//SRR5210450_2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --blacklist /nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-aj38-16c0
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/
*  Pipeline started at:   (09-14 14:34:38) elapsed: 23.0 _TIME_

### Version log:

*       Python version:  3.7.4
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python3.7/site-packages/pypiper`
*      Pypiper version:  0.12.1
*         Pipeline dir:  `/sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.9.5
*        Pipeline hash:  9d04c5b9b64523ab57a715a490430311eef462bb
*      Pipeline branch:  * master
*        Pipeline date:  2020-09-08 11:15:59 -0400
*        Pipeline diff:  3 files changed, 8 insertions(+), 7 deletions(-)

### Arguments passed to pipeline:

*           `TSS_name`:  `None`
*            `aligner`:  `bowtie2`
*          `anno_name`:  `None`
*          `blacklist`:  `/nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz`
*        `config_file`:  `pepatac.yaml`
*              `cores`:  `32`
*       `deduplicator`:  `samblaster`
*              `dirty`:  `False`
*             `extend`:  `250`
*       `force_follow`:  `False`
*     `frip_ref_peaks`:  `None`
*    `genome_assembly`:  `hg38`
*        `genome_size`:  `hs`
*              `input`:  `['/project/shefflab/data/sra_fastq//SRR5210450_1.fastq.gz']`
*             `input2`:  `['/project/shefflab/data/sra_fastq//SRR5210450_2.fastq.gz']`
*               `keep`:  `False`
*               `lite`:  `False`
*             `logdev`:  `False`
*                `mem`:  `24000`
*              `motif`:  `False`
*          `new_start`:  `False`
*            `no_fifo`:  `False`
*           `no_scale`:  `False`
*      `output_parent`:  `/project/shefflab/processed//pepatac/gold_atac/results_pipeline`
*         `paired_end`:  `True`
*        `peak_caller`:  `macs2`
*          `peak_type`:  `fixed`
*      `prealignments`:  `['rCRSd', 'human_repeats']`
*         `prioritize`:  `False`
*            `recover`:  `False`
*        `sample_name`:  `gold2`
*             `silent`:  `False`
*   `single_or_paired`:  `PAIRED`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

The lock has been created in the split second since the last lock existence check. Waiting
Waiting for file lock: /project/shefflab/genomes/lock.genomes.yaml .......... File unlocked
Local input file: /project/shefflab/data/sra_fastq//SRR5210450_1.fastq.gz
Local input file: /project/shefflab/data/sra_fastq//SRR5210450_2.fastq.gz

> `File_mb`	1604	2	_RES_

> `Read_type`	PAIRED	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-14 14:34:54) elapsed: 17.0 _TIME_

Number of input file sets: 2
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210450_1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz` (24564)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.019GB.  
  PID: 24564;	Command: ln;	Return code: 0;	Memory used: 0.019GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210450_2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz` (24604)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.019GB.  
  PID: 24604;	Command: ln;	Return code: 0;	Memory used: 0.001GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1.fastq.gz', 'ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2.fastq.gz']
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1.fastq.gz`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2.fastq.gz`  

> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1.fastq.gz` (24643)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.019GB.  
  PID: 24643;	Command: ln;	Return code: 0;	Memory used: 0.001GB


> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/gold2_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2.fastq.gz` (24684)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.019GB.  
  PID: 24684;	Command: ln;	Return code: 0;	Memory used: 0.002GB


> `Raw_reads`	28408648	PEPATAC	_RES_

> `Fastq_reads`	28408648	PEPATAC	_RES_

### Adapter trimming:  (09-14 14:35:41) elapsed: 47.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq`  

> `skewer -f sanger -t 32 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2.fastq.gz` (25637)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
.--. .-.
: .--': :.-.
`. `. : `'.' .--. .-..-..-. .--. .--.
_`, :: . `.' '_.': `; `; :' '_.': ..'
`.__.':_;:_;`.__.'`.__.__.'`.__.':_;
skewer v0.2.2 [April 4, 2016]
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
-- number of concurrent threads (-t):	32
Mon Sep 14 14:35:41 2020[0;32m >> started[0m

Mon Sep 14 14:36:13 2020[0;32m >> done[0m (31.733s)
14204324 read pairs processed; of these:
      75 ( 0.00%) short read pairs filtered out after trimming by size control
      19 ( 0.00%) empty read pairs filtered out after trimming by size control
14204230 (100.00%) read pairs available; of these:
 2196177 (15.46%) trimmed read pairs available after processing
12008053 (84.54%) untrimmed read pairs available after processing
log has been saved to "/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2-trimmed.log".
</pre>
Command completed. Elapsed time: 0:00:32. Running peak memory: 0.05GB.  
  PID: 25637;	Command: skewer;	Return code: 0;	Memory used: 0.05GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2-trimmed-pair1.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq` (25744)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.05GB.  
  PID: 25744;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2-trimmed-pair2.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim.fastq` (25745)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.05GB.  
  PID: 25745;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	28408460	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq` (25878)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold2_R1_trim.fastq
Approx 5% complete for gold2_R1_trim.fastq
Approx 10% complete for gold2_R1_trim.fastq
Approx 15% complete for gold2_R1_trim.fastq
Approx 20% complete for gold2_R1_trim.fastq
Approx 25% complete for gold2_R1_trim.fastq
Approx 30% complete for gold2_R1_trim.fastq
Approx 35% complete for gold2_R1_trim.fastq
Approx 40% complete for gold2_R1_trim.fastq
Approx 45% complete for gold2_R1_trim.fastq
Approx 50% complete for gold2_R1_trim.fastq
Approx 55% complete for gold2_R1_trim.fastq
Approx 60% complete for gold2_R1_trim.fastq
Approx 65% complete for gold2_R1_trim.fastq
Approx 70% complete for gold2_R1_trim.fastq
Approx 75% complete for gold2_R1_trim.fastq
Approx 80% complete for gold2_R1_trim.fastq
Approx 85% complete for gold2_R1_trim.fastq
Approx 90% complete for gold2_R1_trim.fastq
Approx 95% complete for gold2_R1_trim.fastq
Analysis complete for gold2_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:43. Running peak memory: 0.277GB.  
  PID: 25878;	Command: fastqc;	Return code: 0;	Memory used: 0.277GB

> `FastQC report r1`	fastq/gold2_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim.fastq` (26001)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold2_R2_trim.fastq
Approx 5% complete for gold2_R2_trim.fastq
Approx 10% complete for gold2_R2_trim.fastq
Approx 15% complete for gold2_R2_trim.fastq
Approx 20% complete for gold2_R2_trim.fastq
Approx 25% complete for gold2_R2_trim.fastq
Approx 30% complete for gold2_R2_trim.fastq
Approx 35% complete for gold2_R2_trim.fastq
Approx 40% complete for gold2_R2_trim.fastq
Approx 45% complete for gold2_R2_trim.fastq
Approx 50% complete for gold2_R2_trim.fastq
Approx 55% complete for gold2_R2_trim.fastq
Approx 60% complete for gold2_R2_trim.fastq
Approx 65% complete for gold2_R2_trim.fastq
Approx 70% complete for gold2_R2_trim.fastq
Approx 75% complete for gold2_R2_trim.fastq
Approx 80% complete for gold2_R2_trim.fastq
Approx 85% complete for gold2_R2_trim.fastq
Approx 90% complete for gold2_R2_trim.fastq
Approx 95% complete for gold2_R2_trim.fastq
Analysis complete for gold2_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:44. Running peak memory: 0.362GB.  
  PID: 26001;	Command: fastqc;	Return code: 0;	Memory used: 0.362GB

> `FastQC report r2`	fastq/gold2_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-14 14:37:44) elapsed: 123.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-14 14:37:44) elapsed: 0.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2` (26125)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.362GB.  
  PID: 26125;	Command: mkfifo;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R2_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq` (26164)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id gold2 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2_R1_trim.fastq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log` (26165)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:01:38. Running peak memory: 0.362GB.  
  PID: 26165;	Command: bowtie2;	Return code: 0;	Memory used: 0.182GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	11074130.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	38.98	PEPATAC	_RES_

### Map to human_repeats (09-14 14:39:22) elapsed: 99.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2` (26988)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.362GB.  
  PID: 26988;	Command: mkfifo;	Return code: 0;	Memory used: 0.014GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq` (27028)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id gold2 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_bt_aln_summary.log` (27030)
<pre>
not gzipping output
5537065 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:01:06. Running peak memory: 0.362GB.  
  PID: 27030;	Command: bowtie2;	Return code: 0;	Memory used: 0.24GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	1147860.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	4.04	PEPATAC	_RES_

### Compress all unmapped read files (09-14 14:40:29) elapsed: 67.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq` (27529)
<pre>
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.362GB.  
  PID: 27529;	Command: pigz;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq` (27613)
<pre>
573930 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 0.362GB.  
  PID: 27613;	Command: pigz;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq` (27691)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 0.362GB.  
  PID: 27691;	Command: pigz;	Return code: 0;	Memory used: 0.046GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq` (27768)
<pre>
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.362GB.  
  PID: 27768;	Command: pigz;	Return code: 0;	Memory used: 0.048GB


### Map to genome (09-14 14:40:51) elapsed: 22.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam`  

> `bowtie2 -p 32  --very-sensitive -X 2000 --rg-id gold2 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R1.fq.gz -2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/gold2_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmpywkp7_bu -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam` (27845,27846,27853)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
8093235 reads; of these:
  8093235 (100.00%) were paired; of these:
    98118 (1.21%) aligned concordantly 0 times
    6798259 (84.00%) aligned concordantly exactly 1 time
    1196858 (14.79%) aligned concordantly >1 times
    ----
    98118 pairs aligned concordantly 0 times; of these:
      5881 (5.99%) aligned discordantly 1 time
    ----
    92237 pairs aligned 0 times concordantly or discordantly; of these:
      184474 mates make up the pairs; of these:
        116839 (63.34%) aligned 0 times
        41901 (22.71%) aligned exactly 1 time
        25734 (13.95%) aligned >1 times
99.28% overall alignment rate
[bam_sort_core] merging from 4 files and 1 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:05:36. Running peak memory: 4.123GB.  
  PID: 27845;	Command: bowtie2;	Return code: 0;	Memory used: 4.123GB  
  PID: 27846;	Command: samtools;	Return code: 0;	Memory used: 0.021GB  
  PID: 27853;	Command: samtools;	Return code: 0;	Memory used: 0.889GB


> `samtools view -b -q 10 -@ 32 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_fail_qc.bam -f 2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam` (28544)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:10. Running peak memory: 4.123GB.  
  PID: 28544;	Command: samtools;	Return code: 0;	Memory used: 0.054GB

[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mapped_reads`	16069631	PEPATAC	_RES_

> `QC_filtered_reads`	1124479	PEPATAC	_RES_

> `Aligned_reads`	14945152	PEPATAC	_RES_

> `Alignment_rate`	52.61	PEPATAC	_RES_

> `Total_efficiency`	52.61	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam.bai`  

> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam` (28727)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 4.123GB.  
  PID: 28727;	Command: samtools;	Return code: 0;	Memory used: 0.029GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam` (28773)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 4.123GB.  
  PID: 28773;	Command: samtools;	Return code: 0;	Memory used: 0.028GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mitochondrial_reads`	801	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_noMT.bam`  

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/chr_sizes.bed` (28943,28944,28946,28953)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.123GB.  
  PID: 28943;	Command: samtools;	Return code: 0;	Memory used: 0.028GB  
  PID: 28946;	Command: awk;	Return code: 0;	Memory used: 0.01GB  
  PID: 28944;	Command: cut;	Return code: 0;	Memory used: 0.014GB  
  PID: 28953;	Command: grep;	Return code: 0;	Memory used: 0.016GB


> `samtools view -L /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/chr_sizes.bed -b -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_noMT.bam` (29104)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 4.123GB.  
  PID: 29104;	Command: samtools;	Return code: 0;	Memory used: 0.054GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_noMT.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam` (29187)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.123GB.  
  PID: 29187;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam` (29188)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 4.123GB.  
  PID: 29188;	Command: samtools;	Return code: 0;	Memory used: 0.029GB


### Calculate NRF, PBC1, and PBC2 (09-14 14:47:18) elapsed: 387.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam -c 32 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv` (29239)
<pre>
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/tmp_gold2_sort_ydts9_e0'
Processing with 32 cores...
Merging 128 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:00:09. Running peak memory: 4.123GB.  
  PID: 29239;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 2.785GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_bamQC.tsv`

> `NRF`	0.93	PEPATAC	_RES_

> `PBC1`	0.96	PEPATAC	_RES_

> `PBC2`	27.69	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_unmap.bam`  

> `samtools view -b -@ 32 -f 12  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_unmap.bam` (29437)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.123GB.  
  PID: 29437;	Command: samtools;	Return code: 0;	Memory used: 0.033GB


> `samtools view -c -f 4 -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Unmapped_reads`	116839	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-14 14:47:30) elapsed: 12.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam`  

> `samtools sort -n -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmptrcdrhev /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam | samtools view -h - -@ 8 | samblaster -r --ignoreUnmated 2> /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmptrcdrhev -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam` (29590,29591,29593,29600,29611)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[bam_sort_core] merging from 0 files and 8 in-memory blocks...
[bam_sort_core] merging from 0 files and 8 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 4.123GB.  
  PID: 29590;	Command: samtools;	Return code: 0;	Memory used: 3.707GB  
  PID: 29593;	Command: samblaster;	Return code: 0;	Memory used: 0.051GB  
  PID: 29591;	Command: samtools;	Return code: 0;	Memory used: 0.018GB  
  PID: 29611;	Command: samtools;	Return code: 0;	Memory used: 3.351GB  
  PID: 29600;	Command: samtools;	Return code: 0;	Memory used: 0.028GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam` (29899)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 4.123GB.  
  PID: 29899;	Command: samtools;	Return code: 0;	Memory used: 0.03GB


> `grep 'Removed' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	272965	PEPATAC	_RES_

> `Dedup_aligned_reads`	14672187.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	51.65	PEPATAC	_RES_

> `Dedup_total_efficiency`	51.65	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Read_length`	50	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-14 14:48:31) elapsed: 61.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_out.txt`  

> `preseq c_curve -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_out.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam` (30349)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 7472539
COUNTS_SUM      = 7472539
DISTINCT READS  = 7.01806e+06
DISTINCT COUNTS = 36
MAX COUNT       = 138
COUNTS OF 1     = 6.62211e+06
OBSERVED COUNTS (139)
1	6622113
2	354238
3	31920
4	6415
5	1966
6	758
7	325
8	129
9	75
10	39
11	27
12	12
13	9
14	2
15	6
16	2
17	4
18	1
19	1
21	1
22	1
23	1
24	1
33	1
34	1
35	1
38	1
39	2
41	1
45	1
47	1
58	1
73	1
75	2
107	1
138	1

sample size: 1000000
sample size: 2000000
sample size: 3000000
sample size: 4000000
sample size: 5000000
sample size: 6000000
sample size: 7000000
</pre>
Command completed. Elapsed time: 0:01:57. Running peak memory: 4.123GB.  
  PID: 30349;	Command: preseq;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt`  

> `preseq lc_extrap -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam` (30810)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 7472539
DISTINCT READS  = 7.01806e+06
DISTINCT COUNTS = 36
MAX COUNT       = 138
COUNTS OF 1     = 6.62211e+06
MAX TERMS       = 18
OBSERVED COUNTS (139)
1	6622113
2	354238
3	31920
4	6415
5	1966
6	758
7	325
8	129
9	75
10	39
11	27
12	12
13	9
14	2
15	6
16	2
17	4
18	1
19	1
21	1
22	1
23	1
24	1
33	1
34	1
35	1
38	1
39	2
41	1
45	1
47	1
58	1
73	1
75	2
107	1
138	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
........._............._................_._.............................................................
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:01:57. Running peak memory: 4.123GB.  
  PID: 30810;	Command: preseq;	Return code: 0;	Memory used: 0.024GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_counts.txt`  

> `echo '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort.bam)' '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam) > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_counts.txt` (31009)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:12. Running peak memory: 4.123GB.  
  PID: 31009;	Command: echo;	Return code: 0;	Memory used: 0.023GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_plot.pdf`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_plot.png`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt -r /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_counts.txt -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_plot` (31107)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Processing gold2
INFO: Found real counts for gold2 - Total (M): 14.945076 Unique (M): 14.399146

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 4.123GB.  
  PID: 31107;	Command: Rscript;	Return code: 0;	Memory used: 0.086GB

> `Library complexity`	QC_hg38/gold2_preseq_plot.pdf	Library complexity	QC_hg38/gold2_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '^10000000' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9219	PEPATAC	_RES_

### Produce signal tracks (09-14 14:52:49) elapsed: 258.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_exact.bw`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_smooth.bw`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact -b /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_exact.bw -w /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_smooth.bw -m atac -p 21 --variable-step --scale 14945152.0` (31298)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/tmp_gold2_sort_dedup_cuttrace_oadn5do0'
Processing with 10 cores...
psutil.NoSuchProcess process no longer exists (pid=31943)
Warning: couldn't add memory use for process: 31298
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
psutil.NoSuchProcess process no longer exists (pid=37773)
Warning: couldn't add memory use for process: 31298
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Reduce step (merge files)...
Merging 128 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_exact.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Merging 128 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_smooth.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:07:22. Running peak memory: 4.123GB.  
  PID: 31298;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 3.471GB


### Calculate TSS enrichment (09-14 15:00:11) elapsed: 442.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.txt`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 32 -z -v -s 6 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.txt` (59422)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 4.123GB.  
  PID: 59422;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 3.055GB

Missing stat 'TSS_score'

> `TSS_score`	13.1	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.txt` (59497)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help

Generating TSS plot with /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 4.123GB.  
  PID: 59497;	Command: Rscript;	Return code: 0;	Memory used: 0.341GB

> `TSS enrichment`	QC_hg38/gold2_TSS_enrichment.pdf	TSS enrichment	QC_hg38/gold2_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-14 15:00:22) elapsed: 11.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_sort_dedup.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLen.txt` (59603)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:36. Running peak memory: 4.123GB.  
  PID: 59603;	Command: perl;	Return code: 0;	Memory used: 0.021GB


> `sort -n  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLen.txt | uniq -c  > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragCount.txt` (59683,59684)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 4.123GB.  
  PID: 59683;	Command: sort;	Return code: 0;	Memory used: 0.923GB  
  PID: 59684;	Command: uniq;	Return code: 0;	Memory used: 0.021GB


> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLen.txt -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragCount.txt -p /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLenDistribution.pdf -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/QC_hg38/gold2_fragLenDistribution.txt` (59776)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 4.123GB.  
  PID: 59776;	Command: Rscript;	Return code: 0;	Memory used: 0.341GB

> `Fragment distribution`	QC_hg38/gold2_fragLenDistribution.pdf	Fragment distribution	QC_hg38/gold2_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed.gz` (59899)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.123GB.  
  PID: 59899;	Command: ln;	Return code: 0;	Memory used: 0.001GB


> `pigz -f -p 32 -d -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed.gz > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed` (59939)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.123GB.  
  PID: 59939;	Command: pigz;	Return code: 0;	Memory used: 0.021GB


### Call peaks (09-14 15:01:07) elapsed: 44.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks.narrowPeak`  

> `macs2 callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38 -n gold2 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (59984)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
INFO  @ Mon, 14 Sep 2020 15:01:09: 
# Command line: callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38 -n gold2 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = gold2
# format = BED
# ChIP-seq file = ['/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed']
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
 
INFO  @ Mon, 14 Sep 2020 15:01:09: #1 read tag files... 
INFO  @ Mon, 14 Sep 2020 15:01:09: #1 read treatment tags... 
INFO  @ Mon, 14 Sep 2020 15:01:09:  1000000 
INFO  @ Mon, 14 Sep 2020 15:01:10:  2000000 
INFO  @ Mon, 14 Sep 2020 15:01:10:  3000000 
INFO  @ Mon, 14 Sep 2020 15:01:11:  4000000 
INFO  @ Mon, 14 Sep 2020 15:01:12:  5000000 
INFO  @ Mon, 14 Sep 2020 15:01:12:  6000000 
INFO  @ Mon, 14 Sep 2020 15:01:13:  7000000 
INFO  @ Mon, 14 Sep 2020 15:01:13:  8000000 
INFO  @ Mon, 14 Sep 2020 15:01:14:  9000000 
INFO  @ Mon, 14 Sep 2020 15:01:14:  10000000 
INFO  @ Mon, 14 Sep 2020 15:01:15:  11000000 
INFO  @ Mon, 14 Sep 2020 15:01:16:  12000000 
INFO  @ Mon, 14 Sep 2020 15:01:16:  13000000 
INFO  @ Mon, 14 Sep 2020 15:01:17:  14000000 
INFO  @ Mon, 14 Sep 2020 15:01:17: #1 tag size is determined as 50 bps 
INFO  @ Mon, 14 Sep 2020 15:01:17: #1 tag size = 50.0 
INFO  @ Mon, 14 Sep 2020 15:01:17: #1  total tags in treatment: 14399137 
INFO  @ Mon, 14 Sep 2020 15:01:17: #1 finished! 
INFO  @ Mon, 14 Sep 2020 15:01:17: #2 Build Peak Model... 
INFO  @ Mon, 14 Sep 2020 15:01:17: #2 Skipped... 
INFO  @ Mon, 14 Sep 2020 15:01:17: #2 Use 150 as fragment length 
INFO  @ Mon, 14 Sep 2020 15:01:17: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 14 Sep 2020 15:01:17: #3 Call peaks... 
INFO  @ Mon, 14 Sep 2020 15:01:17: # local lambda is disabled! 
INFO  @ Mon, 14 Sep 2020 15:01:17: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 14 Sep 2020 15:01:17: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 14 Sep 2020 15:01:17: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 14 Sep 2020 15:01:17: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 14 Sep 2020 15:01:30: #3 Call peaks for each chromosome... 
INFO  @ Mon, 14 Sep 2020 15:03:55: #4 Write output xls file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks.xls 
INFO  @ Mon, 14 Sep 2020 15:03:57: #4 Write peak in narrowPeak format file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks.narrowPeak 
INFO  @ Mon, 14 Sep 2020 15:03:58: #4 Write summits bed file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_summits.bed 
INFO  @ Mon, 14 Sep 2020 15:03:58: Done! 
</pre>
Command completed. Elapsed time: 0:02:52. Running peak memory: 4.123GB.  
  PID: 59984;	Command: macs2;	Return code: 0;	Memory used: 0.32GB


> `Peak_count`	420249	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38_exact/gold2_shift.bed.gz` (60357)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.123GB.  
  PID: 60357;	Command: pigz;	Return code: 0;	Memory used: 0.046GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks.narrowPeak > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks_fixedWidth.narrowPeak` (60433)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 4.123GB.  
  PID: 60433;	Command: awk;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/peak_calling_hg38/gold2_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (60476)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Error in setorderv(final, cols = c("chr", "start")) : 
  some columns are not in the data.table: chr,start
Calls: <Anonymous> -> setorderv
Execution halted
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 4.123GB.  
  PID: 60476;	Command: Rscript;	Return code: 1;	Memory used: 0.328GB

Child process 26164 (perl) was already terminated.
Child process 27028 (perl) was already terminated.
Starting cleanup: 10 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Conditional flag found: []

These conditional files were left in place:

- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/gold2*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/fastq/*.log
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/tmp_tl9ayf9
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/rCRSd_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/tmpczr1ywwq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/prealignments/human_repeats_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmpywkp7_bu
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam.bai
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/chr_sizes.bed
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/gold2_temp.bam
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/aligned_hg38/tmptrcdrhev
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold2/raw/hg38_annotations.bed

### Pipeline failed at:  (09-14 15:04:09) elapsed: 182.0 _TIME_

Total time: 0:29:55
Failure reason: Subprocess returned nonzero result. Check above output for details
Traceback (most recent call last):
  File "/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py", line 2481, in <module>
    sys.exit(main())
  File "/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py", line 1842, in main
    pm.run(cmd, norm_peak_file, nofail=False)
  File "/home/jps3dp/.local/lib/python3.7/site-packages/pypiper/manager.py", line 785, in run
    self.callprint(cmd, shell, lock_file, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python3.7/site-packages/pypiper/manager.py", line 1028, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python3.7/site-packages/pypiper/manager.py", line 2131, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python3.7/site-packages/pypiper/manager.py", line 1660, in fail_pipeline
    raise exc
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details
