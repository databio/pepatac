### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/pipelines/pepatac.py --sample-name tutorial2 --genome hg38 --input /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r1.fastq.gz --single-or-paired paired -O /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline -P 4 -M 8000 --input2 /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-ba36-36
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac
*            Outfolder:  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/
*  Pipeline started at:   (09-21 14:43:05) elapsed: 1.0 _TIME_

### Version log:

*       Python version:  3.7.4
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python3.7/site-packages/pypiper`
*      Pypiper version:  0.12.1
*         Pipeline dir:  `/sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.9.6
*        Pipeline hash:  ee6500ecf6fdc9cf3b1890635d7ee92206ddc58b
*      Pipeline branch:  * master
*        Pipeline date:  2020-09-21 10:57:52 -0400
*        Pipeline diff:  2 files changed, 9 insertions(+), 9 deletions(-)

### Arguments passed to pipeline:

*           `TSS_name`:  `None`
*            `aligner`:  `bowtie2`
*          `anno_name`:  `None`
*          `blacklist`:  `None`
*        `config_file`:  `pepatac.yaml`
*              `cores`:  `4`
*       `deduplicator`:  `samblaster`
*              `dirty`:  `False`
*             `extend`:  `250`
*       `force_follow`:  `False`
*     `frip_ref_peaks`:  `None`
*    `genome_assembly`:  `hg38`
*        `genome_size`:  `hs`
*              `input`:  `['/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r1.fastq.gz']`
*             `input2`:  `['/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r2.fastq.gz']`
*               `keep`:  `False`
*               `lite`:  `False`
*             `logdev`:  `False`
*                `mem`:  `8000`
*              `motif`:  `False`
*          `new_start`:  `False`
*            `no_fifo`:  `False`
*           `no_scale`:  `False`
*      `output_parent`:  `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline`
*         `paired_end`:  `True`
*        `peak_caller`:  `macs2`
*          `peak_type`:  `fixed`
*      `prealignments`:  `['rCRSd', 'human_repeats']`
*         `prioritize`:  `False`
*            `recover`:  `False`
*        `sample_name`:  `tutorial2`
*             `silent`:  `False`
*   `single_or_paired`:  `paired`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

['java', 'python', 'samtools', 'bedtools', 'bowtie2', 'fastqc', 'macs2', 'preseq', 'samblaster', 'skewer', 'perl', 'wigToBigWig', 'bigWigCat', 'bedToBigBed', 'bwa', 'fseq', '${TRIMMOMATIC}', '${PICARD}', 'pigz', 'Rscript', 'seqOutBias', 'bigWigMerge', 'bedGraphToBigWig']
Local input file: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r1.fastq.gz
Local input file: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r2.fastq.gz

> `File_mb`	27	2	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-21 14:43:06) elapsed: 1.0 _TIME_

Number of input file sets: 2
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R1.fastq.gz`  

> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R1.fastq.gz` (9146)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 9146;	Command: ln;	Return code: 0;	Memory used: 0.0GB

Local input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R1.fastq.gz'
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R2.fastq.gz`  

> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial2_r2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R2.fastq.gz` (9147)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 9147;	Command: ln;	Return code: 0;	Memory used: 0.0GB

Local input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1.fastq.gz', 'ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2.fastq.gz']
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1.fastq.gz`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2.fastq.gz`  

> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1.fastq.gz` (9148)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 9148;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/tutorial2_R2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2.fastq.gz` (9149)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 9149;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `Raw_reads`	1000000	PEPATAC	_RES_

> `Fastq_reads`	1000000	PEPATAC	_RES_

### Adapter trimming:  (09-21 14:43:08) elapsed: 3.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1_trim.fastq`  

> `skewer -f sanger -t 4 -m pe -x /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2.fastq.gz` (9185)
<pre>
Parameters used:
-- 3' end adapter sequences in file (-x):	/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/NexteraPE-PE.fa
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
-- number of concurrent threads (-t):	4
Mon Sep 21 14:43:09 2020[0;32m >> started[0m

Mon Sep 21 14:43:35 2020[0;32m >> done[0m (25.813s)
500000 read pairs processed; of these:
     0 ( 0.00%) short read pairs filtered out after trimming by size control
     0 ( 0.00%) empty read pairs filtered out after trimming by size control
500000 (100.00%) read pairs available; of these:
500000 (100.00%) untrimmed read pairs available after processing
log has been saved to "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2-trimmed.log".
</pre>
Command completed. Elapsed time: 0:00:26. Running peak memory: 0.003GB.  
  PID: 9185;	Command: skewer;	Return code: 0;	Memory used: 0.003GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2-trimmed-pair1.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1_trim.fastq` (9225)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 9225;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2-trimmed-pair2.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2_trim.fastq` (9226)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 9226;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	1000000	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastqc /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1_trim.fastq` (9231)
<pre>
Started analysis of tutorial2_R1_trim.fastq
Approx 5% complete for tutorial2_R1_trim.fastq
Approx 10% complete for tutorial2_R1_trim.fastq
Approx 15% complete for tutorial2_R1_trim.fastq
Approx 20% complete for tutorial2_R1_trim.fastq
Approx 25% complete for tutorial2_R1_trim.fastq
Approx 30% complete for tutorial2_R1_trim.fastq
Approx 35% complete for tutorial2_R1_trim.fastq
Approx 40% complete for tutorial2_R1_trim.fastq
Approx 45% complete for tutorial2_R1_trim.fastq
Approx 50% complete for tutorial2_R1_trim.fastq
Approx 55% complete for tutorial2_R1_trim.fastq
Approx 60% complete for tutorial2_R1_trim.fastq
Approx 65% complete for tutorial2_R1_trim.fastq
Approx 70% complete for tutorial2_R1_trim.fastq
Approx 75% complete for tutorial2_R1_trim.fastq
Approx 80% complete for tutorial2_R1_trim.fastq
Approx 85% complete for tutorial2_R1_trim.fastq
Approx 90% complete for tutorial2_R1_trim.fastq
Approx 95% complete for tutorial2_R1_trim.fastq
Approx 100% complete for tutorial2_R1_trim.fastq
Analysis complete for tutorial2_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 0.173GB.  
  PID: 9231;	Command: fastqc;	Return code: 0;	Memory used: 0.173GB

> `FastQC report r1`	fastq/tutorial2_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastqc /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2_trim.fastq` (9263)
<pre>
Started analysis of tutorial2_R2_trim.fastq
Approx 5% complete for tutorial2_R2_trim.fastq
Approx 10% complete for tutorial2_R2_trim.fastq
Approx 15% complete for tutorial2_R2_trim.fastq
Approx 20% complete for tutorial2_R2_trim.fastq
Approx 25% complete for tutorial2_R2_trim.fastq
Approx 30% complete for tutorial2_R2_trim.fastq
Approx 35% complete for tutorial2_R2_trim.fastq
Approx 40% complete for tutorial2_R2_trim.fastq
Approx 45% complete for tutorial2_R2_trim.fastq
Approx 50% complete for tutorial2_R2_trim.fastq
Approx 55% complete for tutorial2_R2_trim.fastq
Approx 60% complete for tutorial2_R2_trim.fastq
Approx 65% complete for tutorial2_R2_trim.fastq
Approx 70% complete for tutorial2_R2_trim.fastq
Approx 75% complete for tutorial2_R2_trim.fastq
Approx 80% complete for tutorial2_R2_trim.fastq
Approx 85% complete for tutorial2_R2_trim.fastq
Approx 90% complete for tutorial2_R2_trim.fastq
Approx 95% complete for tutorial2_R2_trim.fastq
Approx 100% complete for tutorial2_R2_trim.fastq
Analysis complete for tutorial2_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.173GB.  
  PID: 9263;	Command: fastqc;	Return code: 0;	Memory used: 0.171GB

> `FastQC report r2`	fastq/tutorial2_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-21 14:43:48) elapsed: 39.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-21 14:43:48) elapsed: 0.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/rCRSd_bt2`  

> `mkfifo /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/rCRSd_bt2` (9296)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.173GB.  
  PID: 9296;	Command: mkfifo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/filter_paired_fq.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/rCRSd_bt2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1_trim.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R2_trim.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R2.fq` (9298)
<pre>
</pre>
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 4 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id tutorial2 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/fastq/tutorial2_R1_trim.fastq --un /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/rCRSd_bt2 > /dev/null) 2>/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_bt_aln_summary.log` (9299)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:00:15. Running peak memory: 0.173GB.  
  PID: 9299;	Command: bowtie2;	Return code: 0;	Memory used: 0.068GB


> `grep 'aligned exactly 1 time' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	100556.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	10.06	PEPATAC	_RES_

### Map to human_repeats (09-21 14:44:03) elapsed: 15.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/human_repeats_bt2`  

> `mkfifo /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/human_repeats_bt2` (9350)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.173GB.  
  PID: 9350;	Command: mkfifo;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/filter_paired_fq.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/human_repeats_bt2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R2.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R2.fq` (9351)
<pre>
</pre>
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 4 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id tutorial2 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R1.fq --un /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/human_repeats_bt2 > /dev/null) 2>/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_bt_aln_summary.log` (9352)
<pre>
not gzipping output
50278 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:16. Running peak memory: 0.173GB.  
  PID: 9352;	Command: bowtie2;	Return code: 0;	Memory used: 0.072GB


> `grep 'aligned exactly 1 time' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	19842.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	1.98	PEPATAC	_RES_

### Compress all unmapped read files (09-21 14:44:19) elapsed: 16.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R1.fq` (9421)
<pre>
</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 0.173GB.  
  PID: 9421;	Command: pigz;	Return code: 0;	Memory used: 0.003GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_rCRSd_unmap_R2.fq` (9451)
<pre>
9921 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 0.173GB.  
  PID: 9451;	Command: pigz;	Return code: 0;	Memory used: 0.003GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R1.fq` (9584)
<pre>
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 0.173GB.  
  PID: 9584;	Command: pigz;	Return code: 0;	Memory used: 0.003GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R2.fq` (9604)
<pre>
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.173GB.  
  PID: 9604;	Command: pigz;	Return code: 0;	Memory used: 0.003GB


### Map to genome (09-21 14:44:47) elapsed: 28.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam`  

> `bowtie2 -p 4  --very-sensitive -X 2000 --rg-id tutorial2 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R1.fq.gz -2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/prealignments/tutorial2_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tmpn2p9e68e -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_temp.bam` (9620,9621,9622)
<pre>
439801 reads; of these:
  439801 (100.00%) were paired; of these:
    43 (0.01%) aligned concordantly 0 times
    403030 (91.64%) aligned concordantly exactly 1 time
    36728 (8.35%) aligned concordantly >1 times
    ----
    43 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    43 pairs aligned 0 times concordantly or discordantly; of these:
      86 mates make up the pairs; of these:
        65 (75.58%) aligned 0 times
        6 (6.98%) aligned exactly 1 time
        15 (17.44%) aligned >1 times
99.99% overall alignment rate
</pre>
Command completed. Elapsed time: 0:06:12. Running peak memory: 3.545GB.  
  PID: 9621;	Command: samtools;	Return code: 0;	Memory used: 0.004GB  
  PID: 9620;	Command: bowtie2;	Return code: 0;	Memory used: 3.545GB  
  PID: 9622;	Command: samtools;	Return code: 0;	Memory used: 0.221GB


> `samtools view -b -q 10 -@ 4 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_fail_qc.bam -f 2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_temp.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam` (10972)
<pre>
</pre>
Command completed. Elapsed time: 0:00:12. Running peak memory: 3.545GB.  
  PID: 10972;	Command: samtools;	Return code: 0;	Memory used: 0.013GB


> `Mapped_reads`	879537	PEPATAC	_RES_

> `QC_filtered_reads`	3707	PEPATAC	_RES_

> `Aligned_reads`	875830	PEPATAC	_RES_

> `Alignment_rate`	87.58	PEPATAC	_RES_

> `Total_efficiency`	87.58	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam.bai`  

> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_temp.bam` (11006)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.545GB.  
  PID: 11006;	Command: samtools;	Return code: 0;	Memory used: 0.022GB


> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam` (11013)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 11013;	Command: samtools;	Return code: 0;	Memory used: 0.016GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`

> `Mitochondrial_reads`	30	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_noMT.bam`  

> `samtools idxstats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/chr_sizes.bed` (11019,11020,11021,11022)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 11022;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 11019;	Command: samtools;	Return code: 0;	Memory used: 0.004GB  
  PID: 11021;	Command: awk;	Return code: 0;	Memory used: 0.001GB  
  PID: 11020;	Command: cut;	Return code: 0;	Memory used: 0.001GB


> `samtools view -L /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/chr_sizes.bed -b -@ 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_noMT.bam` (11024)
<pre>
</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 3.545GB.  
  PID: 11024;	Command: samtools;	Return code: 0;	Memory used: 0.015GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_noMT.bam /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam` (11044)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 11044;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam` (11045)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 11045;	Command: samtools;	Return code: 0;	Memory used: 0.015GB


### Calculate NRF, PBC1, and PBC2 (09-21 14:51:32) elapsed: 405.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_bamQC.tsv`  

> `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamQC.py -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam -c 4 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_bamQC.tsv` (11050)
<pre>
Registering input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam'
Temporary files will be stored in: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tmp_tutorial2_sort_gvvztbpo'
Processing with 4 cores...
Merging 52 files into output file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:00:11. Running peak memory: 3.545GB.  
  PID: 11050;	Command: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 0.342GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_bamQC.tsv`

> `NRF`	1.0	PEPATAC	_RES_

> `PBC1`	1.0	PEPATAC	_RES_

> `PBC2`	437908.0	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_unmap.bam`  

> `samtools view -b -@ 4 -f 12  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_temp.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_unmap.bam` (11091)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.545GB.  
  PID: 11091;	Command: samtools;	Return code: 0;	Memory used: 0.006GB


> `samtools view -c -f 4 -@ 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_temp.bam`

> `Unmapped_reads`	65	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-21 14:51:48) elapsed: 16.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam`  

> `samtools sort -n -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tmpawp6jjsj /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam | samtools view -h - -@ 1 | samblaster -r --ignoreUnmated 2> /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_dedup_metrics_log.txt | samtools view -b - -@ 1 | samtools sort - -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tmpawp6jjsj -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam` (11110,11111,11112,11113,11114)
<pre>
</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 3.545GB.  
  PID: 11110;	Command: samtools;	Return code: 0;	Memory used: 0.242GB  
  PID: 11112;	Command: samblaster;	Return code: 0;	Memory used: 0.005GB  
  PID: 11114;	Command: samtools;	Return code: 0;	Memory used: 0.241GB  
  PID: 11111;	Command: samtools;	Return code: 0;	Memory used: 0.003GB  
  PID: 11113;	Command: samtools;	Return code: 0;	Memory used: 0.004GB


> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam` (11261)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 11261;	Command: samtools;	Return code: 0;	Memory used: 0.015GB


> `grep 'Removed' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	0	PEPATAC	_RES_

> `Dedup_aligned_reads`	875830.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	87.58	PEPATAC	_RES_

> `Dedup_total_efficiency`	87.58	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`

> `Read_length`	42	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-21 14:52:31) elapsed: 43.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_preseq_out.txt`  

> `preseq c_curve -v -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_preseq_out.txt -B /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam` (11359)
<pre>
BAM_INPUT
TOTAL READS     = 437908
COUNTS_SUM      = 437908
DISTINCT READS  = 436959
DISTINCT COUNTS = 3
MAX COUNT       = 3
COUNTS OF 1     = 436025
OBSERVED COUNTS (4)
1	436025
2	919
3	15

</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 3.545GB.  
  PID: 11359;	Command: preseq;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_preseq_yield.txt`  

> `preseq lc_extrap -v -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_preseq_yield.txt -B /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort.bam` (11371)
<pre>
BAM_INPUT
TOTAL READS     = 437908
DISTINCT READS  = 436959
DISTINCT COUNTS = 3
MAX COUNT       = 3
COUNTS OF 1     = 436025
MAX TERMS       = 2
OBSERVED COUNTS (4)
1	436025
2	919
3	15

ERROR:	max count before zero is les than min required count (4), sample not sufficiently deep or duplicates removed
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.545GB.  
  PID: 11371;	Command: preseq;	Return code: 1;	Memory used: 0.005GB

Subprocess returned nonzero result. Check above output for details
ERROR: Subprocess returned nonzero result, but pipeline is continuing because nofail=True
Unable to calculate library complexity.

### Produce signal tracks (09-21 14:52:41) elapsed: 11.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_exact.bw`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_smooth.bw`  

> `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamSitesToWig.py -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_exact.bw -w /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_smooth.bw -m atac -p 2 --variable-step --scale 875830.0` (11379)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam'
Temporary files will be stored in: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tmp_tutorial2_sort_dedup_cuttrace_w8vq05f2'
Processing with 1 cores...
Reduce step (merge files)...
Merging 52 files into output file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_exact.bw'
Merging 52 files into output file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_smooth.bw'
</pre>
Command completed. Elapsed time: 0:21:06. Running peak memory: 3.545GB.  
  PID: 11379;	Command: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 2.495GB


### Calculate TSS enrichment (09-21 15:13:47) elapsed: 1266.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.txt`  

> `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 4 -z -v -s 6 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.txt` (15806)
<pre>
</pre>
Command completed. Elapsed time: 0:00:16. Running peak memory: 3.545GB.  
  PID: 15806;	Command: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 0.431GB

Missing stat 'TSS_score'

> `TSS_score`	13.2	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R tss -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.txt` (15863)
<pre>

Generating TSS plot with /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 3.545GB.  
  PID: 15863;	Command: Rscript;	Return code: 0;	Memory used: 0.239GB

> `TSS enrichment`	QC_hg38/tutorial2_TSS_enrichment.pdf	TSS enrichment	QC_hg38/tutorial2_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-21 15:14:11) elapsed: 23.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/fragment_length_dist.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLen.txt` (15892)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.545GB.  
  PID: 15892;	Command: perl;	Return code: 0;	Memory used: 0.006GB


> `sort -n  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLen.txt | uniq -c  > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragCount.txt` (15970,15971)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 15971;	Command: uniq;	Return code: 0;	Memory used: 0.002GB  
  PID: 15970;	Command: sort;	Return code: 0;	Memory used: 0.018GB


> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frag -l /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLen.txt -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragCount.txt -p /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLenDistribution.pdf -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLenDistribution.txt` (15977)
<pre>
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 3.545GB.  
  PID: 15977;	Command: Rscript;	Return code: 0;	Memory used: 0.243GB

> `Fragment distribution`	QC_hg38/tutorial2_fragLenDistribution.pdf	Fragment distribution	QC_hg38/tutorial2_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed.gz` (15999)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 15999;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `pigz -f -p 4 -d -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed.gz > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed` (16005)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16005;	Command: pigz;	Return code: 0;	Memory used: 0.002GB


### Call peaks (09-21 15:14:24) elapsed: 13.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.narrowPeak`  

> `macs2 callpeak -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed -f BED --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38 -n tutorial2 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (16049)
<pre>
INFO  @ Mon, 21 Sep 2020 15:14:24: 
# Command line: callpeak -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed -f BED --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38 -n tutorial2 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = tutorial2
# format = BED
# ChIP-seq file = ['/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed']
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
 
INFO  @ Mon, 21 Sep 2020 15:14:24: #1 read tag files... 
INFO  @ Mon, 21 Sep 2020 15:14:24: #1 read treatment tags... 
INFO  @ Mon, 21 Sep 2020 15:14:25: #1 tag size is determined as 50 bps 
INFO  @ Mon, 21 Sep 2020 15:14:25: #1 tag size = 50.0 
INFO  @ Mon, 21 Sep 2020 15:14:25: #1  total tags in treatment: 875816 
INFO  @ Mon, 21 Sep 2020 15:14:25: #1 finished! 
INFO  @ Mon, 21 Sep 2020 15:14:25: #2 Build Peak Model... 
INFO  @ Mon, 21 Sep 2020 15:14:25: #2 Skipped... 
INFO  @ Mon, 21 Sep 2020 15:14:25: #2 Use 150 as fragment length 
INFO  @ Mon, 21 Sep 2020 15:14:25: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 21 Sep 2020 15:14:25: #3 Call peaks... 
INFO  @ Mon, 21 Sep 2020 15:14:25: # local lambda is disabled! 
INFO  @ Mon, 21 Sep 2020 15:14:25: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 21 Sep 2020 15:14:25: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 21 Sep 2020 15:14:25: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 21 Sep 2020 15:14:25: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 21 Sep 2020 15:14:26: #3 Call peaks for each chromosome... 
INFO  @ Mon, 21 Sep 2020 15:18:25: #4 Write output xls file... /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.xls 
INFO  @ Mon, 21 Sep 2020 15:18:28: #4 Write peak in narrowPeak format file... /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.narrowPeak 
INFO  @ Mon, 21 Sep 2020 15:18:29: #4 Write summits bed file... /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_summits.bed 
INFO  @ Mon, 21 Sep 2020 15:18:30: Done! 
</pre>
Command completed. Elapsed time: 0:04:07. Running peak memory: 3.545GB.  
  PID: 16049;	Command: macs2;	Return code: 0;	Memory used: 0.118GB


> `Peak_count`	534448	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38_exact/tutorial2_shift.bed.gz` (16744)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 16744;	Command: pigz;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.narrowPeak > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_fixedWidth.narrowPeak` (16755)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 16755;	Command: awk;	Return code: 0;	Memory used: 0.007GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R reduce -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (16758)
<pre>
</pre>
Command completed. Elapsed time: 0:00:17. Running peak memory: 3.545GB.  
  PID: 16758;	Command: Rscript;	Return code: 0;	Memory used: 0.584GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_blacklist.bed`  

> `ln -sf /project/shefflab/genomes/hg38/blacklist/default/hg38_blacklist.bed.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_blacklist.bed.gz` (16795)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16795;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `pigz -f -p 4 -d -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_blacklist.bed.gz > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_blacklist.bed` (16796)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16796;	Command: pigz;	Return code: 0;	Memory used: 0.002GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_rmBlacklist.narrowPeak`  

> `bedtools intersect -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_blacklist.bed -v > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_rmBlacklist.narrowPeak` (16801)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 16801;	Command: bedtools;	Return code: 0;	Memory used: 0.004GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/blacklist.flag`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R reduce -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_rmBlacklist.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes` (16805)
<pre>
</pre>
Command completed. Elapsed time: 0:00:13. Running peak memory: 3.545GB.  
  PID: 16805;	Command: Rscript;	Return code: 0;	Memory used: 0.226GB


> `touch /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/blacklist.flag` (16844)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16844;	Command: touch;	Return code: 0;	Memory used: 0.0GB


### Calculate fraction of reads in peaks (FRiP) (09-21 15:19:04) elapsed: 281.0 _TIME_

Missing stat 'FRiP'

> `samtools view -@ 4 -c -L /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam`
875830 804029

> `FRiP`	0.92	PEPATAC	_RES_

### Calculate peak coverage (09-21 15:19:06) elapsed: 2.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt`  

> `samtools view -H /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt` (16853,16854,16855,16856)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16854;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 16856;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 16853;	Command: samtools;	Return code: 0;	Memory used: 0.003GB  
  PID: 16855;	Command: awk;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_sort.bed`  

> `cut -f 1-3 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.bed` (16858)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16858;	Command: cut;	Return code: 0;	Memory used: 0.002GB


> `samtools view -H /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt` (16860,16861,16862,16863)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16860;	Command: samtools;	Return code: 0;	Memory used: 0.0GB  
  PID: 16862;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 16861;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 16863;	Command: awk;	Return code: 0;	Memory used: 0.0GB


> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_keep.txt` (16865)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16865;	Command: cut;	Return code: 0;	Memory used: 0.002GB


> `bedtools sort -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.bed -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_sort.bed` (16867)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 16867;	Command: bedtools;	Return code: 0;	Memory used: 0.006GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/coverage.flag`  

> `bedtools coverage -sorted -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | uniq > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed` (16870,16871)
<pre>
</pre>
Command completed. Elapsed time: 0:00:04. Running peak memory: 3.545GB.  
  PID: 16870;	Command: bedtools;	Return code: 0;	Memory used: 0.011GB  
  PID: 16871;	Command: uniq;	Return code: 0;	Memory used: 0.002GB


> `awk 'BEGIN{OFS="\t";} NR==FNR{sum += $5; next}{if (sum <= 0){sum = 1} print $1, $2, $3, $4, $5, $6, $7, ($5/sum*1000000)}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_norm_peaks_coverage.bed` (16894)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 16894;	Command: awk;	Return code: 0;	Memory used: 0.011GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_norm_peaks_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed` (16896)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16896;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `touch /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/coverage.flag` (16897)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16897;	Command: touch;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_coverage.bed.gz` (16901)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 16901;	Command: pigz;	Return code: 0;	Memory used: 0.005GB


### # Produce bigBed formatted narrowPeak file (09-21 15:19:13) elapsed: 7.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/bigNarrowPeak.as`  

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
)' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/bigNarrowPeak.as` (16921)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 16921;	Command: echo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.bigBed`  

> `bedToBigBed -as=/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/bigNarrowPeak.as -type=bed6+4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tmpdppqd4sz /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks.bigBed` (16922)
<pre>
pass1 - making usageList (52 chroms): 69 millis
pass2 - checking and writing primary data (352486 records, 10 fields): 890 millis
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 16922;	Command: bedToBigBed;	Return code: 0;	Memory used: 0.004GB


### Annotate peaks (09-21 15:19:17) elapsed: 4.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_chromosome_distribution.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p chromosome -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_chromosome_distribution.pdf` (16924)
<pre>
chromosome distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 3.545GB.  
  PID: 16924;	Command: Rscript;	Return code: 0;	Memory used: 0.53GB

> `Peak chromosome distribution`	QC_hg38/tutorial2_peak_chromosome_distribution.pdf	Peak chromosome distribution	QC_hg38/tutorial2_peak_chromosome_distribution.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_TSS_distribution.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p tss -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_TSS_distribution.pdf` (16989)
<pre>
Scale for 'x' is already present. Adding another scale for 'x', which will
replace the existing scale.
tss distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:15. Running peak memory: 3.545GB.  
  PID: 16989;	Command: Rscript;	Return code: 0;	Memory used: 0.528GB

> `TSS distance distribution`	QC_hg38/tutorial2_peak_TSS_distribution.pdf	TSS distance distribution	QC_hg38/tutorial2_peak_TSS_distribution.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_genomic_distribution.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p genomic -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/tutorial2_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_genomic_distribution.pdf` (17224)
<pre>
genomic distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:16. Running peak memory: 3.545GB.  
  PID: 17224;	Command: Rscript;	Return code: 0;	Memory used: 0.653GB

> `Peak partition distribution`	QC_hg38/tutorial2_peak_genomic_distribution.pdf	Peak partition distribution	QC_hg38/tutorial2_peak_genomic_distribution.png	PEPATAC	_OBJ_

### Calculate read coverage (09-21 15:20:23) elapsed: 65.0 _TIME_


> `cut -f 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed | sort -u`
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3' UTR`  

> `awk -F'	' '{print>"/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/"$4}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/raw/hg38_annotations.bed` (17271)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17271;	Command: awk;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3_UTR`  

> `mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3' UTR" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3_UTR"` (17274)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 17274;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3_UTR_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3_UTR_sort.bed` (17275,17276,17277,17278)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 17275;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17277;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 17276;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 17278;	Command: bedtools;	Return code: 0;	Memory used: 0.036GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_3_UTR_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/3_UTR_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_3_UTR_coverage.bed` (17281)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17281;	Command: bedtools;	Return code: 0;	Memory used: 0.008GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5' UTR`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5_UTR`  

> `mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5' UTR" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5_UTR"` (17285)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 17285;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5_UTR_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5_UTR_sort.bed` (17286,17287,17288,17289)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 17286;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17287;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 17289;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB  
  PID: 17288;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_5_UTR_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/5_UTR_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_5_UTR_coverage.bed` (17292)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17292;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Enhancer`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Enhancer_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Enhancer | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Enhancer_sort.bed` (17296,17297,17298,17299)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 17296;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17298;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 17297;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 17299;	Command: bedtools;	Return code: 0;	Memory used: 0.01GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Enhancer_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Enhancer_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Enhancer_coverage.bed` (17305)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17305;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Exon`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Exon_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Exon | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Exon_sort.bed` (17310,17311,17312,17313)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.545GB.  
  PID: 17310;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17311;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 17313;	Command: bedtools;	Return code: 0;	Memory used: 0.167GB  
  PID: 17312;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Exon_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Exon_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Exon_coverage.bed` (17320)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.545GB.  
  PID: 17320;	Command: bedtools;	Return code: 0;	Memory used: 0.012GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Intron`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Intron_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Intron | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Intron_sort.bed` (17325,17326,17327,17328)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17325;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17328;	Command: bedtools;	Return code: 0;	Memory used: 0.076GB  
  PID: 17326;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 17327;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Intron_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Intron_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Intron_coverage.bed` (17332)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.545GB.  
  PID: 17332;	Command: bedtools;	Return code: 0;	Memory used: 0.015GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_sort.bed` (17340,17341,17342,17343)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.545GB.  
  PID: 17340;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17341;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 17343;	Command: bedtools;	Return code: 0;	Memory used: 0.008GB  
  PID: 17342;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_coverage.bed` (17346)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17346;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter Flanking Region`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_Flanking_Region`  

> `mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter Flanking Region" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_Flanking_Region"` (17351)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.545GB.  
  PID: 17351;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_Flanking_Region_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_Flanking_Region | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_Flanking_Region_sort.bed` (17352,17353,17354,17355)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17352;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 17354;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 17353;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 17355;	Command: bedtools;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_Flanking_Region_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/Promoter_Flanking_Region_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_Flanking_Region_coverage.bed` (17359)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.545GB.  
  PID: 17359;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB


### Calculate cumulative and terminal fraction of reads in features (cFRiF/FRiF) (09-21 15:20:52) elapsed: 30.0 _TIME_


> `samtools view -@ 4 -q 10 -c -F4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/aligned_hg38/tutorial2_sort_dedup.bam`
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_cFRiF.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frif -s tutorial2 -z 3099922541 -n 875816 -y cfrif --reads -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_cFRiF.pdf --bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_3_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_5_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Enhancer_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Exon_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Intron_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_Flanking_Region_coverage.bed` (17379)
<pre>
FRiF plot completed!

</pre>
Command completed. Elapsed time: 0:00:38. Running peak memory: 3.545GB.  
  PID: 17379;	Command: Rscript;	Return code: 0;	Memory used: 0.584GB

> `cFRiF`	QC_hg38/tutorial2_cFRiF.pdf	cFRiF	QC_hg38/tutorial2_cFRiF.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_FRiF.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frif -s tutorial2 -z 3099922541 -n 875816 -y frif --reads -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_FRiF.pdf --bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_3_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_5_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Enhancer_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Exon_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Intron_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial2/QC_hg38/tutorial2_Promoter_Flanking_Region_coverage.bed` (17452)
<pre>
FRiF plot completed!

</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 3.545GB.  
  PID: 17452;	Command: Rscript;	Return code: 0;	Memory used: 0.55GB

> `FRiF`	QC_hg38/tutorial2_FRiF.pdf	FRiF	QC_hg38/tutorial2_FRiF.png	PEPATAC	_OBJ_
Starting cleanup: 39 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Cleaning up conditional list. . .

### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:39:02
*  Total elapsed time (all runs):  0:53:17
*         Peak memory (this run):  3.5449 GB
*        Pipeline completed time: 2020-09-21 15:22:06
