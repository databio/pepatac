### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --sample-name gold5 --genome hg38 --input /project/shefflab/data/sra_fastq//SRR5210390_1.fastq.gz --single-or-paired PAIRED -O /project/shefflab/processed//pepatac/gold_atac/results_pipeline -P 32 -M 24000 --input2 /project/shefflab/data/sra_fastq//SRR5210390_2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --blacklist /nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-aj38-15c0
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/
*  Pipeline started at:   (09-14 14:36:07) elapsed: 1.0 _TIME_

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
*              `input`:  `['/project/shefflab/data/sra_fastq//SRR5210390_1.fastq.gz']`
*             `input2`:  `['/project/shefflab/data/sra_fastq//SRR5210390_2.fastq.gz']`
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
*        `sample_name`:  `gold5`
*             `silent`:  `False`
*   `single_or_paired`:  `PAIRED`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

Local input file: /project/shefflab/data/sra_fastq//SRR5210390_1.fastq.gz
Local input file: /project/shefflab/data/sra_fastq//SRR5210390_2.fastq.gz

> `File_mb`	3272	2	_RES_

> `Read_type`	PAIRED	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-14 14:36:07) elapsed: 1.0 _TIME_

Number of input file sets: 2
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R1.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210390_1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R1.fastq.gz` (233774)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.001GB.  
  PID: 233774;	Command: ln;	Return code: 0;	Memory used: 0.001GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R1.fastq.gz'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R2.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210390_2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R2.fastq.gz` (233814)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.002GB.  
  PID: 233814;	Command: ln;	Return code: 0;	Memory used: 0.002GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1.fastq.gz', 'ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2.fastq.gz']
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1.fastq.gz`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2.fastq.gz`  

> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1.fastq.gz` (233855)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.002GB.  
  PID: 233855;	Command: ln;	Return code: 0;	Memory used: 0.001GB


> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/gold5_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2.fastq.gz` (233897)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.002GB.  
  PID: 233897;	Command: ln;	Return code: 0;	Memory used: 0.002GB


> `Raw_reads`	104881014	PEPATAC	_RES_

> `Fastq_reads`	104881014	PEPATAC	_RES_

### Adapter trimming:  (09-14 14:37:47) elapsed: 100.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1_trim.fastq`  

> `skewer -f sanger -t 32 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2.fastq.gz` (234744)
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
Mon Sep 14 14:37:47 2020[0;32m >> started[0m

Mon Sep 14 14:39:22 2020[0;32m >> done[0m (94.839s)
52440507 read pairs processed; of these:
     310 ( 0.00%) short read pairs filtered out after trimming by size control
     356 ( 0.00%) empty read pairs filtered out after trimming by size control
52439841 (100.00%) read pairs available; of these:
 3403982 ( 6.49%) trimmed read pairs available after processing
49035859 (93.51%) untrimmed read pairs available after processing
log has been saved to "/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5-trimmed.log".
</pre>
Command completed. Elapsed time: 0:01:35. Running peak memory: 0.05GB.  
  PID: 234744;	Command: skewer;	Return code: 0;	Memory used: 0.05GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5-trimmed-pair1.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1_trim.fastq` (235251)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.05GB.  
  PID: 235251;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5-trimmed-pair2.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2_trim.fastq` (235252)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.05GB.  
  PID: 235252;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	104879682	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1_trim.fastq` (235391)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold5_R1_trim.fastq
Approx 5% complete for gold5_R1_trim.fastq
Approx 10% complete for gold5_R1_trim.fastq
Approx 15% complete for gold5_R1_trim.fastq
Approx 20% complete for gold5_R1_trim.fastq
Approx 25% complete for gold5_R1_trim.fastq
Approx 30% complete for gold5_R1_trim.fastq
Approx 35% complete for gold5_R1_trim.fastq
Approx 40% complete for gold5_R1_trim.fastq
Approx 45% complete for gold5_R1_trim.fastq
Approx 50% complete for gold5_R1_trim.fastq
Approx 55% complete for gold5_R1_trim.fastq
Approx 60% complete for gold5_R1_trim.fastq
Approx 65% complete for gold5_R1_trim.fastq
Approx 70% complete for gold5_R1_trim.fastq
Approx 75% complete for gold5_R1_trim.fastq
Approx 80% complete for gold5_R1_trim.fastq
Approx 85% complete for gold5_R1_trim.fastq
Approx 90% complete for gold5_R1_trim.fastq
Approx 95% complete for gold5_R1_trim.fastq
Analysis complete for gold5_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:02:05. Running peak memory: 0.258GB.  
  PID: 235391;	Command: fastqc;	Return code: 0;	Memory used: 0.258GB

> `FastQC report r1`	fastq/gold5_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2_trim.fastq` (235832)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold5_R2_trim.fastq
Approx 5% complete for gold5_R2_trim.fastq
Approx 10% complete for gold5_R2_trim.fastq
Approx 15% complete for gold5_R2_trim.fastq
Approx 20% complete for gold5_R2_trim.fastq
Approx 25% complete for gold5_R2_trim.fastq
Approx 30% complete for gold5_R2_trim.fastq
Approx 35% complete for gold5_R2_trim.fastq
Approx 40% complete for gold5_R2_trim.fastq
Approx 45% complete for gold5_R2_trim.fastq
Approx 50% complete for gold5_R2_trim.fastq
Approx 55% complete for gold5_R2_trim.fastq
Approx 60% complete for gold5_R2_trim.fastq
Approx 65% complete for gold5_R2_trim.fastq
Approx 70% complete for gold5_R2_trim.fastq
Approx 75% complete for gold5_R2_trim.fastq
Approx 80% complete for gold5_R2_trim.fastq
Approx 85% complete for gold5_R2_trim.fastq
Approx 90% complete for gold5_R2_trim.fastq
Approx 95% complete for gold5_R2_trim.fastq
Analysis complete for gold5_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:02:09. Running peak memory: 0.258GB.  
  PID: 235832;	Command: fastqc;	Return code: 0;	Memory used: 0.25GB

> `FastQC report r2`	fastq/gold5_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-14 14:43:48) elapsed: 361.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-14 14:43:48) elapsed: 0.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/rCRSd_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/rCRSd_bt2` (236045)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.258GB.  
  PID: 236045;	Command: mkfifo;	Return code: 0;	Memory used: 0.019GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/rCRSd_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R2_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq` (236085)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id gold5 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5_R1_trim.fastq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/rCRSd_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log` (236086)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:06:04. Running peak memory: 0.258GB.  
  PID: 236086;	Command: bowtie2;	Return code: 0;	Memory used: 0.17GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	19947382.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	19.02	PEPATAC	_RES_

### Map to human_repeats (09-14 14:49:52) elapsed: 364.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/human_repeats_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/human_repeats_bt2` (236815)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.258GB.  
  PID: 236815;	Command: mkfifo;	Return code: 0;	Memory used: 0.002GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/human_repeats_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq` (236856)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id gold5 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/human_repeats_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log` (236857)
<pre>
not gzipping output
9973691 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:05:46. Running peak memory: 0.258GB.  
  PID: 236857;	Command: bowtie2;	Return code: 0;	Memory used: 0.158GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	5705260.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	5.44	PEPATAC	_RES_

### Compress all unmapped read files (09-14 14:55:39) elapsed: 347.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq` (237831)
<pre>
2852630 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:36. Running peak memory: 0.258GB.  
  PID: 237831;	Command: pigz;	Return code: 0;	Memory used: 0.047GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq` (237946)
<pre>
</pre>
Command completed. Elapsed time: 0:00:26. Running peak memory: 0.258GB.  
  PID: 237946;	Command: pigz;	Return code: 0;	Memory used: 0.048GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq` (238041)
<pre>
</pre>
Command completed. Elapsed time: 0:00:31. Running peak memory: 0.258GB.  
  PID: 238041;	Command: pigz;	Return code: 0;	Memory used: 0.048GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq` (238150)
<pre>
</pre>
Command completed. Elapsed time: 0:00:27. Running peak memory: 0.258GB.  
  PID: 238150;	Command: pigz;	Return code: 0;	Memory used: 0.052GB


### Map to genome (09-14 14:57:39) elapsed: 120.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam`  

> `bowtie2 -p 32  --very-sensitive -X 2000 --rg-id gold5 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq.gz -2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/tmp1svm180z -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam` (238250,238251,238253)
<pre>
psutil.NoSuchProcess process no longer exists (pid=238290)
Warning: couldn't add memory use for process: 238253
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
39613520 reads; of these:
  39613520 (100.00%) were paired; of these:
    1047402 (2.64%) aligned concordantly 0 times
    33145660 (83.67%) aligned concordantly exactly 1 time
    5420458 (13.68%) aligned concordantly >1 times
    ----
    1047402 pairs aligned concordantly 0 times; of these:
      28651 (2.74%) aligned discordantly 1 time
    ----
    1018751 pairs aligned 0 times concordantly or discordantly; of these:
      2037502 mates make up the pairs; of these:
        1375826 (67.53%) aligned 0 times
        418072 (20.52%) aligned exactly 1 time
        243604 (11.96%) aligned >1 times
98.26% overall alignment rate
[bam_sort_core] merging from 19 files and 1 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:24:06. Running peak memory: 4.097GB.  
  PID: 238250;	Command: bowtie2;	Return code: 0;	Memory used: 4.097GB  
  PID: 238251;	Command: samtools;	Return code: 0;	Memory used: 0.019GB  
  PID: 238253;	Command: samtools;	Return code: 0;	Memory used: 0.894GB


> `samtools view -b -q 10 -@ 32 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_fail_qc.bam -f 2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam` (241392)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:59. Running peak memory: 4.097GB.  
  PID: 241392;	Command: samtools;	Return code: 0;	Memory used: 0.051GB

[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mapped_reads`	77851214	PEPATAC	_RES_

> `QC_filtered_reads`	5811232	PEPATAC	_RES_

> `Aligned_reads`	72039982	PEPATAC	_RES_

> `Alignment_rate`	68.69	PEPATAC	_RES_

> `Total_efficiency`	68.69	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam.bai`  

> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam` (241655)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 4.097GB.  
  PID: 241655;	Command: samtools;	Return code: 0;	Memory used: 0.029GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam` (241716)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:21. Running peak memory: 4.097GB.  
  PID: 241716;	Command: samtools;	Return code: 0;	Memory used: 0.029GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mitochondrial_reads`	8198	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_noMT.bam`  

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/chr_sizes.bed` (241904,241905,241907,241918)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.097GB.  
  PID: 241904;	Command: samtools;	Return code: 0;	Memory used: 0.032GB  
  PID: 241907;	Command: awk;	Return code: 0;	Memory used: 0.013GB  
  PID: 241905;	Command: cut;	Return code: 0;	Memory used: 0.002GB  
  PID: 241918;	Command: grep;	Return code: 0;	Memory used: 0.015GB


> `samtools view -L /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/chr_sizes.bed -b -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_noMT.bam` (242068)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:46. Running peak memory: 4.097GB.  
  PID: 242068;	Command: samtools;	Return code: 0;	Memory used: 0.05GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_noMT.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam` (242185)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.097GB.  
  PID: 242185;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam` (242187)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:55. Running peak memory: 4.097GB.  
  PID: 242187;	Command: samtools;	Return code: 0;	Memory used: 0.029GB


### Calculate NRF, PBC1, and PBC2 (09-14 15:25:52) elapsed: 1693.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_bamQC.tsv`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam -c 32 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_bamQC.tsv` (242474)
<pre>
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/tmp_gold5_sort__rjrsqfc'
Processing with 32 cores...
Merging 142 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:01:13. Running peak memory: 4.097GB.  
  PID: 242474;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 2.989GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_bamQC.tsv`

> `NRF`	0.94	PEPATAC	_RES_

> `PBC1`	0.97	PEPATAC	_RES_

> `PBC2`	32.2	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_unmap.bam`  

> `samtools view -b -@ 32 -f 12  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_unmap.bam` (242740)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 4.097GB.  
  PID: 242740;	Command: samtools;	Return code: 0;	Memory used: 0.031GB


> `samtools view -c -f 4 -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Unmapped_reads`	1375826	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-14 15:27:18) elapsed: 85.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam`  

> `samtools sort -n -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/tmp48rd6c1e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam | samtools view -h - -@ 8 | samblaster -r --ignoreUnmated 2> /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/tmp48rd6c1e -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam` (242900,242901,242903,242910,242918)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:03:53. Running peak memory: 6.985GB.  
  PID: 242903;	Command: samblaster;	Return code: 0;	Memory used: 0.66GB  
  PID: 242900;	Command: samtools;	Return code: 0;	Memory used: 6.985GB  
  PID: 242910;	Command: samtools;	Return code: 0;	Memory used: 0.025GB  
  PID: 242901;	Command: samtools;	Return code: 0;	Memory used: 0.023GB  
  PID: 242918;	Command: samtools;	Return code: 0;	Memory used: 6.983GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam` (243730)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 6.985GB.  
  PID: 243730;	Command: samtools;	Return code: 0;	Memory used: 0.028GB


> `grep 'Removed' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	1264637	PEPATAC	_RES_

> `Dedup_aligned_reads`	70775345.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	67.48	PEPATAC	_RES_

> `Dedup_total_efficiency`	67.48	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Read_length`	42	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-14 15:32:45) elapsed: 327.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_out.txt`  

> `preseq c_curve -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_out.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam` (244224)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 36019106
COUNTS_SUM      = 36019106
DISTINCT READS  = 3.15776e+07
DISTINCT COUNTS = 115
MAX COUNT       = 1149
COUNTS OF 1     = 2.86969e+07
OBSERVED COUNTS (1150)
1	28696928
2	2131321
3	416563
4	157636
5	74689
6	39470
7	22110
8	13271
9	8325
10	5281
11	3507
12	2393
13	1624
14	1165
15	786
16	577
17	414
18	311
19	251
20	184
21	136
22	97
23	89
24	65
25	64
26	37
27	34
28	28
29	22
30	22
31	25
32	18
33	9
34	9
35	8
36	10
37	9
38	7
39	5
40	2
41	3
42	6
43	5
44	6
45	2
46	3
47	2
48	3
49	2
50	3
51	3
52	3
53	1
54	3
55	2
57	2
59	3
61	1
62	1
63	4
64	1
65	3
66	4
70	2
71	1
72	1
73	1
76	1
77	2
81	2
82	2
83	2
85	1
88	1
91	2
94	1
101	2
103	1
104	1
105	3
107	1
108	1
111	1
114	1
122	1
127	1
128	1
129	1
132	1
135	1
136	1
139	1
143	1
146	1
148	1
151	1
156	1
175	1
196	1
198	1
214	1
223	1
234	1
256	1
312	1
338	1
340	1
343	1
409	1
552	1
592	1
595	1
913	1
1003	1
1149	1

sample size: 1000000
sample size: 2000000
sample size: 3000000
sample size: 4000000
sample size: 5000000
sample size: 6000000
sample size: 7000000
sample size: 8000000
sample size: 9000000
sample size: 10000000
sample size: 11000000
sample size: 12000000
sample size: 13000000
sample size: 14000000
sample size: 15000000
sample size: 16000000
sample size: 17000000
sample size: 18000000
sample size: 19000000
sample size: 20000000
sample size: 21000000
sample size: 22000000
sample size: 23000000
sample size: 24000000
sample size: 25000000
sample size: 26000000
sample size: 27000000
sample size: 28000000
sample size: 29000000
sample size: 30000000
sample size: 31000000
sample size: 32000000
sample size: 33000000
sample size: 34000000
sample size: 35000000
sample size: 36000000
</pre>
Command completed. Elapsed time: 0:08:42. Running peak memory: 6.985GB.  
  PID: 244224;	Command: preseq;	Return code: 0;	Memory used: 0.025GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_yield.txt`  

> `preseq lc_extrap -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_yield.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam` (245330)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 36019106
DISTINCT READS  = 3.15776e+07
DISTINCT COUNTS = 115
MAX COUNT       = 1149
COUNTS OF 1     = 2.86969e+07
MAX TERMS       = 54
OBSERVED COUNTS (1150)
1	28696928
2	2131321
3	416563
4	157636
5	74689
6	39470
7	22110
8	13271
9	8325
10	5281
11	3507
12	2393
13	1624
14	1165
15	786
16	577
17	414
18	311
19	251
20	184
21	136
22	97
23	89
24	65
25	64
26	37
27	34
28	28
29	22
30	22
31	25
32	18
33	9
34	9
35	8
36	10
37	9
38	7
39	5
40	2
41	3
42	6
43	5
44	6
45	2
46	3
47	2
48	3
49	2
50	3
51	3
52	3
53	1
54	3
55	2
57	2
59	3
61	1
62	1
63	4
64	1
65	3
66	4
70	2
71	1
72	1
73	1
76	1
77	2
81	2
82	2
83	2
85	1
88	1
91	2
94	1
101	2
103	1
104	1
105	3
107	1
108	1
111	1
114	1
122	1
127	1
128	1
129	1
132	1
135	1
136	1
139	1
143	1
146	1
148	1
151	1
156	1
175	1
196	1
198	1
214	1
223	1
234	1
256	1
312	1
338	1
340	1
343	1
409	1
552	1
592	1
595	1
913	1
1003	1
1149	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
........._........_.................................._...._.................._..................._........
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:08:37. Running peak memory: 6.985GB.  
  PID: 245330;	Command: preseq;	Return code: 0;	Memory used: 0.023GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_counts.txt`  

> `echo '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_yield.txt '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort.bam)' '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam) > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_counts.txt` (246389)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:40. Running peak memory: 6.985GB.  
  PID: 246389;	Command: echo;	Return code: 0;	Memory used: 0.023GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_plot.pdf`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_plot.png`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_yield.txt -r /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_counts.txt -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_plot` (246510)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Processing gold5
INFO: Found real counts for gold5 - Total (M): 72.038212 Unique (M): 69.508938

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:17. Running peak memory: 6.985GB.  
  PID: 246510;	Command: Rscript;	Return code: 0;	Memory used: 0.339GB

> `Library complexity`	QC_hg38/gold5_preseq_plot.pdf	Library complexity	QC_hg38/gold5_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '^10000000' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9511	PEPATAC	_RES_

### Produce signal tracks (09-14 15:51:00) elapsed: 1096.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_exact.bw`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_smooth.bw`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact -b /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_exact.bw -w /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_smooth.bw -m atac -p 21 --variable-step --scale 72039982.0` (246714)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/tmp_gold5_sort_dedup_cuttrace_qftpt8mj'
Processing with 10 cores...
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
psutil.NoSuchProcess process no longer exists (pid=249401)
Warning: couldn't add memory use for process: 246714
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
Merging 142 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_exact.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Merging 142 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_smooth.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:10:43. Running peak memory: 6.985GB.  
  PID: 246714;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 5.473GB


### Calculate TSS enrichment (09-14 16:01:43) elapsed: 643.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_TSS_enrichment.txt`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 32 -z -v -s 6 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_TSS_enrichment.txt` (8909)
<pre>
</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 6.985GB.  
  PID: 8909;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 2.606GB

Missing stat 'TSS_score'

> `TSS_score`	13.6	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_TSS_enrichment.txt` (8987)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help

Generating TSS plot with /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 6.985GB.  
  PID: 8987;	Command: Rscript;	Return code: 0;	Memory used: 0.249GB

> `TSS enrichment`	QC_hg38/gold5_TSS_enrichment.pdf	TSS enrichment	QC_hg38/gold5_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-14 16:01:59) elapsed: 16.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_sort_dedup.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragLen.txt` (9091)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:02:52. Running peak memory: 6.985GB.  
  PID: 9091;	Command: perl;	Return code: 0;	Memory used: 0.021GB


> `sort -n  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragLen.txt | uniq -c  > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragCount.txt` (9301,9302)
<pre>
</pre>
Command completed. Elapsed time: 0:00:10. Running peak memory: 6.985GB.  
  PID: 9301;	Command: sort;	Return code: 0;	Memory used: 4.266GB  
  PID: 9302;	Command: uniq;	Return code: 0;	Memory used: 0.02GB


> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragLen.txt -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragCount.txt -p /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragLenDistribution.pdf -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/QC_hg38/gold5_fragLenDistribution.txt` (9405)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 6.985GB.  
  PID: 9405;	Command: Rscript;	Return code: 0;	Memory used: 0.252GB

> `Fragment distribution`	QC_hg38/gold5_fragLenDistribution.pdf	Fragment distribution	QC_hg38/gold5_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/hg38_annotations.bed.gz` (9719)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 6.985GB.  
  PID: 9719;	Command: ln;	Return code: 0;	Memory used: 0.002GB


> `pigz -f -p 32 -d -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/hg38_annotations.bed.gz > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/hg38_annotations.bed` (9758)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 6.985GB.  
  PID: 9758;	Command: pigz;	Return code: 0;	Memory used: 0.019GB


### Call peaks (09-14 16:05:09) elapsed: 191.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks.narrowPeak`  

> `macs2 callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38 -n gold5 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (9802)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
INFO  @ Mon, 14 Sep 2020 16:05:12: 
# Command line: callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38 -n gold5 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = gold5
# format = BED
# ChIP-seq file = ['/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed']
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
 
INFO  @ Mon, 14 Sep 2020 16:05:12: #1 read tag files... 
INFO  @ Mon, 14 Sep 2020 16:05:12: #1 read treatment tags... 
INFO  @ Mon, 14 Sep 2020 16:05:13:  1000000 
INFO  @ Mon, 14 Sep 2020 16:05:13:  2000000 
INFO  @ Mon, 14 Sep 2020 16:05:14:  3000000 
INFO  @ Mon, 14 Sep 2020 16:05:14:  4000000 
INFO  @ Mon, 14 Sep 2020 16:05:15:  5000000 
INFO  @ Mon, 14 Sep 2020 16:05:16:  6000000 
INFO  @ Mon, 14 Sep 2020 16:05:16:  7000000 
INFO  @ Mon, 14 Sep 2020 16:05:17:  8000000 
INFO  @ Mon, 14 Sep 2020 16:05:17:  9000000 
INFO  @ Mon, 14 Sep 2020 16:05:18:  10000000 
INFO  @ Mon, 14 Sep 2020 16:05:19:  11000000 
INFO  @ Mon, 14 Sep 2020 16:05:19:  12000000 
INFO  @ Mon, 14 Sep 2020 16:05:20:  13000000 
INFO  @ Mon, 14 Sep 2020 16:05:21:  14000000 
INFO  @ Mon, 14 Sep 2020 16:05:21:  15000000 
INFO  @ Mon, 14 Sep 2020 16:05:22:  16000000 
INFO  @ Mon, 14 Sep 2020 16:05:22:  17000000 
INFO  @ Mon, 14 Sep 2020 16:05:23:  18000000 
INFO  @ Mon, 14 Sep 2020 16:05:24:  19000000 
INFO  @ Mon, 14 Sep 2020 16:05:24:  20000000 
INFO  @ Mon, 14 Sep 2020 16:05:25:  21000000 
INFO  @ Mon, 14 Sep 2020 16:05:26:  22000000 
INFO  @ Mon, 14 Sep 2020 16:05:26:  23000000 
INFO  @ Mon, 14 Sep 2020 16:05:27:  24000000 
INFO  @ Mon, 14 Sep 2020 16:05:28:  25000000 
INFO  @ Mon, 14 Sep 2020 16:05:28:  26000000 
INFO  @ Mon, 14 Sep 2020 16:05:29:  27000000 
INFO  @ Mon, 14 Sep 2020 16:05:29:  28000000 
INFO  @ Mon, 14 Sep 2020 16:05:30:  29000000 
INFO  @ Mon, 14 Sep 2020 16:05:31:  30000000 
INFO  @ Mon, 14 Sep 2020 16:05:31:  31000000 
INFO  @ Mon, 14 Sep 2020 16:05:32:  32000000 
INFO  @ Mon, 14 Sep 2020 16:05:33:  33000000 
INFO  @ Mon, 14 Sep 2020 16:05:33:  34000000 
INFO  @ Mon, 14 Sep 2020 16:05:34:  35000000 
INFO  @ Mon, 14 Sep 2020 16:05:34:  36000000 
INFO  @ Mon, 14 Sep 2020 16:05:35:  37000000 
INFO  @ Mon, 14 Sep 2020 16:05:36:  38000000 
INFO  @ Mon, 14 Sep 2020 16:05:36:  39000000 
INFO  @ Mon, 14 Sep 2020 16:05:37:  40000000 
INFO  @ Mon, 14 Sep 2020 16:05:38:  41000000 
INFO  @ Mon, 14 Sep 2020 16:05:38:  42000000 
INFO  @ Mon, 14 Sep 2020 16:05:39:  43000000 
INFO  @ Mon, 14 Sep 2020 16:05:39:  44000000 
INFO  @ Mon, 14 Sep 2020 16:05:40:  45000000 
INFO  @ Mon, 14 Sep 2020 16:05:41:  46000000 
INFO  @ Mon, 14 Sep 2020 16:05:41:  47000000 
INFO  @ Mon, 14 Sep 2020 16:05:42:  48000000 
INFO  @ Mon, 14 Sep 2020 16:05:42:  49000000 
INFO  @ Mon, 14 Sep 2020 16:05:43:  50000000 
INFO  @ Mon, 14 Sep 2020 16:05:44:  51000000 
INFO  @ Mon, 14 Sep 2020 16:05:44:  52000000 
INFO  @ Mon, 14 Sep 2020 16:05:45:  53000000 
INFO  @ Mon, 14 Sep 2020 16:05:45:  54000000 
INFO  @ Mon, 14 Sep 2020 16:05:46:  55000000 
INFO  @ Mon, 14 Sep 2020 16:05:47:  56000000 
INFO  @ Mon, 14 Sep 2020 16:05:47:  57000000 
INFO  @ Mon, 14 Sep 2020 16:05:48:  58000000 
INFO  @ Mon, 14 Sep 2020 16:05:49:  59000000 
INFO  @ Mon, 14 Sep 2020 16:05:49:  60000000 
INFO  @ Mon, 14 Sep 2020 16:05:50:  61000000 
INFO  @ Mon, 14 Sep 2020 16:05:50:  62000000 
INFO  @ Mon, 14 Sep 2020 16:05:51:  63000000 
INFO  @ Mon, 14 Sep 2020 16:05:52:  64000000 
INFO  @ Mon, 14 Sep 2020 16:05:52:  65000000 
INFO  @ Mon, 14 Sep 2020 16:05:53:  66000000 
INFO  @ Mon, 14 Sep 2020 16:05:53:  67000000 
INFO  @ Mon, 14 Sep 2020 16:05:54:  68000000 
INFO  @ Mon, 14 Sep 2020 16:05:55:  69000000 
INFO  @ Mon, 14 Sep 2020 16:05:56: #1 tag size is determined as 50 bps 
INFO  @ Mon, 14 Sep 2020 16:05:56: #1 tag size = 50.0 
INFO  @ Mon, 14 Sep 2020 16:05:56: #1  total tags in treatment: 69508899 
INFO  @ Mon, 14 Sep 2020 16:05:56: #1 finished! 
INFO  @ Mon, 14 Sep 2020 16:05:56: #2 Build Peak Model... 
INFO  @ Mon, 14 Sep 2020 16:05:56: #2 Skipped... 
INFO  @ Mon, 14 Sep 2020 16:05:56: #2 Use 150 as fragment length 
INFO  @ Mon, 14 Sep 2020 16:05:56: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 14 Sep 2020 16:05:56: #3 Call peaks... 
INFO  @ Mon, 14 Sep 2020 16:05:56: # local lambda is disabled! 
INFO  @ Mon, 14 Sep 2020 16:05:56: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 14 Sep 2020 16:05:56: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 14 Sep 2020 16:05:56: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 14 Sep 2020 16:05:56: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 14 Sep 2020 16:06:55: #3 Call peaks for each chromosome... 
INFO  @ Mon, 14 Sep 2020 16:08:57: #4 Write output xls file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks.xls 
INFO  @ Mon, 14 Sep 2020 16:08:58: #4 Write peak in narrowPeak format file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks.narrowPeak 
INFO  @ Mon, 14 Sep 2020 16:08:59: #4 Write summits bed file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_summits.bed 
INFO  @ Mon, 14 Sep 2020 16:09:00: Done! 
</pre>
Command completed. Elapsed time: 0:03:50. Running peak memory: 6.985GB.  
  PID: 9802;	Command: macs2;	Return code: 0;	Memory used: 0.748GB


> `Peak_count`	285312	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38_exact/gold5_shift.bed.gz` (10265)
<pre>
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 6.985GB.  
  PID: 10265;	Command: pigz;	Return code: 0;	Memory used: 0.049GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks.narrowPeak > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks_fixedWidth.narrowPeak` (10351)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 6.985GB.  
  PID: 10351;	Command: awk;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/peak_calling_hg38/gold5_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (10393)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Error in setorderv(final, cols = c("chr", "start")) : 
  some columns are not in the data.table: chr,start
Calls: <Anonymous> -> setorderv
Execution halted
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 6.985GB.  
  PID: 10393;	Command: Rscript;	Return code: 1;	Memory used: 0.248GB

Child process 236085 (perl) was already terminated.
Child process 236856 (perl) was already terminated.
Starting cleanup: 10 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Conditional flag found: []

These conditional files were left in place:

- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/gold5*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/fastq/*.log
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/tmprtxyveqp
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/rCRSd_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/tmph_1dx0dc
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/prealignments/human_repeats_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/tmp1svm180z
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam.bai
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/chr_sizes.bed
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/gold5_temp.bam
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/aligned_hg38/tmp48rd6c1e
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold5/raw/hg38_annotations.bed

### Pipeline failed at:  (09-14 16:09:15) elapsed: 246.0 _TIME_

Total time: 1:33:09
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
