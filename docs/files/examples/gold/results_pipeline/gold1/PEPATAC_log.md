### [Pipeline run code and environment:]

*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --genome hg19 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --single-or-paired paired --sample-name gold1 --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd_3k human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-9
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/
*  Pipeline started at:   (01-04 09:22:21) elapsed: 3.0 _TIME_

### [Version log:]

*       Python version:  2.7.15
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.9.0
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.8.4
*        Pipeline hash:  030c1c3d4738e719af989154e66a585168472f47
*      Pipeline branch:  * dev
*        Pipeline date:  2019-01-03 15:47:13 -0500

### [Arguments passed to pipeline:]

*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd_3k', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*       `deduplicator`:  `samblaster`
*        `sample_name`:  `gold1`
*               `lite`:  `False`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz']`
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

Using custom config file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.yaml

Loading config file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.yaml

Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz

> `File_mb`	6493.3235	PEPATAC	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (01-04 09:22:22) elapsed: 1.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R1.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R1.fastq.gz`

<pre>
</pre>
Process 39057 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R2.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R2.fastq.gz`

<pre>
</pre>
Process 39058 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.fastq`


> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.fastq`

<pre>
</pre>
Process 39059 returned: (0). Elapsed: 0:00:46. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)

> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.fastq`

<pre>
</pre>
Process 39146 returned: (0). Elapsed: 0:00:46. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.fastq']

> `Raw_reads`	137944752	PEPATAC	_RES_

> `Fastq_reads`	137944752	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (01-04 09:28:06) elapsed: 344.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`


> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.fastq`

<pre>
Parameters used:
-- 3' end adapter sequences in file (-x):	/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa
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
Fri Jan  4 09:28:06 2019[0;32m >> started[0m

Fri Jan  4 09:39:42 2019[0;32m >> done[0m (696.381s)
68972376 read pairs processed; of these:
    1333 ( 0.00%) short read pairs filtered out after trimming by size control
    8642 ( 0.01%) empty read pairs filtered out after trimming by size control
68962401 (99.99%) read pairs available; of these:
27985138 (40.58%) trimmed read pairs available after processing
40977263 (59.42%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1-trimmed.log".
</pre>
Process 39789 returned: (0). Elapsed: 0:11:37. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`

<pre>
</pre>
Process 40855 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.trim.fastq`

<pre>
</pre>
Process 40856 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
Follow:
Evaluating read trimming

> `Trimmed_reads`	137924802	PEPATAC	_RES_

> `Trim_loss_rate`	0.01	PEPATAC	_RES_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold1_R1.trim.fastq
Approx 5% complete for gold1_R1.trim.fastq
Approx 10% complete for gold1_R1.trim.fastq
Approx 15% complete for gold1_R1.trim.fastq
Approx 20% complete for gold1_R1.trim.fastq
Approx 25% complete for gold1_R1.trim.fastq
Approx 30% complete for gold1_R1.trim.fastq
Approx 35% complete for gold1_R1.trim.fastq
Approx 40% complete for gold1_R1.trim.fastq
Approx 45% complete for gold1_R1.trim.fastq
Approx 50% complete for gold1_R1.trim.fastq
Approx 55% complete for gold1_R1.trim.fastq
Approx 60% complete for gold1_R1.trim.fastq
Approx 65% complete for gold1_R1.trim.fastq
Approx 70% complete for gold1_R1.trim.fastq
Approx 75% complete for gold1_R1.trim.fastq
Approx 80% complete for gold1_R1.trim.fastq
Approx 85% complete for gold1_R1.trim.fastq
Approx 90% complete for gold1_R1.trim.fastq
Approx 95% complete for gold1_R1.trim.fastq
Analysis complete for gold1_R1.trim.fastq
</pre>
Process 41043 returned: (0). Elapsed: 0:04:46. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1		PEPATAC	_OBJ_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold1_R2.trim.fastq
Approx 5% complete for gold1_R2.trim.fastq
Approx 10% complete for gold1_R2.trim.fastq
Approx 15% complete for gold1_R2.trim.fastq
Approx 20% complete for gold1_R2.trim.fastq
Approx 25% complete for gold1_R2.trim.fastq
Approx 30% complete for gold1_R2.trim.fastq
Approx 35% complete for gold1_R2.trim.fastq
Approx 40% complete for gold1_R2.trim.fastq
Approx 45% complete for gold1_R2.trim.fastq
Approx 50% complete for gold1_R2.trim.fastq
Approx 55% complete for gold1_R2.trim.fastq
Approx 60% complete for gold1_R2.trim.fastq
Approx 65% complete for gold1_R2.trim.fastq
Approx 70% complete for gold1_R2.trim.fastq
Approx 75% complete for gold1_R2.trim.fastq
Approx 80% complete for gold1_R2.trim.fastq
Approx 85% complete for gold1_R2.trim.fastq
Approx 90% complete for gold1_R2.trim.fastq
Approx 95% complete for gold1_R2.trim.fastq
Analysis complete for gold1_R2.trim.fastq
</pre>
Process 41329 returned: (0). Elapsed: 0:04:47. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2		PEPATAC	_OBJ_

### Prealignments (01-04 09:49:37) elapsed: 1291.0 _TIME_

Prealignment assemblies: ['rCRSd_3k', 'human_repeats']

### Map to rCRSd_3k (01-04 09:49:37) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/rCRSd_3k_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/rCRSd_3k_bt2`

<pre>
</pre>
Process 43037 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/rCRSd_3k_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [43043]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd_3k/indexed_bowtie2/rCRSd_3k --rg-id gold1 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/rCRSd_3k_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_bt_aln_summary.log`

<pre>
</pre>
Process 43044 returned: (0). Elapsed: 0:13:14. Peak memory: (Process: 0.06GB; Pipeline: 0.06GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_rCRSd_3k`	21049900.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd_3k`	15.26	PEPATAC	_RES_

### Map to human_repeats (01-04 10:02:51) elapsed: 794.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/human_repeats_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/human_repeats_bt2`

<pre>
</pre>
Process 55748 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.06GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/human_repeats_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R2.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [55751]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/human_repeats/indexed_bowtie2/human_repeats --rg-id gold1 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R1.fq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/human_repeats_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log`

<pre>
10524950 reads skipped
0 reads lost
</pre>
Process 55752 returned: (0). Elapsed: 0:11:30. Peak memory: (Process: 0.063GB; Pipeline: 0.063GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_human_repeats`	9761740.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	7.08	PEPATAC	_RES_

### Map to genome (01-04 10:14:21) elapsed: 691.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`


> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold1 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmp_dl599 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam`

<pre>
4880870 reads skipped
0 reads lost
53556581 reads; of these:
  53556581 (100.00%) were paired; of these:
    2510011 (4.69%) aligned concordantly 0 times
    42664763 (79.66%) aligned concordantly exactly 1 time
    8381807 (15.65%) aligned concordantly >1 times
    ----
    2510011 pairs aligned concordantly 0 times; of these:
      62571 (2.49%) aligned discordantly 1 time
    ----
    2447440 pairs aligned 0 times concordantly or discordantly; of these:
      4894880 mates make up the pairs; of these:
        3910610 (79.89%) aligned 0 times
        618112 (12.63%) aligned exactly 1 time
        366158 (7.48%) aligned >1 times
96.35% overall alignment rate
</pre>
Process 68690 returned: (0). Elapsed: 1:51:47. Peak memory: (Process: 3.601GB; Pipeline: 3.601GB)
<pre>
</pre>
Process 68691 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.601GB)
<pre>
[bam_sort_core] merging from 32 files and 1 in-memory blocks...
</pre>
Process 68692 returned: (0). Elapsed: 0:15:50. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

> `samtools view -q 10 -b -@ 8 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_fail_qc.bam -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

<pre>
</pre>
Process 143980 returned: (0). Elapsed: 0:04:54. Peak memory: (Process: 0.019GB; Pipeline: 3.601GB)
Follow:

> `Mapped_reads`	103202552	PEPATAC	_RES_

> `QC_filtered_reads`	8281268.0	PEPATAC	_RES_

> `Aligned_reads`	94921284	PEPATAC	_RES_

> `Alignment_rate`	68.82	PEPATAC	_RES_

> `Total_efficiency`	68.81	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R1.fq`

<pre>
</pre>
Process 144640 returned: (0). Elapsed: 0:17:49. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Process 146473 returned: (0). Elapsed: 0:18:16. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R1.fq`

<pre>
</pre>
Process 148340 returned: (0). Elapsed: 0:16:34. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/gold1_human_repeats_unmap_R2.fq`

<pre>
</pre>
Process 149895 returned: (0). Elapsed: 0:16:57. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`


> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam`

<pre>
</pre>
Process 151502 returned: (0). Elapsed: 0:01:31. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

<pre>
</pre>
Process 151771 returned: (0). Elapsed: 0:01:20. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam | grep -we 'chrM' -we 'chrMT' -we 'M' -we 'MT'| cut -f 3`


> `Mitochondrial_reads`	14990.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_noMT.bam`


> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam | cut -f 1 | grep -vwe 'chrM' -vwe 'chrMT' -vwe 'M' -vwe 'MT'| xargs samtools view -b -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_noMT.bam`

<pre>
</pre>
Process 151847 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)
<pre>
</pre>
Process 151848 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.601GB)
<pre>
</pre>
Process 151849 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.601GB)
<pre>
</pre>
Process 151850 returned: (0). Elapsed: 0:02:53. Peak memory: (Process: 0.062GB; Pipeline: 3.601GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_noMT.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

<pre>
</pre>
Process 152058 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

<pre>
</pre>
Process 152059 returned: (0). Elapsed: 0:01:19. Peak memory: (Process: 0.0GB; Pipeline: 3.601GB)

### Calculate NRF, PBC1, and PBC2 (01-04 13:46:17) elapsed: 12716.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

<pre>
Configured logger 'root' using pararead v0.5.0
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/tmp_gold1_sort_pUadww'
Processing with 8 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr13; Size: 115169878]
[Name: chr10; Size: 135534747]
[Name: chr15; Size: 102531392]
[Name: chr18; Size: 78077248]
[Name: chrUn_gl000238; Size: 39939]
[Name: chrUn_gl000231; Size: 27386]
[Name: chrUn_gl000236; Size: 41934]
[Name: chrUn_gl000233; Size: 45941]
[Name: chrUn_gl000235; Size: 34474]
[Name: chrUn_gl000230; Size: 43691]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chrUn_gl000237; Size: 45867]
[Name: chrUn_gl000234; Size: 40531]
[Name: chrUn_gl000232; Size: 40652]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000249; Size: 38502]
[Name: chrUn_gl000244; Size: 39929]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000246; Size: 38154]
[Name: chrUn_gl000245; Size: 36651]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000242; Size: 43523]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000243; Size: 43341]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr8; Size: 146364022]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr3; Size: 198022430]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chrY; Size: 59373566]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chrX; Size: 155270560]
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
[Name: chr14; Size: 107349540]
[Name: chrUn_gl000239; Size: 33824]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr12; Size: 133851895]
[Name: chr21; Size: 48129895]
[Name: chr9_gl000200_random; Size: 187035]
[Name: chr9; Size: 141213431]
[Name: chr17; Size: 81195210]
[Name: chr5; Size: 180915260]
[Name: chr2; Size: 243199373]
[Name: chr19; Size: 59128983]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr1; Size: 249250621]
[Name: chr16; Size: 90354753]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr11; Size: 135006516]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr6; Size: 171115067]
[Name: chr4; Size: 191154276]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000228; Size: 129120]
Discarding 1 chunk(s) of reads: ['chrM']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv'
</pre>
Process 152299 returned: (0). Elapsed: 0:01:44. Peak memory: (Process: 4.383GB; Pipeline: 4.383GB)
Follow:

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`


> `NRF`	0.94	PEPATAC	_RES_

> `PBC1`	0.97	PEPATAC	_RES_

> `PBC2`	31.77	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`


> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

<pre>
</pre>
Process 152456 returned: (0). Elapsed: 0:00:25. Peak memory: (Process: 0.015GB; Pipeline: 4.383GB)
Follow:

> `samtools view -c -f 4 -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam`


> `Unmapped_reads`	3910610.0	PEPATAC	_RES_

### Remove dupes, build bigwig and bedgraph files (01-04 13:48:38) elapsed: 141.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`


> `samtools sort -n -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmpxNTARK /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort.bam | samtools view -h - -@ 8 | samblaster -r 2> /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmpxNTARK -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

<pre>
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
</pre>
Process 152516 returned: (0). Elapsed: 0:10:18. Peak memory: (Process: 0.0GB; Pipeline: 4.383GB)
<pre>
</pre>
Process 152517 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 4.383GB)
<pre>
</pre>
Process 152518 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 4.383GB)
<pre>
</pre>
Process 152519 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 4.383GB)
<pre>
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
</pre>
Process 152520 returned: (0). Elapsed: 0:03:00. Peak memory: (Process: 0.0GB; Pipeline: 4.383GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

<pre>
</pre>
Process 154057 returned: (0). Elapsed: 0:01:17. Peak memory: (Process: 0.0GB; Pipeline: 4.383GB)
Follow:

> `grep 'Removed' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_dedup_metrics_log.txt | cut -f 3 -d ' '`


> `Duplicate_reads`	1973449	PEPATAC	_RES_

> `Dedup_aligned_reads`	92947835.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	67.39	PEPATAC	_RES_

> `Dedup_total_efficiency`	67.38	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (01-04 14:03:12) elapsed: 875.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/gold1_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_smooth.bw -p 5`

<pre>
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/tmp_gold1_sort_dedup_cuttrace_qkxRCy'
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
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr3; Size: 198022430]
[Name: chr11; Size: 135006516]
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
[Name: chrUn_gl000224; Size: 179693]
Discarding 1 chunk(s) of reads: ['chrM']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/gold1_exact.bw'
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_smooth.bw'
</pre>
Process 154142 returned: (0). Elapsed: 0:21:24. Peak memory: (Process: 5.07GB; Pipeline: 5.07GB)

> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 157393 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

### Calculate TSS enrichment (01-04 14:24:37) elapsed: 1284.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

<pre>
</pre>
Process 157394 returned: (0). Elapsed: 0:00:23. Peak memory: (Process: 0.401GB; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt
Completed!

</pre>
Process 157464 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

> `TSS_Score`	9.00420993545	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (01-04 14:25:03) elapsed: 26.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragLen.txt`

<pre>
</pre>
Process 157638 returned: (0). Elapsed: 0:04:00. Peak memory: (Process: 0.003GB; Pipeline: 5.07GB)

> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragCount.txt`

<pre>
</pre>
Process 157931 returned: (0). Elapsed: 0:00:30. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 157932 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)

> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.txt`

<pre>
</pre>
Process 157975 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (01-04 14:29:45) elapsed: 282.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`


> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19 -n gold1 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Fri, 04 Jan 2019 14:29:47: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19 -n gold1 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold1
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# The maximum gap between significant sites is assigned as the read length/tag size.
# The minimum length of peaks is assigned as the predicted fragment length "d".
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Fri, 04 Jan 2019 14:29:47: #1 read tag files... 
INFO  @ Fri, 04 Jan 2019 14:29:47: #1 read treatment tags... 
INFO  @ Fri, 04 Jan 2019 14:29:48:  1000000 
INFO  @ Fri, 04 Jan 2019 14:29:49:  2000000 
INFO  @ Fri, 04 Jan 2019 14:29:50:  3000000 
INFO  @ Fri, 04 Jan 2019 14:29:51:  4000000 
INFO  @ Fri, 04 Jan 2019 14:29:51:  5000000 
INFO  @ Fri, 04 Jan 2019 14:29:52:  6000000 
INFO  @ Fri, 04 Jan 2019 14:29:53:  7000000 
INFO  @ Fri, 04 Jan 2019 14:29:54:  8000000 
INFO  @ Fri, 04 Jan 2019 14:29:54:  9000000 
INFO  @ Fri, 04 Jan 2019 14:29:55:  10000000 
INFO  @ Fri, 04 Jan 2019 14:29:56:  11000000 
INFO  @ Fri, 04 Jan 2019 14:29:57:  12000000 
INFO  @ Fri, 04 Jan 2019 14:29:58:  13000000 
INFO  @ Fri, 04 Jan 2019 14:29:58:  14000000 
INFO  @ Fri, 04 Jan 2019 14:29:59:  15000000 
INFO  @ Fri, 04 Jan 2019 14:30:00:  16000000 
INFO  @ Fri, 04 Jan 2019 14:30:01:  17000000 
INFO  @ Fri, 04 Jan 2019 14:30:01:  18000000 
INFO  @ Fri, 04 Jan 2019 14:30:02:  19000000 
INFO  @ Fri, 04 Jan 2019 14:30:03:  20000000 
INFO  @ Fri, 04 Jan 2019 14:30:04:  21000000 
INFO  @ Fri, 04 Jan 2019 14:30:05:  22000000 
INFO  @ Fri, 04 Jan 2019 14:30:05:  23000000 
INFO  @ Fri, 04 Jan 2019 14:30:06:  24000000 
INFO  @ Fri, 04 Jan 2019 14:30:07:  25000000 
INFO  @ Fri, 04 Jan 2019 14:30:08:  26000000 
INFO  @ Fri, 04 Jan 2019 14:30:08:  27000000 
INFO  @ Fri, 04 Jan 2019 14:30:09:  28000000 
INFO  @ Fri, 04 Jan 2019 14:30:10:  29000000 
INFO  @ Fri, 04 Jan 2019 14:30:11:  30000000 
INFO  @ Fri, 04 Jan 2019 14:30:12:  31000000 
INFO  @ Fri, 04 Jan 2019 14:30:12:  32000000 
INFO  @ Fri, 04 Jan 2019 14:30:13:  33000000 
INFO  @ Fri, 04 Jan 2019 14:30:14:  34000000 
INFO  @ Fri, 04 Jan 2019 14:30:15:  35000000 
INFO  @ Fri, 04 Jan 2019 14:30:16:  36000000 
INFO  @ Fri, 04 Jan 2019 14:30:16:  37000000 
INFO  @ Fri, 04 Jan 2019 14:30:17:  38000000 
INFO  @ Fri, 04 Jan 2019 14:30:18:  39000000 
INFO  @ Fri, 04 Jan 2019 14:30:19:  40000000 
INFO  @ Fri, 04 Jan 2019 14:30:19:  41000000 
INFO  @ Fri, 04 Jan 2019 14:30:20:  42000000 
INFO  @ Fri, 04 Jan 2019 14:30:21:  43000000 
INFO  @ Fri, 04 Jan 2019 14:30:22:  44000000 
INFO  @ Fri, 04 Jan 2019 14:30:23:  45000000 
INFO  @ Fri, 04 Jan 2019 14:30:23:  46000000 
INFO  @ Fri, 04 Jan 2019 14:30:24:  47000000 
INFO  @ Fri, 04 Jan 2019 14:30:25:  48000000 
INFO  @ Fri, 04 Jan 2019 14:30:26:  49000000 
INFO  @ Fri, 04 Jan 2019 14:30:26:  50000000 
INFO  @ Fri, 04 Jan 2019 14:30:27:  51000000 
INFO  @ Fri, 04 Jan 2019 14:30:28:  52000000 
INFO  @ Fri, 04 Jan 2019 14:30:29:  53000000 
INFO  @ Fri, 04 Jan 2019 14:30:30:  54000000 
INFO  @ Fri, 04 Jan 2019 14:30:30:  55000000 
INFO  @ Fri, 04 Jan 2019 14:30:31:  56000000 
INFO  @ Fri, 04 Jan 2019 14:30:32:  57000000 
INFO  @ Fri, 04 Jan 2019 14:30:33:  58000000 
INFO  @ Fri, 04 Jan 2019 14:30:34:  59000000 
INFO  @ Fri, 04 Jan 2019 14:30:34:  60000000 
INFO  @ Fri, 04 Jan 2019 14:30:35:  61000000 
INFO  @ Fri, 04 Jan 2019 14:30:36:  62000000 
INFO  @ Fri, 04 Jan 2019 14:30:37:  63000000 
INFO  @ Fri, 04 Jan 2019 14:30:37:  64000000 
INFO  @ Fri, 04 Jan 2019 14:30:38:  65000000 
INFO  @ Fri, 04 Jan 2019 14:30:39:  66000000 
INFO  @ Fri, 04 Jan 2019 14:30:40:  67000000 
INFO  @ Fri, 04 Jan 2019 14:30:41:  68000000 
INFO  @ Fri, 04 Jan 2019 14:30:41:  69000000 
INFO  @ Fri, 04 Jan 2019 14:30:42:  70000000 
INFO  @ Fri, 04 Jan 2019 14:30:43:  71000000 
INFO  @ Fri, 04 Jan 2019 14:30:44:  72000000 
INFO  @ Fri, 04 Jan 2019 14:30:45:  73000000 
INFO  @ Fri, 04 Jan 2019 14:30:45:  74000000 
INFO  @ Fri, 04 Jan 2019 14:30:46:  75000000 
INFO  @ Fri, 04 Jan 2019 14:30:47:  76000000 
INFO  @ Fri, 04 Jan 2019 14:30:48:  77000000 
INFO  @ Fri, 04 Jan 2019 14:30:49:  78000000 
INFO  @ Fri, 04 Jan 2019 14:30:49:  79000000 
INFO  @ Fri, 04 Jan 2019 14:30:50:  80000000 
INFO  @ Fri, 04 Jan 2019 14:30:51:  81000000 
INFO  @ Fri, 04 Jan 2019 14:30:52:  82000000 
INFO  @ Fri, 04 Jan 2019 14:30:53:  83000000 
INFO  @ Fri, 04 Jan 2019 14:30:53:  84000000 
INFO  @ Fri, 04 Jan 2019 14:30:54:  85000000 
INFO  @ Fri, 04 Jan 2019 14:30:55:  86000000 
INFO  @ Fri, 04 Jan 2019 14:30:56:  87000000 
INFO  @ Fri, 04 Jan 2019 14:30:57:  88000000 
INFO  @ Fri, 04 Jan 2019 14:30:58:  89000000 
INFO  @ Fri, 04 Jan 2019 14:30:58:  90000000 
INFO  @ Fri, 04 Jan 2019 14:31:00: #1 tag size is determined as 50 bps 
INFO  @ Fri, 04 Jan 2019 14:31:00: #1 tag size = 50.0 
INFO  @ Fri, 04 Jan 2019 14:31:00: #1  total tags in treatment: 90973901 
INFO  @ Fri, 04 Jan 2019 14:31:00: #1 user defined the maximum tags... 
INFO  @ Fri, 04 Jan 2019 14:31:00: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Fri, 04 Jan 2019 14:31:02: #1  tags after filtering in treatment: 83582183 
INFO  @ Fri, 04 Jan 2019 14:31:02: #1  Redundant rate of treatment: 0.08 
INFO  @ Fri, 04 Jan 2019 14:31:02: #1 finished! 
INFO  @ Fri, 04 Jan 2019 14:31:02: #2 Build Peak Model... 
INFO  @ Fri, 04 Jan 2019 14:31:02: #2 Skipped... 
INFO  @ Fri, 04 Jan 2019 14:31:02: #2 Use 200 as fragment length 
INFO  @ Fri, 04 Jan 2019 14:31:02: #3 Call peaks... 
INFO  @ Fri, 04 Jan 2019 14:31:02: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Fri, 04 Jan 2019 14:34:15: #3 Call peaks for each chromosome... 
INFO  @ Fri, 04 Jan 2019 14:36:10: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.xls 
INFO  @ Fri, 04 Jan 2019 14:36:11: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak 
INFO  @ Fri, 04 Jan 2019 14:36:11: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_summits.bed 
INFO  @ Fri, 04 Jan 2019 14:36:11: Done! 
</pre>
Process 157992 returned: (0). Elapsed: 0:06:27. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
Follow:

> `Peak_count`	97483	PEPATAC	_RES_

### Calculate fraction of reads in peaks (FRiP) (01-04 14:36:12) elapsed: 387.0 _TIME_


> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('94921284', '14074814\n')

> `FRiP`	0.148278799094	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (01-04 14:37:44) elapsed: 92.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

<pre>
pass1 - making usageList (55 chroms): 18 millis
pass2 - checking and writing primary data (97484 records, 10 fields): 365 millis
[1] TRUE
[1] TRUE
</pre>
Process 158925 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

### Calculate peak coverage (01-04 14:37:47) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed`

<pre>
</pre>
Process 158936 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 158939 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 158940 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)
<pre>
</pre>
Process 158941 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)
<pre>
</pre>
Process 158942 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)

> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

<pre>
</pre>
Process 158944 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

<pre>
</pre>
Process 158946 returned: (0). Elapsed: 0:02:25. Peak memory: (Process: 0.01GB; Pipeline: 5.07GB)

### Calculate read coverage (01-04 14:40:13) elapsed: 146.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/hg19_annotations.bed.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/hg19_annotations.bed.gz`

<pre>
</pre>
Process 159282 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3' UTR`


> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 159287 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 159288 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 159290 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 159291 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

<pre>
</pre>
Process 159293 returned: (0). Elapsed: 0:02:19. Peak memory: (Process: 0.007GB; Pipeline: 5.07GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 159445 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 159446 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.027GB; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

<pre>
</pre>
Process 159448 returned: (0). Elapsed: 0:02:20. Peak memory: (Process: 0.008GB; Pipeline: 5.07GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 159604 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 159605 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.088GB; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

<pre>
</pre>
Process 159607 returned: (0). Elapsed: 0:02:21. Peak memory: (Process: 0.011GB; Pipeline: 5.07GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 159944 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 159945 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.081GB; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

<pre>
</pre>
Process 159947 returned: (0). Elapsed: 0:03:03. Peak memory: (Process: 0.069GB; Pipeline: 5.07GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 160327 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 160329 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

<pre>
</pre>
Process 160331 returned: (0). Elapsed: 0:02:22. Peak memory: (Process: 0.01GB; Pipeline: 5.07GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 160485 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
<pre>
</pre>
Process 160486 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.07GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 160488 returned: (0). Elapsed: 0:02:21. Peak memory: (Process: 0.009GB; Pipeline: 5.07GB)

### Plot FRiP/F (01-04 14:55:02) elapsed: 889.0 _TIME_


> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R', 'gold1', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '90557796', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R gold1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed 90557796 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 160840 returned: (0). Elapsed: 0:00:35. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### Annotate peaks (01-04 14:55:49) elapsed: 46.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/raw/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak gold1 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19`

<pre>
Promoter :	found 15046
Promoter Flanking Region :	found 24572
5' UTR :	found 660
3' UTR :	found 1077
Exon :	found 2367
Intron :	found 25587
Peak annotation complete!

</pre>
Process 160891 returned: (0). Elapsed: 0:00:19. Peak memory: (Process: 0.0GB; Pipeline: 5.07GB)
> `Peak chromosome distribution`	QC_hg19/gold1_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold1_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold1_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold1_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold1_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold1_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/tmpXYv6A8
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/tmpXYv6A8`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/rCRSd_3k_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/tmpJE2w3o
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/tmpJE2w3o`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/prealignments/human_repeats_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmp_dl599
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmp_dl599`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam.bai
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam.bai`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/gold1_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmpxNTARK
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19/tmpxNTARK`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1_R1.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold1/fastq/gold1-trimmed.log`

> `Time`	5:33:49	PEPATAC	_RES_

> `Success`	01-04-14:56:08	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  5:33:49
*     Peak memory used:  5.07 GB
* Pipeline completed at:  (01-04 14:56:08) elapsed: 19.0 _TIME_

Pypiper terminating spawned child process 39031...(tee)
