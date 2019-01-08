### [Pipeline run code and environment:]

*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --genome hg19 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz --single-or-paired paired --sample-name gold4 --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz --prealignments rCRSd_3k human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba33-28c
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/
*  Pipeline started at:   (01-03 14:34:22) elapsed: 1.0 _TIME_

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

*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd_3k', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*       `deduplicator`:  `samblaster`
*        `sample_name`:  `gold4`
*               `lite`:  `False`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz']`
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

Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz

> `File_mb`	3135.7354	PEPATAC	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (01-03 14:34:22) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R1.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R1.fastq.gz`

<pre>
</pre>
Process 141965 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R2.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R2.fastq.gz`

<pre>
</pre>
Process 141966 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.fastq`


> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.fastq`

<pre>
</pre>
Process 141967 returned: (0). Elapsed: 0:00:25. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)

> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.fastq`

<pre>
</pre>
Process 142006 returned: (0). Elapsed: 0:00:26. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.fastq']

> `Raw_reads`	101078490	PEPATAC	_RES_

> `Fastq_reads`	101078490	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/gold4_R2.fastq.gz']

### Adapter trimming:  (01-03 14:37:32) elapsed: 190.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`


> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.fastq`

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
Thu Jan  3 14:37:32 2019[0;32m >> started[0m

Thu Jan  3 14:42:21 2019[0;32m >> done[0m (288.632s)
50539245 read pairs processed; of these:
     297 ( 0.00%) short read pairs filtered out after trimming by size control
     178 ( 0.00%) empty read pairs filtered out after trimming by size control
50538770 (100.00%) read pairs available; of these:
 3227085 ( 6.39%) trimmed read pairs available after processing
47311685 (93.61%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4-trimmed.log".
</pre>
Process 142396 returned: (0). Elapsed: 0:04:49. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`

<pre>
</pre>
Process 143298 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.trim.fastq`

<pre>
</pre>
Process 143300 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
Follow:
Evaluating read trimming

> `Trimmed_reads`	101077540	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold4_R1.trim.fastq
Approx 5% complete for gold4_R1.trim.fastq
Approx 10% complete for gold4_R1.trim.fastq
Approx 15% complete for gold4_R1.trim.fastq
Approx 20% complete for gold4_R1.trim.fastq
Approx 25% complete for gold4_R1.trim.fastq
Approx 30% complete for gold4_R1.trim.fastq
Approx 35% complete for gold4_R1.trim.fastq
Approx 40% complete for gold4_R1.trim.fastq
Approx 45% complete for gold4_R1.trim.fastq
Approx 50% complete for gold4_R1.trim.fastq
Approx 55% complete for gold4_R1.trim.fastq
Approx 60% complete for gold4_R1.trim.fastq
Approx 65% complete for gold4_R1.trim.fastq
Approx 70% complete for gold4_R1.trim.fastq
Approx 75% complete for gold4_R1.trim.fastq
Approx 80% complete for gold4_R1.trim.fastq
Approx 85% complete for gold4_R1.trim.fastq
Approx 90% complete for gold4_R1.trim.fastq
Approx 95% complete for gold4_R1.trim.fastq
Analysis complete for gold4_R1.trim.fastq
</pre>
Process 143315 returned: (0). Elapsed: 0:02:35. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r1`	fastqc/gold4_R1.trim_fastqc.html	FastQC report r1		PEPATAC	_OBJ_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold4_R2.trim.fastq
Approx 5% complete for gold4_R2.trim.fastq
Approx 10% complete for gold4_R2.trim.fastq
Approx 15% complete for gold4_R2.trim.fastq
Approx 20% complete for gold4_R2.trim.fastq
Approx 25% complete for gold4_R2.trim.fastq
Approx 30% complete for gold4_R2.trim.fastq
Approx 35% complete for gold4_R2.trim.fastq
Approx 40% complete for gold4_R2.trim.fastq
Approx 45% complete for gold4_R2.trim.fastq
Approx 50% complete for gold4_R2.trim.fastq
Approx 55% complete for gold4_R2.trim.fastq
Approx 60% complete for gold4_R2.trim.fastq
Approx 65% complete for gold4_R2.trim.fastq
Approx 70% complete for gold4_R2.trim.fastq
Approx 75% complete for gold4_R2.trim.fastq
Approx 80% complete for gold4_R2.trim.fastq
Approx 85% complete for gold4_R2.trim.fastq
Approx 90% complete for gold4_R2.trim.fastq
Approx 95% complete for gold4_R2.trim.fastq
Analysis complete for gold4_R2.trim.fastq
</pre>
Process 143657 returned: (0). Elapsed: 0:02:31. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r2`	fastqc/gold4_R2.trim_fastqc.html	FastQC report r2		PEPATAC	_OBJ_

### Prealignments (01-03 14:47:43) elapsed: 611.0 _TIME_

Prealignment assemblies: ['rCRSd_3k', 'human_repeats']

### Map to rCRSd_3k (01-03 14:47:43) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/rCRSd_3k_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/rCRSd_3k_bt2`

<pre>
</pre>
Process 143818 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/rCRSd_3k_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [143819]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd_3k/indexed_bowtie2/rCRSd_3k --rg-id gold4 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/rCRSd_3k_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_bt_aln_summary.log`

<pre>
</pre>
Process 143820 returned: (0). Elapsed: 0:13:14. Peak memory: (Process: 0.051GB; Pipeline: 0.051GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_rCRSd_3k`	14045392.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd_3k`	13.9	PEPATAC	_RES_

### Map to human_repeats (01-03 15:00:57) elapsed: 794.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/human_repeats_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/human_repeats_bt2`

<pre>
</pre>
Process 145375 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.051GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/human_repeats_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R2.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [145376]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/human_repeats/indexed_bowtie2/human_repeats --rg-id gold4 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R1.fq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/human_repeats_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log`

<pre>
7022696 reads skipped
0 reads lost
</pre>
Process 145377 returned: (0). Elapsed: 0:10:36. Peak memory: (Process: 0.047GB; Pipeline: 0.051GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_human_repeats`	7514112.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	7.43	PEPATAC	_RES_

### Map to genome (01-03 15:11:33) elapsed: 637.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`


> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold4 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpnFeddU -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam`

<pre>
3757056 reads skipped
0 reads lost
39759018 reads; of these:
  39759018 (100.00%) were paired; of these:
    1264507 (3.18%) aligned concordantly 0 times
    32273385 (81.17%) aligned concordantly exactly 1 time
    6221126 (15.65%) aligned concordantly >1 times
    ----
    1264507 pairs aligned concordantly 0 times; of these:
      32082 (2.54%) aligned discordantly 1 time
    ----
    1232425 pairs aligned 0 times concordantly or discordantly; of these:
      2464850 mates make up the pairs; of these:
        1741064 (70.64%) aligned 0 times
        405234 (16.44%) aligned exactly 1 time
        318552 (12.92%) aligned >1 times
97.81% overall alignment rate
</pre>
Process 146403 returned: (0). Elapsed: 1:27:27. Peak memory: (Process: 3.559GB; Pipeline: 3.559GB)
<pre>
</pre>
Process 146404 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.559GB)
<pre>
[bam_sort_core] merging from 19 files and 1 in-memory blocks...
</pre>
Process 146405 returned: (0). Elapsed: 0:09:38. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

> `samtools view -q 10 -b -@ 8 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_fail_qc.bam -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`

<pre>
</pre>
Process 156696 returned: (0). Elapsed: 0:02:35. Peak memory: (Process: 0.019GB; Pipeline: 3.559GB)
Follow:

> `Mapped_reads`	77776972	PEPATAC	_RES_

> `QC_filtered_reads`	6666740.0	PEPATAC	_RES_

> `Aligned_reads`	71110232	PEPATAC	_RES_

> `Alignment_rate`	70.35	PEPATAC	_RES_

> `Total_efficiency`	70.35	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R1.fq`

<pre>
</pre>
Process 157158 returned: (0). Elapsed: 0:09:19. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Process 158058 returned: (0). Elapsed: 0:09:34. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R1.fq`

<pre>
</pre>
Process 158963 returned: (0). Elapsed: 0:08:35. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/gold4_human_repeats_unmap_R2.fq`

<pre>
</pre>
Process 159807 returned: (0). Elapsed: 0:08:47. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam.bai`


> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam`

<pre>
</pre>
Process 160494 returned: (0). Elapsed: 0:00:59. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`

<pre>
</pre>
Process 160733 returned: (0). Elapsed: 0:00:52. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam | grep -we 'chrM' -we 'chrMT' -we 'M' -we 'MT'| cut -f 3`


> `Mitochondrial_reads`	6762.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_noMT.bam`


> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam | cut -f 1 | grep -vwe 'chrM' -vwe 'chrMT' -vwe 'M' -vwe 'MT'| xargs samtools view -b -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_noMT.bam`

<pre>
</pre>
Process 160789 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)
<pre>
</pre>
Process 160790 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.559GB)
<pre>
</pre>
Process 160791 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.559GB)
<pre>
</pre>
Process 160792 returned: (0). Elapsed: 0:01:46. Peak memory: (Process: 0.064GB; Pipeline: 3.559GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_noMT.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`

<pre>
</pre>
Process 160901 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`

<pre>
</pre>
Process 160902 returned: (0). Elapsed: 0:00:53. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

### Calculate NRF, PBC1, and PBC2 (01-03 17:33:48) elapsed: 8535.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`

<pre>
Configured logger 'root' using pararead v0.5.0
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/tmp_gold4_sort_340_DY'
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
[Name: chrUn_gl000230; Size: 43691]
[Name: chrUn_gl000235; Size: 34474]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chrUn_gl000232; Size: 40652]
[Name: chrUn_gl000234; Size: 40531]
[Name: chrUn_gl000237; Size: 45867]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000246; Size: 38154]
[Name: chrUn_gl000245; Size: 36651]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000242; Size: 43523]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000244; Size: 39929]
[Name: chrUn_gl000243; Size: 43341]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr8; Size: 146364022]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr3; Size: 198022430]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1; Size: 249250621]
[Name: chrY; Size: 59373566]
[Name: chrX; Size: 155270560]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chrUn_gl000239; Size: 33824]
[Name: chr9; Size: 141213431]
[Name: chr14; Size: 107349540]
[Name: chr12; Size: 133851895]
[Name: chrUn_gl000211; Size: 166566]
[Name: chr17; Size: 81195210]
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
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr21; Size: 48129895]
[Name: chr19; Size: 59128983]
[Name: chr20; Size: 63025520]
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chr6; Size: 171115067]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr16; Size: 90354753]
[Name: chrUn_gl000228; Size: 129120]
[Name: chr2; Size: 243199373]
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
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr5; Size: 180915260]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chr4; Size: 191154276]
Discarding 3 chunk(s) of reads: ['chrUn_gl000249', 'chr9_gl000200_random', 'chrM']
Keeping 90 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 90 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv'
</pre>
Process 160952 returned: (0). Elapsed: 0:01:54. Peak memory: (Process: 3.146GB; Pipeline: 3.559GB)
Follow:

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`


> `NRF`	0.95	PEPATAC	_RES_

> `PBC1`	0.97	PEPATAC	_RES_

> `PBC2`	35.92	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_unmap.bam`


> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_unmap.bam`

<pre>
</pre>
Process 161282 returned: (0). Elapsed: 0:00:10. Peak memory: (Process: 0.007GB; Pipeline: 3.559GB)
Follow:

> `samtools view -c -f 4 -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam`


> `Unmapped_reads`	1741064.0	PEPATAC	_RES_

### Remove dupes, build bigwig and bedgraph files (01-03 17:35:59) elapsed: 131.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`


> `samtools sort -n -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpEgiU2b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort.bam | samtools view -h - -@ 8 | samblaster -r 2> /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpEgiU2b -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

<pre>
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
</pre>
Process 161324 returned: (0). Elapsed: 0:06:04. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)
<pre>
</pre>
Process 161325 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.559GB)
<pre>
</pre>
Process 161326 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.559GB)
<pre>
</pre>
Process 161327 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.559GB)
<pre>
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
</pre>
Process 161328 returned: (0). Elapsed: 0:01:47. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

<pre>
</pre>
Process 162065 returned: (0). Elapsed: 0:00:51. Peak memory: (Process: 0.0GB; Pipeline: 3.559GB)
Follow:

> `grep 'Removed' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_dedup_metrics_log.txt | cut -f 3 -d ' '`


> `Duplicate_reads`	1017796	PEPATAC	_RES_

> `Dedup_aligned_reads`	70092436.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	69.35	PEPATAC	_RES_

> `Dedup_total_efficiency`	69.34	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (01-03 17:44:41) elapsed: 522.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/gold4_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_smooth.bw -p 5`

<pre>
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/tmp_gold4_sort_dedup_cuttrace_kM5eUi'
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
[Name: chr15; Size: 102531392]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chrY; Size: 59373566]
[Name: chrX; Size: 155270560]
[Name: chr14; Size: 107349540]
[Name: chr19; Size: 59128983]
[Name: chr9; Size: 141213431]
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
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chr21; Size: 48129895]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr6; Size: 171115067]
[Name: chr5; Size: 180915260]
[Name: chr4; Size: 191154276]
[Name: chrUn_gl000228; Size: 129120]
[Name: chr2; Size: 243199373]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
Discarding 3 chunk(s) of reads: ['chrUn_gl000249', 'chr9_gl000200_random', 'chrM']
Keeping 90 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 90 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/gold4_exact.bw'
Merging 90 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_smooth.bw'
</pre>
Process 162121 returned: (0). Elapsed: 0:27:10. Peak memory: (Process: 6.502GB; Pipeline: 6.502GB)

> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 165602 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

### Calculate TSS enrichment (01-03 18:11:51) elapsed: 1630.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt`

<pre>
</pre>
Process 165603 returned: (0). Elapsed: 0:00:23. Peak memory: (Process: 0.481GB; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt
Completed!

</pre>
Process 165661 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

> `TSS_Score`	7.47369732517	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold4_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold4_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (01-03 18:12:17) elapsed: 25.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragLenDistribution.pdf`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragLen.txt`

<pre>
</pre>
Process 165671 returned: (0). Elapsed: 0:04:09. Peak memory: (Process: 0.003GB; Pipeline: 6.502GB)

> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragCount.txt`

<pre>
</pre>
Process 166085 returned: (0). Elapsed: 0:00:36. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 166086 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)

> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_fragLenDistribution.txt`

<pre>
</pre>
Process 166125 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
> `Fragment distribution`	QC_hg19/gold4_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold4_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (01-03 18:17:14) elapsed: 297.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak`


> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19 -n gold4 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Thu, 03 Jan 2019 18:17:16: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19 -n gold4 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold4
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed']
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
 
INFO  @ Thu, 03 Jan 2019 18:17:16: #1 read tag files... 
INFO  @ Thu, 03 Jan 2019 18:17:16: #1 read treatment tags... 
INFO  @ Thu, 03 Jan 2019 18:17:18:  1000000 
INFO  @ Thu, 03 Jan 2019 18:17:19:  2000000 
INFO  @ Thu, 03 Jan 2019 18:17:20:  3000000 
INFO  @ Thu, 03 Jan 2019 18:17:21:  4000000 
INFO  @ Thu, 03 Jan 2019 18:17:23:  5000000 
INFO  @ Thu, 03 Jan 2019 18:17:24:  6000000 
INFO  @ Thu, 03 Jan 2019 18:17:25:  7000000 
INFO  @ Thu, 03 Jan 2019 18:17:26:  8000000 
INFO  @ Thu, 03 Jan 2019 18:17:27:  9000000 
INFO  @ Thu, 03 Jan 2019 18:17:29:  10000000 
INFO  @ Thu, 03 Jan 2019 18:17:30:  11000000 
INFO  @ Thu, 03 Jan 2019 18:17:31:  12000000 
INFO  @ Thu, 03 Jan 2019 18:17:32:  13000000 
INFO  @ Thu, 03 Jan 2019 18:17:34:  14000000 
INFO  @ Thu, 03 Jan 2019 18:17:35:  15000000 
INFO  @ Thu, 03 Jan 2019 18:17:36:  16000000 
INFO  @ Thu, 03 Jan 2019 18:17:37:  17000000 
INFO  @ Thu, 03 Jan 2019 18:17:38:  18000000 
INFO  @ Thu, 03 Jan 2019 18:17:40:  19000000 
INFO  @ Thu, 03 Jan 2019 18:17:41:  20000000 
INFO  @ Thu, 03 Jan 2019 18:17:42:  21000000 
INFO  @ Thu, 03 Jan 2019 18:17:43:  22000000 
INFO  @ Thu, 03 Jan 2019 18:17:45:  23000000 
INFO  @ Thu, 03 Jan 2019 18:17:46:  24000000 
INFO  @ Thu, 03 Jan 2019 18:17:47:  25000000 
INFO  @ Thu, 03 Jan 2019 18:17:48:  26000000 
INFO  @ Thu, 03 Jan 2019 18:17:50:  27000000 
INFO  @ Thu, 03 Jan 2019 18:17:51:  28000000 
INFO  @ Thu, 03 Jan 2019 18:17:52:  29000000 
INFO  @ Thu, 03 Jan 2019 18:17:53:  30000000 
INFO  @ Thu, 03 Jan 2019 18:17:54:  31000000 
INFO  @ Thu, 03 Jan 2019 18:17:56:  32000000 
INFO  @ Thu, 03 Jan 2019 18:17:57:  33000000 
INFO  @ Thu, 03 Jan 2019 18:17:58:  34000000 
INFO  @ Thu, 03 Jan 2019 18:17:59:  35000000 
INFO  @ Thu, 03 Jan 2019 18:18:01:  36000000 
INFO  @ Thu, 03 Jan 2019 18:18:02:  37000000 
INFO  @ Thu, 03 Jan 2019 18:18:03:  38000000 
INFO  @ Thu, 03 Jan 2019 18:18:04:  39000000 
INFO  @ Thu, 03 Jan 2019 18:18:06:  40000000 
INFO  @ Thu, 03 Jan 2019 18:18:07:  41000000 
INFO  @ Thu, 03 Jan 2019 18:18:08:  42000000 
INFO  @ Thu, 03 Jan 2019 18:18:09:  43000000 
INFO  @ Thu, 03 Jan 2019 18:18:11:  44000000 
INFO  @ Thu, 03 Jan 2019 18:18:12:  45000000 
INFO  @ Thu, 03 Jan 2019 18:18:13:  46000000 
INFO  @ Thu, 03 Jan 2019 18:18:14:  47000000 
INFO  @ Thu, 03 Jan 2019 18:18:16:  48000000 
INFO  @ Thu, 03 Jan 2019 18:18:17:  49000000 
INFO  @ Thu, 03 Jan 2019 18:18:18:  50000000 
INFO  @ Thu, 03 Jan 2019 18:18:19:  51000000 
INFO  @ Thu, 03 Jan 2019 18:18:21:  52000000 
INFO  @ Thu, 03 Jan 2019 18:18:22:  53000000 
INFO  @ Thu, 03 Jan 2019 18:18:23:  54000000 
INFO  @ Thu, 03 Jan 2019 18:18:24:  55000000 
INFO  @ Thu, 03 Jan 2019 18:18:26:  56000000 
INFO  @ Thu, 03 Jan 2019 18:18:27:  57000000 
INFO  @ Thu, 03 Jan 2019 18:18:28:  58000000 
INFO  @ Thu, 03 Jan 2019 18:18:29:  59000000 
INFO  @ Thu, 03 Jan 2019 18:18:31:  60000000 
INFO  @ Thu, 03 Jan 2019 18:18:32:  61000000 
INFO  @ Thu, 03 Jan 2019 18:18:33:  62000000 
INFO  @ Thu, 03 Jan 2019 18:18:34:  63000000 
INFO  @ Thu, 03 Jan 2019 18:18:36:  64000000 
INFO  @ Thu, 03 Jan 2019 18:18:37:  65000000 
INFO  @ Thu, 03 Jan 2019 18:18:38:  66000000 
INFO  @ Thu, 03 Jan 2019 18:18:40:  67000000 
INFO  @ Thu, 03 Jan 2019 18:18:41:  68000000 
INFO  @ Thu, 03 Jan 2019 18:18:42:  69000000 
INFO  @ Thu, 03 Jan 2019 18:18:43: #1 tag size is determined as 50 bps 
INFO  @ Thu, 03 Jan 2019 18:18:43: #1 tag size = 50.0 
INFO  @ Thu, 03 Jan 2019 18:18:43: #1  total tags in treatment: 69072628 
INFO  @ Thu, 03 Jan 2019 18:18:43: #1 user defined the maximum tags... 
INFO  @ Thu, 03 Jan 2019 18:18:43: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Thu, 03 Jan 2019 18:18:45: #1  tags after filtering in treatment: 65405284 
INFO  @ Thu, 03 Jan 2019 18:18:45: #1  Redundant rate of treatment: 0.05 
INFO  @ Thu, 03 Jan 2019 18:18:45: #1 finished! 
INFO  @ Thu, 03 Jan 2019 18:18:45: #2 Build Peak Model... 
INFO  @ Thu, 03 Jan 2019 18:18:45: #2 Skipped... 
INFO  @ Thu, 03 Jan 2019 18:18:45: #2 Use 200 as fragment length 
INFO  @ Thu, 03 Jan 2019 18:18:45: #3 Call peaks... 
INFO  @ Thu, 03 Jan 2019 18:18:45: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Thu, 03 Jan 2019 18:21:28: #3 Call peaks for each chromosome... 
INFO  @ Thu, 03 Jan 2019 18:23:01: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.xls 
INFO  @ Thu, 03 Jan 2019 18:23:02: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak 
INFO  @ Thu, 03 Jan 2019 18:23:03: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_summits.bed 
INFO  @ Thu, 03 Jan 2019 18:23:03: Done! 
</pre>
Process 166151 returned: (0). Elapsed: 0:05:49. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
Follow:

> `Peak_count`	77891	PEPATAC	_RES_

### Calculate fraction of reads in peaks (FRiP) (01-03 18:23:03) elapsed: 349.0 _TIME_


> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

('71110232', '7837005\n')

> `FRiP`	0.110209245274	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (01-03 18:25:01) elapsed: 118.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bigBed`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bigBed`

<pre>
pass1 - making usageList (48 chroms): 18 millis
pass2 - checking and writing primary data (77892 records, 10 fields): 321 millis
[1] TRUE
[1] TRUE
</pre>
Process 166968 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

### Calculate peak coverage (01-03 18:25:05) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed`

<pre>
</pre>
Process 166980 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 166982 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 166983 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)
<pre>
</pre>
Process 166984 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)
<pre>
</pre>
Process 166985 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)

> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed`

<pre>
</pre>
Process 166987 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed`

<pre>
</pre>
Process 166989 returned: (0). Elapsed: 0:01:57. Peak memory: (Process: 0.007GB; Pipeline: 6.502GB)

### Calculate read coverage (01-03 18:27:02) elapsed: 117.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/hg19_annotations.bed.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/hg19_annotations.bed.gz`

<pre>
</pre>
Process 167110 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3' UTR`


> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/"$4}'`

<pre>
</pre>
Process 167115 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 167116 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 167118 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 167119 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.024GB; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed`

<pre>
</pre>
Process 167121 returned: (0). Elapsed: 0:01:56. Peak memory: (Process: 0.006GB; Pipeline: 6.502GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 167231 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 167232 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed`

<pre>
</pre>
Process 167234 returned: (0). Elapsed: 0:01:57. Peak memory: (Process: 0.006GB; Pipeline: 6.502GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 167539 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 167540 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.092GB; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed`

<pre>
</pre>
Process 167542 returned: (0). Elapsed: 0:01:55. Peak memory: (Process: 0.015GB; Pipeline: 6.502GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 167654 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 167655 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.088GB; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed`

<pre>
</pre>
Process 167658 returned: (0). Elapsed: 0:02:12. Peak memory: (Process: 0.053GB; Pipeline: 6.502GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 167973 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 167974 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed`

<pre>
</pre>
Process 167976 returned: (0). Elapsed: 0:01:55. Peak memory: (Process: 0.007GB; Pipeline: 6.502GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 168096 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
<pre>
</pre>
Process 168097 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.502GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 168099 returned: (0). Elapsed: 0:01:54. Peak memory: (Process: 0.007GB; Pipeline: 6.502GB)

### Plot FRiP/F (01-03 18:38:57) elapsed: 715.0 _TIME_


> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R', 'gold4', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed', '68811258', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_frif.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R gold4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed 68811258 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 168231 returned: (0). Elapsed: 0:00:36. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
> `Cumulative FRiF`	QC_hg19/gold4_frif.pdf	Cumulative FRiF	QC_hg19/gold4_frif.png	PEPATAC	_OBJ_

### Annotate peaks (01-03 18:39:40) elapsed: 43.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/gold4_peaks_partition_dist.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/raw/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak gold4 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19`

<pre>
Promoter :	found 13988
Promoter Flanking Region :	found 21913
5' UTR :	found 454
3' UTR :	found 798
Exon :	found 1545
Intron :	found 19289
Peak annotation complete!

</pre>
Process 168269 returned: (0). Elapsed: 0:00:20. Peak memory: (Process: 0.0GB; Pipeline: 6.502GB)
> `Peak chromosome distribution`	QC_hg19/gold4_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold4_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold4_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold4_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold4_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold4_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/tmpj7e9YL
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/tmpj7e9YL`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/rCRSd_3k_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/tmppm4Whb
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/tmppm4Whb`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/prealignments/human_repeats_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpnFeddU
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpnFeddU`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam.bai
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam.bai`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/gold4_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpEgiU2b
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19/tmpEgiU2b`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4_R1.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold4/fastq/gold4-trimmed.log`

> `Time`	4:05:39	PEPATAC	_RES_

> `Success`	01-03-18:40:00	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  4:05:39
*     Peak memory used:  6.5 GB
* Pipeline completed at:  (01-03 18:40:00) elapsed: 20.0 _TIME_

Pypiper terminating spawned child process 141936...(tee)
