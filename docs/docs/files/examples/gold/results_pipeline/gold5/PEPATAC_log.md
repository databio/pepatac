### [Pipeline run code and environment:]

*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --genome hg19 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz --single-or-paired paired --sample-name gold5 --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz --prealignments rCRSd_3k human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba34-28j
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/
*  Pipeline started at:   (01-03 14:34:21) elapsed: 1.0 _TIME_

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

*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd_3k', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*       `deduplicator`:  `samblaster`
*        `sample_name`:  `gold5`
*               `lite`:  `False`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz']`
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

Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz

> `File_mb`	3271.827	PEPATAC	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (01-03 14:34:21) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz`

<pre>
</pre>
Process 227750 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz`


> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz`

<pre>
</pre>
Process 227751 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.fastq`


> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.fastq`

<pre>
</pre>
Process 227752 returned: (0). Elapsed: 0:00:27. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)

> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.fastq`

<pre>
</pre>
Process 227780 returned: (0). Elapsed: 0:00:28. Peak memory: (Process: 0.001GB; Pipeline: 0.001GB)
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.fastq']

> `Raw_reads`	104881014	PEPATAC	_RES_

> `Fastq_reads`	104881014	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz']

### Adapter trimming:  (01-03 14:37:31) elapsed: 189.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`


> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.fastq`

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
Thu Jan  3 14:37:31 2019[0;32m >> started[0m

Thu Jan  3 14:42:49 2019[0;32m >> done[0m (318.169s)
52440507 read pairs processed; of these:
     310 ( 0.00%) short read pairs filtered out after trimming by size control
     356 ( 0.00%) empty read pairs filtered out after trimming by size control
52439841 (100.00%) read pairs available; of these:
 3403982 ( 6.49%) trimmed read pairs available after processing
49035859 (93.51%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5-trimmed.log".
</pre>
Process 228128 returned: (0). Elapsed: 0:05:18. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

<pre>
</pre>
Process 228619 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.trim.fastq`

<pre>
</pre>
Process 228620 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
Follow:
Evaluating read trimming

> `Trimmed_reads`	104879682	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold5_R1.trim.fastq
Approx 5% complete for gold5_R1.trim.fastq
Approx 10% complete for gold5_R1.trim.fastq
Approx 15% complete for gold5_R1.trim.fastq
Approx 20% complete for gold5_R1.trim.fastq
Approx 25% complete for gold5_R1.trim.fastq
Approx 30% complete for gold5_R1.trim.fastq
Approx 35% complete for gold5_R1.trim.fastq
Approx 40% complete for gold5_R1.trim.fastq
Approx 45% complete for gold5_R1.trim.fastq
Approx 50% complete for gold5_R1.trim.fastq
Approx 55% complete for gold5_R1.trim.fastq
Approx 60% complete for gold5_R1.trim.fastq
Approx 65% complete for gold5_R1.trim.fastq
Approx 70% complete for gold5_R1.trim.fastq
Approx 75% complete for gold5_R1.trim.fastq
Approx 80% complete for gold5_R1.trim.fastq
Approx 85% complete for gold5_R1.trim.fastq
Approx 90% complete for gold5_R1.trim.fastq
Approx 95% complete for gold5_R1.trim.fastq
Analysis complete for gold5_R1.trim.fastq
</pre>
Process 228647 returned: (0). Elapsed: 0:02:42. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r1`	fastqc/gold5_R1.trim_fastqc.html	FastQC report r1		PEPATAC	_OBJ_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold5_R2.trim.fastq
Approx 5% complete for gold5_R2.trim.fastq
Approx 10% complete for gold5_R2.trim.fastq
Approx 15% complete for gold5_R2.trim.fastq
Approx 20% complete for gold5_R2.trim.fastq
Approx 25% complete for gold5_R2.trim.fastq
Approx 30% complete for gold5_R2.trim.fastq
Approx 35% complete for gold5_R2.trim.fastq
Approx 40% complete for gold5_R2.trim.fastq
Approx 45% complete for gold5_R2.trim.fastq
Approx 50% complete for gold5_R2.trim.fastq
Approx 55% complete for gold5_R2.trim.fastq
Approx 60% complete for gold5_R2.trim.fastq
Approx 65% complete for gold5_R2.trim.fastq
Approx 70% complete for gold5_R2.trim.fastq
Approx 75% complete for gold5_R2.trim.fastq
Approx 80% complete for gold5_R2.trim.fastq
Approx 85% complete for gold5_R2.trim.fastq
Approx 90% complete for gold5_R2.trim.fastq
Approx 95% complete for gold5_R2.trim.fastq
Analysis complete for gold5_R2.trim.fastq
</pre>
Process 228989 returned: (0). Elapsed: 0:02:58. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)
> `FastQC report r2`	fastqc/gold5_R2.trim_fastqc.html	FastQC report r2		PEPATAC	_OBJ_

### Prealignments (01-03 14:48:48) elapsed: 677.0 _TIME_

Prealignment assemblies: ['rCRSd_3k', 'human_repeats']

### Map to rCRSd_3k (01-03 14:48:48) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2`

<pre>
</pre>
Process 229185 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.001GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [229186]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd_3k/indexed_bowtie2/rCRSd_3k --rg-id gold5 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_bt_aln_summary.log`

<pre>
</pre>
Process 229187 returned: (0). Elapsed: 0:14:27. Peak memory: (Process: 0.051GB; Pipeline: 0.051GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_rCRSd_3k`	19947382.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd_3k`	19.02	PEPATAC	_RES_

### Map to human_repeats (01-03 15:03:15) elapsed: 867.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2`

<pre>
</pre>
Process 230596 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.051GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R2.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [230597]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log`


> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/human_repeats/indexed_bowtie2/human_repeats --rg-id gold5 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R1.fq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log`

<pre>
9973691 reads skipped
0 reads lost
</pre>
Process 230598 returned: (0). Elapsed: 0:11:04. Peak memory: (Process: 0.05GB; Pipeline: 0.051GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_human_repeats`	5705260.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	5.44	PEPATAC	_RES_

### Map to genome (01-03 15:14:19) elapsed: 664.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`


> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold5 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpGkOIWW -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`

<pre>
2852630 reads skipped
0 reads lost
[E::hts_open_format] Failed to open file /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpGkOIWW/samtools.231600.7483.tmp.0010.bam
samtools sort: failed to create temporary file "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpGkOIWW/samtools.231600.7483.tmp.0010.bam": Cannot send after transport endpoint shutdown
Got SIGTERM. Failing gracefully... (01-04 09:20:53) elapsed: 65194.0 _TIME_
Setting dynamic recover file: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/recover.lock.aligned_hg19__gold5_sort.bam

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpMRwXbw', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpwLbPwW', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpGkOIWW']
Could not produce cleanup script for item(s):
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5*.fastq
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/*.log
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpMRwXbw
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpwLbPwW
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2
* /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpGkOIWW

### Pipeline failed at:  (01-04 09:20:53) elapsed: 0.0 _TIME_

Total time: 18:46:33

Changed status from running to failed.
Pipeline aborted.

Pypiper terminating spawned child process 227726...(tee)
### [Pipeline run code and environment:]

*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --genome hg19 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz --single-or-paired paired --sample-name gold5 --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz --prealignments rCRSd_3k human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-17
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/
*  Pipeline started at:   (01-04 09:22:21) elapsed: 2.0 _TIME_

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

*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd_3k', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/01_03_19/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*       `deduplicator`:  `samblaster`
*        `sample_name`:  `gold5`
*               `lite`:  `False`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz']`
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

Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz

> `File_mb`	3271.827	PEPATAC	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (01-04 09:22:22) elapsed: 1.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/gold5_R2.fastq.gz']

### Adapter trimming:  (01-04 09:22:22) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

### Prealignments (01-04 09:22:22) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd_3k', 'human_repeats']

### Map to rCRSd_3k (01-04 09:22:22) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_bt_aln_summary.log`

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_rCRSd_3k`	19947382.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd_3k`	19.02	PEPATAC	_RES_

### Map to human_repeats (01-04 09:22:22) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log`

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_human_repeats`	5705260.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	5.44	PEPATAC	_RES_

### Map to genome (01-04 09:22:22) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`


> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold5 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpJJZFHK -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`

<pre>
39613520 reads; of these:
  39613520 (100.00%) were paired; of these:
    1231668 (3.11%) aligned concordantly 0 times
    33047522 (83.42%) aligned concordantly exactly 1 time
    5334330 (13.47%) aligned concordantly >1 times
    ----
    1231668 pairs aligned concordantly 0 times; of these:
      28944 (2.35%) aligned discordantly 1 time
    ----
    1202724 pairs aligned 0 times concordantly or discordantly; of these:
      2405448 mates make up the pairs; of these:
        1691652 (70.33%) aligned 0 times
        431848 (17.95%) aligned exactly 1 time
        281948 (11.72%) aligned >1 times
97.86% overall alignment rate
</pre>
Process 162223 returned: (0). Elapsed: 1:15:30. Peak memory: (Process: 3.563GB; Pipeline: 3.563GB)
<pre>
</pre>
Process 162224 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.563GB)
<pre>
[bam_sort_core] merging from 19 files and 1 in-memory blocks...
</pre>
Process 162225 returned: (0). Elapsed: 0:08:33. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

> `samtools view -q 10 -b -@ 8 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_fail_qc.bam -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`

<pre>
</pre>
Process 169549 returned: (0). Elapsed: 0:02:30. Peak memory: (Process: 0.023GB; Pipeline: 3.563GB)
Follow:

> `Mapped_reads`	77535388	PEPATAC	_RES_

> `QC_filtered_reads`	5833350.0	PEPATAC	_RES_

> `Aligned_reads`	71702038	PEPATAC	_RES_

> `Alignment_rate`	68.37	PEPATAC	_RES_

> `Total_efficiency`	68.37	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R1.fq`

<pre>
</pre>
Process 169942 returned: (0). Elapsed: 0:08:42. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_rCRSd_3k_unmap_R2.fq`

<pre>
</pre>
Process 170552 returned: (0). Elapsed: 0:08:47. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R1.fq`

<pre>
</pre>
Process 171373 returned: (0). Elapsed: 0:08:06. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/gold5_human_repeats_unmap_R2.fq`

<pre>
</pre>
Process 172136 returned: (0). Elapsed: 0:08:13. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam.bai`


> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`

<pre>
</pre>
Process 172719 returned: (0). Elapsed: 0:00:55. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`

<pre>
</pre>
Process 172932 returned: (0). Elapsed: 0:00:50. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam | grep -we 'chrM' -we 'chrMT' -we 'M' -we 'MT'| cut -f 3`


> `Mitochondrial_reads`	8423.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_noMT.bam`


> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam | cut -f 1 | grep -vwe 'chrM' -vwe 'chrMT' -vwe 'M' -vwe 'MT'| xargs samtools view -b -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_noMT.bam`

<pre>
</pre>
Process 172979 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)
<pre>
</pre>
Process 172980 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.563GB)
<pre>
</pre>
Process 172981 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.563GB)
<pre>
</pre>
Process 172982 returned: (0). Elapsed: 0:01:30. Peak memory: (Process: 0.031GB; Pipeline: 3.563GB)

> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_noMT.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`

<pre>
</pre>
Process 173071 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`

<pre>
</pre>
Process 173072 returned: (0). Elapsed: 0:00:49. Peak memory: (Process: 0.0GB; Pipeline: 3.563GB)

### Calculate NRF, PBC1, and PBC2 (01-04 11:28:28) elapsed: 7566.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`

<pre>
Configured logger 'root' using pararead v0.5.0
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/tmp_gold5_sort_IvP6zO'
Processing with 8 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr13; Size: 115169878]
[Name: chr10; Size: 135534747]
[Name: chr15; Size: 102531392]
[Name: chr18; Size: 78077248]
[Name: chrUn_gl000238; Size: 39939]
[Name: chrUn_gl000231; Size: 27386]
[Name: chrUn_gl000236; Size: 41934]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chrUn_gl000233; Size: 45941]
[Name: chrUn_gl000235; Size: 34474]
[Name: chrUn_gl000230; Size: 43691]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chrUn_gl000232; Size: 40652]
[Name: chrUn_gl000237; Size: 45867]
[Name: chrUn_gl000234; Size: 40531]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000246; Size: 38154]
[Name: chrUn_gl000245; Size: 36651]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chrUn_gl000247; Size: 36422]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000242; Size: 43523]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000244; Size: 39929]
[Name: chrUn_gl000243; Size: 43341]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr8; Size: 146364022]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr3; Size: 198022430]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1; Size: 249250621]
[Name: chrY; Size: 59373566]
[Name: chrX; Size: 155270560]
[Name: chr14; Size: 107349540]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chrUn_gl000239; Size: 33824]
[Name: chr9; Size: 141213431]
[Name: chr12; Size: 133851895]
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
[Name: chr17; Size: 81195210]
[Name: chr20; Size: 63025520]
[Name: chr19; Size: 59128983]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr21; Size: 48129895]
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chr6; Size: 171115067]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr16; Size: 90354753]
[Name: chrUn_gl000228; Size: 129120]
[Name: chr2; Size: 243199373]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chr11; Size: 135006516]
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
Merging 90 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv'
</pre>
Process 173116 returned: (0). Elapsed: 0:01:56. Peak memory: (Process: 3.66GB; Pipeline: 3.66GB)
Follow:

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`


> `NRF`	0.94	PEPATAC	_RES_

> `PBC1`	0.97	PEPATAC	_RES_

> `PBC2`	32.04	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_unmap.bam`


> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_unmap.bam`

<pre>
</pre>
Process 173587 returned: (0). Elapsed: 0:00:26. Peak memory: (Process: 0.005GB; Pipeline: 3.66GB)
Follow:

> `samtools view -c -f 4 -@ 8 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`


> `Unmapped_reads`	1691652.0	PEPATAC	_RES_

### Remove dupes, build bigwig and bedgraph files (01-04 11:30:58) elapsed: 151.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`


> `samtools sort -n -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpLr4pes /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort.bam | samtools view -h - -@ 8 | samblaster -r 2> /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_dedup_metrics_log.txt | samtools view -b - -@ 8 | samtools sort - -@ 8 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpLr4pes -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

<pre>
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
</pre>
Process 173637 returned: (0). Elapsed: 0:06:15. Peak memory: (Process: 0.0GB; Pipeline: 3.66GB)
<pre>
</pre>
Process 173638 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.66GB)
<pre>
</pre>
Process 173639 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.66GB)
<pre>
</pre>
Process 173640 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.66GB)
<pre>
[bam_sort_core] merging from 16 files and 8 in-memory blocks...
</pre>
Process 173641 returned: (0). Elapsed: 0:01:44. Peak memory: (Process: 0.0GB; Pipeline: 3.66GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

<pre>
</pre>
Process 174335 returned: (0). Elapsed: 0:00:48. Peak memory: (Process: 0.0GB; Pipeline: 3.66GB)
Follow:

> `grep 'Removed' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_dedup_metrics_log.txt | cut -f 3 -d ' '`


> `Duplicate_reads`	1246861	PEPATAC	_RES_

> `Dedup_aligned_reads`	70455177.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	67.18	PEPATAC	_RES_

> `Dedup_total_efficiency`	67.18	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (01-04 11:39:45) elapsed: 527.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/gold5_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_smooth.bw -p 5`

<pre>
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/tmp_gold5_sort_dedup_cuttrace_t1ydDM'
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
[Name: chr11; Size: 135006516]
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
[Name: chr9; Size: 141213431]
[Name: chr19; Size: 59128983]
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
[Name: chr8_gl000196_random; Size: 38914]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chr21; Size: 48129895]
[Name: chr20; Size: 63025520]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
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
Merging 90 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/gold5_exact.bw'
Merging 90 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_smooth.bw'
</pre>
Process 174379 returned: (0). Elapsed: 0:17:55. Peak memory: (Process: 7.262GB; Pipeline: 7.262GB)

> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 176797 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

### Calculate TSS enrichment (01-04 11:57:41) elapsed: 1075.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt`

<pre>
</pre>
Process 176798 returned: (0). Elapsed: 0:00:21. Peak memory: (Process: 0.47GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt
Completed!

</pre>
Process 176856 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

> `TSS_Score`	13.134632225	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold5_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold5_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (01-04 11:58:05) elapsed: 24.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragLen.txt`

<pre>
</pre>
Process 176868 returned: (0). Elapsed: 0:03:09. Peak memory: (Process: 0.003GB; Pipeline: 7.262GB)

> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragCount.txt`

<pre>
</pre>
Process 177236 returned: (0). Elapsed: 0:00:22. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 177237 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 7.262GB)

> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.txt`

<pre>
</pre>
Process 177267 returned: (0). Elapsed: 0:00:10. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
> `Fragment distribution`	QC_hg19/gold5_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold5_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (01-04 12:01:46) elapsed: 221.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak`


> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19 -n gold5 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Fri, 04 Jan 2019 12:01:49: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19 -n gold5 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold5
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed']
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
 
INFO  @ Fri, 04 Jan 2019 12:01:49: #1 read tag files... 
INFO  @ Fri, 04 Jan 2019 12:01:49: #1 read treatment tags... 
INFO  @ Fri, 04 Jan 2019 12:01:49:  1000000 
INFO  @ Fri, 04 Jan 2019 12:01:50:  2000000 
INFO  @ Fri, 04 Jan 2019 12:01:51:  3000000 
INFO  @ Fri, 04 Jan 2019 12:01:52:  4000000 
INFO  @ Fri, 04 Jan 2019 12:01:53:  5000000 
INFO  @ Fri, 04 Jan 2019 12:01:54:  6000000 
INFO  @ Fri, 04 Jan 2019 12:01:54:  7000000 
INFO  @ Fri, 04 Jan 2019 12:01:55:  8000000 
INFO  @ Fri, 04 Jan 2019 12:01:56:  9000000 
INFO  @ Fri, 04 Jan 2019 12:01:57:  10000000 
INFO  @ Fri, 04 Jan 2019 12:01:58:  11000000 
INFO  @ Fri, 04 Jan 2019 12:01:59:  12000000 
INFO  @ Fri, 04 Jan 2019 12:01:59:  13000000 
INFO  @ Fri, 04 Jan 2019 12:02:00:  14000000 
INFO  @ Fri, 04 Jan 2019 12:02:01:  15000000 
INFO  @ Fri, 04 Jan 2019 12:02:02:  16000000 
INFO  @ Fri, 04 Jan 2019 12:02:03:  17000000 
INFO  @ Fri, 04 Jan 2019 12:02:04:  18000000 
INFO  @ Fri, 04 Jan 2019 12:02:04:  19000000 
INFO  @ Fri, 04 Jan 2019 12:02:05:  20000000 
INFO  @ Fri, 04 Jan 2019 12:02:06:  21000000 
INFO  @ Fri, 04 Jan 2019 12:02:07:  22000000 
INFO  @ Fri, 04 Jan 2019 12:02:08:  23000000 
INFO  @ Fri, 04 Jan 2019 12:02:09:  24000000 
INFO  @ Fri, 04 Jan 2019 12:02:09:  25000000 
INFO  @ Fri, 04 Jan 2019 12:02:10:  26000000 
INFO  @ Fri, 04 Jan 2019 12:02:11:  27000000 
INFO  @ Fri, 04 Jan 2019 12:02:12:  28000000 
INFO  @ Fri, 04 Jan 2019 12:02:13:  29000000 
INFO  @ Fri, 04 Jan 2019 12:02:14:  30000000 
INFO  @ Fri, 04 Jan 2019 12:02:14:  31000000 
INFO  @ Fri, 04 Jan 2019 12:02:15:  32000000 
INFO  @ Fri, 04 Jan 2019 12:02:16:  33000000 
INFO  @ Fri, 04 Jan 2019 12:02:17:  34000000 
INFO  @ Fri, 04 Jan 2019 12:02:18:  35000000 
INFO  @ Fri, 04 Jan 2019 12:02:18:  36000000 
INFO  @ Fri, 04 Jan 2019 12:02:19:  37000000 
INFO  @ Fri, 04 Jan 2019 12:02:20:  38000000 
INFO  @ Fri, 04 Jan 2019 12:02:21:  39000000 
INFO  @ Fri, 04 Jan 2019 12:02:22:  40000000 
INFO  @ Fri, 04 Jan 2019 12:02:23:  41000000 
INFO  @ Fri, 04 Jan 2019 12:02:23:  42000000 
INFO  @ Fri, 04 Jan 2019 12:02:24:  43000000 
INFO  @ Fri, 04 Jan 2019 12:02:25:  44000000 
INFO  @ Fri, 04 Jan 2019 12:02:26:  45000000 
INFO  @ Fri, 04 Jan 2019 12:02:27:  46000000 
INFO  @ Fri, 04 Jan 2019 12:02:28:  47000000 
INFO  @ Fri, 04 Jan 2019 12:02:29:  48000000 
INFO  @ Fri, 04 Jan 2019 12:02:30:  49000000 
INFO  @ Fri, 04 Jan 2019 12:02:30:  50000000 
INFO  @ Fri, 04 Jan 2019 12:02:31:  51000000 
INFO  @ Fri, 04 Jan 2019 12:02:32:  52000000 
INFO  @ Fri, 04 Jan 2019 12:02:33:  53000000 
INFO  @ Fri, 04 Jan 2019 12:02:34:  54000000 
INFO  @ Fri, 04 Jan 2019 12:02:35:  55000000 
INFO  @ Fri, 04 Jan 2019 12:02:36:  56000000 
INFO  @ Fri, 04 Jan 2019 12:02:36:  57000000 
INFO  @ Fri, 04 Jan 2019 12:02:37:  58000000 
INFO  @ Fri, 04 Jan 2019 12:02:38:  59000000 
INFO  @ Fri, 04 Jan 2019 12:02:39:  60000000 
INFO  @ Fri, 04 Jan 2019 12:02:40:  61000000 
INFO  @ Fri, 04 Jan 2019 12:02:41:  62000000 
INFO  @ Fri, 04 Jan 2019 12:02:41:  63000000 
INFO  @ Fri, 04 Jan 2019 12:02:42:  64000000 
INFO  @ Fri, 04 Jan 2019 12:02:43:  65000000 
INFO  @ Fri, 04 Jan 2019 12:02:44:  66000000 
INFO  @ Fri, 04 Jan 2019 12:02:45:  67000000 
INFO  @ Fri, 04 Jan 2019 12:02:46:  68000000 
INFO  @ Fri, 04 Jan 2019 12:02:47:  69000000 
INFO  @ Fri, 04 Jan 2019 12:02:48: #1 tag size is determined as 50 bps 
INFO  @ Fri, 04 Jan 2019 12:02:48: #1 tag size = 50.0 
INFO  @ Fri, 04 Jan 2019 12:02:48: #1  total tags in treatment: 69206468 
INFO  @ Fri, 04 Jan 2019 12:02:48: #1 user defined the maximum tags... 
INFO  @ Fri, 04 Jan 2019 12:02:48: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Fri, 04 Jan 2019 12:02:49: #1  tags after filtering in treatment: 61068472 
INFO  @ Fri, 04 Jan 2019 12:02:49: #1  Redundant rate of treatment: 0.12 
INFO  @ Fri, 04 Jan 2019 12:02:49: #1 finished! 
INFO  @ Fri, 04 Jan 2019 12:02:49: #2 Build Peak Model... 
INFO  @ Fri, 04 Jan 2019 12:02:49: #2 Skipped... 
INFO  @ Fri, 04 Jan 2019 12:02:49: #2 Use 200 as fragment length 
INFO  @ Fri, 04 Jan 2019 12:02:49: #3 Call peaks... 
INFO  @ Fri, 04 Jan 2019 12:02:49: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Fri, 04 Jan 2019 12:05:30: #3 Call peaks for each chromosome... 
INFO  @ Fri, 04 Jan 2019 12:07:25: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.xls 
INFO  @ Fri, 04 Jan 2019 12:07:26: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak 
INFO  @ Fri, 04 Jan 2019 12:07:26: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_summits.bed 
INFO  @ Fri, 04 Jan 2019 12:07:27: Done! 
</pre>
Process 177282 returned: (0). Elapsed: 0:05:41. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
Follow:

> `Peak_count`	116788	PEPATAC	_RES_

### Calculate fraction of reads in peaks (FRiP) (01-04 12:07:27) elapsed: 341.0 _TIME_


> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

('71702038', '18109089\n')

> `FRiP`	0.252560310768	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (01-04 12:08:43) elapsed: 76.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bigBed`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bigBed`

<pre>
pass1 - making usageList (55 chroms): 39 millis
pass2 - checking and writing primary data (116789 records, 10 fields): 475 millis
[1] TRUE
[1] TRUE
</pre>
Process 177837 returned: (0). Elapsed: 0:00:05. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

### Calculate peak coverage (01-04 12:08:48) elapsed: 5.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed`

<pre>
</pre>
Process 177850 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 177852 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 177853 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 7.262GB)
<pre>
</pre>
Process 177854 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 7.262GB)
<pre>
</pre>
Process 177855 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 7.262GB)

> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed`

<pre>
</pre>
Process 177857 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed`

<pre>
</pre>
Process 177860 returned: (0). Elapsed: 0:01:52. Peak memory: (Process: 0.01GB; Pipeline: 7.262GB)

### Calculate read coverage (01-04 12:10:40) elapsed: 112.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/hg19_annotations.bed.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/hg19_annotations.bed.gz`

<pre>
</pre>
Process 178122 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3' UTR`


> `gunzip -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/"$4}'`

<pre>
</pre>
Process 178128 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 178129 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 178130 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 178131 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed`

<pre>
</pre>
Process 178134 returned: (0). Elapsed: 0:01:34. Peak memory: (Process: 0.007GB; Pipeline: 7.262GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 178216 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 178217 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed`

<pre>
</pre>
Process 178220 returned: (0). Elapsed: 0:01:39. Peak memory: (Process: 0.008GB; Pipeline: 7.262GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 178596 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 178597 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.092GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed`

<pre>
</pre>
Process 178600 returned: (0). Elapsed: 0:01:38. Peak memory: (Process: 0.009GB; Pipeline: 7.262GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 179140 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 179141 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.087GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed`

<pre>
</pre>
Process 179144 returned: (0). Elapsed: 0:03:02. Peak memory: (Process: 0.053GB; Pipeline: 7.262GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 179300 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 179301 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed`

<pre>
</pre>
Process 179304 returned: (0). Elapsed: 0:01:45. Peak memory: (Process: 0.01GB; Pipeline: 7.262GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 179562 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
<pre>
</pre>
Process 179563 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 179566 returned: (0). Elapsed: 0:01:41. Peak memory: (Process: 0.01GB; Pipeline: 7.262GB)

### Plot FRiP/F (01-04 12:22:03) elapsed: 683.0 _TIME_


> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R', 'gold5', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed', '68991198', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_frif.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R gold5 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed 68991198 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 179669 returned: (0). Elapsed: 0:00:43. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
> `Cumulative FRiF`	QC_hg19/gold5_frif.pdf	Cumulative FRiF	QC_hg19/gold5_frif.png	PEPATAC	_OBJ_

### Annotate peaks (01-04 12:22:53) elapsed: 50.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/gold5_peaks_partition_dist.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/raw/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak gold5 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19`

<pre>
Promoter :	found 15536
Promoter Flanking Region :	found 29770
5' UTR :	found 823
3' UTR :	found 1492
Exon :	found 2751
Intron :	found 33332
Peak annotation complete!

</pre>
Process 179713 returned: (0). Elapsed: 0:00:22. Peak memory: (Process: 0.0GB; Pipeline: 7.262GB)
> `Peak chromosome distribution`	QC_hg19/gold5_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold5_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold5_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold5_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold5_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold5_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpoe4QuK
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpoe4QuK`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/rCRSd_3k_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpz3uJcG
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/tmpz3uJcG`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/prealignments/human_repeats_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpJJZFHK
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpJJZFHK`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam.bai
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam.bai`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpLr4pes
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19/tmpLr4pes`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/01_03_19/results_pipeline/gold5/fastq/gold5-trimmed.log`

> `Time`	3:00:57	PEPATAC	_RES_

> `Success`	01-04-12:23:16	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  3:00:57
*     Peak memory used:  7.26 GB
* Pipeline completed at:  (01-04 12:23:16) elapsed: 23.0 _TIME_

Pypiper terminating spawned child process 162191...(tee)
