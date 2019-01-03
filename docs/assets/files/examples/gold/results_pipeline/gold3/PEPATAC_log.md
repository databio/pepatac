----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold3 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-9
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/
*  Pipeline started at:   (09-17 15:47:25) elapsed: 0.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  2ffe53bb5058a51fd450bb3d660d64b2fbd4c7fa
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-17 14:37:30 -0400

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold3`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz']`
*        `genome_size`:  `hs`
*        `config_file`:  `pepatac.yaml`
*                `mem`:  `16000`
*       `force_follow`:  `False`
*              `cores`:  `8`
*          `anno_name`:  `None`
*            `trimmer`:  `skewer`
*        `peak_caller`:  `macs2`
*               `keep`:  `False`
*   `single_or_paired`:  `paired`
*              `dirty`:  `False`
*    `genome_assembly`:  `hg19`
*            `no_fifo`:  `False`

----------------------------------------


Changed status from initializing to running.
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz
> `File_mb`	4809.4498	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-17 15:47:25) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz`

<pre>
</pre>
Process 87283 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz`

<pre>
</pre>
Process 87285 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq`
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq`

<pre>
</pre>
Process 87287 returned: (0). Elapsed: 0:00:49.
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.fastq`

<pre>
</pre>
Process 87342 returned: (0). Elapsed: 0:00:42.
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.fastq']
> `Raw_reads`	166092252	PEPATAC	_RES_
> `Fastq_reads`	166092252	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz']

### Adapter trimming:  (09-17 15:52:27) elapsed: 302.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`
> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.fastq`

<pre>
Parameters used:
-- 3' end adapter sequences in file (-x):	/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/NexteraPE-PE.fa
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
Mon Sep 17 15:52:27 2018[0;32m >> started[0m

Mon Sep 17 15:59:51 2018[0;32m >> done[0m (444.114s)
83046126 read pairs processed; of these:
     556 ( 0.00%) short read pairs filtered out after trimming by size control
     276 ( 0.00%) empty read pairs filtered out after trimming by size control
83045294 (100.00%) read pairs available; of these:
 3119403 ( 3.76%) trimmed read pairs available after processing
79925891 (96.24%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3-trimmed.log".
</pre>
Process 87722 returned: (0). Elapsed: 0:07:24. Peak memory: (Process: 0.02GB; Pipeline: 0.0GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`

<pre>
</pre>
Process 97264 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.02GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.trim.fastq`

<pre>
</pre>
Process 97267 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.02GB)
Follow:
Evaluating read trimming
> `Trimmed_reads`	166090588	PEPATAC	_RES_
> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold3_R1.trim.fastq
Approx 5% complete for gold3_R1.trim.fastq
Approx 10% complete for gold3_R1.trim.fastq
Approx 15% complete for gold3_R1.trim.fastq
Approx 20% complete for gold3_R1.trim.fastq
Approx 25% complete for gold3_R1.trim.fastq
Approx 30% complete for gold3_R1.trim.fastq
Approx 35% complete for gold3_R1.trim.fastq
Approx 40% complete for gold3_R1.trim.fastq
Approx 45% complete for gold3_R1.trim.fastq
Approx 50% complete for gold3_R1.trim.fastq
Approx 55% complete for gold3_R1.trim.fastq
Approx 60% complete for gold3_R1.trim.fastq
Approx 65% complete for gold3_R1.trim.fastq
Approx 70% complete for gold3_R1.trim.fastq
Approx 75% complete for gold3_R1.trim.fastq
Approx 80% complete for gold3_R1.trim.fastq
Approx 85% complete for gold3_R1.trim.fastq
Approx 90% complete for gold3_R1.trim.fastq
Approx 95% complete for gold3_R1.trim.fastq
Analysis complete for gold3_R1.trim.fastq
</pre>
Process 97969 returned: (0). Elapsed: 0:03:48. Peak memory: (Process: 0.234GB; Pipeline: 0.02GB)

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold3_R2.trim.fastq
Approx 5% complete for gold3_R2.trim.fastq
Approx 10% complete for gold3_R2.trim.fastq
Approx 15% complete for gold3_R2.trim.fastq
Approx 20% complete for gold3_R2.trim.fastq
Approx 25% complete for gold3_R2.trim.fastq
Approx 30% complete for gold3_R2.trim.fastq
Approx 35% complete for gold3_R2.trim.fastq
Approx 40% complete for gold3_R2.trim.fastq
Approx 45% complete for gold3_R2.trim.fastq
Approx 50% complete for gold3_R2.trim.fastq
Approx 55% complete for gold3_R2.trim.fastq
Approx 60% complete for gold3_R2.trim.fastq
Approx 65% complete for gold3_R2.trim.fastq
Approx 70% complete for gold3_R2.trim.fastq
Approx 75% complete for gold3_R2.trim.fastq
Approx 80% complete for gold3_R2.trim.fastq
Approx 85% complete for gold3_R2.trim.fastq
Approx 90% complete for gold3_R2.trim.fastq
Approx 95% complete for gold3_R2.trim.fastq
Analysis complete for gold3_R2.trim.fastq
</pre>
Process 99052 returned: (0). Elapsed: 0:03:38. Peak memory: (Process: 0.177GB; Pipeline: 0.234GB)
> `FastQC report r1`	fastqc/gold3_R1.trim_fastqc.html	FastQC report r1	fastqc/gold3_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold3_R2.trim_fastqc.html	FastQC report r2	fastqc/gold3_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-17 16:07:37) elapsed: 910.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-17 16:07:37) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2`

<pre>
</pre>
Process 99728 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.234GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 99729

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id gold3 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 99730 returned: (0). Elapsed: 0:12:30.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	29229450.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	17.6	PEPATAC	_RES_

### Map to genome (09-17 16:20:08) elapsed: 751.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold3 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmpD_YffT -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`

<pre>
14614725 reads skipped
0 reads lost
68430569 reads; of these:
  68430569 (100.00%) were paired; of these:
    2815666 (4.11%) aligned concordantly 0 times
    52538253 (76.78%) aligned concordantly exactly 1 time
    13076650 (19.11%) aligned concordantly >1 times
    ----
    2815666 pairs aligned concordantly 0 times; of these:
      102085 (3.63%) aligned discordantly 1 time
    ----
    2713581 pairs aligned 0 times concordantly or discordantly; of these:
      5427162 mates make up the pairs; of these:
        3073796 (56.64%) aligned 0 times
        1213390 (22.36%) aligned exactly 1 time
        1139976 (21.01%) aligned >1 times
97.75% overall alignment rate
[bam_sort_core] merging from 58 files...
Got SIGTERM. Failing gracefully... (09-17 19:47:50) elapsed: 12462.0 _TIME_
Got SIGTERM. Failing gracefully... (09-17 19:47:50) elapsed: 0.0 _TIME_
</pre>

Pypiper terminating spawned child process 99729...(perl)
Child not responding to SIGTERM, trying SIGKILL...
Child process SIGKILLed after 5.0 seconds.
</pre>

Pypiper terminating spawned child process 111039...(bowtie2)
Child not responding to SIGTERM, trying SIGKILL...
Child process SIGKILLed after 5.0 seconds.
Setting dynamic recover file: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/recover.lock.aligned_hg19__gold3_sort.bam

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/tmp3M4UFm', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmpD_YffT']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/tmp3M4UFm', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmpD_YffT', skipping

### Pipeline failed at:  (09-17 19:48:01) elapsed: 10.0 _TIME_

Total time: 4:00:36

Changed status from running to failed.
Pipeline aborted.

Pypiper terminating spawned child process 87240...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold3 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-15
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/
*  Pipeline started at:   (09-17 20:26:26) elapsed: 1.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  2ffe53bb5058a51fd450bb3d660d64b2fbd4c7fa
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-17 14:37:30 -0400

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold3`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz']`
*        `genome_size`:  `hs`
*        `config_file`:  `pepatac.yaml`
*                `mem`:  `16000`
*       `force_follow`:  `False`
*              `cores`:  `8`
*          `anno_name`:  `None`
*            `trimmer`:  `skewer`
*        `peak_caller`:  `macs2`
*               `keep`:  `False`
*   `single_or_paired`:  `paired`
*              `dirty`:  `False`
*    `genome_assembly`:  `hg19`
*            `no_fifo`:  `False`

----------------------------------------


Changed status from initializing to running.
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz
> `File_mb`	4809.4498	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-17 20:26:27) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz']

### Adapter trimming:  (09-17 20:26:27) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold3_R1.trim_fastqc.html	FastQC report r1	fastqc/gold3_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold3_R2.trim_fastqc.html	FastQC report r2	fastqc/gold3_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-17 20:26:27) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-17 20:26:27) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	29229450.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	17.6	PEPATAC	_RES_

### Map to genome (09-17 20:26:27) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold3 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmpyO8JHV -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`

<pre>
68430569 reads; of these:
  68430569 (100.00%) were paired; of these:
    2815666 (4.11%) aligned concordantly 0 times
    52538253 (76.78%) aligned concordantly exactly 1 time
    13076650 (19.11%) aligned concordantly >1 times
    ----
    2815666 pairs aligned concordantly 0 times; of these:
      102085 (3.63%) aligned discordantly 1 time
    ----
    2713581 pairs aligned 0 times concordantly or discordantly; of these:
      5427162 mates make up the pairs; of these:
        3073796 (56.64%) aligned 0 times
        1213390 (22.36%) aligned exactly 1 time
        1139976 (21.01%) aligned >1 times
97.75% overall alignment rate
[bam_sort_core] merging from 58 files...
</pre>
Process 157821 returned: (0). Elapsed: 3:13:40.
> `samtools view -q 10 -b -@ 8 -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

<pre>
</pre>
Process 179576 returned: (0). Elapsed: 0:03:48.
Follow:
> `Aligned_reads`	118880126	PEPATAC	_RES_
> `Alignment_rate`	71.58	PEPATAC	_RES_
> `Total_efficiency`	71.57	PEPATAC	_RES_

### Calculate NRF, PBC1, and PBC2 (09-17 23:45:55) elapsed: 11968.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam.bai`
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

<pre>
</pre>
Process 179813 returned: (0). Elapsed: 0:02:04. Peak memory: (Process: 0.017GB; Pipeline: 0.0GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`

<pre>
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/_libs/__init__.py:4: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from .tslib import iNaT, NaT, Timestamp, Timedelta, OutOfBoundsDatetime
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/__init__.py:26: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import (hashtable as _hashtable,
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/dtypes/common.py:6: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import algos, lib
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/util/hashing.py:7: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import hashing, tslib
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/indexes/base.py:7: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import (lib, index as libindex, tslib as libts,
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/tseries/offsets.py:21: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  import pandas._libs.tslibs.offsets as liboffsets
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/ops.py:16: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import algos as libalgos, ops as libops
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/indexes/interval.py:32: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs.interval import (
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/internals.py:14: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import internals as libinternals
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/sparse/array.py:33: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  import pandas._libs.sparse as splib
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/window.py:36: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  import pandas._libs.window as _window
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/groupby/groupby.py:68: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import (lib, reduction,
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/core/reshape/reshape.py:30: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import algos as _algos, reshape as _reshape
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/io/parsers.py:45: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  import pandas._libs.parsers as parsers
/home/jps3dp/.local/lib/python2.7/site-packages/pandas/io/pytables.py:50: RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
  from pandas._libs import algos, lib, writers as libwriters
Configured logger 'root' using pararead v0.5.0
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/tmp_gold3_sort_uzWO4s'
Processing with 8 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr13; Size: 115169878]
[Name: chr10; Size: 135534747]
[Name: chr15; Size: 102531392]
[Name: chr18; Size: 78077248]
[Name: chrUn_gl000238; Size: 39939]
[Name: chrUn_gl000231; Size: 27386]
[Name: chrUn_gl000236; Size: 41934]
[Name: chrUn_gl000235; Size: 34474]
[Name: chrUn_gl000233; Size: 45941]
[Name: chrUn_gl000230; Size: 43691]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chrUn_gl000232; Size: 40652]
[Name: chrUn_gl000237; Size: 45867]
[Name: chrUn_gl000234; Size: 40531]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000249; Size: 38502]
[Name: chrUn_gl000244; Size: 39929]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000245; Size: 36651]
[Name: chrUn_gl000246; Size: 38154]
[Name: chrUn_gl000242; Size: 43523]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000243; Size: 43341]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chrUn_gl000248; Size: 39786]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr8; Size: 146364022]
[Name: chr3; Size: 198022430]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chrY; Size: 59373566]
[Name: chrX; Size: 155270560]
[Name: chrM; Size: 16571]
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chrUn_gl000211; Size: 166566]
[Name: chrUn_gl000213; Size: 164239]
[Name: chrUn_gl000212; Size: 186858]
[Name: chrUn_gl000215; Size: 172545]
[Name: chrUn_gl000214; Size: 137718]
[Name: chrUn_gl000217; Size: 172149]
[Name: chrUn_gl000216; Size: 172294]
[Name: chrUn_gl000219; Size: 179198]
[Name: chrUn_gl000218; Size: 161147]
[Name: chr19_gl000209_random; Size: 159169]
[Name: chr22; Size: 51304566]
[Name: chr20; Size: 63025520]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chrUn_gl000239; Size: 33824]
[Name: chr14; Size: 107349540]
[Name: chr21; Size: 48129895]
[Name: chr12; Size: 133851895]
[Name: chr6; Size: 171115067]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr9_gl000200_random; Size: 187035]
[Name: chr9; Size: 141213431]
[Name: chr17; Size: 81195210]
[Name: chrUn_gl000228; Size: 129120]
[Name: chr2; Size: 243199373]
[Name: chr19; Size: 59128983]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr1; Size: 249250621]
[Name: chr16; Size: 90354753]
[Name: chr11; Size: 135006516]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr5; Size: 180915260]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chr4; Size: 191154276]
Discarding 0 chunk(s) of reads: []
Keeping 93 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 93 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv'
</pre>
Process 179832 returned: (0). Elapsed: 0:02:20. Peak memory: (Process: 0.059GB; Pipeline: 0.017GB)
Follow:
> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`

> `NRF`	0.9	PEPATAC	_RES_
> `PBC1`	0.95	PEPATAC	_RES_
> `PBC2`	18.82	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_unmap.bam`
> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_unmap.bam`

<pre>
</pre>
Process 180085 returned: (0). Elapsed: 0:00:29.

### Remove dupes, build bigwig and bedgraph files (09-17 23:50:47) elapsed: 293.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`
> `java -Xmx15200m -jar /sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar MarkDuplicates INPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_picard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_picard_metrics_log.txt`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
23:50:49.154 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar!/com/intel/gkl/native/libgkl_compression.so
[Mon Sep 17 23:50:49 EDT 2018] MarkDuplicates INPUT=[/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam] OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_picard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 TAG_DUPLICATE_SET_MEMBERS=false REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag CLEAR_DT=true ADD_PG_TAG_TO_READS=true DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 MAX_OPTICAL_DUPLICATE_SET_SIZE=300000 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json USE_JDK_DEFLATER=false USE_JDK_INFLATER=false
[Mon Sep 17 23:50:49 EDT 2018] Executing as jps3dp@udc-ba26-15 on Linux 3.10.0-514.21.2.el7.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_171-b11; Deflater: Intel; Inflater: Intel; Picard version: 2.17.4-1-gb63d73e-SNAPSHOT
INFO	2018-09-17 23:50:49	MarkDuplicates	Start of doWork freeMemory: 2038257648; totalMemory: 2058354688; maxMemory: 14167834624
INFO	2018-09-17 23:50:49	MarkDuplicates	Reading input file and constructing read end information.
INFO	2018-09-17 23:50:49	MarkDuplicates	Will retain up to 51332734 data points before spilling to disk.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold3
WARNING	2018-09-17 23:50:49	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR5210398.21389296. Cause: String 'SRR5210398.21389296' did not start with a parsable number.
INFO	2018-09-17 23:50:53	MarkDuplicates	Read     1,000,000 records.  Elapsed time: 00:00:04s.  Time for last 1,000,000:    4s.  Last read position: chr1:23,192,269
INFO	2018-09-17 23:50:53	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:50:57	MarkDuplicates	Read     2,000,000 records.  Elapsed time: 00:00:08s.  Time for last 1,000,000:    4s.  Last read position: chr1:45,745,831
INFO	2018-09-17 23:50:57	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:01	MarkDuplicates	Read     3,000,000 records.  Elapsed time: 00:00:11s.  Time for last 1,000,000:    3s.  Last read position: chr1:71,230,791
INFO	2018-09-17 23:51:01	MarkDuplicates	Tracking 14 as yet unmatched pairs. 14 records in RAM.
INFO	2018-09-17 23:51:05	MarkDuplicates	Read     4,000,000 records.  Elapsed time: 00:00:16s.  Time for last 1,000,000:    4s.  Last read position: chr1:96,674,644
INFO	2018-09-17 23:51:05	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:51:09	MarkDuplicates	Read     5,000,000 records.  Elapsed time: 00:00:19s.  Time for last 1,000,000:    3s.  Last read position: chr1:121,484,736
INFO	2018-09-17 23:51:09	MarkDuplicates	Tracking 11162 as yet unmatched pairs. 11162 records in RAM.
INFO	2018-09-17 23:51:12	MarkDuplicates	Read     6,000,000 records.  Elapsed time: 00:00:23s.  Time for last 1,000,000:    3s.  Last read position: chr1:166,755,450
INFO	2018-09-17 23:51:12	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:16	MarkDuplicates	Read     7,000,000 records.  Elapsed time: 00:00:27s.  Time for last 1,000,000:    3s.  Last read position: chr1:191,124,356
INFO	2018-09-17 23:51:16	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:51:20	MarkDuplicates	Read     8,000,000 records.  Elapsed time: 00:00:30s.  Time for last 1,000,000:    3s.  Last read position: chr1:215,042,953
INFO	2018-09-17 23:51:20	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:27	MarkDuplicates	Read     9,000,000 records.  Elapsed time: 00:00:37s.  Time for last 1,000,000:    6s.  Last read position: chr1:238,490,725
INFO	2018-09-17 23:51:27	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:51:30	MarkDuplicates	Read    10,000,000 records.  Elapsed time: 00:00:41s.  Time for last 1,000,000:    3s.  Last read position: chr2:12,681,651
INFO	2018-09-17 23:51:30	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:34	MarkDuplicates	Read    11,000,000 records.  Elapsed time: 00:00:44s.  Time for last 1,000,000:    3s.  Last read position: chr2:36,074,266
INFO	2018-09-17 23:51:34	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:38	MarkDuplicates	Read    12,000,000 records.  Elapsed time: 00:00:48s.  Time for last 1,000,000:    3s.  Last read position: chr2:60,576,323
INFO	2018-09-17 23:51:38	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:41	MarkDuplicates	Read    13,000,000 records.  Elapsed time: 00:00:52s.  Time for last 1,000,000:    3s.  Last read position: chr2:83,872,423
INFO	2018-09-17 23:51:41	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:51:45	MarkDuplicates	Read    14,000,000 records.  Elapsed time: 00:00:56s.  Time for last 1,000,000:    3s.  Last read position: chr2:113,655,198
INFO	2018-09-17 23:51:45	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:51:49	MarkDuplicates	Read    15,000,000 records.  Elapsed time: 00:01:00s.  Time for last 1,000,000:    3s.  Last read position: chr2:136,710,071
INFO	2018-09-17 23:51:49	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:51:53	MarkDuplicates	Read    16,000,000 records.  Elapsed time: 00:01:03s.  Time for last 1,000,000:    3s.  Last read position: chr2:161,977,955
INFO	2018-09-17 23:51:53	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:51:57	MarkDuplicates	Read    17,000,000 records.  Elapsed time: 00:01:07s.  Time for last 1,000,000:    4s.  Last read position: chr2:187,218,292
INFO	2018-09-17 23:51:57	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:52:01	MarkDuplicates	Read    18,000,000 records.  Elapsed time: 00:01:11s.  Time for last 1,000,000:    3s.  Last read position: chr2:211,028,516
INFO	2018-09-17 23:52:01	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:52:10	MarkDuplicates	Read    19,000,000 records.  Elapsed time: 00:01:20s.  Time for last 1,000,000:    8s.  Last read position: chr2:233,406,765
INFO	2018-09-17 23:52:10	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 23:52:13	MarkDuplicates	Read    20,000,000 records.  Elapsed time: 00:01:24s.  Time for last 1,000,000:    3s.  Last read position: chr3:13,006,009
INFO	2018-09-17 23:52:13	MarkDuplicates	Tracking 70 as yet unmatched pairs. 70 records in RAM.
INFO	2018-09-17 23:52:17	MarkDuplicates	Read    21,000,000 records.  Elapsed time: 00:01:27s.  Time for last 1,000,000:    3s.  Last read position: chr3:37,108,721
INFO	2018-09-17 23:52:17	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:52:21	MarkDuplicates	Read    22,000,000 records.  Elapsed time: 00:01:31s.  Time for last 1,000,000:    3s.  Last read position: chr3:58,449,580
INFO	2018-09-17 23:52:21	MarkDuplicates	Tracking 22 as yet unmatched pairs. 22 records in RAM.
INFO	2018-09-17 23:52:24	MarkDuplicates	Read    23,000,000 records.  Elapsed time: 00:01:35s.  Time for last 1,000,000:    3s.  Last read position: chr3:83,924,375
INFO	2018-09-17 23:52:24	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:52:28	MarkDuplicates	Read    24,000,000 records.  Elapsed time: 00:01:39s.  Time for last 1,000,000:    3s.  Last read position: chr3:112,461,686
INFO	2018-09-17 23:52:28	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:52:32	MarkDuplicates	Read    25,000,000 records.  Elapsed time: 00:01:43s.  Time for last 1,000,000:    3s.  Last read position: chr3:134,707,074
INFO	2018-09-17 23:52:32	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:52:36	MarkDuplicates	Read    26,000,000 records.  Elapsed time: 00:01:46s.  Time for last 1,000,000:    3s.  Last read position: chr3:159,121,818
INFO	2018-09-17 23:52:36	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:52:40	MarkDuplicates	Read    27,000,000 records.  Elapsed time: 00:01:50s.  Time for last 1,000,000:    4s.  Last read position: chr3:184,040,689
INFO	2018-09-17 23:52:40	MarkDuplicates	Tracking 22 as yet unmatched pairs. 22 records in RAM.
INFO	2018-09-17 23:52:44	MarkDuplicates	Read    28,000,000 records.  Elapsed time: 00:01:54s.  Time for last 1,000,000:    4s.  Last read position: chr4:7,426,546
INFO	2018-09-17 23:52:44	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:52:48	MarkDuplicates	Read    29,000,000 records.  Elapsed time: 00:01:58s.  Time for last 1,000,000:    3s.  Last read position: chr4:31,389,919
INFO	2018-09-17 23:52:48	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:52:52	MarkDuplicates	Read    30,000,000 records.  Elapsed time: 00:02:02s.  Time for last 1,000,000:    3s.  Last read position: chr4:58,917,422
INFO	2018-09-17 23:52:52	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:52:55	MarkDuplicates	Read    31,000,000 records.  Elapsed time: 00:02:06s.  Time for last 1,000,000:    3s.  Last read position: chr4:85,308,765
INFO	2018-09-17 23:52:55	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:52:59	MarkDuplicates	Read    32,000,000 records.  Elapsed time: 00:02:10s.  Time for last 1,000,000:    3s.  Last read position: chr4:110,696,186
INFO	2018-09-17 23:52:59	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:03	MarkDuplicates	Read    33,000,000 records.  Elapsed time: 00:02:14s.  Time for last 1,000,000:    3s.  Last read position: chr4:137,166,127
INFO	2018-09-17 23:53:03	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:07	MarkDuplicates	Read    34,000,000 records.  Elapsed time: 00:02:18s.  Time for last 1,000,000:    3s.  Last read position: chr4:161,688,922
INFO	2018-09-17 23:53:07	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:10	MarkDuplicates	Read    35,000,000 records.  Elapsed time: 00:02:21s.  Time for last 1,000,000:    3s.  Last read position: chr4:186,407,426
INFO	2018-09-17 23:53:10	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:53:24	MarkDuplicates	Read    36,000,000 records.  Elapsed time: 00:02:34s.  Time for last 1,000,000:   13s.  Last read position: chr5:18,611,949
INFO	2018-09-17 23:53:24	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:53:27	MarkDuplicates	Read    37,000,000 records.  Elapsed time: 00:02:38s.  Time for last 1,000,000:    3s.  Last read position: chr5:44,816,100
INFO	2018-09-17 23:53:27	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:53:31	MarkDuplicates	Read    38,000,000 records.  Elapsed time: 00:02:42s.  Time for last 1,000,000:    3s.  Last read position: chr5:75,802,035
INFO	2018-09-17 23:53:31	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:35	MarkDuplicates	Read    39,000,000 records.  Elapsed time: 00:02:45s.  Time for last 1,000,000:    3s.  Last read position: chr5:101,546,382
INFO	2018-09-17 23:53:35	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:53:39	MarkDuplicates	Read    40,000,000 records.  Elapsed time: 00:02:49s.  Time for last 1,000,000:    3s.  Last read position: chr5:126,256,182
INFO	2018-09-17 23:53:39	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:43	MarkDuplicates	Read    41,000,000 records.  Elapsed time: 00:02:53s.  Time for last 1,000,000:    4s.  Last read position: chr5:148,315,725
INFO	2018-09-17 23:53:43	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:53:47	MarkDuplicates	Read    42,000,000 records.  Elapsed time: 00:02:58s.  Time for last 1,000,000:    4s.  Last read position: chr5:171,266,356
INFO	2018-09-17 23:53:47	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:51	MarkDuplicates	Read    43,000,000 records.  Elapsed time: 00:03:01s.  Time for last 1,000,000:    3s.  Last read position: chr6:13,144,801
INFO	2018-09-17 23:53:51	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:53:55	MarkDuplicates	Read    44,000,000 records.  Elapsed time: 00:03:05s.  Time for last 1,000,000:    4s.  Last read position: chr6:41,040,812
INFO	2018-09-17 23:53:55	MarkDuplicates	Tracking 98 as yet unmatched pairs. 98 records in RAM.
INFO	2018-09-17 23:53:59	MarkDuplicates	Read    45,000,000 records.  Elapsed time: 00:03:10s.  Time for last 1,000,000:    4s.  Last read position: chr6:67,285,950
INFO	2018-09-17 23:53:59	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:54:03	MarkDuplicates	Read    46,000,000 records.  Elapsed time: 00:03:14s.  Time for last 1,000,000:    4s.  Last read position: chr6:91,979,002
INFO	2018-09-17 23:54:03	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:54:08	MarkDuplicates	Read    47,000,000 records.  Elapsed time: 00:03:19s.  Time for last 1,000,000:    4s.  Last read position: chr6:117,380,105
INFO	2018-09-17 23:54:08	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:54:13	MarkDuplicates	Read    48,000,000 records.  Elapsed time: 00:03:23s.  Time for last 1,000,000:    4s.  Last read position: chr6:141,962,864
INFO	2018-09-17 23:54:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:54:17	MarkDuplicates	Read    49,000,000 records.  Elapsed time: 00:03:27s.  Time for last 1,000,000:    4s.  Last read position: chr6:164,628,432
INFO	2018-09-17 23:54:17	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:54:21	MarkDuplicates	Read    50,000,000 records.  Elapsed time: 00:03:32s.  Time for last 1,000,000:    4s.  Last read position: chr7:15,885,805
INFO	2018-09-17 23:54:21	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:54:38	MarkDuplicates	Read    51,000,000 records.  Elapsed time: 00:03:49s.  Time for last 1,000,000:   17s.  Last read position: chr7:39,772,741
INFO	2018-09-17 23:54:38	MarkDuplicates	Tracking 90 as yet unmatched pairs. 90 records in RAM.
INFO	2018-09-17 23:54:58	MarkDuplicates	Read    52,000,000 records.  Elapsed time: 00:04:09s.  Time for last 1,000,000:   19s.  Last read position: chr7:66,405,107
INFO	2018-09-17 23:54:58	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:55:02	MarkDuplicates	Read    53,000,000 records.  Elapsed time: 00:04:12s.  Time for last 1,000,000:    3s.  Last read position: chr7:91,932,500
INFO	2018-09-17 23:55:02	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:55:05	MarkDuplicates	Read    54,000,000 records.  Elapsed time: 00:04:16s.  Time for last 1,000,000:    3s.  Last read position: chr7:115,122,125
INFO	2018-09-17 23:55:05	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:55:09	MarkDuplicates	Read    55,000,000 records.  Elapsed time: 00:04:19s.  Time for last 1,000,000:    3s.  Last read position: chr7:139,214,923
INFO	2018-09-17 23:55:09	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:55:13	MarkDuplicates	Read    56,000,000 records.  Elapsed time: 00:04:23s.  Time for last 1,000,000:    3s.  Last read position: chrX:6,122,747
INFO	2018-09-17 23:55:13	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:55:17	MarkDuplicates	Read    57,000,000 records.  Elapsed time: 00:04:27s.  Time for last 1,000,000:    3s.  Last read position: chrX:32,980,987
INFO	2018-09-17 23:55:17	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:55:21	MarkDuplicates	Read    58,000,000 records.  Elapsed time: 00:04:31s.  Time for last 1,000,000:    4s.  Last read position: chrX:64,639,263
INFO	2018-09-17 23:55:21	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:55:25	MarkDuplicates	Read    59,000,000 records.  Elapsed time: 00:04:35s.  Time for last 1,000,000:    4s.  Last read position: chrX:96,672,085
INFO	2018-09-17 23:55:25	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:55:29	MarkDuplicates	Read    60,000,000 records.  Elapsed time: 00:04:40s.  Time for last 1,000,000:    4s.  Last read position: chrX:125,430,022
INFO	2018-09-17 23:55:29	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:55:34	MarkDuplicates	Read    61,000,000 records.  Elapsed time: 00:04:45s.  Time for last 1,000,000:    4s.  Last read position: chrX:153,084,298
INFO	2018-09-17 23:55:34	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:55:39	MarkDuplicates	Read    62,000,000 records.  Elapsed time: 00:04:49s.  Time for last 1,000,000:    4s.  Last read position: chr8:22,457,063
INFO	2018-09-17 23:55:39	MarkDuplicates	Tracking 24 as yet unmatched pairs. 24 records in RAM.
INFO	2018-09-17 23:55:43	MarkDuplicates	Read    63,000,000 records.  Elapsed time: 00:04:54s.  Time for last 1,000,000:    4s.  Last read position: chr8:47,556,720
INFO	2018-09-17 23:55:43	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:55:47	MarkDuplicates	Read    64,000,000 records.  Elapsed time: 00:04:58s.  Time for last 1,000,000:    4s.  Last read position: chr8:71,380,442
INFO	2018-09-17 23:55:47	MarkDuplicates	Tracking 14 as yet unmatched pairs. 14 records in RAM.
INFO	2018-09-17 23:55:51	MarkDuplicates	Read    65,000,000 records.  Elapsed time: 00:05:02s.  Time for last 1,000,000:    3s.  Last read position: chr8:96,208,331
INFO	2018-09-17 23:55:51	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 23:55:55	MarkDuplicates	Read    66,000,000 records.  Elapsed time: 00:05:06s.  Time for last 1,000,000:    3s.  Last read position: chr8:121,028,907
INFO	2018-09-17 23:55:55	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:55:59	MarkDuplicates	Read    67,000,000 records.  Elapsed time: 00:05:09s.  Time for last 1,000,000:    3s.  Last read position: chr8:143,822,405
INFO	2018-09-17 23:55:59	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:56:02	MarkDuplicates	Read    68,000,000 records.  Elapsed time: 00:05:13s.  Time for last 1,000,000:    3s.  Last read position: chr9:20,965,021
INFO	2018-09-17 23:56:02	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:56:06	MarkDuplicates	Read    69,000,000 records.  Elapsed time: 00:05:16s.  Time for last 1,000,000:    3s.  Last read position: chr9:74,383,140
INFO	2018-09-17 23:56:06	MarkDuplicates	Tracking 32 as yet unmatched pairs. 32 records in RAM.
INFO	2018-09-17 23:56:09	MarkDuplicates	Read    70,000,000 records.  Elapsed time: 00:05:20s.  Time for last 1,000,000:    3s.  Last read position: chr9:98,833,988
INFO	2018-09-17 23:56:09	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 23:56:13	MarkDuplicates	Read    71,000,000 records.  Elapsed time: 00:05:23s.  Time for last 1,000,000:    3s.  Last read position: chr9:123,251,560
INFO	2018-09-17 23:56:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:56:16	MarkDuplicates	Read    72,000,000 records.  Elapsed time: 00:05:27s.  Time for last 1,000,000:    3s.  Last read position: chr10:2,654,825
INFO	2018-09-17 23:56:16	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:56:20	MarkDuplicates	Read    73,000,000 records.  Elapsed time: 00:05:31s.  Time for last 1,000,000:    3s.  Last read position: chr10:26,728,050
INFO	2018-09-17 23:56:20	MarkDuplicates	Tracking 42 as yet unmatched pairs. 42 records in RAM.
INFO	2018-09-17 23:56:24	MarkDuplicates	Read    74,000,000 records.  Elapsed time: 00:05:34s.  Time for last 1,000,000:    3s.  Last read position: chr10:54,864,345
INFO	2018-09-17 23:56:24	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:56:28	MarkDuplicates	Read    75,000,000 records.  Elapsed time: 00:05:38s.  Time for last 1,000,000:    4s.  Last read position: chr10:79,551,950
INFO	2018-09-17 23:56:28	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:56:32	MarkDuplicates	Read    76,000,000 records.  Elapsed time: 00:05:42s.  Time for last 1,000,000:    3s.  Last read position: chr10:102,580,307
INFO	2018-09-17 23:56:32	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:56:36	MarkDuplicates	Read    77,000,000 records.  Elapsed time: 00:05:46s.  Time for last 1,000,000:    3s.  Last read position: chr10:124,913,832
INFO	2018-09-17 23:56:36	MarkDuplicates	Tracking 192 as yet unmatched pairs. 192 records in RAM.
INFO	2018-09-17 23:56:40	MarkDuplicates	Read    78,000,000 records.  Elapsed time: 00:05:50s.  Time for last 1,000,000:    3s.  Last read position: chr11:9,650,189
INFO	2018-09-17 23:56:40	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:56:54	MarkDuplicates	Read    79,000,000 records.  Elapsed time: 00:06:05s.  Time for last 1,000,000:   14s.  Last read position: chr11:33,532,552
INFO	2018-09-17 23:56:54	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:56:58	MarkDuplicates	Read    80,000,000 records.  Elapsed time: 00:06:09s.  Time for last 1,000,000:    3s.  Last read position: chr11:61,129,717
INFO	2018-09-17 23:56:58	MarkDuplicates	Tracking 80 as yet unmatched pairs. 80 records in RAM.
INFO	2018-09-17 23:57:02	MarkDuplicates	Read    81,000,000 records.  Elapsed time: 00:06:12s.  Time for last 1,000,000:    3s.  Last read position: chr11:80,989,512
INFO	2018-09-17 23:57:02	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:57:06	MarkDuplicates	Read    82,000,000 records.  Elapsed time: 00:06:16s.  Time for last 1,000,000:    3s.  Last read position: chr11:106,117,801
INFO	2018-09-17 23:57:06	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:57:10	MarkDuplicates	Read    83,000,000 records.  Elapsed time: 00:06:21s.  Time for last 1,000,000:    4s.  Last read position: chr11:129,093,286
INFO	2018-09-17 23:57:10	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:57:14	MarkDuplicates	Read    84,000,000 records.  Elapsed time: 00:06:25s.  Time for last 1,000,000:    4s.  Last read position: chr12:17,550,782
INFO	2018-09-17 23:57:14	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:57:19	MarkDuplicates	Read    85,000,000 records.  Elapsed time: 00:06:29s.  Time for last 1,000,000:    4s.  Last read position: chr12:45,450,114
INFO	2018-09-17 23:57:19	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:57:22	MarkDuplicates	Read    86,000,000 records.  Elapsed time: 00:06:33s.  Time for last 1,000,000:    3s.  Last read position: chr12:68,523,925
INFO	2018-09-17 23:57:22	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:57:27	MarkDuplicates	Read    87,000,000 records.  Elapsed time: 00:06:37s.  Time for last 1,000,000:    4s.  Last read position: chr12:93,551,941
INFO	2018-09-17 23:57:27	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:57:31	MarkDuplicates	Read    88,000,000 records.  Elapsed time: 00:06:42s.  Time for last 1,000,000:    4s.  Last read position: chr12:116,581,729
INFO	2018-09-17 23:57:31	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:57:36	MarkDuplicates	Read    89,000,000 records.  Elapsed time: 00:06:46s.  Time for last 1,000,000:    4s.  Last read position: chr13:23,949,625
INFO	2018-09-17 23:57:36	MarkDuplicates	Tracking 148 as yet unmatched pairs. 148 records in RAM.
INFO	2018-09-17 23:57:40	MarkDuplicates	Read    90,000,000 records.  Elapsed time: 00:06:51s.  Time for last 1,000,000:    4s.  Last read position: chr13:48,099,000
INFO	2018-09-17 23:57:40	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:57:44	MarkDuplicates	Read    91,000,000 records.  Elapsed time: 00:06:55s.  Time for last 1,000,000:    4s.  Last read position: chr13:76,056,503
INFO	2018-09-17 23:57:44	MarkDuplicates	Tracking 72 as yet unmatched pairs. 72 records in RAM.
INFO	2018-09-17 23:57:49	MarkDuplicates	Read    92,000,000 records.  Elapsed time: 00:06:59s.  Time for last 1,000,000:    4s.  Last read position: chr13:102,072,578
INFO	2018-09-17 23:57:49	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:57:53	MarkDuplicates	Read    93,000,000 records.  Elapsed time: 00:07:03s.  Time for last 1,000,000:    4s.  Last read position: chr14:29,754,467
INFO	2018-09-17 23:57:53	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:57:57	MarkDuplicates	Read    94,000,000 records.  Elapsed time: 00:07:08s.  Time for last 1,000,000:    4s.  Last read position: chr14:54,564,574
INFO	2018-09-17 23:57:57	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:58:01	MarkDuplicates	Read    95,000,000 records.  Elapsed time: 00:07:12s.  Time for last 1,000,000:    4s.  Last read position: chr14:77,153,163
INFO	2018-09-17 23:58:01	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:58:05	MarkDuplicates	Read    96,000,000 records.  Elapsed time: 00:07:16s.  Time for last 1,000,000:    3s.  Last read position: chr14:100,194,469
INFO	2018-09-17 23:58:05	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:58:09	MarkDuplicates	Read    97,000,000 records.  Elapsed time: 00:07:20s.  Time for last 1,000,000:    3s.  Last read position: chr15:39,025,967
INFO	2018-09-17 23:58:09	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:58:13	MarkDuplicates	Read    98,000,000 records.  Elapsed time: 00:07:24s.  Time for last 1,000,000:    4s.  Last read position: chr15:63,893,316
INFO	2018-09-17 23:58:13	MarkDuplicates	Tracking 34 as yet unmatched pairs. 34 records in RAM.
INFO	2018-09-17 23:58:18	MarkDuplicates	Read    99,000,000 records.  Elapsed time: 00:07:28s.  Time for last 1,000,000:    4s.  Last read position: chr15:89,010,574
INFO	2018-09-17 23:58:18	MarkDuplicates	Tracking 24 as yet unmatched pairs. 24 records in RAM.
INFO	2018-09-17 23:58:21	MarkDuplicates	Read   100,000,000 records.  Elapsed time: 00:07:32s.  Time for last 1,000,000:    3s.  Last read position: chr16:7,999,756
INFO	2018-09-17 23:58:21	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:58:25	MarkDuplicates	Read   101,000,000 records.  Elapsed time: 00:07:36s.  Time for last 1,000,000:    3s.  Last read position: chr16:32,631,124
INFO	2018-09-17 23:58:25	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:58:29	MarkDuplicates	Read   102,000,000 records.  Elapsed time: 00:07:39s.  Time for last 1,000,000:    3s.  Last read position: chr16:66,550,704
INFO	2018-09-17 23:58:29	MarkDuplicates	Tracking 44 as yet unmatched pairs. 44 records in RAM.
INFO	2018-09-17 23:59:10	MarkDuplicates	Read   103,000,000 records.  Elapsed time: 00:08:20s.  Time for last 1,000,000:   41s.  Last read position: chr16:88,246,147
INFO	2018-09-17 23:59:10	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 23:59:14	MarkDuplicates	Read   104,000,000 records.  Elapsed time: 00:08:24s.  Time for last 1,000,000:    3s.  Last read position: chr17:19,641,591
INFO	2018-09-17 23:59:14	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:59:17	MarkDuplicates	Read   105,000,000 records.  Elapsed time: 00:08:28s.  Time for last 1,000,000:    3s.  Last read position: chr17:46,776,361
INFO	2018-09-17 23:59:17	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:59:21	MarkDuplicates	Read   106,000,000 records.  Elapsed time: 00:08:31s.  Time for last 1,000,000:    3s.  Last read position: chr17:71,781,995
INFO	2018-09-17 23:59:21	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:59:24	MarkDuplicates	Read   107,000,000 records.  Elapsed time: 00:08:35s.  Time for last 1,000,000:    3s.  Last read position: chr18:11,073,220
INFO	2018-09-17 23:59:24	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:59:28	MarkDuplicates	Read   108,000,000 records.  Elapsed time: 00:08:38s.  Time for last 1,000,000:    3s.  Last read position: chr18:38,043,390
INFO	2018-09-17 23:59:28	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:59:32	MarkDuplicates	Read   109,000,000 records.  Elapsed time: 00:08:43s.  Time for last 1,000,000:    4s.  Last read position: chr18:61,257,317
INFO	2018-09-17 23:59:32	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:59:36	MarkDuplicates	Read   110,000,000 records.  Elapsed time: 00:08:47s.  Time for last 1,000,000:    4s.  Last read position: chr20:6,160,839
INFO	2018-09-17 23:59:36	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 23:59:40	MarkDuplicates	Read   111,000,000 records.  Elapsed time: 00:08:51s.  Time for last 1,000,000:    3s.  Last read position: chr20:31,736,518
INFO	2018-09-17 23:59:40	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:59:44	MarkDuplicates	Read   112,000,000 records.  Elapsed time: 00:08:55s.  Time for last 1,000,000:    4s.  Last read position: chr20:54,819,041
INFO	2018-09-17 23:59:44	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 23:59:47	MarkDuplicates	Read   113,000,000 records.  Elapsed time: 00:08:58s.  Time for last 1,000,000:    3s.  Last read position: chr19:10,407,598
INFO	2018-09-17 23:59:47	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 23:59:53	MarkDuplicates	Read   114,000,000 records.  Elapsed time: 00:09:03s.  Time for last 1,000,000:    5s.  Last read position: chr19:33,798,448
INFO	2018-09-17 23:59:53	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 23:59:57	MarkDuplicates	Read   115,000,000 records.  Elapsed time: 00:09:07s.  Time for last 1,000,000:    4s.  Last read position: chr19:52,773,445
INFO	2018-09-17 23:59:57	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-18 00:00:05	MarkDuplicates	Read   116,000,000 records.  Elapsed time: 00:09:16s.  Time for last 1,000,000:    8s.  Last read position: chr22:33,698,012
INFO	2018-09-18 00:00:05	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-18 00:00:09	MarkDuplicates	Read   117,000,000 records.  Elapsed time: 00:09:19s.  Time for last 1,000,000:    3s.  Last read position: chr21:17,035,111
INFO	2018-09-18 00:00:09	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 00:00:12	MarkDuplicates	Read   118,000,000 records.  Elapsed time: 00:09:23s.  Time for last 1,000,000:    3s.  Last read position: chr21:41,925,185
INFO	2018-09-18 00:00:12	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 00:00:16	MarkDuplicates	Read 118880126 records. 0 pairs never matched.
INFO	2018-09-18 00:00:24	MarkDuplicates	After buildSortedReadEndLists freeMemory: 8546968048; totalMemory: 8595701760; maxMemory: 14167834624
INFO	2018-09-18 00:00:24	MarkDuplicates	Will retain up to 442744832 duplicate indices before spilling to disk.
INFO	2018-09-18 00:00:25	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2018-09-18 00:00:41	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2018-09-18 00:01:04	MarkDuplicates	Sorting list of duplicate records.
INFO	2018-09-18 00:01:04	MarkDuplicates	After generateDuplicateIndexes freeMemory: 3928721184; totalMemory: 7527727104; maxMemory: 14167834624
INFO	2018-09-18 00:01:04	MarkDuplicates	Marking 6651738 records as duplicates.
INFO	2018-09-18 00:01:04	MarkDuplicates	Found 0 optical duplicate clusters.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold3
INFO	2018-09-18 00:01:05	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2018-09-18 00:01:56	MarkDuplicates	Written    10,000,000 records.  Elapsed time: 00:00:51s.  Time for last 10,000,000:   51s.  Last read position: chr2:27,309,406
INFO	2018-09-18 00:02:47	MarkDuplicates	Written    20,000,000 records.  Elapsed time: 00:01:42s.  Time for last 10,000,000:   51s.  Last read position: chr3:42,221,754
INFO	2018-09-18 00:03:38	MarkDuplicates	Written    30,000,000 records.  Elapsed time: 00:02:33s.  Time for last 10,000,000:   51s.  Last read position: chr4:106,048,891
INFO	2018-09-18 00:04:30	MarkDuplicates	Written    40,000,000 records.  Elapsed time: 00:03:25s.  Time for last 10,000,000:   51s.  Last read position: chr5:179,771,221
INFO	2018-09-18 00:05:21	MarkDuplicates	Written    50,000,000 records.  Elapsed time: 00:04:16s.  Time for last 10,000,000:   51s.  Last read position: chr7:92,026,690
INFO	2018-09-18 00:06:13	MarkDuplicates	Written    60,000,000 records.  Elapsed time: 00:05:08s.  Time for last 10,000,000:   51s.  Last read position: chr8:61,303,234
INFO	2018-09-18 00:07:04	MarkDuplicates	Written    70,000,000 records.  Elapsed time: 00:05:59s.  Time for last 10,000,000:   51s.  Last read position: chr10:59,642,248
INFO	2018-09-18 00:07:55	MarkDuplicates	Written    80,000,000 records.  Elapsed time: 00:06:50s.  Time for last 10,000,000:   50s.  Last read position: chr12:38,934,243
INFO	2018-09-18 00:08:47	MarkDuplicates	Written    90,000,000 records.  Elapsed time: 00:07:42s.  Time for last 10,000,000:   51s.  Last read position: chr14:84,751,375
INFO	2018-09-18 00:09:39	MarkDuplicates	Written   100,000,000 records.  Elapsed time: 00:08:34s.  Time for last 10,000,000:   52s.  Last read position: chr17:69,278,738
INFO	2018-09-18 00:10:31	MarkDuplicates	Written   110,000,000 records.  Elapsed time: 00:09:26s.  Time for last 10,000,000:   52s.  Last read position: chr22:43,679,530
INFO	2018-09-18 00:10:43	MarkDuplicates	Before output close freeMemory: 8011063160; totalMemory: 8078753792; maxMemory: 14167834624
INFO	2018-09-18 00:10:43	MarkDuplicates	After output close freeMemory: 8011587448; totalMemory: 8079278080; maxMemory: 14167834624
[Tue Sep 18 00:10:43 EDT 2018] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 19.91 minutes.
Runtime.totalMemory()=8079278080
</pre>
Process 180097 returned: (0). Elapsed: 0:19:56.
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

<pre>
</pre>
Process 181703 returned: (0). Elapsed: 0:02:03. Peak memory: (Process: 0.017GB; Pipeline: 0.059GB)
Follow:
> `awk -F'	' -f /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/extract_post_dup_aligned_reads.awk /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_picard_metrics_bam.txt`

> `Duplicate_reads`	6651738.0	PEPATAC	_RES_
> `Dedup_aligned_reads`	112228388	PEPATAC	_RES_
> `Dedup_alignment_rate`	67.57	PEPATAC	_RES_
> `Dedup_total_efficiency`	67.57	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (09-18 00:12:47) elapsed: 1319.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/tmp_gold3_sort_dedup_cuttrace_U_6__d'
Processing with 2 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr18; Size: 78077248]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chr13; Size: 115169878]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chrUn_gl000239; Size: 33824]
[Name: chrUn_gl000238; Size: 39939]
[Name: chrUn_gl000233; Size: 45941]
[Name: chrUn_gl000232; Size: 40652]
[Name: chrUn_gl000231; Size: 27386]
[Name: chrUn_gl000230; Size: 43691]
[Name: chrUn_gl000237; Size: 45867]
[Name: chrUn_gl000236; Size: 41934]
[Name: chrUn_gl000235; Size: 34474]
[Name: chrUn_gl000234; Size: 40531]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000249; Size: 38502]
[Name: chrUn_gl000246; Size: 38154]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000244; Size: 39929]
[Name: chrUn_gl000245; Size: 36651]
[Name: chrUn_gl000242; Size: 43523]
[Name: chrUn_gl000243; Size: 43341]
[Name: chrUn_gl000240; Size: 41933]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr8; Size: 146364022]
[Name: chr12; Size: 133851895]
[Name: chr11; Size: 135006516]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr3; Size: 198022430]
[Name: chr10; Size: 135534747]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr1; Size: 249250621]
[Name: chr17; Size: 81195210]
[Name: chr16; Size: 90354753]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chrY; Size: 59373566]
[Name: chr15; Size: 102531392]
[Name: chrX; Size: 155270560]
[Name: chr14; Size: 107349540]
[Name: chr9_gl000200_random; Size: 187035]
[Name: chr9; Size: 141213431]
[Name: chr19; Size: 59128983]
[Name: chrM; Size: 16571]
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chrUn_gl000211; Size: 166566]
[Name: chrUn_gl000213; Size: 164239]
[Name: chrUn_gl000212; Size: 186858]
[Name: chrUn_gl000215; Size: 172545]
[Name: chrUn_gl000214; Size: 137718]
[Name: chrUn_gl000217; Size: 172149]
[Name: chrUn_gl000216; Size: 172294]
[Name: chrUn_gl000219; Size: 179198]
[Name: chrUn_gl000218; Size: 161147]
[Name: chr19_gl000209_random; Size: 159169]
[Name: chr22; Size: 51304566]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr20; Size: 63025520]
[Name: chr21; Size: 48129895]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr6; Size: 171115067]
Got SIGTERM. Failing gracefully... (09-18 00:26:51) elapsed: 844.0 _TIME_
</pre>

Pypiper terminating spawned child process 181723...(/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py)
Got SIGTERM. Failing gracefully... (09-18 00:26:55) elapsed: 5.0 _TIME_

Pypiper terminating spawned child process 181723...(/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py)
[Name: chr5; Size: 180915260]
Child not responding to SIGTERM, trying SIGKILL...
Child process SIGKILLed after 5.0 seconds.
Setting dynamic recover file: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/recover.lock.aligned_hg19_exact__temp__flag_completed

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/tmpr6AtQP', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmpyO8JHV', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/tmpr6AtQP', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmpyO8JHV', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam', skipping

### Pipeline failed at:  (09-18 00:27:00) elapsed: 5.0 _TIME_

Total time: 4:00:35

Changed status from running to failed.
Pipeline aborted.

Pypiper terminating spawned child process 157791...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold3 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/
*  Pipeline started at:   (09-18 08:14:36) elapsed: 0.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  2ffe53bb5058a51fd450bb3d660d64b2fbd4c7fa
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-17 14:37:30 -0400

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold3`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz']`
*        `genome_size`:  `hs`
*        `config_file`:  `pepatac.yaml`
*                `mem`:  `16000`
*       `force_follow`:  `False`
*              `cores`:  `8`
*          `anno_name`:  `None`
*            `trimmer`:  `skewer`
*        `peak_caller`:  `macs2`
*               `keep`:  `False`
*   `single_or_paired`:  `paired`
*              `dirty`:  `False`
*    `genome_assembly`:  `hg19`
*            `no_fifo`:  `False`

----------------------------------------


Changed status from initializing to running.
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz
> `File_mb`	4809.4498	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 08:14:36) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/raw/gold3_R2.fastq.gz']

### Adapter trimming:  (09-18 08:14:36) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold3_R1.trim_fastqc.html	FastQC report r1	fastqc/gold3_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold3_R2.trim_fastqc.html	FastQC report r2	fastqc/gold3_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 08:14:36) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 08:14:36) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/gold3_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	29229450.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	17.6	PEPATAC	_RES_

### Map to genome (09-18 08:14:36) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 08:14:36) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 08:14:36) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 08:14:36) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/tmp_gold3_sort_dedup_cuttrace_BgkNev'
Processing with 2 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr18; Size: 78077248]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chr13; Size: 115169878]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chrUn_gl000239; Size: 33824]
[Name: chrUn_gl000238; Size: 39939]
[Name: chrUn_gl000233; Size: 45941]
[Name: chrUn_gl000232; Size: 40652]
[Name: chrUn_gl000231; Size: 27386]
[Name: chrUn_gl000230; Size: 43691]
[Name: chrUn_gl000237; Size: 45867]
[Name: chrUn_gl000236; Size: 41934]
[Name: chrUn_gl000235; Size: 34474]
[Name: chrUn_gl000234; Size: 40531]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000249; Size: 38502]
[Name: chrUn_gl000246; Size: 38154]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000244; Size: 39929]
[Name: chrUn_gl000245; Size: 36651]
[Name: chrUn_gl000242; Size: 43523]
[Name: chrUn_gl000243; Size: 43341]
[Name: chrUn_gl000240; Size: 41933]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr8; Size: 146364022]
[Name: chr12; Size: 133851895]
[Name: chr11; Size: 135006516]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr3; Size: 198022430]
[Name: chr10; Size: 135534747]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr1; Size: 249250621]
[Name: chr17; Size: 81195210]
[Name: chr16; Size: 90354753]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chrY; Size: 59373566]
[Name: chr15; Size: 102531392]
[Name: chrX; Size: 155270560]
[Name: chr14; Size: 107349540]
[Name: chr9_gl000200_random; Size: 187035]
[Name: chr9; Size: 141213431]
[Name: chr19; Size: 59128983]
[Name: chrM; Size: 16571]
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chrUn_gl000211; Size: 166566]
[Name: chrUn_gl000213; Size: 164239]
[Name: chrUn_gl000212; Size: 186858]
[Name: chrUn_gl000215; Size: 172545]
[Name: chrUn_gl000214; Size: 137718]
[Name: chrUn_gl000217; Size: 172149]
[Name: chrUn_gl000216; Size: 172294]
[Name: chrUn_gl000219; Size: 179198]
[Name: chrUn_gl000218; Size: 161147]
[Name: chr19_gl000209_random; Size: 159169]
[Name: chr22; Size: 51304566]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr20; Size: 63025520]
[Name: chr21; Size: 48129895]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr6; Size: 171115067]
[Name: chr5; Size: 180915260]
[Name: chr4; Size: 191154276]
[Name: chrUn_gl000228; Size: 129120]
[Name: chr2; Size: 243199373]
[Name: chr1_gl000192_random; Size: 547496]
Discarding 0 chunk(s) of reads: []
Keeping 93 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 93 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_exact.bw'
Merging 93 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_smooth.bw'
</pre>
Process 149828 returned: (0). Elapsed: 0:22:39. Peak memory: (Process: 0.028GB; Pipeline: 0.0GB)
> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 173795 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.028GB)

### Calculate TSS enrichment (09-18 08:37:15) elapsed: 1359.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt`

<pre>
</pre>
Process 173797 returned: (0). Elapsed: 0:00:26. Peak memory: (Process: 0.188GB; Pipeline: 0.028GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt
Completed!

</pre>
Process 174308 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.028GB; Pipeline: 0.188GB)
> `TSS_Score`	10.1343127413	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold3_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold3_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 08:37:45) elapsed: 30.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragLenDistribution.pdf`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragLen.txt`

<pre>
</pre>
Process 174391 returned: (0). Elapsed: 0:05:41. Peak memory: (Process: 0.002GB; Pipeline: 0.188GB)
> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragCount.txt`

<pre>
</pre>
Process 181708 returned: (0). Elapsed: 0:02:13.
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_fragLenDistribution.txt`

<pre>
</pre>
Process 182569 returned: (0). Elapsed: 0:00:15. Peak memory: (Process: 0.423GB; Pipeline: 0.188GB)
> `Fragment distribution`	QC_hg19/gold3_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold3_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 08:45:53) elapsed: 489.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak`
> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19 -n gold3 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Tue, 18 Sep 2018 08:45:57: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19 -n gold3 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold3
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Tue, 18 Sep 2018 08:45:57: #1 read tag files... 
INFO  @ Tue, 18 Sep 2018 08:45:57: #1 read treatment tags... 
INFO  @ Tue, 18 Sep 2018 08:45:58:  1000000 
INFO  @ Tue, 18 Sep 2018 08:45:59:  2000000 
INFO  @ Tue, 18 Sep 2018 08:46:00:  3000000 
INFO  @ Tue, 18 Sep 2018 08:46:01:  4000000 
INFO  @ Tue, 18 Sep 2018 08:46:02:  5000000 
INFO  @ Tue, 18 Sep 2018 08:46:03:  6000000 
INFO  @ Tue, 18 Sep 2018 08:46:04:  7000000 
INFO  @ Tue, 18 Sep 2018 08:46:05:  8000000 
INFO  @ Tue, 18 Sep 2018 08:46:06:  9000000 
INFO  @ Tue, 18 Sep 2018 08:46:07:  10000000 
INFO  @ Tue, 18 Sep 2018 08:46:08:  11000000 
INFO  @ Tue, 18 Sep 2018 08:46:08:  12000000 
INFO  @ Tue, 18 Sep 2018 08:46:09:  13000000 
INFO  @ Tue, 18 Sep 2018 08:46:10:  14000000 
INFO  @ Tue, 18 Sep 2018 08:46:11:  15000000 
INFO  @ Tue, 18 Sep 2018 08:46:12:  16000000 
INFO  @ Tue, 18 Sep 2018 08:46:13:  17000000 
INFO  @ Tue, 18 Sep 2018 08:46:14:  18000000 
INFO  @ Tue, 18 Sep 2018 08:46:15:  19000000 
INFO  @ Tue, 18 Sep 2018 08:46:16:  20000000 
INFO  @ Tue, 18 Sep 2018 08:46:17:  21000000 
INFO  @ Tue, 18 Sep 2018 08:46:18:  22000000 
INFO  @ Tue, 18 Sep 2018 08:46:19:  23000000 
INFO  @ Tue, 18 Sep 2018 08:46:20:  24000000 
INFO  @ Tue, 18 Sep 2018 08:46:21:  25000000 
INFO  @ Tue, 18 Sep 2018 08:46:21:  26000000 
INFO  @ Tue, 18 Sep 2018 08:46:22:  27000000 
INFO  @ Tue, 18 Sep 2018 08:46:23:  28000000 
INFO  @ Tue, 18 Sep 2018 08:46:24:  29000000 
INFO  @ Tue, 18 Sep 2018 08:46:25:  30000000 
INFO  @ Tue, 18 Sep 2018 08:46:26:  31000000 
INFO  @ Tue, 18 Sep 2018 08:46:27:  32000000 
INFO  @ Tue, 18 Sep 2018 08:46:28:  33000000 
INFO  @ Tue, 18 Sep 2018 08:46:29:  34000000 
INFO  @ Tue, 18 Sep 2018 08:46:30:  35000000 
INFO  @ Tue, 18 Sep 2018 08:46:31:  36000000 
INFO  @ Tue, 18 Sep 2018 08:46:32:  37000000 
INFO  @ Tue, 18 Sep 2018 08:46:33:  38000000 
INFO  @ Tue, 18 Sep 2018 08:46:34:  39000000 
INFO  @ Tue, 18 Sep 2018 08:46:34:  40000000 
INFO  @ Tue, 18 Sep 2018 08:46:35:  41000000 
INFO  @ Tue, 18 Sep 2018 08:46:36:  42000000 
INFO  @ Tue, 18 Sep 2018 08:46:37:  43000000 
INFO  @ Tue, 18 Sep 2018 08:46:38:  44000000 
INFO  @ Tue, 18 Sep 2018 08:46:39:  45000000 
INFO  @ Tue, 18 Sep 2018 08:46:40:  46000000 
INFO  @ Tue, 18 Sep 2018 08:46:41:  47000000 
INFO  @ Tue, 18 Sep 2018 08:46:42:  48000000 
INFO  @ Tue, 18 Sep 2018 08:46:43:  49000000 
INFO  @ Tue, 18 Sep 2018 08:46:44:  50000000 
INFO  @ Tue, 18 Sep 2018 08:46:45:  51000000 
INFO  @ Tue, 18 Sep 2018 08:46:46:  52000000 
INFO  @ Tue, 18 Sep 2018 08:46:47:  53000000 
INFO  @ Tue, 18 Sep 2018 08:46:48:  54000000 
INFO  @ Tue, 18 Sep 2018 08:46:48:  55000000 
INFO  @ Tue, 18 Sep 2018 08:46:49:  56000000 
INFO  @ Tue, 18 Sep 2018 08:46:50:  57000000 
INFO  @ Tue, 18 Sep 2018 08:46:51:  58000000 
INFO  @ Tue, 18 Sep 2018 08:46:52:  59000000 
INFO  @ Tue, 18 Sep 2018 08:46:53:  60000000 
INFO  @ Tue, 18 Sep 2018 08:46:54:  61000000 
INFO  @ Tue, 18 Sep 2018 08:46:55:  62000000 
INFO  @ Tue, 18 Sep 2018 08:46:56:  63000000 
INFO  @ Tue, 18 Sep 2018 08:46:57:  64000000 
INFO  @ Tue, 18 Sep 2018 08:46:58:  65000000 
INFO  @ Tue, 18 Sep 2018 08:46:59:  66000000 
INFO  @ Tue, 18 Sep 2018 08:47:00:  67000000 
INFO  @ Tue, 18 Sep 2018 08:47:01:  68000000 
INFO  @ Tue, 18 Sep 2018 08:47:01:  69000000 
INFO  @ Tue, 18 Sep 2018 08:47:02:  70000000 
INFO  @ Tue, 18 Sep 2018 08:47:03:  71000000 
INFO  @ Tue, 18 Sep 2018 08:47:04:  72000000 
INFO  @ Tue, 18 Sep 2018 08:47:05:  73000000 
INFO  @ Tue, 18 Sep 2018 08:47:06:  74000000 
INFO  @ Tue, 18 Sep 2018 08:47:07:  75000000 
INFO  @ Tue, 18 Sep 2018 08:47:08:  76000000 
INFO  @ Tue, 18 Sep 2018 08:47:09:  77000000 
INFO  @ Tue, 18 Sep 2018 08:47:10:  78000000 
INFO  @ Tue, 18 Sep 2018 08:47:11:  79000000 
INFO  @ Tue, 18 Sep 2018 08:47:12:  80000000 
INFO  @ Tue, 18 Sep 2018 08:47:13:  81000000 
INFO  @ Tue, 18 Sep 2018 08:47:14:  82000000 
INFO  @ Tue, 18 Sep 2018 08:47:15:  83000000 
INFO  @ Tue, 18 Sep 2018 08:47:16:  84000000 
INFO  @ Tue, 18 Sep 2018 08:47:17:  85000000 
INFO  @ Tue, 18 Sep 2018 08:47:18:  86000000 
INFO  @ Tue, 18 Sep 2018 08:47:18:  87000000 
INFO  @ Tue, 18 Sep 2018 08:47:19:  88000000 
INFO  @ Tue, 18 Sep 2018 08:47:20:  89000000 
INFO  @ Tue, 18 Sep 2018 08:47:21:  90000000 
INFO  @ Tue, 18 Sep 2018 08:47:22:  91000000 
INFO  @ Tue, 18 Sep 2018 08:47:23:  92000000 
INFO  @ Tue, 18 Sep 2018 08:47:24:  93000000 
INFO  @ Tue, 18 Sep 2018 08:47:25:  94000000 
INFO  @ Tue, 18 Sep 2018 08:47:26:  95000000 
INFO  @ Tue, 18 Sep 2018 08:47:27:  96000000 
INFO  @ Tue, 18 Sep 2018 08:47:28:  97000000 
INFO  @ Tue, 18 Sep 2018 08:47:29:  98000000 
INFO  @ Tue, 18 Sep 2018 08:47:30:  99000000 
INFO  @ Tue, 18 Sep 2018 08:47:31:  100000000 
INFO  @ Tue, 18 Sep 2018 08:47:32:  101000000 
INFO  @ Tue, 18 Sep 2018 08:47:33:  102000000 
INFO  @ Tue, 18 Sep 2018 08:47:34:  103000000 
INFO  @ Tue, 18 Sep 2018 08:47:35:  104000000 
INFO  @ Tue, 18 Sep 2018 08:47:36:  105000000 
INFO  @ Tue, 18 Sep 2018 08:47:37:  106000000 
INFO  @ Tue, 18 Sep 2018 08:47:38:  107000000 
INFO  @ Tue, 18 Sep 2018 08:47:39:  108000000 
INFO  @ Tue, 18 Sep 2018 08:47:40:  109000000 
INFO  @ Tue, 18 Sep 2018 08:47:41:  110000000 
INFO  @ Tue, 18 Sep 2018 08:47:41:  111000000 
INFO  @ Tue, 18 Sep 2018 08:47:42:  112000000 
INFO  @ Tue, 18 Sep 2018 08:47:44: #1 tag size is determined as 50 bps 
INFO  @ Tue, 18 Sep 2018 08:47:44: #1 tag size = 50 
INFO  @ Tue, 18 Sep 2018 08:47:44: #1  total tags in treatment: 112228289 
INFO  @ Tue, 18 Sep 2018 08:47:44: #1 user defined the maximum tags... 
INFO  @ Tue, 18 Sep 2018 08:47:44: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Tue, 18 Sep 2018 08:47:46: #1  tags after filtering in treatment: 101570275 
INFO  @ Tue, 18 Sep 2018 08:47:46: #1  Redundant rate of treatment: 0.09 
INFO  @ Tue, 18 Sep 2018 08:47:46: #1 finished! 
INFO  @ Tue, 18 Sep 2018 08:47:46: #2 Build Peak Model... 
INFO  @ Tue, 18 Sep 2018 08:47:46: #2 Skipped... 
INFO  @ Tue, 18 Sep 2018 08:47:46: #2 Use 200 as fragment length 
INFO  @ Tue, 18 Sep 2018 08:47:46: #3 Call peaks... 
INFO  @ Tue, 18 Sep 2018 08:47:46: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Tue, 18 Sep 2018 08:51:19: #3 Call peaks for each chromosome... 
INFO  @ Tue, 18 Sep 2018 08:53:24: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.xls 
INFO  @ Tue, 18 Sep 2018 08:53:25: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak 
INFO  @ Tue, 18 Sep 2018 08:53:25: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_summits.bed 
INFO  @ Tue, 18 Sep 2018 08:53:25: Done! 
</pre>
Process 182873 returned: (0). Elapsed: 0:07:32. Peak memory: (Process: 1.458GB; Pipeline: 0.423GB)
Follow:
> `Peak_count`	99384	PEPATAC	_RES_

### # Calculate fraction of reads in peaks (FRiP) (09-18 08:53:25) elapsed: 452.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

('118880126', '17925307\n')
> `FRiP`	0.150784724101	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 08:55:11) elapsed: 106.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bigBed`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bigBed`

<pre>
pass1 - making usageList (59 chroms): 17 millis
pass2 - checking and writing primary data (99385 records, 10 fields): 326 millis
[1] TRUE
[1] TRUE
</pre>
Process 195213 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.028GB; Pipeline: 1.458GB)

### # Calculate peak coverage (09-18 08:55:16) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed`

<pre>
</pre>
Process 195222 returned: (0). Elapsed: 0:00:00.
> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 195224 returned: (0). Elapsed: 0:00:00.
> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed`

<pre>
</pre>
Process 195229 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed`

<pre>
</pre>
Process 195231 returned: (0). Elapsed: 0:02:41.

### # Calculate read coverage (09-18 08:57:58) elapsed: 162.0 _TIME_

> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3' UTR`
> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/"$4}'`

<pre>
</pre>
Process 195303 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 195306 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed`

<pre>
</pre>
Process 195309 returned: (0). Elapsed: 0:02:29.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 196045 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed`

<pre>
</pre>
Process 196054 returned: (0). Elapsed: 0:02:32.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 3509 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed`

<pre>
</pre>
Process 3532 returned: (0). Elapsed: 0:02:31.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 7225 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed`

<pre>
</pre>
Process 7242 returned: (0). Elapsed: 0:03:55.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 12154 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed`

<pre>
</pre>
Process 12161 returned: (0). Elapsed: 0:02:35.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 15720 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 15728 returned: (0). Elapsed: 0:02:31.

### # Plot FRiP/F (09-18 09:14:35) elapsed: 997.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed', '111571444', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_frif.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed 111571444 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 19502 returned: (0). Elapsed: 0:00:34. Peak memory: (Process: 0.482GB; Pipeline: 1.458GB)
> `Cumulative FRiF`	QC_hg19/gold3_frif.pdf	Cumulative FRiF	QC_hg19/gold3_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 09:15:31) elapsed: 56.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/gold3_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak gold3 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Warning message:
In parent.frame() :
  closing unused connection 3 (/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz)
Promoter :	found 14906
Promoter Flanking Region :	found 25694
5' UTR :	found 664
3' UTR :	found 1107
Exon :	found 2241
Intron :	found 25922
Peak annotation complete!

</pre>
Process 20354 returned: (0). Elapsed: 0:00:19. Peak memory: (Process: 0.352GB; Pipeline: 1.458GB)
> `Peak chromosome distribution`	QC_hg19/gold3_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold3_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold3_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold3_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold3_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold3_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/tmpccCqtJ
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/tmpccCqtJ`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/prealignments/bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmph_AHn3
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/tmph_AHn3`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R1.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3_R2.trim.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold3/fastq/gold3-trimmed.log`
> `Time`	1:01:14	PEPATAC	_RES_
> `Success`	09-18-09:15:50	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  1:01:14
*     Peak memory used:  1.46 GB
* Pipeline completed at:  (09-18 09:15:50) elapsed: 19.0 _TIME_

Pypiper terminating spawned child process 149798...(tee)
