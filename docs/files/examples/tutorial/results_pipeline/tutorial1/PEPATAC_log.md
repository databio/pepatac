### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/pipelines/pepatac.py --sample-name tutorial1 --genome hg38 --input /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r1.fastq.gz --single-or-paired paired -O /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline -P 4 -M 8000 --input2 /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r2.fastq.gz --genome-size hs --trimmer skewer --prealignments rCRSd human_repeats --deduplicator samblaster --peak-type fixed --extend 250 --frip-ref-peaks None`
*         Compute host:  udc-ba36-36
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac
*            Outfolder:  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/
*  Pipeline started at:   (09-21 14:04:14) elapsed: 0.0 _TIME_

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
*              `input`:  `['/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r1.fastq.gz']`
*             `input2`:  `['/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r2.fastq.gz']`
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
*        `sample_name`:  `tutorial1`
*             `silent`:  `False`
*   `single_or_paired`:  `paired`
*             `skipqc`:  `False`
*                `sob`:  `False`
*           `testmode`:  `False`
*            `trimmer`:  `skewer`
*          `verbosity`:  `None`

----------------------------------------

['java', 'python', 'samtools', 'bedtools', 'bowtie2', 'fastqc', 'macs2', 'preseq', 'samblaster', 'skewer', 'perl', 'wigToBigWig', 'bigWigCat', 'bedToBigBed', 'bwa', 'fseq', '${TRIMMOMATIC}', '${PICARD}', 'pigz', 'Rscript', 'seqOutBias', 'bigWigMerge', 'bedGraphToBigWig']
Local input file: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r1.fastq.gz
Local input file: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r2.fastq.gz

> `File_mb`	27	2	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-21 14:04:14) elapsed: 1.0 _TIME_

Number of input file sets: 2
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz`  

> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz` (32206)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 32206;	Command: ln;	Return code: 0;	Memory used: 0.0GB

Local input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz'
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz`  

> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/data/tutorial1_r2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz` (32207)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 32207;	Command: ln;	Return code: 0;	Memory used: 0.0GB

Local input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz'
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
Found .fastq.gz file
Found .fq.gz file; no conversion necessary
['ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1.fastq.gz', 'ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2.fastq.gz']
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1.fastq.gz`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2.fastq.gz`  

> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1.fastq.gz` (32208)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 32208;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `ln -sf /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/tutorial1_R2.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2.fastq.gz` (32209)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.0GB.  
  PID: 32209;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `Raw_reads`	1000000	PEPATAC	_RES_

> `Fastq_reads`	1000000	PEPATAC	_RES_

### Adapter trimming:  (09-21 14:04:16) elapsed: 2.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq`  

> `skewer -f sanger -t 4 -m pe -x /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1.fastq.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2.fastq.gz` (32245)
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
Mon Sep 21 14:04:16 2020[0;32m >> started[0m

Mon Sep 21 14:04:41 2020[0;32m >> done[0m (24.928s)
500000 read pairs processed; of these:
     0 ( 0.00%) short read pairs filtered out after trimming by size control
     0 ( 0.00%) empty read pairs filtered out after trimming by size control
500000 (100.00%) read pairs available; of these:
500000 (100.00%) untrimmed read pairs available after processing
log has been saved to "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1-trimmed.log".
</pre>
Command completed. Elapsed time: 0:00:25. Running peak memory: 0.003GB.  
  PID: 32245;	Command: skewer;	Return code: 0;	Memory used: 0.003GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1-trimmed-pair1.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq` (32280)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 32280;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1-trimmed-pair2.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim.fastq` (32281)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.003GB.  
  PID: 32281;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Evaluating read trimming

> `Trimmed_reads`	1000000	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim_fastqc.html`  

> `fastqc --noextract --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastqc /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq` (32286)
<pre>
Started analysis of tutorial1_R1_trim.fastq
Approx 5% complete for tutorial1_R1_trim.fastq
Approx 10% complete for tutorial1_R1_trim.fastq
Approx 15% complete for tutorial1_R1_trim.fastq
Approx 20% complete for tutorial1_R1_trim.fastq
Approx 25% complete for tutorial1_R1_trim.fastq
Approx 30% complete for tutorial1_R1_trim.fastq
Approx 35% complete for tutorial1_R1_trim.fastq
Approx 40% complete for tutorial1_R1_trim.fastq
Approx 45% complete for tutorial1_R1_trim.fastq
Approx 50% complete for tutorial1_R1_trim.fastq
Approx 55% complete for tutorial1_R1_trim.fastq
Approx 60% complete for tutorial1_R1_trim.fastq
Approx 65% complete for tutorial1_R1_trim.fastq
Approx 70% complete for tutorial1_R1_trim.fastq
Approx 75% complete for tutorial1_R1_trim.fastq
Approx 80% complete for tutorial1_R1_trim.fastq
Approx 85% complete for tutorial1_R1_trim.fastq
Approx 90% complete for tutorial1_R1_trim.fastq
Approx 95% complete for tutorial1_R1_trim.fastq
Approx 100% complete for tutorial1_R1_trim.fastq
Analysis complete for tutorial1_R1_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 0.164GB.  
  PID: 32286;	Command: fastqc;	Return code: 0;	Memory used: 0.164GB

> `FastQC report r1`	fastq/tutorial1_R1_trim_fastqc.html	FastQC report r1	None	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim_fastqc.html`  

> `fastqc --noextract --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastqc /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim.fastq` (32325)
<pre>
Started analysis of tutorial1_R2_trim.fastq
Approx 5% complete for tutorial1_R2_trim.fastq
Approx 10% complete for tutorial1_R2_trim.fastq
Approx 15% complete for tutorial1_R2_trim.fastq
Approx 20% complete for tutorial1_R2_trim.fastq
Approx 25% complete for tutorial1_R2_trim.fastq
Approx 30% complete for tutorial1_R2_trim.fastq
Approx 35% complete for tutorial1_R2_trim.fastq
Approx 40% complete for tutorial1_R2_trim.fastq
Approx 45% complete for tutorial1_R2_trim.fastq
Approx 50% complete for tutorial1_R2_trim.fastq
Approx 55% complete for tutorial1_R2_trim.fastq
Approx 60% complete for tutorial1_R2_trim.fastq
Approx 65% complete for tutorial1_R2_trim.fastq
Approx 70% complete for tutorial1_R2_trim.fastq
Approx 75% complete for tutorial1_R2_trim.fastq
Approx 80% complete for tutorial1_R2_trim.fastq
Approx 85% complete for tutorial1_R2_trim.fastq
Approx 90% complete for tutorial1_R2_trim.fastq
Approx 95% complete for tutorial1_R2_trim.fastq
Approx 100% complete for tutorial1_R2_trim.fastq
Analysis complete for tutorial1_R2_trim.fastq
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.172GB.  
  PID: 32325;	Command: fastqc;	Return code: 0;	Memory used: 0.172GB

> `FastQC report r2`	fastq/tutorial1_R2_trim_fastqc.html	FastQC report r2	None	PEPATAC	_OBJ_

### Prealignments (09-21 14:04:55) elapsed: 39.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-21 14:04:55) elapsed: 0.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2`  

> `mkfifo /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2` (32361)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.172GB.  
  PID: 32361;	Command: mkfifo;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/filter_paired_fq.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R2_trim.fastq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq` (32362)
<pre>
</pre>
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq.gz`  

> `(bowtie2 -p 4 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/rCRSd/bowtie2_index/default/rCRSd --rg-id tutorial1 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/fastq/tutorial1_R1_trim.fastq --un /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/rCRSd_bt2 > /dev/null) 2>/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_bt_aln_summary.log` (32363)
<pre>
not gzipping output
</pre>
Command completed. Elapsed time: 0:00:14. Running peak memory: 0.172GB.  
  PID: 32363;	Command: bowtie2;	Return code: 0;	Memory used: 0.068GB


> `grep 'aligned exactly 1 time' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	99360.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	9.94	PEPATAC	_RES_

### Map to human_repeats (09-21 14:05:09) elapsed: 15.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2`  

> `mkfifo /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2` (32545)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0.172GB.  
  PID: 32545;	Command: mkfifo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq.gz`  

> `perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/filter_paired_fq.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq` (32546)
<pre>
</pre>
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_bt_aln_summary.log`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq.gz`  

> `(bowtie2 -p 4 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /project/shefflab/genomes/human_repeats/bowtie2_index/default/human_repeats --rg-id tutorial1 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq --un /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/human_repeats_bt2 > /dev/null) 2>/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_bt_aln_summary.log` (32547)
<pre>
not gzipping output
49680 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:16. Running peak memory: 0.172GB.  
  PID: 32547;	Command: bowtie2;	Return code: 0;	Memory used: 0.072GB


> `grep 'aligned exactly 1 time' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	20102.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	2.01	PEPATAC	_RES_

### Compress all unmapped read files (09-21 14:05:25) elapsed: 16.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R1.fq` (32576)
<pre>
</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 0.172GB.  
  PID: 32576;	Command: pigz;	Return code: 0;	Memory used: 0.003GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_rCRSd_unmap_R2.fq` (32592)
<pre>
10051 reads skipped
0 reads lost
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.172GB.  
  PID: 32592;	Command: pigz;	Return code: 0;	Memory used: 0.003GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq` (32604)
<pre>
</pre>
Command completed. Elapsed time: 0:00:08. Running peak memory: 0.172GB.  
  PID: 32604;	Command: pigz;	Return code: 0;	Memory used: 0.003GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq` (32620)
<pre>
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 0.172GB.  
  PID: 32620;	Command: pigz;	Return code: 0;	Memory used: 0.003GB


### Map to genome (09-21 14:05:53) elapsed: 28.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam`  

> `bowtie2 -p 4  --very-sensitive -X 2000 --rg-id tutorial1 -x /project/shefflab/genomes/hg38/bowtie2_index/default/hg38 -1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R1.fq.gz -2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/prealignments/tutorial1_human_repeats_unmap_R2.fq.gz | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tmpuh0mv4hp -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam` (32635,32636,32637)
<pre>
440269 reads; of these:
  440269 (100.00%) were paired; of these:
    40 (0.01%) aligned concordantly 0 times
    403728 (91.70%) aligned concordantly exactly 1 time
    36501 (8.29%) aligned concordantly >1 times
    ----
    40 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    40 pairs aligned 0 times concordantly or discordantly; of these:
      80 mates make up the pairs; of these:
        59 (73.75%) aligned 0 times
        7 (8.75%) aligned exactly 1 time
        14 (17.50%) aligned >1 times
99.99% overall alignment rate
</pre>
Command completed. Elapsed time: 0:06:36. Running peak memory: 3.544GB.  
  PID: 32637;	Command: samtools;	Return code: 0;	Memory used: 0.218GB  
  PID: 32635;	Command: bowtie2;	Return code: 0;	Memory used: 3.544GB  
  PID: 32636;	Command: samtools;	Return code: 0;	Memory used: 0.004GB


> `samtools view -b -q 10 -@ 4 -U /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_fail_qc.bam -f 2 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam` (1500)
<pre>
</pre>
Command completed. Elapsed time: 0:00:09. Running peak memory: 3.544GB.  
  PID: 1500;	Command: samtools;	Return code: 0;	Memory used: 0.013GB


> `Mapped_reads`	880479	PEPATAC	_RES_

> `QC_filtered_reads`	3539	PEPATAC	_RES_

> `Aligned_reads`	876940	PEPATAC	_RES_

> `Alignment_rate`	87.69	PEPATAC	_RES_

> `Total_efficiency`	87.69	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam.bai`  

> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam` (1546)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 1546;	Command: samtools;	Return code: 0;	Memory used: 0.016GB


> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam` (1551)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 1551;	Command: samtools;	Return code: 0;	Memory used: 0.017GB

Missing stat 'Mitochondrial_reads'

> `samtools idxstats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam | grep -we 'chrM' -we 'ChrM' -we 'ChrMT' -we 'chrMT' -we 'M' -we 'MT' -we 'rCRSd'| cut -f 3`

> `Mitochondrial_reads`	18	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_noMT.bam`  

> `samtools idxstats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam | cut -f 1-2 | awk '{print $1, 0, $2}' | grep -vwe 'chrM' -vwe 'ChrM' -vwe 'ChrMT' -vwe 'chrMT' -vwe 'M' -vwe 'MT' -vwe 'rCRSd' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/chr_sizes.bed` (1559,1560,1561,1562)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 1562;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 1559;	Command: samtools;	Return code: 0;	Memory used: 0.005GB  
  PID: 1561;	Command: awk;	Return code: 0;	Memory used: 0.001GB  
  PID: 1560;	Command: cut;	Return code: 0;	Memory used: 0.001GB


> `samtools view -L /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/chr_sizes.bed -b -@ 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_noMT.bam` (1564)
<pre>
</pre>
Command completed. Elapsed time: 0:00:09. Running peak memory: 3.544GB.  
  PID: 1564;	Command: samtools;	Return code: 0;	Memory used: 0.015GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_noMT.bam /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam` (1584)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 1584;	Command: mv;	Return code: 0;	Memory used: 0.0GB


> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam` (1585)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 1585;	Command: samtools;	Return code: 0;	Memory used: 0.017GB


### Calculate NRF, PBC1, and PBC2 (09-21 14:12:53) elapsed: 420.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv`  

> `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamQC.py -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam -c 4 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv` (1589)
<pre>
Registering input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam'
Temporary files will be stored in: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tmp_tutorial1_sort_3nh89p4l'
Processing with 4 cores...
Merging 53 files into output file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv'
</pre>
Command completed. Elapsed time: 0:00:09. Running peak memory: 3.544GB.  
  PID: 1589;	Command: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamQC.py;	Return code: 0;	Memory used: 0.354GB


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_bamQC.tsv`

> `NRF`	1.0	PEPATAC	_RES_

> `PBC1`	1.0	PEPATAC	_RES_

> `PBC2`	438465.0	PEPATAC	_RES_
Missing stat 'Unmapped_reads'
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_unmap.bam`  

> `samtools view -b -@ 4 -f 12  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_unmap.bam` (1634)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 1634;	Command: samtools;	Return code: 0;	Memory used: 0.005GB


> `samtools view -c -f 4 -@ 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_temp.bam`

> `Unmapped_reads`	59	PEPATAC	_RES_

### Remove duplicates and produce signal tracks (09-21 14:13:04) elapsed: 11.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam`  

> `samtools sort -n -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tmpqxlr3h_m /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam | samtools view -h - -@ 1 | samblaster -r --ignoreUnmated 2> /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_dedup_metrics_log.txt | samtools view -b - -@ 1 | samtools sort - -@ 1 -T /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tmpqxlr3h_m -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam` (1655,1656,1657,1658,1659)
<pre>
</pre>
Command completed. Elapsed time: 0:00:30. Running peak memory: 3.544GB.  
  PID: 1655;	Command: samtools;	Return code: 0;	Memory used: 0.242GB  
  PID: 1657;	Command: samblaster;	Return code: 0;	Memory used: 0.005GB  
  PID: 1659;	Command: samtools;	Return code: 0;	Memory used: 0.221GB  
  PID: 1656;	Command: samtools;	Return code: 0;	Memory used: 0.003GB  
  PID: 1658;	Command: samtools;	Return code: 0;	Memory used: 0.004GB


> `samtools index /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam` (1706)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 1706;	Command: samtools;	Return code: 0;	Memory used: 0.017GB


> `grep 'Removed' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_dedup_metrics_log.txt | tr -s ' ' | cut -f 3 -d ' '`

> `Duplicate_reads`	0	PEPATAC	_RES_

> `Dedup_aligned_reads`	876940.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	87.69	PEPATAC	_RES_

> `Dedup_total_efficiency`	87.69	PEPATAC	_RES_
Missing stat 'Read_length'

> `samtools stats /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam | grep '^SN' | cut -f 2- | grep 'maximum length:' | cut -f 2-`

> `Read_length`	42	PEPATAC	_RES_
Missing stat 'Genome_size'

> `awk '{sum+=$2} END {printf "%.0f", sum}' /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes`

> `Genome_size`	3099922541	PEPATAC	_RES_

### Calculate library complexity (09-21 14:13:40) elapsed: 36.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_out.txt`  

> `preseq c_curve -v -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_out.txt -B /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam` (1731)
<pre>
BAM_INPUT
TOTAL READS     = 438466
COUNTS_SUM      = 438466
DISTINCT READS  = 437508
DISTINCT COUNTS = 4
MAX COUNT       = 4
COUNTS OF 1     = 436566
OBSERVED COUNTS (5)
1	436566
2	927
3	14
4	1

</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.544GB.  
  PID: 1731;	Command: preseq;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt`  

> `preseq lc_extrap -v -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt -B /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam` (1740)
<pre>
BAM_INPUT
TOTAL READS     = 438466
DISTINCT READS  = 437508
DISTINCT COUNTS = 4
MAX COUNT       = 4
COUNTS OF 1     = 436566
MAX TERMS       = 4
OBSERVED COUNTS (5)
1	436566
2	927
3	14
4	1

[ESTIMATING YIELD CURVE]
[BOOTSTRAPPING HISTOGRAM]
._.._._.._..__..._._.___._.___...__.___..__._.__...___...__.....__._........___..__._.__.._._....__.__..._.___..._._._...__.._.__..__.._..._._..__..........._.._..__._....
[COMPUTING CONFIDENCE INTERVALS]
[WRITING OUTPUT]
</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 3.544GB.  
  PID: 1740;	Command: preseq;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_counts.txt`  

> `echo '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt '$(samtools view -c -F 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort.bam)' '$(samtools view -c -F 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam) > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_counts.txt` (1746)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 1746;	Command: echo;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_plot.pdf`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_plot.png`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R preseq -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt -r /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_counts.txt -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_plot` (1755)
<pre>
INFO: Found real counts for tutorial1 - Total (M): 0.87693 Unique (M): 0.87693

Library complexity plot completed!

</pre>
Command completed. Elapsed time: 0:00:07. Running peak memory: 3.544GB.  
  PID: 1755;	Command: Rscript;	Return code: 0;	Memory used: 0.212GB

> `Library complexity`	QC_hg38/tutorial1_preseq_plot.pdf	Library complexity	QC_hg38/tutorial1_preseq_plot.png	PEPATAC	_OBJ_
Missing stat 'Frac_exp_unique_at_10M'

> `grep -w '^10000000' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_yield.txt | awk '{print $2}'`

> `Frac_exp_unique_at_10M`	0.9572	PEPATAC	_RES_

### Produce signal tracks (09-21 14:14:00) elapsed: 20.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_exact.bw`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_smooth.bw`  

> `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamSitesToWig.py -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes -e /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_exact.bw -w /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_smooth.bw -m atac -p 2 --variable-step --scale 876940.0` (1783)
<pre>
Cutting parallel chroms in half to accommodate two tracks.
Registering input file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam'
Temporary files will be stored in: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tmp_tutorial1_sort_dedup_cuttrace_6u3kypgq'
Processing with 1 cores...
Reduce step (merge files)...
Merging 53 files into output file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_exact.bw'
Merging 53 files into output file: '/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_smooth.bw'
</pre>
Command completed. Elapsed time: 0:20:32. Running peak memory: 3.544GB.  
  PID: 1783;	Command: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/bamSitesToWig.py;	Return code: 0;	Memory used: 1.859GB


### Calculate TSS enrichment (09-21 14:34:32) elapsed: 1232.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.txt`  

> `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -b /project/shefflab/genomes/hg38/refgene_anno/default/hg38_TSS.bed -p ends -c 4 -z -v -s 6 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.txt` (6822)
<pre>
</pre>
Command completed. Elapsed time: 0:00:15. Running peak memory: 3.544GB.  
  PID: 6822;	Command: /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/pyTssEnrichment.py;	Return code: 0;	Memory used: 0.404GB

Missing stat 'TSS_score'

> `TSS_score`	14.3	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R tss -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.txt` (6862)
<pre>

Generating TSS plot with /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.txt
`geom_smooth()` using formula 'y ~ x'
`geom_smooth()` using formula 'y ~ x'
TSS enrichment plot completed!

</pre>
Command completed. Elapsed time: 0:00:09. Running peak memory: 3.544GB.  
  PID: 6862;	Command: Rscript;	Return code: 0;	Memory used: 0.213GB

> `TSS enrichment`	QC_hg38/tutorial1_TSS_enrichment.pdf	TSS enrichment	QC_hg38/tutorial1_TSS_enrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-21 14:34:56) elapsed: 24.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.pdf`  

> `perl /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/fragment_length_dist.pl /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLen.txt` (6894)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.544GB.  
  PID: 6894;	Command: perl;	Return code: 0;	Memory used: 0.006GB


> `sort -n  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLen.txt | uniq -c  > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragCount.txt` (6899,6900)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 6899;	Command: sort;	Return code: 0;	Memory used: 0.018GB  
  PID: 6900;	Command: uniq;	Return code: 0;	Memory used: 0.002GB


> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frag -l /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLen.txt -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragCount.txt -p /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.pdf -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.txt` (7061)
<pre>
Fragment distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:06. Running peak memory: 3.544GB.  
  PID: 7061;	Command: Rscript;	Return code: 0;	Memory used: 0.213GB

> `Fragment distribution`	QC_hg38/tutorial1_fragLenDistribution.pdf	Fragment distribution	QC_hg38/tutorial1_fragLenDistribution.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed`  

> `ln -sf /project/shefflab/genomes/hg38/feat_annotation/default/hg38_annotations.bed.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed.gz` (7081)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 7081;	Command: ln;	Return code: 0;	Memory used: 0.001GB


> `pigz -f -p 4 -d -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed.gz > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed` (7082)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 7082;	Command: pigz;	Return code: 0;	Memory used: 0.002GB


### Call peaks (09-21 14:35:08) elapsed: 12.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.narrowPeak`  

> `macs2 callpeak -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed -f BED --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38 -n tutorial1 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01` (7088)
<pre>
INFO  @ Mon, 21 Sep 2020 14:35:09: 
# Command line: callpeak -t /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed -f BED --outdir /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38 -n tutorial1 -g hs --shift -75 --extsize 150 --nomodel --call-summits --nolambda --keep-dup all -p 0.01
# ARGUMENTS LIST:
# name = tutorial1
# format = BED
# ChIP-seq file = ['/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed']
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
 
INFO  @ Mon, 21 Sep 2020 14:35:09: #1 read tag files... 
INFO  @ Mon, 21 Sep 2020 14:35:09: #1 read treatment tags... 
INFO  @ Mon, 21 Sep 2020 14:35:10: #1 tag size is determined as 50 bps 
INFO  @ Mon, 21 Sep 2020 14:35:10: #1 tag size = 50.0 
INFO  @ Mon, 21 Sep 2020 14:35:10: #1  total tags in treatment: 876930 
INFO  @ Mon, 21 Sep 2020 14:35:10: #1 finished! 
INFO  @ Mon, 21 Sep 2020 14:35:10: #2 Build Peak Model... 
INFO  @ Mon, 21 Sep 2020 14:35:10: #2 Skipped... 
INFO  @ Mon, 21 Sep 2020 14:35:10: #2 Use 150 as fragment length 
INFO  @ Mon, 21 Sep 2020 14:35:10: #2 Sequencing ends will be shifted towards 5' by 75 bp(s) 
INFO  @ Mon, 21 Sep 2020 14:35:10: #3 Call peaks... 
INFO  @ Mon, 21 Sep 2020 14:35:10: # local lambda is disabled! 
INFO  @ Mon, 21 Sep 2020 14:35:10: #3 !!!! DYNAMIC LAMBDA IS DISABLED !!!! 
INFO  @ Mon, 21 Sep 2020 14:35:10: #3 Going to call summits inside each peak ... 
INFO  @ Mon, 21 Sep 2020 14:35:10: #3 Call peaks with given -log10pvalue cutoff: 2.00000 ... 
INFO  @ Mon, 21 Sep 2020 14:35:10: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 21 Sep 2020 14:35:11: #3 Call peaks for each chromosome... 
INFO  @ Mon, 21 Sep 2020 14:39:08: #4 Write output xls file... /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.xls 
INFO  @ Mon, 21 Sep 2020 14:39:10: #4 Write peak in narrowPeak format file... /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.narrowPeak 
INFO  @ Mon, 21 Sep 2020 14:39:11: #4 Write summits bed file... /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_summits.bed 
INFO  @ Mon, 21 Sep 2020 14:39:12: Done! 
</pre>
Command completed. Elapsed time: 0:04:04. Running peak memory: 3.544GB.  
  PID: 7088;	Command: macs2;	Return code: 0;	Memory used: 0.12GB


> `Peak_count`	535285	PEPATAC	_RES_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38_exact/tutorial1_shift.bed.gz` (8016)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8016;	Command: pigz;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_fixedWidth.narrowPeak`  

> `awk -v OFS='	' '{$2 = int(($3 - $2)/2 + $2 - 250); $3 = int($2 + 500); print}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.narrowPeak > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_fixedWidth.narrowPeak` (8026)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8026;	Command: awk;	Return code: 0;	Memory used: 0.007GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R reduce -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_fixedWidth.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes --normalize` (8028)
<pre>
</pre>
Command completed. Elapsed time: 0:00:15. Running peak memory: 3.544GB.  
  PID: 8028;	Command: Rscript;	Return code: 0;	Memory used: 0.671GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed`  

> `ln -sf /project/shefflab/genomes/hg38/blacklist/default/hg38_blacklist.bed.gz /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed.gz` (8067)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8067;	Command: ln;	Return code: 0;	Memory used: 0.0GB


> `pigz -f -p 4 -d -c /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed.gz > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed` (8068)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8068;	Command: pigz;	Return code: 0;	Memory used: 0.002GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_rmBlacklist.narrowPeak`  

> `bedtools intersect -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_blacklist.bed -v > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_rmBlacklist.narrowPeak` (8073)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8073;	Command: bedtools;	Return code: 0;	Memory used: 0.004GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/blacklist.flag`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R reduce -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_rmBlacklist.narrowPeak -c /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes` (8075)
<pre>
</pre>
Command completed. Elapsed time: 0:00:13. Running peak memory: 3.544GB.  
  PID: 8075;	Command: Rscript;	Return code: 0;	Memory used: 0.296GB


> `touch /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/blacklist.flag` (8112)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8112;	Command: touch;	Return code: 0;	Memory used: 0.001GB


### Calculate fraction of reads in peaks (FRiP) (09-21 14:39:44) elapsed: 275.0 _TIME_

Missing stat 'FRiP'

> `samtools view -@ 4 -c -L /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam`
876940 804980

> `FRiP`	0.92	PEPATAC	_RES_

### Calculate peak coverage (09-21 14:39:46) elapsed: 2.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt`  

> `samtools view -H /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt` (8123,8124,8125,8126)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8123;	Command: samtools;	Return code: 0;	Memory used: 0.0GB  
  PID: 8125;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 8124;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 8126;	Command: awk;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_sort.bed`  

> `cut -f 1-3 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bed` (8129)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8129;	Command: cut;	Return code: 0;	Memory used: 0.002GB


> `samtools view -H /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt` (8131,8132,8133,8134)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8131;	Command: samtools;	Return code: 0;	Memory used: 0.0GB  
  PID: 8133;	Command: awk;	Return code: 0;	Memory used: 0.0GB  
  PID: 8132;	Command: grep;	Return code: 0;	Memory used: 0.0GB  
  PID: 8134;	Command: awk;	Return code: 0;	Memory used: 0.0GB


> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_keep.txt` (8136)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8136;	Command: cut;	Return code: 0;	Memory used: 0.0GB


> `bedtools sort -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bed -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_sort.bed` (8138)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8138;	Command: bedtools;	Return code: 0;	Memory used: 0.008GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/coverage.flag`  

> `bedtools coverage -sorted -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | uniq > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed` (8141,8142)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.544GB.  
  PID: 8141;	Command: bedtools;	Return code: 0;	Memory used: 0.011GB  
  PID: 8142;	Command: uniq;	Return code: 0;	Memory used: 0.002GB


> `awk 'BEGIN{OFS="\t";} NR==FNR{sum += $5; next}{if (sum <= 0){sum = 1} print $1, $2, $3, $4, $5, $6, $7, ($5/sum*1000000)}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_norm_peaks_coverage.bed` (8147)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8147;	Command: awk;	Return code: 0;	Memory used: 0.011GB


> `mv /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_norm_peaks_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed` (8151)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8151;	Command: mv;	Return code: 0;	Memory used: 0.001GB


> `touch /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/coverage.flag` (8152)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8152;	Command: touch;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed.gz`  

> `pigz -f -p 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_coverage.bed.gz` (8153)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8153;	Command: pigz;	Return code: 0;	Memory used: 0.005GB


### # Produce bigBed formatted narrowPeak file (09-21 14:39:53) elapsed: 7.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/bigNarrowPeak.as`  

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
)' > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/bigNarrowPeak.as` (8176)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8176;	Command: echo;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bigBed`  

> `bedToBigBed -as=/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/bigNarrowPeak.as -type=bed6+4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tmp85spiubq /project/shefflab/genomes/hg38/fasta/default/hg38.chrom.sizes /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks.bigBed` (8177)
<pre>
pass1 - making usageList (53 chroms): 91 millis
pass2 - checking and writing primary data (352537 records, 10 fields): 875 millis
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8177;	Command: bedToBigBed;	Return code: 0;	Memory used: 0.004GB


### Annotate peaks (09-21 14:39:58) elapsed: 5.0 _TIME_

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_chromosome_distribution.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p chromosome -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_chromosome_distribution.pdf` (8179)
<pre>
chromosome distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:41. Running peak memory: 3.544GB.  
  PID: 8179;	Command: Rscript;	Return code: 0;	Memory used: 0.459GB

> `Peak chromosome distribution`	QC_hg38/tutorial1_peak_chromosome_distribution.pdf	Peak chromosome distribution	QC_hg38/tutorial1_peak_chromosome_distribution.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_TSS_distribution.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p tss -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_TSS_distribution.pdf` (8659)
<pre>
Scale for 'x' is already present. Adding another scale for 'x', which will
replace the existing scale.
tss distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:17. Running peak memory: 3.544GB.  
  PID: 8659;	Command: Rscript;	Return code: 0;	Memory used: 0.497GB

> `TSS distance distribution`	QC_hg38/tutorial1_peak_TSS_distribution.pdf	TSS distance distribution	QC_hg38/tutorial1_peak_TSS_distribution.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_genomic_distribution.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R anno -p genomic -i /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/tutorial1_peaks_normalized.narrowPeak -f /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed -g hg38 -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_genomic_distribution.pdf` (8724)
<pre>
genomic distribution plot completed!

</pre>
Command completed. Elapsed time: 0:00:19. Running peak memory: 3.544GB.  
  PID: 8724;	Command: Rscript;	Return code: 0;	Memory used: 0.549GB

> `Peak partition distribution`	QC_hg38/tutorial1_peak_genomic_distribution.pdf	Peak partition distribution	QC_hg38/tutorial1_peak_genomic_distribution.png	PEPATAC	_OBJ_

### Calculate read coverage (09-21 14:41:14) elapsed: 77.0 _TIME_


> `cut -f 4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed | sort -u`
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3' UTR`  

> `awk -F'	' '{print>"/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/"$4}' /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/raw/hg38_annotations.bed` (8783)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8783;	Command: awk;	Return code: 0;	Memory used: 0.005GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR`  

> `mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3' UTR" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR"` (8787)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8787;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR_sort.bed` (8788,8789,8790,8791)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8788;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8789;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 8791;	Command: bedtools;	Return code: 0;	Memory used: 0.036GB  
  PID: 8790;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/3_UTR_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed` (8803)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.544GB.  
  PID: 8803;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5' UTR`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR`  

> `mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5' UTR" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR"` (8822)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8822;	Command: mv;	Return code: 0;	Memory used: 0.0GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR_sort.bed` (8823,8824,8825,8826)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8823;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8824;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 8826;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB  
  PID: 8825;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/5_UTR_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed` (8829)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8829;	Command: bedtools;	Return code: 0;	Memory used: 0.008GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer_sort.bed` (8839,8840,8841,8842)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8839;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8841;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 8840;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 8842;	Command: bedtools;	Return code: 0;	Memory used: 0.047GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Enhancer_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed` (8860)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8860;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon_sort.bed` (8864,8865,8866,8867)
<pre>
</pre>
Command completed. Elapsed time: 0:00:05. Running peak memory: 3.544GB.  
  PID: 8864;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8865;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 8867;	Command: bedtools;	Return code: 0;	Memory used: 0.167GB  
  PID: 8866;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Exon_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed` (8878)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.544GB.  
  PID: 8878;	Command: bedtools;	Return code: 0;	Memory used: 0.012GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron_sort.bed` (8886,8887,8888,8889)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8886;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8889;	Command: bedtools;	Return code: 0;	Memory used: 0.076GB  
  PID: 8887;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 8888;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Intron_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed` (8894)
<pre>
</pre>
Command completed. Elapsed time: 0:00:03. Running peak memory: 3.544GB.  
  PID: 8894;	Command: bedtools;	Return code: 0;	Memory used: 0.014GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_sort.bed` (8901,8902,8903,8904)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8901;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8902;	Command: grep;	Return code: 0;	Memory used: 0.003GB  
  PID: 8904;	Command: bedtools;	Return code: 0;	Memory used: 0.009GB  
  PID: 8903;	Command: cut;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed` (8906)
<pre>
</pre>
Command completed. Elapsed time: 0:00:01. Running peak memory: 3.544GB.  
  PID: 8906;	Command: bedtools;	Return code: 0;	Memory used: 0.007GB

Target exists: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter Flanking Region`  
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region`  

> `mv "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter Flanking Region" "/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region"` (8912)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 3.544GB.  
  PID: 8912;	Command: mv;	Return code: 0;	Memory used: 0.001GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region_sort.bed`  

> `cut -f 1 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt | grep -wf - /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region | cut -f 1-3 | bedtools sort -i stdin -faidx /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region_sort.bed` (8913,8914,8915,8916)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8913;	Command: cut;	Return code: 0;	Memory used: 0.0GB  
  PID: 8915;	Command: cut;	Return code: 0;	Memory used: 0.001GB  
  PID: 8914;	Command: grep;	Return code: 0;	Memory used: 0.002GB  
  PID: 8916;	Command: bedtools;	Return code: 0;	Memory used: 0.05GB

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed`  

> `bedtools coverage -sorted  -a /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/Promoter_Flanking_Region_sort.bed -b /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam -g /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/peak_calling_hg38/chr_order.txt > /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed` (8921)
<pre>
</pre>
Command completed. Elapsed time: 0:00:02. Running peak memory: 3.544GB.  
  PID: 8921;	Command: bedtools;	Return code: 0;	Memory used: 0.008GB


### Calculate cumulative and terminal fraction of reads in features (cFRiF/FRiF) (09-21 14:41:46) elapsed: 32.0 _TIME_


> `samtools view -@ 4 -q 10 -c -F4 /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/aligned_hg38/tutorial1_sort_dedup.bam`
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_cFRiF.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frif -s tutorial1 -z 3099922541 -n 876930 -y cfrif --reads -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_cFRiF.pdf --bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed` (8933)
<pre>
FRiF plot completed!

</pre>
Command completed. Elapsed time: 0:00:40. Running peak memory: 3.544GB.  
  PID: 8933;	Command: Rscript;	Return code: 0;	Memory used: 0.536GB

> `cFRiF`	QC_hg38/tutorial1_cFRiF.pdf	cFRiF	QC_hg38/tutorial1_cFRiF.png	PEPATAC	_OBJ_
Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_FRiF.pdf`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC.R frif -s tutorial1 -z 3099922541 -n 876930 -y frif --reads -o /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_FRiF.pdf --bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_3_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_5_UTR_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Enhancer_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Exon_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Intron_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_coverage.bed /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline/tutorial1/QC_hg38/tutorial1_Promoter_Flanking_Region_coverage.bed` (9012)
<pre>
FRiF plot completed!

</pre>
Command completed. Elapsed time: 0:00:35. Running peak memory: 3.544GB.  
  PID: 9012;	Command: Rscript;	Return code: 0;	Memory used: 0.54GB

> `FRiF`	QC_hg38/tutorial1_FRiF.pdf	FRiF	QC_hg38/tutorial1_FRiF.png	PEPATAC	_OBJ_
Starting cleanup: 39 files; 3 conditional files for cleanup

Cleaning up flagged intermediate files. . .

Cleaning up conditional list. . .

### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:38:48
*  Total elapsed time (all runs):  0:53:54
*         Peak memory (this run):  3.5437 GB
*        Pipeline completed time: 2020-09-21 14:43:02
