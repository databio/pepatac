### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --sample-name gold1 --genome hg38 --input /project/shefflab/data/sra_fastq//SRR5210416_1.fastq.gz --single-or-paired PAIRED -O /project/shefflab/processed//pepatac/gold_atac/results_pipeline -P 32 -M 24000 --input2 /project/shefflab/data/sra_fastq//SRR5210416_2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --blacklist /nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-ba26-33c0
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/
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
*              `input`:  `['/project/shefflab/data/sra_fastq//SRR5210416_1.fastq.gz']`
*             `input2`:  `['/project/shefflab/data/sra_fastq//SRR5210416_2.fastq.gz']`
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
*        `sample_name`:  `gold1`
*             `silent`:  `False`
*   `single_or_paired`:  `PAIRED`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

The lock has been created in the split second since the last lock existence check. Waiting
Waiting for file lock: /project/shefflab/genomes/lock.genomes.yaml ........... File unlocked
Local input file: /project/shefflab/data/sra_fastq//SRR5210416_1.fastq.gz
Local input file: /project/shefflab/data/sra_fastq//SRR5210416_2.fastq.gz

> `File_mb`	6493	2	_RES_

> `Read_type`	PAIRED	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-14 14:34:59) elapsed: 22.0 _TIME_

Number of input file sets: 2
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R1.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210416_1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R1.fastq.gz` (58419)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.018GB.  
  PID: 58419;	Command: ln;	Return code: 0;	Memory used: 0.018GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R1.fastq.gz'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R2.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210416_2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R2.fastq.gz` (58460)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.02GB.  
  PID: 58460;	Command: ln;	Return code: 0;	Memory used: 0.02GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1.fastq.gz', 'ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2.fastq.gz']
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1.fastq.gz`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2.fastq.gz`  

> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1.fastq.gz` (58498)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.02GB.  
  PID: 58498;	Command: ln;	Return code: 0;	Memory used: 0.018GB


> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/gold1_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2.fastq.gz` (58539)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.02GB.  
  PID: 58539;	Command: ln;	Return code: 0;	Memory used: 0.018GB


> `Raw_reads`	137944752	PEPATAC	_RES_

> `Fastq_reads`	137944752	PEPATAC	_RES_

### Adapter trimming:  (09-14 14:38:14) elapsed: 195.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1_trim.fastq`  

> `skewer -f sanger -t 32 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2.fastq.gz` (59832)
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
Mon Sep 14 14:38:14 2020[0;32m >> started[0m

Mon Sep 14 14:42:04 2020[0;32m >> done[0m (229.916s)
68972376 read pairs processed; of these:
    1333 ( 0.00%) short read pairs filtered out after trimming by size control
    8642 ( 0.01%) empty read pairs filtered out after trimming by size control
68962401 (99.99%) read pairs available; of these:
27985138 (40.58%) trimmed read pairs available after processing
40977263 (59.42%) untrimmed read pairs available after processing
log has been saved to "/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1-trimmed.log".
</pre>
Command completed. Elapsed time: 0:03:50. Running peak memory: 0.05GB.  
  PID: 59832;	Command: skewer;	Return code: 0;	Memory used: 0.05GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1-trimmed-pair1.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1_trim.fastq` (60392)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.05GB.  
  PID: 60392;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1-trimmed-pair2.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2_trim.fastq` (60393)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.05GB.  
  PID: 60393;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	137924802	PEPATAC	_RES_

> `Trim_loss_rate`	0.01	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1_trim.fastq` (60543)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold1_R1_trim.fastq
Approx 5% complete for gold1_R1_trim.fastq
Approx 10% complete for gold1_R1_trim.fastq
Approx 15% complete for gold1_R1_trim.fastq
Approx 20% complete for gold1_R1_trim.fastq
Approx 25% complete for gold1_R1_trim.fastq
Approx 30% complete for gold1_R1_trim.fastq
Approx 35% complete for gold1_R1_trim.fastq
Approx 40% complete for gold1_R1_trim.fastq
Approx 45% complete for gold1_R1_trim.fastq
Approx 50% complete for gold1_R1_trim.fastq
Approx 55% complete for gold1_R1_trim.fastq
Approx 60% complete for gold1_R1_trim.fastq
Approx 65% complete for gold1_R1_trim.fastq
Approx 70% complete for gold1_R1_trim.fastq
Approx 75% complete for gold1_R1_trim.fastq
Approx 80% complete for gold1_R1_trim.fastq
Approx 85% complete for gold1_R1_trim.fastq
Approx 90% complete for gold1_R1_trim.fastq
Approx 95% complete for gold1_R1_trim.fastq
Analysis complete for gold1_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:03:53. Running peak memory: 0.273GB.  
  PID: 60543;	Command: fastqc;	Return code: 0;	Memory used: 0.273GB

> `FastQC report r1`	fastq/gold1_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2_trim.fastq` (61021)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold1_R2_trim.fastq
Approx 5% complete for gold1_R2_trim.fastq
Approx 10% complete for gold1_R2_trim.fastq
Approx 15% complete for gold1_R2_trim.fastq
Approx 20% complete for gold1_R2_trim.fastq
Approx 25% complete for gold1_R2_trim.fastq
Approx 30% complete for gold1_R2_trim.fastq
Approx 35% complete for gold1_R2_trim.fastq
Approx 40% complete for gold1_R2_trim.fastq
Approx 45% complete for gold1_R2_trim.fastq
Approx 50% complete for gold1_R2_trim.fastq
Approx 55% complete for gold1_R2_trim.fastq
Approx 60% complete for gold1_R2_trim.fastq
Approx 65% complete for gold1_R2_trim.fastq
Approx 70% complete for gold1_R2_trim.fastq
Approx 75% complete for gold1_R2_trim.fastq
Approx 80% complete for gold1_R2_trim.fastq
Approx 85% complete for gold1_R2_trim.fastq
Approx 90% complete for gold1_R2_trim.fastq
Approx 95% complete for gold1_R2_trim.fastq
Analysis complete for gold1_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:03:53. Running peak memory: 0.283GB.  
  PID: 61021;	Command: fastqc;	Return code: 0;	Memory used: 0.283GB

> `FastQC report r2`	fastq/gold1_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-14 14:50:04) elapsed: 710.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-14 14:50:04) elapsed: 0.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/rCRSd_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/rCRSd_bt2` (61656)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.283GB.  
  PID: 61656;	Command: mkfifo;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/rCRSd_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R2_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq` (61698)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id gold1 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1_R1_trim.fastq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/rCRSd_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log` (61699)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:09:27. Running peak memory: 0.283GB.  
  PID: 61699;	Command: bowtie2;	Return code: 0;	Memory used: 0.21GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to human_repeats (09-14 14:59:31) elapsed: 567.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/human_repeats_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/human_repeats_bt2` (62566)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.283GB.  
  PID: 62566;	Command: mkfifo;	Return code: 0;	Memory used: 0.02GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/human_repeats_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq` (62606)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id gold1 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/human_repeats_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log` (62607)
<pre>
not gzipping output
10524950 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:08:19. Running peak memory: 0.283GB.  
  PID: 62607;	Command: bowtie2;	Return code: 0;	Memory used: 0.219GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	9761740.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	7.08	PEPATAC	_RES_

### Compress all unmapped read files (09-14 15:07:51) elapsed: 499.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq` (63746)
<pre>
4880870 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:45. Running peak memory: 0.283GB.  
  PID: 63746;	Command: pigz;	Return code: 0;	Memory used: 0.046GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq` (63862)
<pre>
</pre>
Command completed. Elapsed time: 0:00:42. Running peak memory: 0.283GB.  
  PID: 63862;	Command: pigz;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq` (63970)
<pre>
</pre>
Command completed. Elapsed time: 0:00:36. Running peak memory: 0.283GB.  
  PID: 63970;	Command: pigz;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq` (64079)
<pre>
</pre>
Command completed. Elapsed time: 0:00:36. Running peak memory: 0.283GB.  
  PID: 64079;	Command: pigz;	Return code: 0;	Memory used: 0.048GB


### Map to genome (09-14 15:10:31) elapsed: 160.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam`  

> `bowtie2 -p 32  --very-sensitive -X 2000 --rg-id gold1 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq.gz -2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/tmppflrp2u7 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam` (64473,64474,64476)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
53556581 reads; of these:
  53556581 (100.00%) were paired; of these:
    2185848 (4.08%) aligned concordantly 0 times
    42794874 (79.91%) aligned concordantly exactly 1 time
    8575859 (16.01%) aligned concordantly >1 times
    ----
    2185848 pairs aligned concordantly 0 times; of these:
      62234 (2.85%) aligned discordantly 1 time
    ----
    2123614 pairs aligned 0 times concordantly or discordantly; of these:
      4247228 mates make up the pairs; of these:
        3342300 (78.69%) aligned 0 times
        584641 (13.77%) aligned exactly 1 time
        320287 (7.54%) aligned >1 times
96.88% overall alignment rate
[bam_sort_core] merging from 32 files and 1 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:35:41. Running peak memory: 4.311GB.  
  PID: 64473;	Command: bowtie2;	Return code: 0;	Memory used: 4.311GB  
  PID: 64474;	Command: samtools;	Return code: 0;	Memory used: 0.025GB  
  PID: 64476;	Command: samtools;	Return code: 0;	Memory used: 0.888GB


> `samtools view -b -q 10 -@ 32 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_fail_qc.bam -f 2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam` (68272)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:01:24. Running peak memory: 4.311GB.  
  PID: 68272;	Command: samtools;	Return code: 0;	Memory used: 0.053GB

[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mapped_reads`	103770862	PEPATAC	_RES_

> `QC_filtered_reads`	8341982	PEPATAC	_RES_

> `Aligned_reads`	95428880	PEPATAC	_RES_

> `Alignment_rate`	69.19	PEPATAC	_RES_

> `Total_efficiency`	69.18	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam.bai`  

> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam` (68567)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:41. Running peak memory: 4.311GB.  
  PID: 68567;	Command: samtools;	Return code: 0;	Memory used: 0.025GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam` (68643)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 4.311GB.  
  PID: 68643;	Command: samtools;	Return code: 0;	Memory used: 0.028GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mitochondrial_reads`	14500	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_noMT.bam`  

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/chr_sizes.bed` (69103,69104,69111,69123)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.311GB.  
  PID: 69103;	Command: samtools;	Return code: 0;	Memory used: 0.028GB  
  PID: 69111;	Command: awk;	Return code: 0;	Memory used: 0.002GB  
  PID: 69104;	Command: cut;	Return code: 0;	Memory used: 0.014GB  
  PID: 69123;	Command: grep;	Return code: 0;	Memory used: 0.004GB


> `samtools view -L /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/chr_sizes.bed -b -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_noMT.bam` (69265)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:54. Running peak memory: 4.311GB.  
  PID: 69265;	Command: samtools;	Return code: 0;	Memory used: 0.053GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_noMT.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam` (69391)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.311GB.  
  PID: 69391;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam` (69393)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:38. Running peak memory: 4.311GB.  
  PID: 69393;	Command: samtools;	Return code: 0;	Memory used: 0.027GB


### Calculate NRF, PBC1, and PBC2 (09-14 15:51:38) elapsed: 2468.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_bamQC.tsv`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam -c 32 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_bamQC.tsv` (69466)
<pre>
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/tmp_gold1_sort_ie8n37mz'
Processing with 32 cores...
Merging 145 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:01:35. Running peak memory: 4.328GB.  
  PID: 69466;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 4.328GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_bamQC.tsv`

> `NRF`	0.94	PEPATAC	_RES_

> `PBC1`	0.97	PEPATAC	_RES_

> `PBC2`	32.71	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_unmap.bam`  

> `samtools view -b -@ 32 -f 12  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_unmap.bam` (69738)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 4.328GB.  
  PID: 69738;	Command: samtools;	Return code: 0;	Memory used: 0.038GB


> `samtools view -c -f 4 -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Unmapped_reads`	3342300	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-14 15:53:34) elapsed: 116.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam`  

> `samtools sort -n -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/tmpt25x08ue /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam | samtools view -h - -@ 8 | samblaster -r --ignoreUnmated 2> /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/tmpt25x08ue -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam` (69910,69911,69917,69928,69932)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:05:40. Running peak memory: 7.112GB.  
  PID: 69910;	Command: samtools;	Return code: 0;	Memory used: 7.112GB  
  PID: 69917;	Command: samblaster;	Return code: 0;	Memory used: 0.731GB  
  PID: 69911;	Command: samtools;	Return code: 0;	Memory used: 0.02GB  
  PID: 69928;	Command: samtools;	Return code: 0;	Memory used: 0.024GB  
  PID: 69932;	Command: samtools;	Return code: 0;	Memory used: 6.906GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam` (70740)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:36. Running peak memory: 7.112GB.  
  PID: 70740;	Command: samtools;	Return code: 0;	Memory used: 0.025GB


> `grep 'Removed' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	2001987	PEPATAC	_RES_

> `Dedup_aligned_reads`	93426893.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	67.74	PEPATAC	_RES_

> `Dedup_total_efficiency`	67.73	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Read_length`	76	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-14 16:02:02) elapsed: 508.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_out.txt`  

> `preseq c_curve -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_out.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam` (71626)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 47714314
COUNTS_SUM      = 47714314
DISTINCT READS  = 4.3109e+07
DISTINCT COUNTS = 145
MAX COUNT       = 1783
COUNTS OF 1     = 3.97156e+07
OBSERVED COUNTS (1784)
1	39715641
2	2780427
3	379082
4	113592
5	50538
6	26236
7	15018
8	8972
9	5664
10	3711
11	2511
12	1777
13	1297
14	1005
15	710
16	558
17	430
18	266
19	230
20	187
21	161
22	131
23	110
24	83
25	86
26	72
27	52
28	46
29	27
30	43
31	20
32	28
33	17
34	16
35	11
36	13
37	12
38	10
39	13
40	3
41	7
42	7
43	12
44	6
45	5
46	8
47	4
48	5
49	9
50	4
51	7
52	4
53	4
54	3
55	3
56	3
57	1
58	2
59	4
61	2
62	1
63	4
64	3
65	4
66	1
67	2
68	4
69	2
70	3
71	1
72	1
73	4
74	1
75	3
76	2
77	1
78	2
79	3
80	2
81	1
83	3
84	1
89	1
90	3
94	2
95	2
96	2
97	1
98	1
99	1
100	1
104	1
105	2
106	1
108	1
109	1
110	1
112	1
115	2
118	1
121	2
126	1
128	1
130	2
131	1
137	1
138	1
141	1
142	1
144	2
145	1
146	1
147	1
148	1
152	1
157	1
164	1
168	1
169	1
179	1
183	1
184	1
187	1
188	1
197	1
237	1
244	1
245	1
253	1
278	1
292	1
333	1
347	1
350	1
379	1
478	1
532	1
550	1
605	1
644	1
673	1
733	1
1337	1
1540	1
1783	1

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
sample size: 37000000
sample size: 38000000
sample size: 39000000
sample size: 40000000
sample size: 41000000
sample size: 42000000
sample size: 43000000
sample size: 44000000
sample size: 45000000
sample size: 46000000
sample size: 47000000
</pre>
Command completed. Elapsed time: 0:12:44. Running peak memory: 7.112GB.  
  PID: 71626;	Command: preseq;	Return code: 0;	Memory used: 0.023GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_yield.txt`  

> `preseq lc_extrap -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_yield.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam` (72825)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 47714314
DISTINCT READS  = 4.3109e+07
DISTINCT COUNTS = 145
MAX COUNT       = 1783
COUNTS OF 1     = 3.97156e+07
MAX TERMS       = 58
OBSERVED COUNTS (1784)
1	39715641
2	2780427
3	379082
4	113592
5	50538
6	26236
7	15018
8	8972
9	5664
10	3711
11	2511
12	1777
13	1297
14	1005
15	710
16	558
17	430
18	266
19	230
20	187
21	161
22	131
23	110
24	83
25	86
26	72
27	52
28	46
29	27
30	43
31	20
32	28
33	17
34	16
35	11
36	13
37	12
38	10
39	13
40	3
41	7
42	7
43	12
44	6
45	5
46	8
47	4
48	5
49	9
50	4
51	7
52	4
53	4
54	3
55	3
56	3
57	1
58	2
59	4
61	2
62	1
63	4
64	3
65	4
66	1
67	2
68	4
69	2
70	3
71	1
72	1
73	4
74	1
75	3
76	2
77	1
78	2
79	3
80	2
81	1
83	3
84	1
89	1
90	3
94	2
95	2
96	2
97	1
98	1
99	1
100	1
104	1
105	2
106	1
108	1
109	1
110	1
112	1
115	2
118	1
121	2
126	1
128	1
130	2
131	1
137	1
138	1
141	1
142	1
144	2
145	1
146	1
147	1
148	1
152	1
157	1
164	1
168	1
169	1
179	1
183	1
184	1
187	1
188	1
197	1
237	1
244	1
245	1
253	1
278	1
292	1
333	1
347	1
350	1
379	1
478	1
532	1
550	1
605	1
644	1
673	1
733	1
1337	1
1540	1
1783	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
._.._..........._....._.........._._........_._............_..._._...._....._.............._......_.._._._........._...
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:12:48. Running peak memory: 7.112GB.  
  PID: 72825;	Command: preseq;	Return code: 0;	Memory used: 0.027GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_counts.txt`  

> `echo '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_yield.txt '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort.bam)' '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam) > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_counts.txt` (74217)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:01:04. Running peak memory: 7.112GB.  
  PID: 74217;	Command: echo;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_plot.pdf`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_plot.png`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_yield.txt -r /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_counts.txt -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_plot` (74358)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Processing gold1
INFO: Found real counts for gold1 - Total (M): 95.428628 Unique (M): 91.424654

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:13. Running peak memory: 7.112GB.  
  PID: 74358;	Command: Rscript;	Return code: 0;	Memory used: 0.062GB

> `Library complexity`	QC_hg38/gold1_preseq_plot.pdf	Library complexity	QC_hg38/gold1_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '^10000000' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9721	PEPATAC	_RES_

### Produce signal tracks (09-14 16:28:51) elapsed: 1609.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_exact.bw`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_smooth.bw`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact -b /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_exact.bw -w /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_smooth.bw -m atac -p 21 --variable-step --scale 95428880.0` (74548)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/tmp_gold1_sort_dedup_cuttrace_zfgfthu1'
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
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
psutil.NoSuchProcess process no longer exists (pid=92815)
Warning: couldn't add memory use for process: 74548
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
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
Merging 145 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_exact.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Merging 145 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_smooth.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:11:25. Running peak memory: 7.112GB.  
  PID: 74548;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 3.876GB


### Calculate TSS enrichment (09-14 16:40:16) elapsed: 685.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_TSS_enrichment.txt`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 32 -z -v -s 6 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_TSS_enrichment.txt` (106609)
<pre>
</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 7.112GB.  
  PID: 106609;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 2.618GB

Missing stat 'TSS_score'

> `TSS_score`	9.3	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_TSS_enrichment.txt` (106689)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help

Generating TSS plot with /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 7.112GB.  
  PID: 106689;	Command: Rscript;	Return code: 0;	Memory used: 0.251GB

> `TSS enrichment`	QC_hg38/gold1_TSS_enrichment.pdf	TSS enrichment	QC_hg38/gold1_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-14 16:40:34) elapsed: 18.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_sort_dedup.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragLen.txt` (106790)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:03:42. Running peak memory: 7.112GB.  
  PID: 106790;	Command: perl;	Return code: 0;	Memory used: 0.023GB


> `sort -n  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragLen.txt | uniq -c  > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragCount.txt` (107021,107022)
<pre>
</pre>
Command completed. Elapsed time: 0:00:13. Running peak memory: 7.112GB.  
  PID: 107021;	Command: sort;	Return code: 0;	Memory used: 4.74GB  
  PID: 107022;	Command: uniq;	Return code: 0;	Memory used: 0.022GB


> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragLen.txt -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragCount.txt -p /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragLenDistribution.pdf -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/QC_hg38/gold1_fragLenDistribution.txt` (107129)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 7.112GB.  
  PID: 107129;	Command: Rscript;	Return code: 0;	Memory used: 0.312GB

> `Fragment distribution`	QC_hg38/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg38/gold1_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/hg38_annotations.bed.gz` (107243)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 7.112GB.  
  PID: 107243;	Command: ln;	Return code: 0;	Memory used: 0.018GB


> `pigz -f -p 32 -d -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/hg38_annotations.bed.gz > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/hg38_annotations.bed` (107283)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 7.112GB.  
  PID: 107283;	Command: pigz;	Return code: 0;	Memory used: 0.003GB


### Call peaks (09-14 16:44:37) elapsed: 243.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks.narrowPeak`  

> `macs2 callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38 -n gold1 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (107328)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
INFO  @ Mon, 14 Sep 2020 16:44:41: 
# Command line: callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38 -n gold1 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = gold1
# format = BED
# ChIP-seq file = ['/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed']
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
 
INFO  @ Mon, 14 Sep 2020 16:44:41: #1 read tag files... 
INFO  @ Mon, 14 Sep 2020 16:44:41: #1 read treatment tags... 
INFO  @ Mon, 14 Sep 2020 16:44:42:  1000000 
INFO  @ Mon, 14 Sep 2020 16:44:42:  2000000 
INFO  @ Mon, 14 Sep 2020 16:44:43:  3000000 
INFO  @ Mon, 14 Sep 2020 16:44:43:  4000000 
INFO  @ Mon, 14 Sep 2020 16:44:44:  5000000 
INFO  @ Mon, 14 Sep 2020 16:44:44:  6000000 
INFO  @ Mon, 14 Sep 2020 16:44:45:  7000000 
INFO  @ Mon, 14 Sep 2020 16:44:46:  8000000 
INFO  @ Mon, 14 Sep 2020 16:44:46:  9000000 
INFO  @ Mon, 14 Sep 2020 16:44:47:  10000000 
INFO  @ Mon, 14 Sep 2020 16:44:47:  11000000 
INFO  @ Mon, 14 Sep 2020 16:44:48:  12000000 
INFO  @ Mon, 14 Sep 2020 16:44:48:  13000000 
INFO  @ Mon, 14 Sep 2020 16:44:49:  14000000 
INFO  @ Mon, 14 Sep 2020 16:44:50:  15000000 
INFO  @ Mon, 14 Sep 2020 16:44:50:  16000000 
INFO  @ Mon, 14 Sep 2020 16:44:51:  17000000 
INFO  @ Mon, 14 Sep 2020 16:44:51:  18000000 
INFO  @ Mon, 14 Sep 2020 16:44:52:  19000000 
INFO  @ Mon, 14 Sep 2020 16:44:53:  20000000 
INFO  @ Mon, 14 Sep 2020 16:44:53:  21000000 
INFO  @ Mon, 14 Sep 2020 16:44:54:  22000000 
INFO  @ Mon, 14 Sep 2020 16:44:54:  23000000 
INFO  @ Mon, 14 Sep 2020 16:44:55:  24000000 
INFO  @ Mon, 14 Sep 2020 16:44:55:  25000000 
INFO  @ Mon, 14 Sep 2020 16:44:56:  26000000 
INFO  @ Mon, 14 Sep 2020 16:44:57:  27000000 
INFO  @ Mon, 14 Sep 2020 16:44:57:  28000000 
INFO  @ Mon, 14 Sep 2020 16:44:58:  29000000 
INFO  @ Mon, 14 Sep 2020 16:44:58:  30000000 
INFO  @ Mon, 14 Sep 2020 16:44:59:  31000000 
INFO  @ Mon, 14 Sep 2020 16:44:59:  32000000 
INFO  @ Mon, 14 Sep 2020 16:45:00:  33000000 
INFO  @ Mon, 14 Sep 2020 16:45:01:  34000000 
INFO  @ Mon, 14 Sep 2020 16:45:01:  35000000 
INFO  @ Mon, 14 Sep 2020 16:45:02:  36000000 
INFO  @ Mon, 14 Sep 2020 16:45:02:  37000000 
INFO  @ Mon, 14 Sep 2020 16:45:03:  38000000 
INFO  @ Mon, 14 Sep 2020 16:45:04:  39000000 
INFO  @ Mon, 14 Sep 2020 16:45:04:  40000000 
INFO  @ Mon, 14 Sep 2020 16:45:05:  41000000 
INFO  @ Mon, 14 Sep 2020 16:45:05:  42000000 
INFO  @ Mon, 14 Sep 2020 16:45:06:  43000000 
INFO  @ Mon, 14 Sep 2020 16:45:06:  44000000 
INFO  @ Mon, 14 Sep 2020 16:45:07:  45000000 
INFO  @ Mon, 14 Sep 2020 16:45:08:  46000000 
INFO  @ Mon, 14 Sep 2020 16:45:08:  47000000 
INFO  @ Mon, 14 Sep 2020 16:45:09:  48000000 
INFO  @ Mon, 14 Sep 2020 16:45:09:  49000000 
INFO  @ Mon, 14 Sep 2020 16:45:10:  50000000 
INFO  @ Mon, 14 Sep 2020 16:45:10:  51000000 
INFO  @ Mon, 14 Sep 2020 16:45:11:  52000000 
INFO  @ Mon, 14 Sep 2020 16:45:12:  53000000 
INFO  @ Mon, 14 Sep 2020 16:45:12:  54000000 
INFO  @ Mon, 14 Sep 2020 16:45:13:  55000000 
INFO  @ Mon, 14 Sep 2020 16:45:13:  56000000 
INFO  @ Mon, 14 Sep 2020 16:45:14:  57000000 
INFO  @ Mon, 14 Sep 2020 16:45:15:  58000000 
INFO  @ Mon, 14 Sep 2020 16:45:15:  59000000 
INFO  @ Mon, 14 Sep 2020 16:45:16:  60000000 
INFO  @ Mon, 14 Sep 2020 16:45:16:  61000000 
INFO  @ Mon, 14 Sep 2020 16:45:17:  62000000 
INFO  @ Mon, 14 Sep 2020 16:45:17:  63000000 
INFO  @ Mon, 14 Sep 2020 16:45:18:  64000000 
INFO  @ Mon, 14 Sep 2020 16:45:19:  65000000 
INFO  @ Mon, 14 Sep 2020 16:45:19:  66000000 
INFO  @ Mon, 14 Sep 2020 16:45:20:  67000000 
INFO  @ Mon, 14 Sep 2020 16:45:20:  68000000 
INFO  @ Mon, 14 Sep 2020 16:45:21:  69000000 
INFO  @ Mon, 14 Sep 2020 16:45:22:  70000000 
INFO  @ Mon, 14 Sep 2020 16:45:22:  71000000 
INFO  @ Mon, 14 Sep 2020 16:45:23:  72000000 
INFO  @ Mon, 14 Sep 2020 16:45:23:  73000000 
INFO  @ Mon, 14 Sep 2020 16:45:24:  74000000 
INFO  @ Mon, 14 Sep 2020 16:45:24:  75000000 
INFO  @ Mon, 14 Sep 2020 16:45:25:  76000000 
INFO  @ Mon, 14 Sep 2020 16:45:26:  77000000 
INFO  @ Mon, 14 Sep 2020 16:45:26:  78000000 
INFO  @ Mon, 14 Sep 2020 16:45:27:  79000000 
INFO  @ Mon, 14 Sep 2020 16:45:27:  80000000 
INFO  @ Mon, 14 Sep 2020 16:45:28:  81000000 
INFO  @ Mon, 14 Sep 2020 16:45:28:  82000000 
INFO  @ Mon, 14 Sep 2020 16:45:29:  83000000 
INFO  @ Mon, 14 Sep 2020 16:45:30:  84000000 
INFO  @ Mon, 14 Sep 2020 16:45:30:  85000000 
INFO  @ Mon, 14 Sep 2020 16:45:31:  86000000 
INFO  @ Mon, 14 Sep 2020 16:45:31:  87000000 
INFO  @ Mon, 14 Sep 2020 16:45:32:  88000000 
INFO  @ Mon, 14 Sep 2020 16:45:33:  89000000 
INFO  @ Mon, 14 Sep 2020 16:45:33:  90000000 
INFO  @ Mon, 14 Sep 2020 16:45:34:  91000000 
INFO  @ Mon, 14 Sep 2020 16:45:35: #1 tag size is determined as 50 bps 
INFO  @ Mon, 14 Sep 2020 16:45:35: #1 tag size = 50.0 
INFO  @ Mon, 14 Sep 2020 16:45:35: #1  total tags in treatment: 91424609 
INFO  @ Mon, 14 Sep 2020 16:45:35: #1 finished! 
INFO  @ Mon, 14 Sep 2020 16:45:35: #2 Build Peak Model... 
INFO  @ Mon, 14 Sep 2020 16:45:35: #2 Skipped... 
INFO  @ Mon, 14 Sep 2020 16:45:35: #2 Use 150 as fragment length 
INFO  @ Mon, 14 Sep 2020 16:45:35: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 14 Sep 2020 16:45:35: #3 Call peaks... 
INFO  @ Mon, 14 Sep 2020 16:45:35: # local lambda is disabled! 
INFO  @ Mon, 14 Sep 2020 16:45:35: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 14 Sep 2020 16:45:35: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 14 Sep 2020 16:45:35: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 14 Sep 2020 16:45:35: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 14 Sep 2020 16:46:51: #3 Call peaks for each chromosome... 
INFO  @ Mon, 14 Sep 2020 16:49:25: #4 Write output xls file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks.xls 
INFO  @ Mon, 14 Sep 2020 16:49:26: #4 Write peak in narrowPeak format file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks.narrowPeak 
INFO  @ Mon, 14 Sep 2020 16:49:27: #4 Write summits bed file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_summits.bed 
INFO  @ Mon, 14 Sep 2020 16:49:28: Done! 
</pre>
Command completed. Elapsed time: 0:04:50. Running peak memory: 7.112GB.  
  PID: 107328;	Command: macs2;	Return code: 0;	Memory used: 0.777GB


> `Peak_count`	382788	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38_exact/gold1_shift.bed.gz` (107976)
<pre>
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 7.112GB.  
  PID: 107976;	Command: pigz;	Return code: 0;	Memory used: 0.047GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks.narrowPeak > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks_fixedWidth.narrowPeak` (108055)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 7.112GB.  
  PID: 108055;	Command: awk;	Return code: 0;	Memory used: 0.02GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/peak_calling_hg38/gold1_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (108097)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Error in setorderv(final, cols = c("chr", "start")) : 
  some columns are not in the data.table: chr,start
Calls: <Anonymous> -> setorderv
Execution halted
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 7.112GB.  
  PID: 108097;	Command: Rscript;	Return code: 1;	Memory used: 0.249GB

Child process 61698 (perl) was already terminated.
Child process 62606 (perl) was already terminated.
Starting cleanup: 10 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Conditional flag found: []

These conditional files were left in place:

- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/gold1*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/fastq/*.log
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/tmpwkctjzrw
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/rCRSd_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/tmpzfpw_1dp
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/prealignments/human_repeats_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/tmppflrp2u7
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam.bai
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/chr_sizes.bed
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/gold1_temp.bam
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/aligned_hg38/tmpt25x08ue
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold1/raw/hg38_annotations.bed

### Pipeline failed at:  (09-14 16:49:44) elapsed: 306.0 _TIME_

Total time: 2:15:29
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
