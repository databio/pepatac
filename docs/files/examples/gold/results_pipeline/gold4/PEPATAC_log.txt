### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --sample-name gold4 --genome hg38 --input /project/shefflab/data/sra_fastq//SRR5210428_1.fastq.gz --single-or-paired PAIRED -O /project/shefflab/processed//pepatac/gold_atac/results_pipeline -P 32 -M 24000 --input2 /project/shefflab/data/sra_fastq//SRR5210428_2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --blacklist /nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-aj37-16c0
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/
*  Pipeline started at:   (09-14 14:34:38) elapsed: 5.0 _TIME_

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
*              `input`:  `['/project/shefflab/data/sra_fastq//SRR5210428_1.fastq.gz']`
*             `input2`:  `['/project/shefflab/data/sra_fastq//SRR5210428_2.fastq.gz']`
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
*        `sample_name`:  `gold4`
*             `silent`:  `False`
*   `single_or_paired`:  `PAIRED`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

The lock has been created in the split second since the last lock existence check. Waiting
Waiting for file lock: /project/shefflab/genomes/lock.genomes.yaml ......... File unlocked
Local input file: /project/shefflab/data/sra_fastq//SRR5210428_1.fastq.gz
Local input file: /project/shefflab/data/sra_fastq//SRR5210428_2.fastq.gz

> `File_mb`	3136	2	_RES_

> `Read_type`	PAIRED	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-14 14:34:50) elapsed: 12.0 _TIME_

Number of input file sets: 2
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R1.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210428_1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R1.fastq.gz` (47701)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.018GB.  
  PID: 47701;	Command: ln;	Return code: 0;	Memory used: 0.018GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R1.fastq.gz'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R2.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210428_2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R2.fastq.gz` (47740)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.018GB.  
  PID: 47740;	Command: ln;	Return code: 0;	Memory used: 0.002GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1.fastq.gz', 'ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2.fastq.gz']
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1.fastq.gz`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2.fastq.gz`  

> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1.fastq.gz` (47782)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.018GB.  
  PID: 47782;	Command: ln;	Return code: 0;	Memory used: 0.001GB


> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/gold4_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2.fastq.gz` (47822)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.018GB.  
  PID: 47822;	Command: ln;	Return code: 0;	Memory used: 0.002GB


> `Raw_reads`	101078490	PEPATAC	_RES_

> `Fastq_reads`	101078490	PEPATAC	_RES_

### Adapter trimming:  (09-14 14:36:25) elapsed: 95.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1_trim.fastq`  

> `skewer -f sanger -t 32 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2.fastq.gz` (48831)
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
Mon Sep 14 14:36:25 2020[0;32m >> started[0m

Mon Sep 14 14:37:58 2020[0;32m >> done[0m (93.529s)
50539245 read pairs processed; of these:
     297 ( 0.00%) short read pairs filtered out after trimming by size control
     178 ( 0.00%) empty read pairs filtered out after trimming by size control
50538770 (100.00%) read pairs available; of these:
 3227085 ( 6.39%) trimmed read pairs available after processing
47311685 (93.61%) untrimmed read pairs available after processing
log has been saved to "/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4-trimmed.log".
</pre>
Command completed. Elapsed time: 0:01:34. Running peak memory: 0.048GB.  
  PID: 48831;	Command: skewer;	Return code: 0;	Memory used: 0.048GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4-trimmed-pair1.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1_trim.fastq` (49008)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.048GB.  
  PID: 49008;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4-trimmed-pair2.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2_trim.fastq` (49009)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.048GB.  
  PID: 49009;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	101077540	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1_trim.fastq` (49146)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold4_R1_trim.fastq
Approx 5% complete for gold4_R1_trim.fastq
Approx 10% complete for gold4_R1_trim.fastq
Approx 15% complete for gold4_R1_trim.fastq
Approx 20% complete for gold4_R1_trim.fastq
Approx 25% complete for gold4_R1_trim.fastq
Approx 30% complete for gold4_R1_trim.fastq
Approx 35% complete for gold4_R1_trim.fastq
Approx 40% complete for gold4_R1_trim.fastq
Approx 45% complete for gold4_R1_trim.fastq
Approx 50% complete for gold4_R1_trim.fastq
Approx 55% complete for gold4_R1_trim.fastq
Approx 60% complete for gold4_R1_trim.fastq
Approx 65% complete for gold4_R1_trim.fastq
Approx 70% complete for gold4_R1_trim.fastq
Approx 75% complete for gold4_R1_trim.fastq
Approx 80% complete for gold4_R1_trim.fastq
Approx 85% complete for gold4_R1_trim.fastq
Approx 90% complete for gold4_R1_trim.fastq
Approx 95% complete for gold4_R1_trim.fastq
Analysis complete for gold4_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:02:11. Running peak memory: 0.253GB.  
  PID: 49146;	Command: fastqc;	Return code: 0;	Memory used: 0.253GB

> `FastQC report r1`	fastq/gold4_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2_trim.fastq` (49694)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold4_R2_trim.fastq
Approx 5% complete for gold4_R2_trim.fastq
Approx 10% complete for gold4_R2_trim.fastq
Approx 15% complete for gold4_R2_trim.fastq
Approx 20% complete for gold4_R2_trim.fastq
Approx 25% complete for gold4_R2_trim.fastq
Approx 30% complete for gold4_R2_trim.fastq
Approx 35% complete for gold4_R2_trim.fastq
Approx 40% complete for gold4_R2_trim.fastq
Approx 45% complete for gold4_R2_trim.fastq
Approx 50% complete for gold4_R2_trim.fastq
Approx 55% complete for gold4_R2_trim.fastq
Approx 60% complete for gold4_R2_trim.fastq
Approx 65% complete for gold4_R2_trim.fastq
Approx 70% complete for gold4_R2_trim.fastq
Approx 75% complete for gold4_R2_trim.fastq
Approx 80% complete for gold4_R2_trim.fastq
Approx 85% complete for gold4_R2_trim.fastq
Approx 90% complete for gold4_R2_trim.fastq
Approx 95% complete for gold4_R2_trim.fastq
Analysis complete for gold4_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:02:11. Running peak memory: 0.259GB.  
  PID: 49694;	Command: fastqc;	Return code: 0;	Memory used: 0.259GB

> `FastQC report r2`	fastq/gold4_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-14 14:42:29) elapsed: 365.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-14 14:42:29) elapsed: 0.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/rCRSd_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/rCRSd_bt2` (49907)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.259GB.  
  PID: 49907;	Command: mkfifo;	Return code: 0;	Memory used: 0.019GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/rCRSd_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R2_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq` (49947)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id gold4 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4_R1_trim.fastq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/rCRSd_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log` (49948)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:06:17. Running peak memory: 0.259GB.  
  PID: 49948;	Command: bowtie2;	Return code: 0;	Memory used: 0.17GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	14045392.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	13.9	PEPATAC	_RES_

### Map to human_repeats (09-14 14:48:46) elapsed: 377.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/human_repeats_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/human_repeats_bt2` (50688)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.259GB.  
  PID: 50688;	Command: mkfifo;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/human_repeats_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq` (50728)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id gold4 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/human_repeats_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log` (50729)
<pre>
not gzipping output
7022696 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:05:36. Running peak memory: 0.259GB.  
  PID: 50729;	Command: bowtie2;	Return code: 0;	Memory used: 0.175GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	7514112.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	7.43	PEPATAC	_RES_

### Compress all unmapped read files (09-14 14:54:22) elapsed: 336.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq` (51486)
<pre>
3757056 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 0.259GB.  
  PID: 51486;	Command: pigz;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq` (51588)
<pre>
</pre>
Command completed. Elapsed time: 0:00:29. Running peak memory: 0.259GB.  
  PID: 51588;	Command: pigz;	Return code: 0;	Memory used: 0.047GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq` (51881)
<pre>
</pre>
Command completed. Elapsed time: 0:00:30. Running peak memory: 0.259GB.  
  PID: 51881;	Command: pigz;	Return code: 0;	Memory used: 0.048GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq` (51991)
<pre>
</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 0.259GB.  
  PID: 51991;	Command: pigz;	Return code: 0;	Memory used: 0.045GB


### Map to genome (09-14 14:56:19) elapsed: 117.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam`  

> `bowtie2 -p 32  --very-sensitive -X 2000 --rg-id gold4 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq.gz -2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/tmpmdi7by7l -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam` (52096,52097,52099)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
39759018 reads; of these:
  39759018 (100.00%) were paired; of these:
    1046243 (2.63%) aligned concordantly 0 times
    32357036 (81.38%) aligned concordantly exactly 1 time
    6355739 (15.99%) aligned concordantly >1 times
    ----
    1046243 pairs aligned concordantly 0 times; of these:
      31444 (3.01%) aligned discordantly 1 time
    ----
    1014799 pairs aligned 0 times concordantly or discordantly; of these:
      2029598 mates make up the pairs; of these:
        1368463 (67.43%) aligned 0 times
        386828 (19.06%) aligned exactly 1 time
        274307 (13.52%) aligned >1 times
98.28% overall alignment rate
[bam_sort_core] merging from 19 files and 1 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:24:44. Running peak memory: 4.147GB.  
  PID: 52097;	Command: samtools;	Return code: 0;	Memory used: 0.021GB  
  PID: 52096;	Command: bowtie2;	Return code: 0;	Memory used: 4.147GB  
  PID: 52099;	Command: samtools;	Return code: 0;	Memory used: 0.896GB


> `samtools view -b -q 10 -@ 32 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_fail_qc.bam -f 2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam` (55401)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:01:04. Running peak memory: 4.147GB.  
  PID: 55401;	Command: samtools;	Return code: 0;	Memory used: 0.051GB

[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mapped_reads`	78149573	PEPATAC	_RES_

> `QC_filtered_reads`	6702363	PEPATAC	_RES_

> `Aligned_reads`	71447210	PEPATAC	_RES_

> `Alignment_rate`	70.69	PEPATAC	_RES_

> `Total_efficiency`	70.68	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam.bai`  

> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam` (55776)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:24. Running peak memory: 4.147GB.  
  PID: 55776;	Command: samtools;	Return code: 0;	Memory used: 0.031GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam` (55851)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:22. Running peak memory: 4.147GB.  
  PID: 55851;	Command: samtools;	Return code: 0;	Memory used: 0.033GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mitochondrial_reads`	6339	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_noMT.bam`  

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/chr_sizes.bed` (56050,56051,56055,56070)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.147GB.  
  PID: 56050;	Command: samtools;	Return code: 0;	Memory used: 0.032GB  
  PID: 56055;	Command: awk;	Return code: 0;	Memory used: 0.016GB  
  PID: 56051;	Command: cut;	Return code: 0;	Memory used: 0.014GB  
  PID: 56070;	Command: grep;	Return code: 0;	Memory used: 0.01GB


> `samtools view -L /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/chr_sizes.bed -b -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_noMT.bam` (56215)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:46. Running peak memory: 4.147GB.  
  PID: 56215;	Command: samtools;	Return code: 0;	Memory used: 0.05GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_noMT.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam` (56350)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.147GB.  
  PID: 56350;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam` (56351)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:53. Running peak memory: 4.147GB.  
  PID: 56351;	Command: samtools;	Return code: 0;	Memory used: 0.036GB


### Calculate NRF, PBC1, and PBC2 (09-14 15:25:18) elapsed: 1738.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_bamQC.tsv`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam -c 32 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_bamQC.tsv` (56670)
<pre>
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/tmp_gold4_sort_v2_n483q'
Processing with 32 cores...
Merging 144 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:01:08. Running peak memory: 4.309GB.  
  PID: 56670;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 4.309GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_bamQC.tsv`

> `NRF`	0.94	PEPATAC	_RES_

> `PBC1`	0.97	PEPATAC	_RES_

> `PBC2`	35.97	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_unmap.bam`  

> `samtools view -b -@ 32 -f 12  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_unmap.bam` (56948)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 4.309GB.  
  PID: 56948;	Command: samtools;	Return code: 0;	Memory used: 0.033GB


> `samtools view -c -f 4 -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Unmapped_reads`	1368463	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-14 15:26:40) elapsed: 82.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam`  

> `samtools sort -n -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/tmphv0o4hf5 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam | samtools view -h - -@ 8 | samblaster -r --ignoreUnmated 2> /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/tmphv0o4hf5 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam` (57129,57130,57132,57139,57149)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:03:59. Running peak memory: 6.985GB.  
  PID: 57139;	Command: samtools;	Return code: 0;	Memory used: 0.024GB  
  PID: 57129;	Command: samtools;	Return code: 0;	Memory used: 6.985GB  
  PID: 57132;	Command: samblaster;	Return code: 0;	Memory used: 0.648GB  
  PID: 57130;	Command: samtools;	Return code: 0;	Memory used: 0.023GB  
  PID: 57149;	Command: samtools;	Return code: 0;	Memory used: 6.983GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam` (58051)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:21. Running peak memory: 6.985GB.  
  PID: 58051;	Command: samtools;	Return code: 0;	Memory used: 0.029GB


> `grep 'Removed' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	1038863	PEPATAC	_RES_

> `Dedup_aligned_reads`	70408347.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	69.66	PEPATAC	_RES_

> `Dedup_total_efficiency`	69.66	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Read_length`	42	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-14 15:32:34) elapsed: 354.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_out.txt`  

> `preseq c_curve -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_out.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam` (58573)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 35722732
COUNTS_SUM      = 35722732
DISTINCT READS  = 3.33882e+07
DISTINCT COUNTS = 124
MAX COUNT       = 1349
COUNTS OF 1     = 3.14304e+07
OBSERVED COUNTS (1350)
1	31430393
2	1719823
3	172342
4	39824
5	13878
6	5926
7	2673
8	1303
9	698
10	412
11	231
12	127
13	92
14	65
15	37
16	31
17	29
18	17
19	14
20	10
21	12
22	6
23	9
24	5
25	5
26	5
27	8
28	4
29	1
30	4
31	1
32	2
33	8
34	4
35	7
36	7
37	1
38	3
39	2
40	6
41	2
42	3
44	1
46	6
47	3
48	2
49	1
50	2
51	2
52	4
53	2
54	2
55	3
57	1
58	3
59	3
60	3
61	3
64	2
66	2
69	1
70	1
72	4
73	2
75	1
77	3
79	1
81	1
83	1
84	1
86	1
87	3
88	2
89	2
90	2
96	1
97	2
99	1
101	1
102	4
103	2
106	1
110	1
114	1
116	1
119	1
120	3
128	1
130	3
131	1
134	1
135	1
137	1
138	2
139	1
143	1
149	1
155	1
159	1
160	1
164	1
165	1
166	1
194	1
200	1
210	1
212	1
234	2
257	1
259	1
262	1
318	1
364	1
406	1
425	1
526	1
543	1
581	1
602	1
666	1
773	1
1174	1
1227	1
1349	1

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
</pre>
Command completed. Elapsed time: 0:08:47. Running peak memory: 6.985GB.  
  PID: 58573;	Command: preseq;	Return code: 0;	Memory used: 0.025GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_yield.txt`  

> `preseq lc_extrap -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_yield.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam` (59694)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 35722732
DISTINCT READS  = 3.33882e+07
DISTINCT COUNTS = 124
MAX COUNT       = 1349
COUNTS OF 1     = 3.14304e+07
MAX TERMS       = 42
OBSERVED COUNTS (1350)
1	31430393
2	1719823
3	172342
4	39824
5	13878
6	5926
7	2673
8	1303
9	698
10	412
11	231
12	127
13	92
14	65
15	37
16	31
17	29
18	17
19	14
20	10
21	12
22	6
23	9
24	5
25	5
26	5
27	8
28	4
29	1
30	4
31	1
32	2
33	8
34	4
35	7
36	7
37	1
38	3
39	2
40	6
41	2
42	3
44	1
46	6
47	3
48	2
49	1
50	2
51	2
52	4
53	2
54	2
55	3
57	1
58	3
59	3
60	3
61	3
64	2
66	2
69	1
70	1
72	4
73	2
75	1
77	3
79	1
81	1
83	1
84	1
86	1
87	3
88	2
89	2
90	2
96	1
97	2
99	1
101	1
102	4
103	2
106	1
110	1
114	1
116	1
119	1
120	3
128	1
130	3
131	1
134	1
135	1
137	1
138	2
139	1
143	1
149	1
155	1
159	1
160	1
164	1
165	1
166	1
194	1
200	1
210	1
212	1
234	2
257	1
259	1
262	1
318	1
364	1
406	1
425	1
526	1
543	1
581	1
602	1
666	1
773	1
1174	1
1227	1
1349	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
............._....._............................................._..............................._......
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:08:48. Running peak memory: 6.985GB.  
  PID: 59694;	Command: preseq;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_counts.txt`  

> `echo '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_yield.txt '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort.bam)' '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam) > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_counts.txt` (60761)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:41. Running peak memory: 6.985GB.  
  PID: 60761;	Command: echo;	Return code: 0;	Memory used: 0.023GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_plot.pdf`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_plot.png`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_yield.txt -r /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_counts.txt -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_plot` (60893)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Processing gold4
INFO: Found real counts for gold4 - Total (M): 71.445462 Unique (M): 69.367736

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:10. Running peak memory: 6.985GB.  
  PID: 60893;	Command: Rscript;	Return code: 0;	Memory used: 0.09GB

> `Library complexity`	QC_hg38/gold4_preseq_plot.pdf	Library complexity	QC_hg38/gold4_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '^10000000' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9785	PEPATAC	_RES_

### Produce signal tracks (09-14 15:51:00) elapsed: 1106.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_exact.bw`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_smooth.bw`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact -b /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_exact.bw -w /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_smooth.bw -m atac -p 21 --variable-step --scale 71447210.0` (61081)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/tmp_gold4_sort_dedup_cuttrace_svbz3_4b'
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
psutil.NoSuchProcess process no longer exists (pid=65262)
Warning: couldn't add memory use for process: 61081
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
psutil.NoSuchProcess process no longer exists (pid=81825)
Warning: couldn't add memory use for process: 61081
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
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
Merging 144 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_exact.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Merging 144 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_smooth.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:10:39. Running peak memory: 6.985GB.  
  PID: 61081;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 5.041GB


### Calculate TSS enrichment (09-14 16:01:39) elapsed: 639.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_TSS_enrichment.txt`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 32 -z -v -s 6 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_TSS_enrichment.txt` (92718)
<pre>
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 6.985GB.  
  PID: 92718;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 2.785GB

Missing stat 'TSS_score'

> `TSS_score`	7.7	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_TSS_enrichment.txt` (92796)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help

Generating TSS plot with /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 6.985GB.  
  PID: 92796;	Command: Rscript;	Return code: 0;	Memory used: 0.25GB

> `TSS enrichment`	QC_hg38/gold4_TSS_enrichment.pdf	TSS enrichment	QC_hg38/gold4_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-14 16:01:53) elapsed: 14.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_sort_dedup.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragLen.txt` (92899)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:02:44. Running peak memory: 6.985GB.  
  PID: 92899;	Command: perl;	Return code: 0;	Memory used: 0.021GB


> `sort -n  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragLen.txt | uniq -c  > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragCount.txt` (93135,93136)
<pre>
</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 6.985GB.  
  PID: 93135;	Command: sort;	Return code: 0;	Memory used: 3.897GB  
  PID: 93136;	Command: uniq;	Return code: 0;	Memory used: 0.02GB


> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragLen.txt -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragCount.txt -p /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragLenDistribution.pdf -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/QC_hg38/gold4_fragLenDistribution.txt` (93241)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 6.985GB.  
  PID: 93241;	Command: Rscript;	Return code: 0;	Memory used: 0.253GB

> `Fragment distribution`	QC_hg38/gold4_fragLenDistribution.pdf	Fragment distribution	QC_hg38/gold4_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/hg38_annotations.bed.gz` (93356)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 6.985GB.  
  PID: 93356;	Command: ln;	Return code: 0;	Memory used: 0.022GB


> `pigz -f -p 32 -d -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/hg38_annotations.bed.gz > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/hg38_annotations.bed` (93395)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 6.985GB.  
  PID: 93395;	Command: pigz;	Return code: 0;	Memory used: 0.019GB


### Call peaks (09-14 16:04:57) elapsed: 183.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks.narrowPeak`  

> `macs2 callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38 -n gold4 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (93439)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
INFO  @ Mon, 14 Sep 2020 16:05:01: 
# Command line: callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38 -n gold4 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = gold4
# format = BED
# ChIP-seq file = ['/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed']
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
 
INFO  @ Mon, 14 Sep 2020 16:05:01: #1 read tag files... 
INFO  @ Mon, 14 Sep 2020 16:05:01: #1 read treatment tags... 
INFO  @ Mon, 14 Sep 2020 16:05:02:  1000000 
INFO  @ Mon, 14 Sep 2020 16:05:03:  2000000 
INFO  @ Mon, 14 Sep 2020 16:05:03:  3000000 
INFO  @ Mon, 14 Sep 2020 16:05:04:  4000000 
INFO  @ Mon, 14 Sep 2020 16:05:04:  5000000 
INFO  @ Mon, 14 Sep 2020 16:05:05:  6000000 
INFO  @ Mon, 14 Sep 2020 16:05:05:  7000000 
INFO  @ Mon, 14 Sep 2020 16:05:06:  8000000 
INFO  @ Mon, 14 Sep 2020 16:05:06:  9000000 
INFO  @ Mon, 14 Sep 2020 16:05:07:  10000000 
INFO  @ Mon, 14 Sep 2020 16:05:08:  11000000 
INFO  @ Mon, 14 Sep 2020 16:05:08:  12000000 
INFO  @ Mon, 14 Sep 2020 16:05:09:  13000000 
INFO  @ Mon, 14 Sep 2020 16:05:09:  14000000 
INFO  @ Mon, 14 Sep 2020 16:05:10:  15000000 
INFO  @ Mon, 14 Sep 2020 16:05:10:  16000000 
INFO  @ Mon, 14 Sep 2020 16:05:11:  17000000 
INFO  @ Mon, 14 Sep 2020 16:05:12:  18000000 
INFO  @ Mon, 14 Sep 2020 16:05:12:  19000000 
INFO  @ Mon, 14 Sep 2020 16:05:13:  20000000 
INFO  @ Mon, 14 Sep 2020 16:05:13:  21000000 
INFO  @ Mon, 14 Sep 2020 16:05:14:  22000000 
INFO  @ Mon, 14 Sep 2020 16:05:14:  23000000 
INFO  @ Mon, 14 Sep 2020 16:05:15:  24000000 
INFO  @ Mon, 14 Sep 2020 16:05:16:  25000000 
INFO  @ Mon, 14 Sep 2020 16:05:16:  26000000 
INFO  @ Mon, 14 Sep 2020 16:05:17:  27000000 
INFO  @ Mon, 14 Sep 2020 16:05:17:  28000000 
INFO  @ Mon, 14 Sep 2020 16:05:18:  29000000 
INFO  @ Mon, 14 Sep 2020 16:05:18:  30000000 
INFO  @ Mon, 14 Sep 2020 16:05:19:  31000000 
INFO  @ Mon, 14 Sep 2020 16:05:19:  32000000 
INFO  @ Mon, 14 Sep 2020 16:05:20:  33000000 
INFO  @ Mon, 14 Sep 2020 16:05:21:  34000000 
INFO  @ Mon, 14 Sep 2020 16:05:21:  35000000 
INFO  @ Mon, 14 Sep 2020 16:05:22:  36000000 
INFO  @ Mon, 14 Sep 2020 16:05:22:  37000000 
INFO  @ Mon, 14 Sep 2020 16:05:23:  38000000 
INFO  @ Mon, 14 Sep 2020 16:05:23:  39000000 
INFO  @ Mon, 14 Sep 2020 16:05:24:  40000000 
INFO  @ Mon, 14 Sep 2020 16:05:25:  41000000 
INFO  @ Mon, 14 Sep 2020 16:05:25:  42000000 
INFO  @ Mon, 14 Sep 2020 16:05:26:  43000000 
INFO  @ Mon, 14 Sep 2020 16:05:26:  44000000 
INFO  @ Mon, 14 Sep 2020 16:05:27:  45000000 
INFO  @ Mon, 14 Sep 2020 16:05:28:  46000000 
INFO  @ Mon, 14 Sep 2020 16:05:28:  47000000 
INFO  @ Mon, 14 Sep 2020 16:05:29:  48000000 
INFO  @ Mon, 14 Sep 2020 16:05:29:  49000000 
INFO  @ Mon, 14 Sep 2020 16:05:30:  50000000 
INFO  @ Mon, 14 Sep 2020 16:05:30:  51000000 
INFO  @ Mon, 14 Sep 2020 16:05:31:  52000000 
INFO  @ Mon, 14 Sep 2020 16:05:31:  53000000 
INFO  @ Mon, 14 Sep 2020 16:05:32:  54000000 
INFO  @ Mon, 14 Sep 2020 16:05:33:  55000000 
INFO  @ Mon, 14 Sep 2020 16:05:33:  56000000 
INFO  @ Mon, 14 Sep 2020 16:05:34:  57000000 
INFO  @ Mon, 14 Sep 2020 16:05:34:  58000000 
INFO  @ Mon, 14 Sep 2020 16:05:35:  59000000 
INFO  @ Mon, 14 Sep 2020 16:05:36:  60000000 
INFO  @ Mon, 14 Sep 2020 16:05:36:  61000000 
INFO  @ Mon, 14 Sep 2020 16:05:37:  62000000 
INFO  @ Mon, 14 Sep 2020 16:05:37:  63000000 
INFO  @ Mon, 14 Sep 2020 16:05:38:  64000000 
INFO  @ Mon, 14 Sep 2020 16:05:38:  65000000 
INFO  @ Mon, 14 Sep 2020 16:05:39:  66000000 
INFO  @ Mon, 14 Sep 2020 16:05:39:  67000000 
INFO  @ Mon, 14 Sep 2020 16:05:40:  68000000 
INFO  @ Mon, 14 Sep 2020 16:05:41:  69000000 
INFO  @ Mon, 14 Sep 2020 16:05:41: #1 tag size is determined as 50 bps 
INFO  @ Mon, 14 Sep 2020 16:05:41: #1 tag size = 50.0 
INFO  @ Mon, 14 Sep 2020 16:05:41: #1  total tags in treatment: 69367696 
INFO  @ Mon, 14 Sep 2020 16:05:41: #1 finished! 
INFO  @ Mon, 14 Sep 2020 16:05:41: #2 Build Peak Model... 
INFO  @ Mon, 14 Sep 2020 16:05:41: #2 Skipped... 
INFO  @ Mon, 14 Sep 2020 16:05:41: #2 Use 150 as fragment length 
INFO  @ Mon, 14 Sep 2020 16:05:41: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 14 Sep 2020 16:05:41: #3 Call peaks... 
INFO  @ Mon, 14 Sep 2020 16:05:41: # local lambda is disabled! 
INFO  @ Mon, 14 Sep 2020 16:05:41: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 14 Sep 2020 16:05:41: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 14 Sep 2020 16:05:41: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 14 Sep 2020 16:05:41: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 14 Sep 2020 16:06:40: #3 Call peaks for each chromosome... 
INFO  @ Mon, 14 Sep 2020 16:08:39: #4 Write output xls file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks.xls 
INFO  @ Mon, 14 Sep 2020 16:08:41: #4 Write peak in narrowPeak format file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks.narrowPeak 
INFO  @ Mon, 14 Sep 2020 16:08:42: #4 Write summits bed file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_summits.bed 
INFO  @ Mon, 14 Sep 2020 16:08:42: Done! 
</pre>
Command completed. Elapsed time: 0:03:46. Running peak memory: 6.985GB.  
  PID: 93439;	Command: macs2;	Return code: 0;	Memory used: 0.787GB


> `Peak_count`	305045	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38_exact/gold4_shift.bed.gz` (94052)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 6.985GB.  
  PID: 94052;	Command: pigz;	Return code: 0;	Memory used: 0.051GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks.narrowPeak > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks_fixedWidth.narrowPeak` (94134)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 6.985GB.  
  PID: 94134;	Command: awk;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/peak_calling_hg38/gold4_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (94177)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Error in setorderv(final, cols = c("chr", "start")) : 
  some columns are not in the data.table: chr,start
Calls: <Anonymous> -> setorderv
Execution halted
</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 6.985GB.  
  PID: 94177;	Command: Rscript;	Return code: 1;	Memory used: 0.233GB

Child process 49947 (perl) was already terminated.
Child process 50728 (perl) was already terminated.
Starting cleanup: 10 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Conditional flag found: []

These conditional files were left in place:

- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/gold4*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/fastq/*.log
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/tmpm5mk9z8g
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/rCRSd_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/tmpn_q2g22c
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/prealignments/human_repeats_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/tmpmdi7by7l
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam.bai
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/chr_sizes.bed
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/gold4_temp.bam
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/aligned_hg38/tmphv0o4hf5
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold4/raw/hg38_annotations.bed

### Pipeline failed at:  (09-14 16:08:58) elapsed: 241.0 _TIME_

Total time: 1:34:26
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
