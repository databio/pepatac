### [Pipeline run code and environment:]

*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --genome hg19 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz --single-or-paired paired --sample-name gold3 --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz --prealignments rCRSd_3k human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba27-12
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/
*  Pipeline started at:   (01-03 14:33:50) elapsed: 0.0 _TIME_

### [Version log:]

*       Python version:  2.7.15
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.9.0
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.8.4
*        Pipeline hash:  62ec17688de7ba8c2540494bf5a0f91c8de3186b
*      Pipeline branch:  * dev
*        Pipeline date:  2018-12-31 12:25:15 -0500

### [Arguments passed to pipeline:]

*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd_3k', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*       `deduplicator`:  `samblaster`
*        `sample_name`:  `gold3`
*               `lite`:  `False`
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

Using custom config file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.yaml

Loading config file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.yaml

Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz

> `File_mb`	4809.4498	PEPATAC	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (01-03 14:33:50) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R1.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R1.fastq.gz`

<pre>
</pre>
Process 11490 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R2.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210398_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R2.fastq.gz`

<pre>
</pre>
Process 11492 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.fastq`


> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.fastq`

<pre>
</pre>
Process 11493 returned: (0). Elapsed: 0:00:35. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)

> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.fastq`

<pre>
</pre>
Process 11529 returned: (0). Elapsed: 0:00:41. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.fastq']

> `Raw_reads`	166092252	PEPATAC	_RES_

> `Fastq_reads`	166092252	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/gold3_R2.fastq.gz']

### Adapter trimming:  (01-03 14:38:28) elapsed: 278.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`


> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.fastq`

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
Thu Jan  3 14:38:28 2019[0;32m >> started[0m

Thu Jan  3 14:45:23 2019[0;32m >> done[0m (414.480s)
83046126 read pairs processed; of these:
     556 ( 0.00%) short read pairs filtered out after trimming by size control
     276 ( 0.00%) empty read pairs filtered out after trimming by size control
83045294 (100.00%) read pairs available; of these:
 3119403 ( 3.76%) trimmed read pairs available after processing
79925891 (96.24%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3-trimmed.log".
</pre>
Process 11941 returned: (0). Elapsed: 0:06:55. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`

<pre>
</pre>
Process 12772 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.trim.fastq`

<pre>
</pre>
Process 12773 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
Follow:
Evaluating read trimming

> `Trimmed_reads`	166090588	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`

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
Process 12800 returned: (0). Elapsed: 0:04:35. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r1`	fastqc/gold3_R1.trim_fastqc.html	FastQC report r1		PEPATAC	_OBJ_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.trim.fastq`

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
Process 13230 returned: (0). Elapsed: 0:03:55. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r2`	fastqc/gold3_R2.trim_fastqc.html	FastQC report r2		PEPATAC	_OBJ_

### Prealignments (01-03 14:54:13) elapsed: 945.0 _TIME_

Prealignment assemblies: ['rCRSd_3k', 'human_repeats']

### Map to rCRSd_3k (01-03 14:54:13) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/rCRSd_3k_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/rCRSd_3k_bt2`

<pre>
</pre>
Process 13485 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/rCRSd_3k_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [13487]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd_3k/indexed_bowtie2/rCRSd_3k --rg-id gold3 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/rCRSd_3k_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_bt_aln_summary.log`

<pre>
</pre>
Process 13488 returned: (0). Elapsed: 0:13:01. Peak memory: (Process: 0.051GB; Pipeline: 0.051GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_rCRSd_3k`	29229450.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd_3k`	17.6	PEPATAC	_RES_

### Map to human_repeats (01-03 15:07:14) elapsed: 781.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/human_repeats_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/human_repeats_bt2`

<pre>
</pre>
Process 14732 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.051GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/human_repeats_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R2.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [14733]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/human_repeats/indexed_bowtie2/human_repeats --rg-id gold3 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R1.fq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/human_repeats_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log`

<pre>
14614725 reads skipped
0 reads lost
</pre>
Process 14734 returned: (0). Elapsed: 0:09:51. Peak memory: (Process: 0.047GB; Pipeline: 0.051GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_human_repeats`	10699930.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	6.44	PEPATAC	_RES_

### Map to genome (01-03 15:17:08) elapsed: 594.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`


> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold3 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmpT8WvTY -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`

<pre>
5349965 reads skipped
0 reads lost
63080604 reads; of these:
  63080604 (100.00%) were paired; of these:
    2450385 (3.88%) aligned concordantly 0 times
    51499917 (81.64%) aligned concordantly exactly 1 time
    9130302 (14.47%) aligned concordantly >1 times
    ----
    2450385 pairs aligned concordantly 0 times; of these:
      98299 (4.01%) aligned discordantly 1 time
    ----
    2352086 pairs aligned 0 times concordantly or discordantly; of these:
      4704172 mates make up the pairs; of these:
        2803833 (59.60%) aligned 0 times
        1143248 (24.30%) aligned exactly 1 time
        757091 (16.09%) aligned >1 times
97.78% overall alignment rate
</pre>
Process 15639 returned: (0). Elapsed: 2:13:41. Peak memory: (Process: 3.557GB; Pipeline: 3.557GB)
<pre>
</pre>
Process 15640 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.557GB)
<pre>
[bam_sort_core] merging from 31 files and 1 in-memory blocks...
</pre>
Process 15641 returned: (0). Elapsed: 0:11:43. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

> `samtools view -q 10 -b -@ 8 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_fail_qc.bam -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

<pre>
</pre>
Process 46098 returned: (0). Elapsed: 0:03:34. Peak memory: (Process: 0.019GB; Pipeline: 3.557GB)
Follow:

> `Mapped_reads`	123357375	PEPATAC	_RES_

> `QC_filtered_reads`	9669147.0	PEPATAC	_RES_

> `Aligned_reads`	113688228	PEPATAC	_RES_

> `Alignment_rate`	68.45	PEPATAC	_RES_

> `Total_efficiency`	68.45	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R1.fq`

<pre>
</pre>
Process 46665 returned: (0). Elapsed: 0:11:57. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Process 48018 returned: (0). Elapsed: 0:12:49. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R1.fq`

<pre>
</pre>
Process 49200 returned: (0). Elapsed: 0:11:05. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/gold3_human_repeats_unmap_R2.fq`

<pre>
</pre>
Process 50267 returned: (0). Elapsed: 0:11:54. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam.bai`


> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`

<pre>
</pre>
Process 51706 returned: (0). Elapsed: 0:01:21. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

<pre>
</pre>
Process 51784 returned: (0). Elapsed: 0:01:17. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam | grep -we 'chrM' -we 'chrMT' -we 'M' -we 'MT'| cut -f 3`


> `Mitochondrial_reads`	15230.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_noMT.bam`


> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam | cut -f 1 | grep -vwe 'chrM' -vwe 'chrMT' -vwe 'M' -vwe 'MT'| xargs samtools view -b -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_noMT.bam`

<pre>
</pre>
Process 51918 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)
<pre>
</pre>
Process 51919 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.557GB)
<pre>
</pre>
Process 51920 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.557GB)
<pre>
</pre>
Process 51921 returned: (0). Elapsed: 0:02:06. Peak memory: (Process: 0.052GB; Pipeline: 3.557GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_noMT.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

<pre>
</pre>
Process 52236 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam`

<pre>
</pre>
Process 52237 returned: (0). Elapsed: 0:01:11. Peak memory: (Process: 0.0GB; Pipeline: 3.557GB)

### Calculate NRF, PBC1, and PBC2 (01-03 18:42:15) elapsed: 12306.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`

<pre>
Configured logger 'root' using pararead v0.5.0
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/tmp_gold3_sort_0OGMWN'
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
[Name: chr21_gl000210_random; Size: 27682]
[Name: chrUn_gl000230; Size: 43691]
[Name: chrUn_gl000232; Size: 40652]
[Name: chrUn_gl000234; Size: 40531]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chrUn_gl000237; Size: 45867]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000249; Size: 38502]
[Name: chrUn_gl000244; Size: 39929]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chrUn_gl000246; Size: 38154]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000245; Size: 36651]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000242; Size: 43523]
[Name: chrUn_gl000243; Size: 43341]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chrUn_gl000248; Size: 39786]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr8; Size: 146364022]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr7_gl000195_random; Size: 182896]
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
[Name: chrUn_gl000239; Size: 33824]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr14; Size: 107349540]
[Name: chr12; Size: 133851895]
[Name: chr21; Size: 48129895]
[Name: chr9_gl000200_random; Size: 187035]
[Name: chr9; Size: 141213431]
[Name: chr5; Size: 180915260]
[Name: chr17; Size: 81195210]
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
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr11; Size: 135006516]
[Name: chr6; Size: 171115067]
[Name: chr4; Size: 191154276]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000228; Size: 129120]
Discarding 1 chunk(s) of reads: ['chrM']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv'
</pre>
Process 52306 returned: (0). Elapsed: 0:01:53. Peak memory: (Process: 5.694GB; Pipeline: 5.694GB)
Follow:

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_bamQC.tsv`


> `NRF`	0.9	PEPATAC	_RES_

> `PBC1`	0.95	PEPATAC	_RES_

> `PBC2`	18.86	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_unmap.bam`


> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_unmap.bam`

<pre>
</pre>
Process 52463 returned: (0). Elapsed: 0:00:21. Peak memory: (Process: 0.014GB; Pipeline: 5.694GB)
Follow:

> `samtools view -c -f 4 -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`


> `Unmapped_reads`	2803833.0	PEPATAC	_RES_

### Remove dupes, build bigwig and bedgraph files (01-03 18:44:41) elapsed: 147.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`


> `samtools sort -n -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmp1MFGjI /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort.bam | samtools view -h - -@ 8 | samblaster -r 2> /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmp1MFGjI -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

<pre>
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
</pre>
Process 52522 returned: (0). Elapsed: 0:08:41. Peak memory: (Process: 0.0GB; Pipeline: 5.694GB)
<pre>
</pre>
Process 52523 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.694GB)
<pre>
</pre>
Process 52524 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.694GB)
<pre>
</pre>
Process 52525 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.694GB)
<pre>
[bam_sort_core] merging from 24 files and 8 in-memory blocks...
</pre>
Process 52526 returned: (0). Elapsed: 0:02:14. Peak memory: (Process: 0.0GB; Pipeline: 5.694GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

<pre>
</pre>
Process 53789 returned: (0). Elapsed: 0:01:08. Peak memory: (Process: 0.0GB; Pipeline: 5.694GB)
Follow:

> `grep 'Removed' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_dedup_metrics_log.txt | cut -f 3 -d ' '`


> `Duplicate_reads`	3118698	PEPATAC	_RES_

> `Dedup_aligned_reads`	110569530.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	66.57	PEPATAC	_RES_

> `Dedup_total_efficiency`	66.57	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (01-03 18:56:44) elapsed: 723.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/gold3_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_smooth.bw -p 5`

<pre>
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/tmp_gold3_sort_dedup_cuttrace_BT2nHc'
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
[Name: chr15; Size: 102531392]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chrY; Size: 59373566]
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
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/gold3_exact.bw'
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_smooth.bw'
</pre>
Process 53852 returned: (0). Elapsed: 0:23:23. Peak memory: (Process: 5.783GB; Pipeline: 5.783GB)

> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 56904 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

### Calculate TSS enrichment (01-03 19:20:07) elapsed: 1404.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt`

<pre>
</pre>
Process 56905 returned: (0). Elapsed: 0:00:23. Peak memory: (Process: 0.461GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_TssEnrichment.txt
Completed!

</pre>
Process 56969 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

> `TSS_Score`	10.5998173292	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold3_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold3_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (01-03 19:20:33) elapsed: 26.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragLenDistribution.pdf`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragLen.txt`

<pre>
</pre>
Process 56979 returned: (0). Elapsed: 0:04:25. Peak memory: (Process: 0.003GB; Pipeline: 5.783GB)

> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragCount.txt`

<pre>
</pre>
Process 57242 returned: (0). Elapsed: 0:00:33. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 57243 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.783GB)

> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_fragLenDistribution.txt`

<pre>
</pre>
Process 57445 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
> `Fragment distribution`	QC_hg19/gold3_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold3_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (01-03 19:25:44) elapsed: 311.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak`


> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19 -n gold3 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Thu, 03 Jan 2019 19:25:47: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19 -n gold3 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold3
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/gold3_shift.bed']
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
 
INFO  @ Thu, 03 Jan 2019 19:25:47: #1 read tag files... 
INFO  @ Thu, 03 Jan 2019 19:25:47: #1 read treatment tags... 
INFO  @ Thu, 03 Jan 2019 19:25:47:  1000000 
INFO  @ Thu, 03 Jan 2019 19:25:48:  2000000 
INFO  @ Thu, 03 Jan 2019 19:25:49:  3000000 
INFO  @ Thu, 03 Jan 2019 19:25:50:  4000000 
INFO  @ Thu, 03 Jan 2019 19:25:51:  5000000 
INFO  @ Thu, 03 Jan 2019 19:25:51:  6000000 
INFO  @ Thu, 03 Jan 2019 19:25:52:  7000000 
INFO  @ Thu, 03 Jan 2019 19:25:53:  8000000 
INFO  @ Thu, 03 Jan 2019 19:25:54:  9000000 
INFO  @ Thu, 03 Jan 2019 19:25:54:  10000000 
INFO  @ Thu, 03 Jan 2019 19:25:55:  11000000 
INFO  @ Thu, 03 Jan 2019 19:25:56:  12000000 
INFO  @ Thu, 03 Jan 2019 19:25:57:  13000000 
INFO  @ Thu, 03 Jan 2019 19:25:57:  14000000 
INFO  @ Thu, 03 Jan 2019 19:25:58:  15000000 
INFO  @ Thu, 03 Jan 2019 19:25:59:  16000000 
INFO  @ Thu, 03 Jan 2019 19:25:59:  17000000 
INFO  @ Thu, 03 Jan 2019 19:26:00:  18000000 
INFO  @ Thu, 03 Jan 2019 19:26:01:  19000000 
INFO  @ Thu, 03 Jan 2019 19:26:02:  20000000 
INFO  @ Thu, 03 Jan 2019 19:26:02:  21000000 
INFO  @ Thu, 03 Jan 2019 19:26:03:  22000000 
INFO  @ Thu, 03 Jan 2019 19:26:04:  23000000 
INFO  @ Thu, 03 Jan 2019 19:26:05:  24000000 
INFO  @ Thu, 03 Jan 2019 19:26:05:  25000000 
INFO  @ Thu, 03 Jan 2019 19:26:06:  26000000 
INFO  @ Thu, 03 Jan 2019 19:26:07:  27000000 
INFO  @ Thu, 03 Jan 2019 19:26:07:  28000000 
INFO  @ Thu, 03 Jan 2019 19:26:08:  29000000 
INFO  @ Thu, 03 Jan 2019 19:26:09:  30000000 
INFO  @ Thu, 03 Jan 2019 19:26:10:  31000000 
INFO  @ Thu, 03 Jan 2019 19:26:10:  32000000 
INFO  @ Thu, 03 Jan 2019 19:26:11:  33000000 
INFO  @ Thu, 03 Jan 2019 19:26:12:  34000000 
INFO  @ Thu, 03 Jan 2019 19:26:12:  35000000 
INFO  @ Thu, 03 Jan 2019 19:26:13:  36000000 
INFO  @ Thu, 03 Jan 2019 19:26:14:  37000000 
INFO  @ Thu, 03 Jan 2019 19:26:15:  38000000 
INFO  @ Thu, 03 Jan 2019 19:26:15:  39000000 
INFO  @ Thu, 03 Jan 2019 19:26:16:  40000000 
INFO  @ Thu, 03 Jan 2019 19:26:17:  41000000 
INFO  @ Thu, 03 Jan 2019 19:26:18:  42000000 
INFO  @ Thu, 03 Jan 2019 19:26:18:  43000000 
INFO  @ Thu, 03 Jan 2019 19:26:19:  44000000 
INFO  @ Thu, 03 Jan 2019 19:26:20:  45000000 
INFO  @ Thu, 03 Jan 2019 19:26:20:  46000000 
INFO  @ Thu, 03 Jan 2019 19:26:21:  47000000 
INFO  @ Thu, 03 Jan 2019 19:26:22:  48000000 
INFO  @ Thu, 03 Jan 2019 19:26:23:  49000000 
INFO  @ Thu, 03 Jan 2019 19:26:23:  50000000 
INFO  @ Thu, 03 Jan 2019 19:26:24:  51000000 
INFO  @ Thu, 03 Jan 2019 19:26:25:  52000000 
INFO  @ Thu, 03 Jan 2019 19:26:26:  53000000 
INFO  @ Thu, 03 Jan 2019 19:26:26:  54000000 
INFO  @ Thu, 03 Jan 2019 19:26:27:  55000000 
INFO  @ Thu, 03 Jan 2019 19:26:28:  56000000 
INFO  @ Thu, 03 Jan 2019 19:26:28:  57000000 
INFO  @ Thu, 03 Jan 2019 19:26:29:  58000000 
INFO  @ Thu, 03 Jan 2019 19:26:30:  59000000 
INFO  @ Thu, 03 Jan 2019 19:26:31:  60000000 
INFO  @ Thu, 03 Jan 2019 19:26:31:  61000000 
INFO  @ Thu, 03 Jan 2019 19:26:32:  62000000 
INFO  @ Thu, 03 Jan 2019 19:26:33:  63000000 
INFO  @ Thu, 03 Jan 2019 19:26:33:  64000000 
INFO  @ Thu, 03 Jan 2019 19:26:34:  65000000 
INFO  @ Thu, 03 Jan 2019 19:26:35:  66000000 
INFO  @ Thu, 03 Jan 2019 19:26:36:  67000000 
INFO  @ Thu, 03 Jan 2019 19:26:36:  68000000 
INFO  @ Thu, 03 Jan 2019 19:26:37:  69000000 
INFO  @ Thu, 03 Jan 2019 19:26:38:  70000000 
INFO  @ Thu, 03 Jan 2019 19:26:39:  71000000 
INFO  @ Thu, 03 Jan 2019 19:26:39:  72000000 
INFO  @ Thu, 03 Jan 2019 19:26:40:  73000000 
INFO  @ Thu, 03 Jan 2019 19:26:41:  74000000 
INFO  @ Thu, 03 Jan 2019 19:26:41:  75000000 
INFO  @ Thu, 03 Jan 2019 19:26:42:  76000000 
INFO  @ Thu, 03 Jan 2019 19:26:43:  77000000 
INFO  @ Thu, 03 Jan 2019 19:26:44:  78000000 
INFO  @ Thu, 03 Jan 2019 19:26:44:  79000000 
INFO  @ Thu, 03 Jan 2019 19:26:45:  80000000 
INFO  @ Thu, 03 Jan 2019 19:26:46:  81000000 
INFO  @ Thu, 03 Jan 2019 19:26:47:  82000000 
INFO  @ Thu, 03 Jan 2019 19:26:47:  83000000 
INFO  @ Thu, 03 Jan 2019 19:26:48:  84000000 
INFO  @ Thu, 03 Jan 2019 19:26:49:  85000000 
INFO  @ Thu, 03 Jan 2019 19:26:50:  86000000 
INFO  @ Thu, 03 Jan 2019 19:26:50:  87000000 
INFO  @ Thu, 03 Jan 2019 19:26:51:  88000000 
INFO  @ Thu, 03 Jan 2019 19:26:52:  89000000 
INFO  @ Thu, 03 Jan 2019 19:26:53:  90000000 
INFO  @ Thu, 03 Jan 2019 19:26:53:  91000000 
INFO  @ Thu, 03 Jan 2019 19:26:54:  92000000 
INFO  @ Thu, 03 Jan 2019 19:26:55:  93000000 
INFO  @ Thu, 03 Jan 2019 19:26:55:  94000000 
INFO  @ Thu, 03 Jan 2019 19:26:56:  95000000 
INFO  @ Thu, 03 Jan 2019 19:26:57:  96000000 
INFO  @ Thu, 03 Jan 2019 19:26:58:  97000000 
INFO  @ Thu, 03 Jan 2019 19:26:58:  98000000 
INFO  @ Thu, 03 Jan 2019 19:26:59:  99000000 
INFO  @ Thu, 03 Jan 2019 19:27:00:  100000000 
INFO  @ Thu, 03 Jan 2019 19:27:01:  101000000 
INFO  @ Thu, 03 Jan 2019 19:27:01:  102000000 
INFO  @ Thu, 03 Jan 2019 19:27:02:  103000000 
INFO  @ Thu, 03 Jan 2019 19:27:03:  104000000 
INFO  @ Thu, 03 Jan 2019 19:27:04:  105000000 
INFO  @ Thu, 03 Jan 2019 19:27:05:  106000000 
INFO  @ Thu, 03 Jan 2019 19:27:05:  107000000 
INFO  @ Thu, 03 Jan 2019 19:27:07: #1 tag size is determined as 50 bps 
INFO  @ Thu, 03 Jan 2019 19:27:07: #1 tag size = 50.0 
INFO  @ Thu, 03 Jan 2019 19:27:07: #1  total tags in treatment: 107445202 
INFO  @ Thu, 03 Jan 2019 19:27:07: #1 user defined the maximum tags... 
INFO  @ Thu, 03 Jan 2019 19:27:07: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Thu, 03 Jan 2019 19:27:09: #1  tags after filtering in treatment: 97408365 
INFO  @ Thu, 03 Jan 2019 19:27:09: #1  Redundant rate of treatment: 0.09 
INFO  @ Thu, 03 Jan 2019 19:27:09: #1 finished! 
INFO  @ Thu, 03 Jan 2019 19:27:09: #2 Build Peak Model... 
INFO  @ Thu, 03 Jan 2019 19:27:09: #2 Skipped... 
INFO  @ Thu, 03 Jan 2019 19:27:09: #2 Use 200 as fragment length 
INFO  @ Thu, 03 Jan 2019 19:27:09: #3 Call peaks... 
INFO  @ Thu, 03 Jan 2019 19:27:09: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Thu, 03 Jan 2019 19:30:21: #3 Call peaks for each chromosome... 
INFO  @ Thu, 03 Jan 2019 19:32:22: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.xls 
INFO  @ Thu, 03 Jan 2019 19:32:22: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak 
INFO  @ Thu, 03 Jan 2019 19:32:24: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_summits.bed 
INFO  @ Thu, 03 Jan 2019 19:32:24: Done! 
</pre>
Process 57463 returned: (0). Elapsed: 0:06:40. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
Follow:

> `Peak_count`	99691	PEPATAC	_RES_

### Calculate fraction of reads in peaks (FRiP) (01-03 19:32:24) elapsed: 400.0 _TIME_


> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

('113688228', '17613135\n')

> `FRiP`	0.154924879294	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (01-03 19:34:10) elapsed: 106.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bigBed`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bigBed`

<pre>
pass1 - making usageList (58 chroms): 18 millis
pass2 - checking and writing primary data (99692 records, 10 fields): 350 millis
[1] TRUE
[1] TRUE
</pre>
Process 58143 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

### Calculate peak coverage (01-03 19:34:14) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed`

<pre>
</pre>
Process 58154 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 58156 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 58157 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.783GB)
<pre>
</pre>
Process 58158 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.783GB)
<pre>
</pre>
Process 58159 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed`

<pre>
</pre>
Process 58161 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed`

<pre>
</pre>
Process 58163 returned: (0). Elapsed: 0:02:13. Peak memory: (Process: 0.01GB; Pipeline: 5.783GB)

### Calculate read coverage (01-03 19:36:27) elapsed: 133.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/hg19_annotations.bed.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/hg19_annotations.bed.gz`

<pre>
</pre>
Process 58451 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3' UTR`


> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/"$4}'`

<pre>
</pre>
Process 58458 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 58459 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.783GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 58460 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 58461 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed`

<pre>
</pre>
Process 58463 returned: (0). Elapsed: 0:02:06. Peak memory: (Process: 0.007GB; Pipeline: 5.783GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 58573 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 58574 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.027GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed`

<pre>
</pre>
Process 58576 returned: (0). Elapsed: 0:02:09. Peak memory: (Process: 0.008GB; Pipeline: 5.783GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 58882 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 58883 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.095GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed`

<pre>
</pre>
Process 58885 returned: (0). Elapsed: 0:02:09. Peak memory: (Process: 0.018GB; Pipeline: 5.783GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 59004 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 59005 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.089GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed`

<pre>
</pre>
Process 59008 returned: (0). Elapsed: 0:02:35. Peak memory: (Process: 0.074GB; Pipeline: 5.783GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 59319 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 59320 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed`

<pre>
</pre>
Process 59323 returned: (0). Elapsed: 0:02:11. Peak memory: (Process: 0.012GB; Pipeline: 5.783GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 59444 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
<pre>
</pre>
Process 59445 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.016GB; Pipeline: 5.783GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 59447 returned: (0). Elapsed: 0:02:08. Peak memory: (Process: 0.01GB; Pipeline: 5.783GB)

### Plot FRiP/F (01-03 19:49:49) elapsed: 802.0 _TIME_


> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R', 'gold3', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed', '107008628', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_frif.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R gold3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_coverage.bed 107008628 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 59584 returned: (0). Elapsed: 0:00:32. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
> `Cumulative FRiF`	QC_hg19/gold3_frif.pdf	Cumulative FRiF	QC_hg19/gold3_frif.png	PEPATAC	_OBJ_

### Annotate peaks (01-03 19:50:31) elapsed: 42.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/gold3_peaks_partition_dist.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/raw/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.narrowPeak gold3 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19`

<pre>
Promoter :	found 14956
Promoter Flanking Region :	found 25857
5' UTR :	found 692
3' UTR :	found 1133
Exon :	found 2325
Intron :	found 25916
Peak annotation complete!

</pre>
Process 59785 returned: (0). Elapsed: 0:00:16. Peak memory: (Process: 0.0GB; Pipeline: 5.783GB)
> `Peak chromosome distribution`	QC_hg19/gold3_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold3_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold3_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold3_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold3_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold3_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/tmpHO8UxF
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/tmpHO8UxF`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/rCRSd_3k_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/tmp8bVbwo
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/tmp8bVbwo`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/prealignments/human_repeats_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmpT8WvTY
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmpT8WvTY`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam.bai
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam.bai`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/gold3_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmp1MFGjI
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19/tmp1MFGjI`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/peak_calling_hg19/gold3_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R1.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3_R2.trim.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold3/fastq/gold3-trimmed.log`

> `Time`	5:16:57	PEPATAC	_RES_

> `Success`	01-03-19:50:48	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  5:16:58
*     Peak memory used:  5.78 GB
* Pipeline completed at:  (01-03 19:50:48) elapsed: 17.0 _TIME_

Pypiper terminating spawned child process 11473...(tee)
