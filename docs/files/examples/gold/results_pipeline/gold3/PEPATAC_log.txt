### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --sample-name gold3 --genome hg38 --input /project/shefflab/data/sra_fastq//SRR5210398_1.fastq.gz --single-or-paired PAIRED -O /project/shefflab/processed//pepatac/gold_atac/results_pipeline -P 32 -M 24000 --input2 /project/shefflab/data/sra_fastq//SRR5210398_2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --blacklist /nv/t1/genomes//hg38/blacklist/default/hg38_blacklist.bed.gz --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-aj37-15c1
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/
*  Pipeline started at:   (09-14 14:34:38) elapsed: 31.0 _TIME_

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
*              `input`:  `['/project/shefflab/data/sra_fastq//SRR5210398_1.fastq.gz']`
*             `input2`:  `['/project/shefflab/data/sra_fastq//SRR5210398_2.fastq.gz']`
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
*        `sample_name`:  `gold3`
*             `silent`:  `False`
*   `single_or_paired`:  `PAIRED`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

Local input file: /project/shefflab/data/sra_fastq//SRR5210398_1.fastq.gz
Local input file: /project/shefflab/data/sra_fastq//SRR5210398_2.fastq.gz

> `File_mb`	4809	2	_RES_

> `Read_type`	PAIRED	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-14 14:34:38) elapsed: 1.0 _TIME_

Number of input file sets: 2
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R1.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210398_1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R1.fastq.gz` (40028)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.001GB.  
  PID: 40028;	Command: ln;	Return code: 0;	Memory used: 0.001GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R1.fastq.gz'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R2.fastq.gz`  

> `ln -sf /project/shefflab/data/sra_fastq//SRR5210398_2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R2.fastq.gz` (40069)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.002GB.  
  PID: 40069;	Command: ln;	Return code: 0;	Memory used: 0.002GB

Local input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1.fastq.gz', 'ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2.fastq.gz']
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1.fastq.gz`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2.fastq.gz`  

> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1.fastq.gz` (40109)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.002GB.  
  PID: 40109;	Command: ln;	Return code: 0;	Memory used: 0.002GB


> `ln -sf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/gold3_R2.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2.fastq.gz` (40151)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.002GB.  
  PID: 40151;	Command: ln;	Return code: 0;	Memory used: 0.002GB


> `Raw_reads`	166092252	PEPATAC	_RES_

> `Fastq_reads`	166092252	PEPATAC	_RES_

### Adapter trimming:  (09-14 14:37:01) elapsed: 143.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1_trim.fastq`  

> `skewer -f sanger -t 32 -m pe -x /scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1.fastq.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2.fastq.gz` (41251)
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
Mon Sep 14 14:37:01 2020[0;32m >> started[0m

Mon Sep 14 14:39:28 2020[0;32m >> done[0m (146.701s)
83046126 read pairs processed; of these:
     556 ( 0.00%) short read pairs filtered out after trimming by size control
     276 ( 0.00%) empty read pairs filtered out after trimming by size control
83045294 (100.00%) read pairs available; of these:
 3119403 ( 3.76%) trimmed read pairs available after processing
79925891 (96.24%) untrimmed read pairs available after processing
log has been saved to "/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3-trimmed.log".
</pre>
Command completed. Elapsed time: 0:02:27. Running peak memory: 0.048GB.  
  PID: 41251;	Command: skewer;	Return code: 0;	Memory used: 0.048GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3-trimmed-pair1.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1_trim.fastq` (41613)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.048GB.  
  PID: 41613;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3-trimmed-pair2.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2_trim.fastq` (41614)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.048GB.  
  PID: 41614;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	166090588	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1_trim.fastq` (41754)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold3_R1_trim.fastq
Approx 5% complete for gold3_R1_trim.fastq
Approx 10% complete for gold3_R1_trim.fastq
Approx 15% complete for gold3_R1_trim.fastq
Approx 20% complete for gold3_R1_trim.fastq
Approx 25% complete for gold3_R1_trim.fastq
Approx 30% complete for gold3_R1_trim.fastq
Approx 35% complete for gold3_R1_trim.fastq
Approx 40% complete for gold3_R1_trim.fastq
Approx 45% complete for gold3_R1_trim.fastq
Approx 50% complete for gold3_R1_trim.fastq
Approx 55% complete for gold3_R1_trim.fastq
Approx 60% complete for gold3_R1_trim.fastq
Approx 65% complete for gold3_R1_trim.fastq
Approx 70% complete for gold3_R1_trim.fastq
Approx 75% complete for gold3_R1_trim.fastq
Approx 80% complete for gold3_R1_trim.fastq
Approx 85% complete for gold3_R1_trim.fastq
Approx 90% complete for gold3_R1_trim.fastq
Approx 95% complete for gold3_R1_trim.fastq
Analysis complete for gold3_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:03:22. Running peak memory: 0.255GB.  
  PID: 41754;	Command: fastqc;	Return code: 0;	Memory used: 0.255GB

> `FastQC report r1`	fastq/gold3_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastqc /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2_trim.fastq` (42317)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Started analysis of gold3_R2_trim.fastq
Approx 5% complete for gold3_R2_trim.fastq
Approx 10% complete for gold3_R2_trim.fastq
Approx 15% complete for gold3_R2_trim.fastq
Approx 20% complete for gold3_R2_trim.fastq
Approx 25% complete for gold3_R2_trim.fastq
Approx 30% complete for gold3_R2_trim.fastq
Approx 35% complete for gold3_R2_trim.fastq
Approx 40% complete for gold3_R2_trim.fastq
Approx 45% complete for gold3_R2_trim.fastq
Approx 50% complete for gold3_R2_trim.fastq
Approx 55% complete for gold3_R2_trim.fastq
Approx 60% complete for gold3_R2_trim.fastq
Approx 65% complete for gold3_R2_trim.fastq
Approx 70% complete for gold3_R2_trim.fastq
Approx 75% complete for gold3_R2_trim.fastq
Approx 80% complete for gold3_R2_trim.fastq
Approx 85% complete for gold3_R2_trim.fastq
Approx 90% complete for gold3_R2_trim.fastq
Approx 95% complete for gold3_R2_trim.fastq
Analysis complete for gold3_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:03:23. Running peak memory: 0.255GB.  
  PID: 42317;	Command: fastqc;	Return code: 0;	Memory used: 0.253GB

> `FastQC report r2`	fastq/gold3_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-14 14:46:28) elapsed: 567.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-14 14:46:28) elapsed: 0.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/rCRSd_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/rCRSd_bt2` (42798)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.255GB.  
  PID: 42798;	Command: mkfifo;	Return code: 0;	Memory used: 0.017GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/rCRSd_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R2_trim.fastq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq` (42840)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id gold3 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3_R1_trim.fastq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/rCRSd_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log` (42841)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:11:16. Running peak memory: 0.255GB.  
  PID: 42841;	Command: bowtie2;	Return code: 0;	Memory used: 0.138GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	29229450.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	17.6	PEPATAC	_RES_

### Map to human_repeats (09-14 14:57:50) elapsed: 682.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/human_repeats_bt2`  

> `mkfifo /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/human_repeats_bt2` (44155)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.255GB.  
  PID: 44155;	Command: mkfifo;	Return code: 0;	Memory used: 0.002GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/human_repeats_bt2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq` (44196)
<pre>
</pre>
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 32 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id gold3 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq --un /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/human_repeats_bt2 > /dev/null) 2>/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log` (44197)
<pre>
not gzipping output
14614725 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:10:02. Running peak memory: 0.255GB.  
  PID: 44197;	Command: bowtie2;	Return code: 0;	Memory used: 0.156GB


> `grep 'aligned exactly 1 time' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	10699930.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	6.44	PEPATAC	_RES_

### Compress all unmapped read files (09-14 15:07:52) elapsed: 602.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq` (45506)
<pre>
5349965 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:28. Running peak memory: 0.255GB.  
  PID: 45506;	Command: pigz;	Return code: 0;	Memory used: 0.048GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq` (45609)
<pre>
</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 0.255GB.  
  PID: 45609;	Command: pigz;	Return code: 0;	Memory used: 0.047GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq` (45716)
<pre>
</pre>
Command completed. Elapsed time: 0:00:30. Running peak memory: 0.255GB.  
  PID: 45716;	Command: pigz;	Return code: 0;	Memory used: 0.048GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq` (45822)
<pre>
</pre>
Command completed. Elapsed time: 0:00:45. Running peak memory: 0.255GB.  
  PID: 45822;	Command: pigz;	Return code: 0;	Memory used: 0.045GB


### Map to genome (09-14 15:10:09) elapsed: 137.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam`  

> `bowtie2 -p 32  --very-sensitive -X 2000 --rg-id gold3 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq.gz -2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/tmpxoy3eakj -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam` (46202,46203,46205)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
63080604 reads; of these:
  63080604 (100.00%) were paired; of these:
    2101698 (3.33%) aligned concordantly 0 times
    51634611 (81.85%) aligned concordantly exactly 1 time
    9344295 (14.81%) aligned concordantly >1 times
    ----
    2101698 pairs aligned concordantly 0 times; of these:
      97320 (4.63%) aligned discordantly 1 time
    ----
    2004378 pairs aligned 0 times concordantly or discordantly; of these:
      4008756 mates make up the pairs; of these:
        2236283 (55.78%) aligned 0 times
        1108801 (27.66%) aligned exactly 1 time
        663672 (16.56%) aligned >1 times
98.23% overall alignment rate
[bam_sort_core] merging from 31 files and 1 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:38:22. Running peak memory: 4.119GB.  
  PID: 46203;	Command: samtools;	Return code: 0;	Memory used: 0.021GB  
  PID: 46202;	Command: bowtie2;	Return code: 0;	Memory used: 4.119GB  
  PID: 46205;	Command: samtools;	Return code: 0;	Memory used: 0.92GB


> `samtools view -b -q 10 -@ 32 -U /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_fail_qc.bam -f 2 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam` (50853)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:01:37. Running peak memory: 4.119GB.  
  PID: 50853;	Command: samtools;	Return code: 0;	Memory used: 0.053GB

[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mapped_reads`	123924925	PEPATAC	_RES_

> `QC_filtered_reads`	9613401	PEPATAC	_RES_

> `Aligned_reads`	114311524	PEPATAC	_RES_

> `Alignment_rate`	68.82	PEPATAC	_RES_

> `Total_efficiency`	68.82	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam.bai`  

> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam` (51443)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:34. Running peak memory: 4.119GB.  
  PID: 51443;	Command: samtools;	Return code: 0;	Memory used: 0.026GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam` (51515)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:30. Running peak memory: 4.119GB.  
  PID: 51515;	Command: samtools;	Return code: 0;	Memory used: 0.028GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Mitochondrial_reads`	14199	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_noMT.bam`  

> `samtools idxstats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/chr_sizes.bed` (51717,51718,51720,51727)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 4.119GB.  
  PID: 51717;	Command: samtools;	Return code: 0;	Memory used: 0.02GB  
  PID: 51720;	Command: awk;	Return code: 0;	Memory used: 0.018GB  
  PID: 51718;	Command: cut;	Return code: 0;	Memory used: 0.002GB  
  PID: 51727;	Command: grep;	Return code: 0;	Memory used: 0.018GB


> `samtools view -L /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/chr_sizes.bed -b -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_noMT.bam` (51882)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:52. Running peak memory: 4.119GB.  
  PID: 51882;	Command: samtools;	Return code: 0;	Memory used: 0.05GB


> `mv /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_noMT.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam` (52008)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 4.119GB.  
  PID: 52008;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam` (52010)
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
<pre>
</pre>
Command completed. Elapsed time: 0:00:38. Running peak memory: 4.119GB.  
  PID: 52010;	Command: samtools;	Return code: 0;	Memory used: 0.026GB


### Calculate NRF, PBC1, and PBC2 (09-14 15:53:45) elapsed: 2616.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_bamQC.tsv`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam -c 32 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_bamQC.tsv` (52086)
<pre>
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/tmp_gold3_sort_h78e4gl8'
Processing with 32 cores...
Merging 153 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:01:43. Running peak memory: 6.249GB.  
  PID: 52086;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 6.249GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_bamQC.tsv`

> `NRF`	0.9	PEPATAC	_RES_

> `PBC1`	0.95	PEPATAC	_RES_

> `PBC2`	18.89	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_unmap.bam`  

> `samtools view -b -@ 32 -f 12  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_unmap.bam` (52585)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:10. Running peak memory: 6.249GB.  
  PID: 52585;	Command: samtools;	Return code: 0;	Memory used: 0.03GB


> `samtools view -c -f 4 -@ 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Unmapped_reads`	2236283	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-14 15:55:48) elapsed: 123.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam`  

> `samtools sort -n -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/tmpuavzwnuf /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam | samtools view -h - -@ 8 | samblaster -r --ignoreUnmated 2> /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/tmpuavzwnuf -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam` (52751,52752,52754,52761,52772)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
</pre>
Command completed. Elapsed time: 0:05:12. Running peak memory: 7.491GB.  
  PID: 52761;	Command: samtools;	Return code: 0;	Memory used: 0.022GB  
  PID: 52751;	Command: samtools;	Return code: 0;	Memory used: 7.491GB  
  PID: 52754;	Command: samblaster;	Return code: 0;	Memory used: 1.055GB  
  PID: 52752;	Command: samtools;	Return code: 0;	Memory used: 0.02GB  
  PID: 52772;	Command: samtools;	Return code: 0;	Memory used: 7.087GB


> `samtools index /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam` (53675)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:28. Running peak memory: 7.491GB.  
  PID: 53675;	Command: samtools;	Return code: 0;	Memory used: 0.027GB


> `grep 'Removed' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	3152724	PEPATAC	_RES_

> `Dedup_aligned_reads`	111158800.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	66.93	PEPATAC	_RES_

> `Dedup_total_efficiency`	66.93	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container

> `Read_length`	40	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-14 16:03:18) elapsed: 450.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_out.txt`  

> `preseq c_curve -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_out.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam` (54235)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 57154185
COUNTS_SUM      = 57154185
DISTINCT READS  = 5.01862e+07
DISTINCT COUNTS = 144
MAX COUNT       = 1463
COUNTS OF 1     = 4.51091e+07
OBSERVED COUNTS (1464)
1	45109121
2	4116003
3	592902
4	176092
5	79892
6	42081
7	24142
8	14823
9	9310
10	6185
11	4307
12	2848
13	2014
14	1505
15	1038
16	782
17	607
18	482
19	339
20	254
21	217
22	158
23	138
24	114
25	92
26	85
27	76
28	62
29	38
30	35
31	35
32	24
33	12
34	23
35	13
36	20
37	12
38	12
39	12
40	5
41	11
42	5
43	9
44	4
45	14
46	6
47	6
48	4
49	7
50	8
51	6
52	3
53	4
54	3
55	3
56	2
57	7
58	6
59	2
60	3
61	3
62	2
63	2
64	5
65	4
66	2
67	1
68	6
69	5
70	3
71	4
73	1
74	3
75	1
76	1
77	1
78	1
79	3
80	1
82	3
84	2
85	3
86	1
87	1
88	2
89	1
91	1
92	3
93	2
94	4
95	2
97	2
98	1
99	4
100	1
101	2
103	1
105	1
112	1
114	1
116	1
117	2
118	1
119	3
121	1
125	1
133	1
137	1
138	1
139	1
140	1
142	1
143	2
144	1
150	1
162	1
178	1
179	1
190	1
198	1
199	1
200	1
213	1
216	1
224	1
226	1
230	1
238	1
251	1
266	1
293	1
331	1
347	1
382	1
391	1
465	1
469	1
504	1
540	1
677	1
824	1
930	1
1452	1
1463	1

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
sample size: 48000000
sample size: 49000000
sample size: 50000000
sample size: 51000000
sample size: 52000000
sample size: 53000000
sample size: 54000000
sample size: 55000000
sample size: 56000000
sample size: 57000000
</pre>
Command completed. Elapsed time: 0:12:53. Running peak memory: 7.491GB.  
  PID: 54235;	Command: preseq;	Return code: 0;	Memory used: 0.025GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_yield.txt`  

> `preseq lc_extrap -v -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_yield.txt -B /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam` (55776)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
BAM_INPUT
TOTAL READS     = 57154185
DISTINCT READS  = 5.01862e+07
DISTINCT COUNTS = 144
MAX COUNT       = 1463
COUNTS OF 1     = 4.51091e+07
MAX TERMS       = 70
OBSERVED COUNTS (1464)
1	45109121
2	4116003
3	592902
4	176092
5	79892
6	42081
7	24142
8	14823
9	9310
10	6185
11	4307
12	2848
13	2014
14	1505
15	1038
16	782
17	607
18	482
19	339
20	254
21	217
22	158
23	138
24	114
25	92
26	85
27	76
28	62
29	38
30	35
31	35
32	24
33	12
34	23
35	13
36	20
37	12
38	12
39	12
40	5
41	11
42	5
43	9
44	4
45	14
46	6
47	6
48	4
49	7
50	8
51	6
52	3
53	4
54	3
55	3
56	2
57	7
58	6
59	2
60	3
61	3
62	2
63	2
64	5
65	4
66	2
67	1
68	6
69	5
70	3
71	4
73	1
74	3
75	1
76	1
77	1
78	1
79	3
80	1
82	3
84	2
85	3
86	1
87	1
88	2
89	1
91	1
92	3
93	2
94	4
95	2
97	2
98	1
99	4
100	1
101	2
103	1
105	1
112	1
114	1
116	1
117	2
118	1
119	3
121	1
125	1
133	1
137	1
138	1
139	1
140	1
142	1
143	2
144	1
150	1
162	1
178	1
179	1
190	1
198	1
199	1
200	1
213	1
216	1
224	1
226	1
230	1
238	1
251	1
266	1
293	1
331	1
347	1
382	1
391	1
465	1
469	1
504	1
540	1
677	1
824	1
930	1
1452	1
1463	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
...._.........__....._.._................_..._................._............_............._._...._..........._.._.
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:12:56. Running peak memory: 7.491GB.  
  PID: 55776;	Command: preseq;	Return code: 0;	Memory used: 0.024GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_counts.txt`  

> `echo '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_yield.txt '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort.bam)' '$(samtools view -c -F 4 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam) > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_counts.txt` (57074)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:00:57. Running peak memory: 7.491GB.  
  PID: 57074;	Command: echo;	Return code: 0;	Memory used: 0.021GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_plot.pdf`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_plot.png`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R preseq -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_yield.txt -r /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_counts.txt -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_plot` (57480)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Processing gold3
INFO: Found real counts for gold3 - Total (M): 114.30837 Unique (M): 108.002922

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:23. Running peak memory: 7.491GB.  
  PID: 57480;	Command: Rscript;	Return code: 0;	Memory used: 0.135GB

> `Library complexity`	QC_hg38/gold3_preseq_plot.pdf	Library complexity	QC_hg38/gold3_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '^10000000' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9696	PEPATAC	_RES_

### Produce signal tracks (09-14 16:30:27) elapsed: 1629.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_exact.bw`,`/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_smooth.bw`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact -b /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_exact.bw -w /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_smooth.bw -m atac -p 21 --variable-step --scale 114311524.0` (57680)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam'
Temporary files will be stored in: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/tmp_gold3_sort_dedup_cuttrace_egmtzw48'
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
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
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
Merging 153 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_exact.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
Merging 153 files into output file: '/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_smooth.bw'
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:12:52. Running peak memory: 7.491GB.  
  PID: 57680;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 3.46GB


### Calculate TSS enrichment (09-14 16:43:18) elapsed: 772.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_TSS_enrichment.txt`  

> `/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 32 -z -v -s 6 -o /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_TSS_enrichment.txt` (92001)
<pre>
</pre>
Command completed. Elapsed time: 0:00:13. Running peak memory: 7.491GB.  
  PID: 92001;	Command: /scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 0.028GB

Missing stat 'TSS_score'

> `TSS_score`	11.0	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R tss -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_TSS_enrichment.txt` (92079)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help

Generating TSS plot with /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 7.491GB.  
  PID: 92079;	Command: Rscript;	Return code: 0;	Memory used: 0.137GB

> `TSS enrichment`	QC_hg38/gold3_TSS_enrichment.pdf	TSS enrichment	QC_hg38/gold3_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-14 16:43:43) elapsed: 24.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_sort_dedup.bam /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragLen.txt` (92182)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
</pre>
Command completed. Elapsed time: 0:04:16. Running peak memory: 7.491GB.  
  PID: 92182;	Command: perl;	Return code: 0;	Memory used: 0.021GB


> `sort -n  /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragLen.txt | uniq -c  > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragCount.txt` (92680,92681)
<pre>
</pre>
Command completed. Elapsed time: 0:00:21. Running peak memory: 7.491GB.  
  PID: 92681;	Command: uniq;	Return code: 0;	Memory used: 0.021GB  
  PID: 92680;	Command: sort;	Return code: 0;	Memory used: 3.828GB


> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R frag -l /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragLen.txt -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragCount.txt -p /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragLenDistribution.pdf -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/QC_hg38/gold3_fragLenDistribution.txt` (92791)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:12. Running peak memory: 7.491GB.  
  PID: 92791;	Command: Rscript;	Return code: 0;	Memory used: 0.128GB

> `Fragment distribution`	QC_hg38/gold3_fragLenDistribution.pdf	Fragment distribution	QC_hg38/gold3_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/hg38_annotations.bed.gz` (92909)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 7.491GB.  
  PID: 92909;	Command: ln;	Return code: 0;	Memory used: 0.01GB


> `pigz -f -p 32 -d -c /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/hg38_annotations.bed.gz > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/hg38_annotations.bed` (92950)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 7.491GB.  
  PID: 92950;	Command: pigz;	Return code: 0;	Memory used: 0.016GB


### Call peaks (09-14 16:48:34) elapsed: 291.0 _TIME_

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks.narrowPeak`  

> `macs2 callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38 -n gold3 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (92997)
<pre>
[33mWARNING:[0m Skipping mount /opt/singularity/3.5.2/var/singularity/mnt/session/etc/resolv.conf [files]: /etc/resolv.conf doesn't exist in container
INFO  @ Mon, 14 Sep 2020 16:48:41: 
# Command line: callpeak -t /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed -f BED --outdir /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38 -n gold3 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = gold3
# format = BED
# ChIP-seq file = ['/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed']
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
 
INFO  @ Mon, 14 Sep 2020 16:48:41: #1 read tag files... 
INFO  @ Mon, 14 Sep 2020 16:48:41: #1 read treatment tags... 
INFO  @ Mon, 14 Sep 2020 16:48:42:  1000000 
INFO  @ Mon, 14 Sep 2020 16:48:42:  2000000 
INFO  @ Mon, 14 Sep 2020 16:48:43:  3000000 
INFO  @ Mon, 14 Sep 2020 16:48:43:  4000000 
INFO  @ Mon, 14 Sep 2020 16:48:44:  5000000 
INFO  @ Mon, 14 Sep 2020 16:48:45:  6000000 
INFO  @ Mon, 14 Sep 2020 16:48:45:  7000000 
INFO  @ Mon, 14 Sep 2020 16:48:46:  8000000 
INFO  @ Mon, 14 Sep 2020 16:48:46:  9000000 
INFO  @ Mon, 14 Sep 2020 16:48:47:  10000000 
INFO  @ Mon, 14 Sep 2020 16:48:47:  11000000 
INFO  @ Mon, 14 Sep 2020 16:48:48:  12000000 
INFO  @ Mon, 14 Sep 2020 16:48:49:  13000000 
INFO  @ Mon, 14 Sep 2020 16:48:49:  14000000 
INFO  @ Mon, 14 Sep 2020 16:48:50:  15000000 
INFO  @ Mon, 14 Sep 2020 16:48:50:  16000000 
INFO  @ Mon, 14 Sep 2020 16:48:51:  17000000 
INFO  @ Mon, 14 Sep 2020 16:48:51:  18000000 
INFO  @ Mon, 14 Sep 2020 16:48:52:  19000000 
INFO  @ Mon, 14 Sep 2020 16:48:53:  20000000 
INFO  @ Mon, 14 Sep 2020 16:48:53:  21000000 
INFO  @ Mon, 14 Sep 2020 16:48:54:  22000000 
INFO  @ Mon, 14 Sep 2020 16:48:54:  23000000 
INFO  @ Mon, 14 Sep 2020 16:48:55:  24000000 
INFO  @ Mon, 14 Sep 2020 16:48:55:  25000000 
INFO  @ Mon, 14 Sep 2020 16:48:56:  26000000 
INFO  @ Mon, 14 Sep 2020 16:48:56:  27000000 
INFO  @ Mon, 14 Sep 2020 16:48:57:  28000000 
INFO  @ Mon, 14 Sep 2020 16:48:58:  29000000 
INFO  @ Mon, 14 Sep 2020 16:48:58:  30000000 
INFO  @ Mon, 14 Sep 2020 16:48:59:  31000000 
INFO  @ Mon, 14 Sep 2020 16:48:59:  32000000 
INFO  @ Mon, 14 Sep 2020 16:49:00:  33000000 
INFO  @ Mon, 14 Sep 2020 16:49:00:  34000000 
INFO  @ Mon, 14 Sep 2020 16:49:01:  35000000 
INFO  @ Mon, 14 Sep 2020 16:49:01:  36000000 
INFO  @ Mon, 14 Sep 2020 16:49:02:  37000000 
INFO  @ Mon, 14 Sep 2020 16:49:03:  38000000 
INFO  @ Mon, 14 Sep 2020 16:49:03:  39000000 
INFO  @ Mon, 14 Sep 2020 16:49:04:  40000000 
INFO  @ Mon, 14 Sep 2020 16:49:04:  41000000 
INFO  @ Mon, 14 Sep 2020 16:49:05:  42000000 
INFO  @ Mon, 14 Sep 2020 16:49:05:  43000000 
INFO  @ Mon, 14 Sep 2020 16:49:06:  44000000 
INFO  @ Mon, 14 Sep 2020 16:49:06:  45000000 
INFO  @ Mon, 14 Sep 2020 16:49:07:  46000000 
INFO  @ Mon, 14 Sep 2020 16:49:08:  47000000 
INFO  @ Mon, 14 Sep 2020 16:49:08:  48000000 
INFO  @ Mon, 14 Sep 2020 16:49:09:  49000000 
INFO  @ Mon, 14 Sep 2020 16:49:09:  50000000 
INFO  @ Mon, 14 Sep 2020 16:49:10:  51000000 
INFO  @ Mon, 14 Sep 2020 16:49:10:  52000000 
INFO  @ Mon, 14 Sep 2020 16:49:11:  53000000 
INFO  @ Mon, 14 Sep 2020 16:49:11:  54000000 
INFO  @ Mon, 14 Sep 2020 16:49:12:  55000000 
INFO  @ Mon, 14 Sep 2020 16:49:13:  56000000 
INFO  @ Mon, 14 Sep 2020 16:49:13:  57000000 
INFO  @ Mon, 14 Sep 2020 16:49:14:  58000000 
INFO  @ Mon, 14 Sep 2020 16:49:14:  59000000 
INFO  @ Mon, 14 Sep 2020 16:49:15:  60000000 
INFO  @ Mon, 14 Sep 2020 16:49:15:  61000000 
INFO  @ Mon, 14 Sep 2020 16:49:16:  62000000 
INFO  @ Mon, 14 Sep 2020 16:49:16:  63000000 
INFO  @ Mon, 14 Sep 2020 16:49:17:  64000000 
INFO  @ Mon, 14 Sep 2020 16:49:18:  65000000 
INFO  @ Mon, 14 Sep 2020 16:49:18:  66000000 
INFO  @ Mon, 14 Sep 2020 16:49:19:  67000000 
INFO  @ Mon, 14 Sep 2020 16:49:19:  68000000 
INFO  @ Mon, 14 Sep 2020 16:49:20:  69000000 
INFO  @ Mon, 14 Sep 2020 16:49:20:  70000000 
INFO  @ Mon, 14 Sep 2020 16:49:21:  71000000 
INFO  @ Mon, 14 Sep 2020 16:49:22:  72000000 
INFO  @ Mon, 14 Sep 2020 16:49:22:  73000000 
INFO  @ Mon, 14 Sep 2020 16:49:23:  74000000 
INFO  @ Mon, 14 Sep 2020 16:49:23:  75000000 
INFO  @ Mon, 14 Sep 2020 16:49:24:  76000000 
INFO  @ Mon, 14 Sep 2020 16:49:24:  77000000 
INFO  @ Mon, 14 Sep 2020 16:49:25:  78000000 
INFO  @ Mon, 14 Sep 2020 16:49:26:  79000000 
INFO  @ Mon, 14 Sep 2020 16:49:26:  80000000 
INFO  @ Mon, 14 Sep 2020 16:49:27:  81000000 
INFO  @ Mon, 14 Sep 2020 16:49:27:  82000000 
INFO  @ Mon, 14 Sep 2020 16:49:28:  83000000 
INFO  @ Mon, 14 Sep 2020 16:49:28:  84000000 
INFO  @ Mon, 14 Sep 2020 16:49:29:  85000000 
INFO  @ Mon, 14 Sep 2020 16:49:29:  86000000 
INFO  @ Mon, 14 Sep 2020 16:49:30:  87000000 
INFO  @ Mon, 14 Sep 2020 16:49:31:  88000000 
INFO  @ Mon, 14 Sep 2020 16:49:31:  89000000 
INFO  @ Mon, 14 Sep 2020 16:49:32:  90000000 
INFO  @ Mon, 14 Sep 2020 16:49:32:  91000000 
INFO  @ Mon, 14 Sep 2020 16:49:33:  92000000 
INFO  @ Mon, 14 Sep 2020 16:49:33:  93000000 
INFO  @ Mon, 14 Sep 2020 16:49:34:  94000000 
INFO  @ Mon, 14 Sep 2020 16:49:34:  95000000 
INFO  @ Mon, 14 Sep 2020 16:49:35:  96000000 
INFO  @ Mon, 14 Sep 2020 16:49:36:  97000000 
INFO  @ Mon, 14 Sep 2020 16:49:36:  98000000 
INFO  @ Mon, 14 Sep 2020 16:49:37:  99000000 
INFO  @ Mon, 14 Sep 2020 16:49:37:  100000000 
INFO  @ Mon, 14 Sep 2020 16:49:38:  101000000 
INFO  @ Mon, 14 Sep 2020 16:49:38:  102000000 
INFO  @ Mon, 14 Sep 2020 16:49:39:  103000000 
INFO  @ Mon, 14 Sep 2020 16:49:40:  104000000 
INFO  @ Mon, 14 Sep 2020 16:49:40:  105000000 
INFO  @ Mon, 14 Sep 2020 16:49:41:  106000000 
INFO  @ Mon, 14 Sep 2020 16:49:41:  107000000 
INFO  @ Mon, 14 Sep 2020 16:49:42:  108000000 
INFO  @ Mon, 14 Sep 2020 16:49:43: #1 tag size is determined as 50 bps 
INFO  @ Mon, 14 Sep 2020 16:49:43: #1 tag size = 50.0 
INFO  @ Mon, 14 Sep 2020 16:49:43: #1  total tags in treatment: 108002827 
INFO  @ Mon, 14 Sep 2020 16:49:43: #1 finished! 
INFO  @ Mon, 14 Sep 2020 16:49:43: #2 Build Peak Model... 
INFO  @ Mon, 14 Sep 2020 16:49:43: #2 Skipped... 
INFO  @ Mon, 14 Sep 2020 16:49:43: #2 Use 150 as fragment length 
INFO  @ Mon, 14 Sep 2020 16:49:43: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 14 Sep 2020 16:49:43: #3 Call peaks... 
INFO  @ Mon, 14 Sep 2020 16:49:43: # local lambda is disabled! 
INFO  @ Mon, 14 Sep 2020 16:49:43: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 14 Sep 2020 16:49:43: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 14 Sep 2020 16:49:43: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 14 Sep 2020 16:49:43: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 14 Sep 2020 16:51:11: #3 Call peaks for each chromosome... 
INFO  @ Mon, 14 Sep 2020 16:53:52: #4 Write output xls file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks.xls 
INFO  @ Mon, 14 Sep 2020 16:53:53: #4 Write peak in narrowPeak format file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks.narrowPeak 
INFO  @ Mon, 14 Sep 2020 16:53:54: #4 Write summits bed file... /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_summits.bed 
INFO  @ Mon, 14 Sep 2020 16:53:55: Done! 
</pre>
Command completed. Elapsed time: 0:05:21. Running peak memory: 7.491GB.  
  PID: 92997;	Command: macs2;	Return code: 0;	Memory used: 0.939GB


> `Peak_count`	380540	PEPATAC	_RES_
Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed.gz`  

> `pigz -f -p 32 /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38_exact/gold3_shift.bed.gz` (93765)
<pre>
</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 7.491GB.  
  PID: 93765;	Command: pigz;	Return code: 0;	Memory used: 0.049GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks.narrowPeak > /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks_fixedWidth.narrowPeak` (93850)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 7.491GB.  
  PID: 93850;	Command: awk;	Return code: 0;	Memory used: 0.018GB

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC.R reduce -i /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/peak_calling_hg38/gold3_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (93891)
<pre>
Bioconductor version 3.11 (BiocManager 1.30.10), ?BiocManager::install for help
Error in setorderv(final, cols = c("chr", "start")) : 
  some columns are not in the data.table: chr,start
Calls: <Anonymous> -> setorderv
Execution halted
</pre>
Command completed. Elapsed time: 0:00:18. Running peak memory: 7.491GB.  
  PID: 93891;	Command: Rscript;	Return code: 1;	Memory used: 0.326GB

Child process 42840 (perl) was already terminated.
Child process 44196 (perl) was already terminated.
Starting cleanup: 10 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Conditional flag found: []

These conditional files were left in place:

- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/gold3*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/*.fastq
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/fastq/*.log
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/tmphmrgfxyx
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/rCRSd_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/tmpt5p4dcmz
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/prealignments/human_repeats_bt2
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/tmpxoy3eakj
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam.bai
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/chr_sizes.bed
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/gold3_temp.bam
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/aligned_hg38/tmpuavzwnuf
- /project/shefflab/processed/pepatac/gold_atac/results_pipeline/gold3/raw/hg38_annotations.bed

### Pipeline failed at:  (09-14 16:54:23) elapsed: 349.0 _TIME_

Total time: 2:20:16
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
