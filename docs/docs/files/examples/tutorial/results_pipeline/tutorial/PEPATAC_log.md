### [Pipeline run code and environment:]

*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --genome hg38 --input /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz --single-or-paired paired --sample-name tutorial --input2 /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz --prealignments rCRSd human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//tutorial/results_pipeline -P 2 -M 12000`
*         Compute host:  udc-ba35-16e
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/
*  Pipeline started at:   (01-08 10:18:30) elapsed: 6.0 _TIME_

### [Version log:]

*       Python version:  2.7.15
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.9.0
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.8.4
*        Pipeline hash:  030c1c3d4738e719af989154e66a585168472f47
*      Pipeline branch:  * dev
*        Pipeline date:  2019-01-03 15:47:13 -0500
*        Pipeline diff:  169 files changed, 43313 deletions(-)

### [Arguments passed to pipeline:]

*             `input2`:  `['/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//tutorial/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*       `deduplicator`:  `samblaster`
*        `sample_name`:  `tutorial`
*               `lite`:  `False`
*              `input`:  `['/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz']`
*        `genome_size`:  `hs`
*        `config_file`:  `pepatac.yaml`
*                `mem`:  `12000`
*       `force_follow`:  `False`
*              `cores`:  `2`
*          `anno_name`:  `None`
*            `trimmer`:  `skewer`
*        `peak_caller`:  `macs2`
*               `keep`:  `False`
*   `single_or_paired`:  `paired`
*              `dirty`:  `False`
*    `genome_assembly`:  `hg38`
*            `no_fifo`:  `False`

----------------------------------------


Changed status from initializing to running.

Using custom config file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.yaml

Loading config file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.yaml

Local input file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz
Local input file: /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz

> `File_mb`	54.5006	PEPATAC	_RES_

> `Read_type`	paired	PEPATAC	_RES_

> `Genome`	hg38	PEPATAC	_RES_

### Merge/link and fastq conversion:  (01-08 10:18:31) elapsed: 1.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz`

<pre>
</pre>
Process 154043 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz`

<pre>
</pre>
Process 154056 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Local input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq`


> `pigz -p 2 -d -c /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq`

<pre>
</pre>
Process 154068 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)

> `pigz -p 2 -d -c /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq`

<pre>
</pre>
Process 154274 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Follow:
['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq']

> `Raw_reads`	2000000	PEPATAC	_RES_

> `Fastq_reads`	2000000	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz']

### Adapter trimming:  (01-08 10:18:34) elapsed: 3.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq`


> `skewer -f sanger -t 2 -m pe -x /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq`

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
-- number of concurrent threads (-t):	2
Tue Jan  8 10:18:34 2019[0;32m >> started[0m

Tue Jan  8 10:18:56 2019[0;32m >> done[0m (22.020s)
1000000 read pairs processed; of these:
      0 ( 0.00%) short read pairs filtered out after trimming by size control
      0 ( 0.00%) empty read pairs filtered out after trimming by size control
1000000 (100.00%) read pairs available; of these:
1000000 (100.00%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed.log".
</pre>
Process 157201 returned: (0). Elapsed: 0:00:22. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)

> `mv /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq`

<pre>
</pre>
Process 185658 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)

> `mv /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.trim.fastq`

<pre>
</pre>
Process 185862 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
Follow:
Evaluating read trimming

> `Trimmed_reads`	2000000	PEPATAC	_RES_

> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastqc /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of tutorial_R1.trim.fastq
Approx 5% complete for tutorial_R1.trim.fastq
Approx 10% complete for tutorial_R1.trim.fastq
Approx 15% complete for tutorial_R1.trim.fastq
Approx 20% complete for tutorial_R1.trim.fastq
Approx 25% complete for tutorial_R1.trim.fastq
Approx 30% complete for tutorial_R1.trim.fastq
Approx 35% complete for tutorial_R1.trim.fastq
Approx 40% complete for tutorial_R1.trim.fastq
Approx 45% complete for tutorial_R1.trim.fastq
Approx 50% complete for tutorial_R1.trim.fastq
Approx 55% complete for tutorial_R1.trim.fastq
Approx 60% complete for tutorial_R1.trim.fastq
Approx 65% complete for tutorial_R1.trim.fastq
Approx 70% complete for tutorial_R1.trim.fastq
Approx 75% complete for tutorial_R1.trim.fastq
Approx 80% complete for tutorial_R1.trim.fastq
Approx 85% complete for tutorial_R1.trim.fastq
Approx 90% complete for tutorial_R1.trim.fastq
Approx 95% complete for tutorial_R1.trim.fastq
Approx 100% complete for tutorial_R1.trim.fastq
Analysis complete for tutorial_R1.trim.fastq
</pre>
Process 186005 returned: (0). Elapsed: 0:00:12. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
> `FastQC report r1`	fastqc/tutorial_R1.trim_fastqc.html	FastQC report r1		PEPATAC	_OBJ_

Targetless command, running...


> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastqc /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of tutorial_R2.trim.fastq
Approx 5% complete for tutorial_R2.trim.fastq
Approx 10% complete for tutorial_R2.trim.fastq
Approx 15% complete for tutorial_R2.trim.fastq
Approx 20% complete for tutorial_R2.trim.fastq
Approx 25% complete for tutorial_R2.trim.fastq
Approx 30% complete for tutorial_R2.trim.fastq
Approx 35% complete for tutorial_R2.trim.fastq
Approx 40% complete for tutorial_R2.trim.fastq
Approx 45% complete for tutorial_R2.trim.fastq
Approx 50% complete for tutorial_R2.trim.fastq
Approx 55% complete for tutorial_R2.trim.fastq
Approx 60% complete for tutorial_R2.trim.fastq
Approx 65% complete for tutorial_R2.trim.fastq
Approx 70% complete for tutorial_R2.trim.fastq
Approx 75% complete for tutorial_R2.trim.fastq
Approx 80% complete for tutorial_R2.trim.fastq
Approx 85% complete for tutorial_R2.trim.fastq
Approx 90% complete for tutorial_R2.trim.fastq
Approx 95% complete for tutorial_R2.trim.fastq
Approx 100% complete for tutorial_R2.trim.fastq
Analysis complete for tutorial_R2.trim.fastq
</pre>
Process 202861 returned: (0). Elapsed: 0:02:54. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
> `FastQC report r2`	fastqc/tutorial_R2.trim_fastqc.html	FastQC report r2		PEPATAC	_OBJ_

### Prealignments (01-08 10:22:03) elapsed: 209.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (01-08 10:22:03) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2`

<pre>
</pre>
Process 199220 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [199333]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log`


> `(bowtie2 -p 2 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id tutorial -U /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 199340 returned: (0). Elapsed: 0:00:20. Peak memory: (Process: 0.027GB; Pipeline: 0.027GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_rCRSd`	199916.0	PEPATAC	_RES_

> `Alignment_rate_rCRSd`	10.0	PEPATAC	_RES_

### Map to human_repeats (01-08 10:22:22) elapsed: 20.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2`


> `mkfifo /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2`

<pre>
</pre>
Process 226405 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.027GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess(es): [226495]

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log`


> `(bowtie2 -p 2 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/human_repeats/indexed_bowtie2/human_repeats --rg-id tutorial -U /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq --un /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log`

<pre>
99958 reads skipped
0 reads lost
</pre>
Process 226509 returned: (0). Elapsed: 0:00:23. Peak memory: (Process: 0.029GB; Pipeline: 0.029GB)

> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log | awk '{print $1}'`


> `Aligned_reads_human_repeats`	39944.0	PEPATAC	_RES_

> `Alignment_rate_human_repeats`	2.0	PEPATAC	_RES_

### Map to genome (01-08 10:22:46) elapsed: 23.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`


> `bowtie2 -p 2 --very-sensitive -X 2000 --rg-id tutorial -x /nm/t1/genomes/hg38/indexed_bowtie2/hg38 -1 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmptVnmNF -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`

<pre>
19972 reads skipped
0 reads lost
880070 reads; of these:
  880070 (100.00%) were paired; of these:
    803 (0.09%) aligned concordantly 0 times
    806088 (91.59%) aligned concordantly exactly 1 time
    73179 (8.32%) aligned concordantly >1 times
    ----
    803 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    803 pairs aligned 0 times concordantly or discordantly; of these:
      1606 mates make up the pairs; of these:
        1562 (97.26%) aligned 0 times
        13 (0.81%) aligned exactly 1 time
        31 (1.93%) aligned >1 times
99.91% overall alignment rate
</pre>
Process 13397 returned: (0). Elapsed: 0:05:58. Peak memory: (Process: 3.473GB; Pipeline: 3.473GB)
<pre>
</pre>
Process 13402 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)
<pre>
</pre>
Process 13482 returned: (0). Elapsed: 0:00:14. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

> `samtools view -q 10 -b -@ 2 -U /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_fail_qc.bam -f 2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`

<pre>
</pre>
Process 38152 returned: (0). Elapsed: 0:00:09. Peak memory: (Process: 0.01GB; Pipeline: 3.473GB)
Follow:

> `Mapped_reads`	1758578	PEPATAC	_RES_

> `QC_filtered_reads`	7196.0	PEPATAC	_RES_

> `Aligned_reads`	1751382	PEPATAC	_RES_

> `Alignment_rate`	87.57	PEPATAC	_RES_

> `Total_efficiency`	87.57	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq`

<pre>
</pre>
Process 54964 returned: (0). Elapsed: 0:00:12. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq`

<pre>
</pre>
Process 72120 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq`

<pre>
</pre>
Process 89872 returned: (0). Elapsed: 0:00:12. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq.gz`


> `gzip /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq`

<pre>
</pre>
Process 106939 returned: (0). Elapsed: 0:00:12. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam.bai`


> `samtools index /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`

<pre>
</pre>
Process 124393 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`

<pre>
</pre>
Process 127498 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam | grep -we 'chrM' -we 'chrMT' -we 'M' -we 'MT'| cut -f 3`


> `Mitochondrial_reads`	28.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_noMT.bam`


> `samtools idxstats /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam | cut -f 1 | grep -vwe 'chrM' -vwe 'chrMT' -vwe 'M' -vwe 'MT'| xargs samtools view -b -@ 2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_noMT.bam`

<pre>
</pre>
Process 130536 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)
<pre>
</pre>
Process 130538 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.473GB)
<pre>
</pre>
Process 130548 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.473GB)
<pre>
</pre>
Process 130552 returned: (0). Elapsed: 0:00:09. Peak memory: (Process: 0.027GB; Pipeline: 3.473GB)

> `mv /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_noMT.bam /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`

<pre>
</pre>
Process 142904 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`

<pre>
</pre>
Process 142979 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

### Calculate NRF, PBC1, and PBC2 (01-08 10:30:14) elapsed: 449.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam -c 2 -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

<pre>
Configured logger 'root' using pararead v0.5.0
Registering input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tmp_tutorial_sort_5j_PqK'
Processing with 2 cores...
[Name: chrUn_KI270749v1; Size: 158759]
[Name: chr15; Size: 101991189]
[Name: chr1_KI270713v1_random; Size: 40745]
[Name: chr13; Size: 114364328]
[Name: chrUn_GL000218v1; Size: 161147]
[Name: chr19; Size: 58617616]
[Name: chr12; Size: 133275309]
[Name: chr18; Size: 80373285]
[Name: chrUn_GL000219v1; Size: 179198]
[Name: chr11; Size: 135086622]
[Name: chrUn_GL000213v1; Size: 164239]
[Name: chr16_KI270728v1_random; Size: 1872759]
[Name: chrUn_GL000214v1; Size: 137718]
[Name: chrUn_KI270744v1; Size: 168472]
[Name: chr22_KI270732v1_random; Size: 41543]
[Name: chrUn_GL000216v2; Size: 176608]
[Name: chr10; Size: 133797422]
[Name: chrUn_GL000195v1; Size: 182896]
[Name: chrUn_KI270742v1; Size: 186739]
[Name: chr14_GL000194v1_random; Size: 191469]
[Name: chrUn_KI270751v1; Size: 150742]
[Name: chrUn_KI270750v1; Size: 148850]
[Name: chr9_KI270719v1_random; Size: 176845]
[Name: chr17; Size: 83257441]
[Name: chr14; Size: 107043718]
[Name: chr16; Size: 90338345]
[Name: chr17_GL000205v2_random; Size: 185591]
[Name: chr4_GL000008v2_random; Size: 209709]
[Name: chr14_KI270726v1_random; Size: 43739]
[Name: chr22_KI270733v1_random; Size: 179772]
[Name: chr1_KI270706v1_random; Size: 175055]
[Name: chrUn_KI270754v1; Size: 40191]
[Name: chr14_KI270722v1_random; Size: 194050]
[Name: chr14_GL000009v2_random; Size: 201709]
[Name: chrUn_KI270519v1; Size: 138126]
[Name: chrUn_KI270438v1; Size: 112505]
[Name: chrUn_KI270442v1; Size: 392061]
[Name: chr1_KI270714v1_random; Size: 41717]
[Name: chr5; Size: 181538259]
[Name: chr14_KI270725v1_random; Size: 172810]
[Name: chr14_GL000225v1_random; Size: 211173]
[Name: chrY; Size: 57227415]
[Name: chrX; Size: 156040895]
[Name: chr22_KI270736v1_random; Size: 181920]
[Name: chrUn_KI270757v1; Size: 71251]
[Name: chrUn_GL000220v1; Size: 161802]
[Name: chr5_GL000208v1_random; Size: 92689]
[Name: chrUn_GL000224v1; Size: 179693]
[Name: chr22; Size: 50818468]
[Name: chr1; Size: 248956422]
[Name: chr20; Size: 64444167]
[Name: chr21; Size: 46709983]
[Name: chr7; Size: 159345973]
[Name: chr9; Size: 138394717]
[Name: chr6; Size: 170805979]
[Name: chr8; Size: 145138636]
[Name: chrUn_KI270741v1; Size: 157432]
[Name: chr4; Size: 190214555]
[Name: chr3; Size: 198295559]
[Name: chr2; Size: 242193529]
Discarding 135 chunk(s) of reads: ['chrUn_KI270748v1', 'chrUn_KI270337v1', 'chrUn_KI270418v1', 'chrUn_KI270305v1', 'chrUn_KI270376v1', 'chrUn_KI270320v1', 'chrUn_KI270518v1', 'chr3_GL000221v1_random', 'chr17_KI270729v1_random', 'chrUn_KI270746v1', 'chrUn_KI270516v1', 'chrUn_KI270521v1', 'chrUn_KI270372v1', 'chr9_KI270720v1_random', 'chrUn_KI270593v1', 'chrUn_KI270538v1', 'chr22_KI270731v1_random', 'chr1_KI270707v1_random', 'chrUn_KI270322v1', 'chrUn_KI270579v1', 'chrUn_KI270756v1', 'chrUn_KI270335v1', 'chrUn_KI270378v1', 'chrEBV', 'chrUn_KI270381v1', 'chrUn_KI270303v1', 'chrUn_KI270333v1', 'chrUn_KI270435v1', 'chr15_KI270727v1_random', 'chrUn_KI270302v1', 'chrUn_KI270530v1', 'chrUn_KI270548v1', 'chrUn_KI270304v1', 'chrUn_KI270745v1', 'chrY_KI270740v1_random', 'chrUn_KI270590v1', 'chrUn_KI270374v1', 'chrUn_KI270311v1', 'chr22_KI270737v1_random', 'chrUn_KI270362v1', 'chrUn_KI270363v1', 'chrUn_KI270508v1', 'chrUn_KI270747v1', 'chrUn_KI270509v1', 'chrUn_KI270753v1', 'chrUn_KI270752v1', 'chr17_KI270730v1_random', 'chrUn_KI270755v1', 'chr22_KI270734v1_random', 'chrUn_KI270448v1', 'chrUn_KI270422v1', 'chrUn_KI270417v1', 'chr1_KI270711v1_random', 'chrUn_KI270371v1', 'chrUn_KI270420v1', 'chr11_KI270721v1_random', 'chrUn_KI270425v1', 'chrUn_KI270315v1', 'chrUn_KI270424v1', 'chrUn_KI270588v1', 'chr22_KI270739v1_random', 'chrUn_KI270364v1', 'chrUn_KI270366v1', 'chrUn_KI270522v1', 'chr14_KI270724v1_random', 'chrUn_KI270517v1', 'chrUn_KI270429v1', 'chr1_KI270709v1_random', 'chrUn_KI270580v1', 'chr2_KI270715v1_random', 'chrUn_KI270507v1', 'chrUn_KI270317v1', 'chrUn_KI270388v1', 'chrUn_KI270389v1', 'chrUn_KI270584v1', 'chrUn_KI270336v1', 'chrUn_KI270511v1', 'chrUn_KI270383v1', 'chrUn_KI270419v1', 'chr1_KI270712v1_random', 'chr1_KI270708v1_random', 'chr14_KI270723v1_random', 'chrUn_KI270386v1', 'chr9_KI270718v1_random', 'chrUn_KI270423v1', 'chrUn_KI270387v1', 'chrUn_KI270373v1', 'chrUn_KI270587v1', 'chrUn_KI270515v1', 'chrUn_KI270582v1', 'chrUn_KI270411v1', 'chrUn_KI270583v1', 'chrUn_KI270330v1', 'chrUn_KI270379v1', 'chrUn_KI270334v1', 'chrUn_KI270743v1', 'chr9_KI270717v1_random', 'chrUn_KI270589v1', 'chrUn_KI270375v1', 'chr1_KI270710v1_random', 'chrUn_KI270384v1', 'chrUn_KI270338v1', 'chrUn_KI270385v1', 'chrUn_KI270394v1', 'chrUn_KI270591v1', 'chrUn_KI270382v1', 'chrUn_KI270391v1', 'chrUn_KI270390v1', 'chrUn_KI270310v1', 'chrUn_KI270544v1', 'chrM', 'chrUn_GL000226v1', 'chrUn_KI270340v1', 'chrUn_KI270393v1', 'chrUn_KI270392v1', 'chr22_KI270738v1_random', 'chrUn_KI270528v1', 'chrUn_KI270467v1', 'chrUn_KI270529v1', 'chrUn_KI270316v1', 'chrUn_KI270539v1', 'chrUn_KI270512v1', 'chr22_KI270735v1_random', 'chrUn_KI270312v1', 'chrUn_KI270329v1', 'chr2_KI270716v1_random', 'chrUn_KI270468v1', 'chrUn_KI270414v1', 'chrUn_KI270510v1', 'chrUn_KI270466v1', 'chrUn_KI270395v1', 'chrUn_KI270412v1', 'chrUn_KI270465v1', 'chrUn_KI270396v1', 'chrUn_KI270581v1']
Keeping 60 chunk(s) of reads: ['chrUn_KI270749v1', 'chr1_KI270713v1_random', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chrUn_GL000218v1', 'chr19', 'chr18', 'chrUn_GL000219v1', 'chrUn_GL000213v1', 'chr16_KI270728v1_random', 'chrUn_GL000214v1', 'chrUn_KI270744v1', 'chr22_KI270732v1_random', 'chrUn_GL000216v2', 'chrUn_GL000195v1', 'chrUn_KI270742v1', 'chr14_GL000194v1_random', 'chrUn_KI270751v1', 'chrUn_KI270750v1', 'chr9_KI270719v1_random', 'chr14', 'chr17_GL000205v2_random', 'chr4_GL000008v2_random', 'chr14_KI270726v1_random', 'chr22_KI270733v1_random', 'chrUn_KI270754v1', 'chr14_GL000009v2_random', 'chr1_KI270706v1_random', 'chr14_KI270722v1_random', 'chrUn_KI270519v1', 'chrUn_KI270442v1', 'chr5', 'chr22_KI270736v1_random', 'chrUn_KI270757v1', 'chr5_GL000208v1_random', 'chrUn_KI270438v1', 'chr1_KI270714v1_random', 'chr14_KI270725v1_random', 'chr14_GL000225v1_random', 'chrY', 'chrX', 'chrUn_GL000220v1', 'chrUn_GL000224v1', 'chr22', 'chr20', 'chr21', 'chr7', 'chr6', 'chr4', 'chr3', 'chr2', 'chr1', 'chr9', 'chr8', 'chrUn_KI270741v1']
Reduce step (merge files)...
Merging 60 files into output file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv'
</pre>
Process 145873 returned: (0). Elapsed: 0:00:17. Peak memory: (Process: 0.174GB; Pipeline: 3.473GB)
Follow:

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`


> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`


> `NRF`	1.0	PEPATAC	_RES_

> `PBC1`	1.0	PEPATAC	_RES_

> `PBC2`	875678.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_unmap.bam`


> `samtools view -b -@ 2 -f 12  /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_unmap.bam`

<pre>
</pre>
Process 170141 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.004GB; Pipeline: 3.473GB)
Follow:

> `samtools view -c -f 4 -@ 2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`


> `Unmapped_reads`	1562.0	PEPATAC	_RES_

### Remove dupes, build bigwig and bedgraph files (01-08 10:30:34) elapsed: 19.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`


> `samtools sort -n -@ 2 -T /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmpLrA_r5 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam | samtools view -h - -@ 2 | samblaster -r 2> /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_dedup_metrics_log.txt | samtools view -b - -@ 2 | samtools sort - -@ 2 -T /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmpLrA_r5 -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

<pre>
[bam_sort_core] merging from 0 files and 2 in-memory blocks...
</pre>
Process 172556 returned: (0). Elapsed: 0:00:26. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)
<pre>
</pre>
Process 172562 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)
<pre>
</pre>
Process 172568 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 3.473GB)
<pre>
</pre>
Process 172571 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)
<pre>
[bam_sort_core] merging from 0 files and 2 in-memory blocks...
</pre>
Process 172580 returned: (0). Elapsed: 0:00:09. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)

> `samtools index /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

<pre>
</pre>
Process 221652 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.0GB; Pipeline: 3.473GB)
Follow:

> `grep 'Removed' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_dedup_metrics_log.txt | cut -f 3 -d ' '`


> `Duplicate_reads`	0	PEPATAC	_RES_

> `Dedup_aligned_reads`	1751382.0	PEPATAC	_RES_

> `Dedup_alignment_rate`	87.57	PEPATAC	_RES_

> `Dedup_total_efficiency`	87.57	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (01-08 10:31:11) elapsed: 37.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp/flag_completed`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -c /nm/t1/genomes/hg38/hg38.chromSizes -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw -w /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw -p 1`

<pre>
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tmp_tutorial_sort_dedup_cuttrace_YHk69G'
Processing with 1 cores...
[Name: chrUn_KI270749v1; Size: 158759]
[Name: chr1_KI270713v1_random; Size: 40745]
[Name: chr13; Size: 114364328]
[Name: chr12; Size: 133275309]
[Name: chr11; Size: 135086622]
[Name: chr10; Size: 133797422]
[Name: chr17; Size: 83257441]
[Name: chr16; Size: 90338345]
[Name: chr15; Size: 101991189]
[Name: chrUn_GL000218v1; Size: 161147]
[Name: chr19; Size: 58617616]
[Name: chr18; Size: 80373285]
[Name: chrUn_GL000219v1; Size: 179198]
[Name: chrUn_GL000213v1; Size: 164239]
[Name: chr16_KI270728v1_random; Size: 1872759]
[Name: chrUn_GL000214v1; Size: 137718]
[Name: chrUn_KI270744v1; Size: 168472]
[Name: chr22_KI270732v1_random; Size: 41543]
[Name: chrUn_GL000216v2; Size: 176608]
[Name: chrUn_GL000195v1; Size: 182896]
[Name: chrUn_KI270742v1; Size: 186739]
[Name: chr14_GL000194v1_random; Size: 191469]
[Name: chrUn_KI270751v1; Size: 150742]
[Name: chrUn_KI270750v1; Size: 148850]
[Name: chr9_KI270719v1_random; Size: 176845]
[Name: chr14; Size: 107043718]
[Name: chr17_GL000205v2_random; Size: 185591]
[Name: chr4_GL000008v2_random; Size: 209709]
[Name: chr14_KI270726v1_random; Size: 43739]
[Name: chr22_KI270733v1_random; Size: 179772]
[Name: chrUn_KI270754v1; Size: 40191]
[Name: chr14_GL000009v2_random; Size: 201709]
[Name: chr1_KI270706v1_random; Size: 175055]
[Name: chr14_KI270722v1_random; Size: 194050]
[Name: chrUn_KI270519v1; Size: 138126]
[Name: chrUn_KI270442v1; Size: 392061]
[Name: chr5; Size: 181538259]
[Name: chr22_KI270736v1_random; Size: 181920]
[Name: chrUn_KI270757v1; Size: 71251]
[Name: chr5_GL000208v1_random; Size: 92689]
[Name: chrUn_KI270438v1; Size: 112505]
[Name: chr1_KI270714v1_random; Size: 41717]
[Name: chr14_KI270725v1_random; Size: 172810]
[Name: chr14_GL000225v1_random; Size: 211173]
[Name: chrY; Size: 57227415]
[Name: chrX; Size: 156040895]
[Name: chrUn_GL000220v1; Size: 161802]
[Name: chrUn_GL000224v1; Size: 179693]
[Name: chr22; Size: 50818468]
[Name: chr20; Size: 64444167]
[Name: chr21; Size: 46709983]
[Name: chr7; Size: 159345973]
[Name: chr6; Size: 170805979]
[Name: chr4; Size: 190214555]
[Name: chr3; Size: 198295559]
[Name: chr2; Size: 242193529]
[Name: chr1; Size: 248956422]
[Name: chr9; Size: 138394717]
[Name: chr8; Size: 145138636]
[Name: chrUn_KI270741v1; Size: 157432]
Discarding 135 chunk(s) of reads: ['chrUn_KI270748v1', 'chrUn_KI270337v1', 'chrUn_KI270418v1', 'chrUn_KI270305v1', 'chrUn_KI270376v1', 'chrUn_KI270320v1', 'chrUn_KI270518v1', 'chr3_GL000221v1_random', 'chr17_KI270729v1_random', 'chrUn_KI270746v1', 'chrUn_KI270516v1', 'chrUn_KI270521v1', 'chrUn_KI270372v1', 'chr9_KI270720v1_random', 'chrUn_KI270593v1', 'chrUn_KI270538v1', 'chr22_KI270731v1_random', 'chr1_KI270707v1_random', 'chrUn_KI270322v1', 'chrUn_KI270579v1', 'chrUn_KI270756v1', 'chrUn_KI270335v1', 'chrUn_KI270378v1', 'chrEBV', 'chrUn_KI270381v1', 'chrUn_KI270303v1', 'chrUn_KI270333v1', 'chrUn_KI270435v1', 'chr15_KI270727v1_random', 'chrUn_KI270302v1', 'chrUn_KI270530v1', 'chrUn_KI270548v1', 'chrUn_KI270304v1', 'chrUn_KI270745v1', 'chrY_KI270740v1_random', 'chrUn_KI270590v1', 'chrUn_KI270374v1', 'chrUn_KI270311v1', 'chr22_KI270737v1_random', 'chrUn_KI270362v1', 'chrUn_KI270363v1', 'chrUn_KI270508v1', 'chrUn_KI270747v1', 'chrUn_KI270509v1', 'chrUn_KI270753v1', 'chrUn_KI270752v1', 'chr17_KI270730v1_random', 'chrUn_KI270755v1', 'chr22_KI270734v1_random', 'chrUn_KI270448v1', 'chrUn_KI270422v1', 'chrUn_KI270417v1', 'chr1_KI270711v1_random', 'chrUn_KI270371v1', 'chrUn_KI270420v1', 'chr11_KI270721v1_random', 'chrUn_KI270425v1', 'chrUn_KI270315v1', 'chrUn_KI270424v1', 'chrUn_KI270588v1', 'chr22_KI270739v1_random', 'chrUn_KI270364v1', 'chrUn_KI270366v1', 'chrUn_KI270522v1', 'chr14_KI270724v1_random', 'chrUn_KI270517v1', 'chrUn_KI270429v1', 'chr1_KI270709v1_random', 'chrUn_KI270580v1', 'chr2_KI270715v1_random', 'chrUn_KI270507v1', 'chrUn_KI270317v1', 'chrUn_KI270388v1', 'chrUn_KI270389v1', 'chrUn_KI270584v1', 'chrUn_KI270336v1', 'chrUn_KI270511v1', 'chrUn_KI270383v1', 'chrUn_KI270419v1', 'chr1_KI270712v1_random', 'chr1_KI270708v1_random', 'chr14_KI270723v1_random', 'chrUn_KI270386v1', 'chr9_KI270718v1_random', 'chrUn_KI270423v1', 'chrUn_KI270387v1', 'chrUn_KI270373v1', 'chrUn_KI270587v1', 'chrUn_KI270515v1', 'chrUn_KI270582v1', 'chrUn_KI270411v1', 'chrUn_KI270583v1', 'chrUn_KI270330v1', 'chrUn_KI270379v1', 'chrUn_KI270334v1', 'chrUn_KI270743v1', 'chr9_KI270717v1_random', 'chrUn_KI270589v1', 'chrUn_KI270375v1', 'chr1_KI270710v1_random', 'chrUn_KI270384v1', 'chrUn_KI270338v1', 'chrUn_KI270385v1', 'chrUn_KI270394v1', 'chrUn_KI270591v1', 'chrUn_KI270382v1', 'chrUn_KI270391v1', 'chrUn_KI270390v1', 'chrUn_KI270310v1', 'chrUn_KI270544v1', 'chrM', 'chrUn_GL000226v1', 'chrUn_KI270340v1', 'chrUn_KI270393v1', 'chrUn_KI270392v1', 'chr22_KI270738v1_random', 'chrUn_KI270528v1', 'chrUn_KI270467v1', 'chrUn_KI270529v1', 'chrUn_KI270316v1', 'chrUn_KI270539v1', 'chrUn_KI270512v1', 'chr22_KI270735v1_random', 'chrUn_KI270312v1', 'chrUn_KI270329v1', 'chr2_KI270716v1_random', 'chrUn_KI270468v1', 'chrUn_KI270414v1', 'chrUn_KI270510v1', 'chrUn_KI270466v1', 'chrUn_KI270395v1', 'chrUn_KI270412v1', 'chrUn_KI270465v1', 'chrUn_KI270396v1', 'chrUn_KI270581v1']
Keeping 60 chunk(s) of reads: ['chrUn_KI270749v1', 'chr1_KI270713v1_random', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chrUn_GL000218v1', 'chr19', 'chr18', 'chrUn_GL000219v1', 'chrUn_GL000213v1', 'chr16_KI270728v1_random', 'chrUn_GL000214v1', 'chrUn_KI270744v1', 'chr22_KI270732v1_random', 'chrUn_GL000216v2', 'chrUn_GL000195v1', 'chrUn_KI270742v1', 'chr14_GL000194v1_random', 'chrUn_KI270751v1', 'chrUn_KI270750v1', 'chr9_KI270719v1_random', 'chr14', 'chr17_GL000205v2_random', 'chr4_GL000008v2_random', 'chr14_KI270726v1_random', 'chr22_KI270733v1_random', 'chrUn_KI270754v1', 'chr14_GL000009v2_random', 'chr1_KI270706v1_random', 'chr14_KI270722v1_random', 'chrUn_KI270519v1', 'chrUn_KI270442v1', 'chr5', 'chr22_KI270736v1_random', 'chrUn_KI270757v1', 'chr5_GL000208v1_random', 'chrUn_KI270438v1', 'chr1_KI270714v1_random', 'chr14_KI270725v1_random', 'chr14_GL000225v1_random', 'chrY', 'chrX', 'chrUn_GL000220v1', 'chrUn_GL000224v1', 'chr22', 'chr20', 'chr21', 'chr7', 'chr6', 'chr4', 'chr3', 'chr2', 'chr1', 'chr9', 'chr8', 'chrUn_KI270741v1']
Reduce step (merge files)...
Merging 60 files into output file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw'
Merging 60 files into output file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw'
</pre>
Process 224506 returned: (0). Elapsed: 0:21:26. Peak memory: (Process: 6.503GB; Pipeline: 6.503GB)

> `touch /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp/flag_completed`

<pre>
</pre>
Process 96311 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)

### Calculate TSS enrichment (01-08 10:52:37) elapsed: 1286.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt`


> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -b /nm/t1/genomes/hg38/hg38_TSS.tsv -p ends -c 2 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt`

<pre>
</pre>
Process 96448 returned: (0). Elapsed: 0:00:09. Peak memory: (Process: 0.135GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt
Completed!

</pre>
Process 108658 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)

> `TSS_Score`	13.3252162768	PEPATAC	_RES_
> `TSS enrichment`	QC_hg38/tutorial_TssEnrichment.pdf	TSS enrichment	QC_hg38/tutorial_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (01-08 10:52:48) elapsed: 12.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf`


> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt`

<pre>
</pre>
Process 113103 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.003GB; Pipeline: 6.503GB)

> `sort -n  /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragCount.txt`

<pre>
</pre>
Process 122056 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 122059 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.503GB)

> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragCount.txt /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.txt`

<pre>
</pre>
Process 123789 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
> `Fragment distribution`	QC_hg38/tutorial_fragLenDistribution.pdf	Fragment distribution	QC_hg38/tutorial_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (01-08 10:52:57) elapsed: 8.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak`


> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38 -n tutorial -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Tue, 08 Jan 2019 10:53:00: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38 -n tutorial -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = tutorial
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed']
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
 
INFO  @ Tue, 08 Jan 2019 10:53:00: #1 read tag files... 
INFO  @ Tue, 08 Jan 2019 10:53:00: #1 read treatment tags... 
INFO  @ Tue, 08 Jan 2019 10:53:01:  1000000 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1 tag size is determined as 50 bps 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1 tag size = 50.0 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1  total tags in treatment: 1751356 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1 user defined the maximum tags... 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1  tags after filtering in treatment: 1740010 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1  Redundant rate of treatment: 0.01 
INFO  @ Tue, 08 Jan 2019 10:53:02: #1 finished! 
INFO  @ Tue, 08 Jan 2019 10:53:02: #2 Build Peak Model... 
INFO  @ Tue, 08 Jan 2019 10:53:02: #2 Skipped... 
INFO  @ Tue, 08 Jan 2019 10:53:02: #2 Use 200 as fragment length 
INFO  @ Tue, 08 Jan 2019 10:53:02: #3 Call peaks... 
INFO  @ Tue, 08 Jan 2019 10:53:02: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Tue, 08 Jan 2019 10:53:07: #3 Call peaks for each chromosome... 
INFO  @ Tue, 08 Jan 2019 10:53:12: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.xls 
INFO  @ Tue, 08 Jan 2019 10:53:12: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak 
INFO  @ Tue, 08 Jan 2019 10:53:12: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_summits.bed 
INFO  @ Tue, 08 Jan 2019 10:53:12: Done! 
</pre>
Process 125047 returned: (0). Elapsed: 0:00:15. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
Follow:

> `Peak_count`	16028	PEPATAC	_RES_

### Calculate fraction of reads in peaks (FRiP) (01-08 10:53:12) elapsed: 16.0 _TIME_


> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

('1751382', '192916\n')

> `FRiP`	0.110150726683	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (01-08 10:53:15) elapsed: 3.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bigBed`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak /nm/t1/genomes/hg38/hg38.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bigBed`

<pre>
pass1 - making usageList (26 chroms): 6 millis
pass2 - checking and writing primary data (16029 records, 10 fields): 63 millis
[1] TRUE
[1] TRUE
</pre>
Process 151208 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)

### Calculate peak coverage (01-08 10:53:17) elapsed: 2.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed`

<pre>
</pre>
Process 153401 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)

> `samtools view -H /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt`

<pre>
</pre>
Process 153453 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 153461 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.503GB)
<pre>
</pre>
Process 153465 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.503GB)
<pre>
</pre>
Process 153473 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.503GB)

> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed`

<pre>
</pre>
Process 153512 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed`

<pre>
</pre>
Process 153679 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.005GB; Pipeline: 6.503GB)

### Calculate read coverage (01-08 10:53:20) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz`


> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio/pepatac/anno/hg38_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz`

<pre>
</pre>
Process 158397 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)

> `gunzip -c /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3' UTR`


> `gunzip -c /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/"$4}'`

<pre>
</pre>
Process 160087 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 160093 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.503GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed`

<pre>
</pre>
Process 162100 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 162140 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.032GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed`

<pre>
</pre>
Process 162609 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.005GB; Pipeline: 6.503GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed`

<pre>
</pre>
Process 167646 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 167649 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.029GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed`

<pre>
</pre>
Process 168074 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.005GB; Pipeline: 6.503GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed`

<pre>
</pre>
Process 173011 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 173016 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.188GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed`

<pre>
</pre>
Process 175135 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.01GB; Pipeline: 6.503GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed`

<pre>
</pre>
Process 181216 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 181464 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.111GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed`

<pre>
</pre>
Process 182827 returned: (0). Elapsed: 0:00:05. Peak memory: (Process: 0.016GB; Pipeline: 6.503GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed`

<pre>
</pre>
Process 190222 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 190229 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: None; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed`

<pre>
</pre>
Process 190351 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.005GB; Pipeline: 6.503GB)

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed`


> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 195024 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
<pre>
</pre>
Process 195029 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.016GB; Pipeline: 6.503GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`


> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 195244 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.005GB; Pipeline: 6.503GB)

### Plot FRiP/F (01-08 10:53:50) elapsed: 29.0 _TIME_


> `samtools view -@ 2 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R', 'tutorial', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed', '1746450', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R tutorial /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed 1746450 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 201094 returned: (0). Elapsed: 0:00:30. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
> `Cumulative FRiF`	QC_hg38/tutorial_frif.pdf	Cumulative FRiF	QC_hg38/tutorial_frif.png	PEPATAC	_OBJ_

### Annotate peaks (01-08 10:54:20) elapsed: 30.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_partition_dist.pdf`


> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak tutorial hg38 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38`

<pre>
Promoter :	found 6350
Promoter Flanking Region :	found 4494
5' UTR :	found 57
3' UTR :	found 103
Exon :	found 267
Intron :	found 2659
Peak annotation complete!

</pre>
Process 242536 returned: (0). Elapsed: 0:00:24. Peak memory: (Process: 0.0GB; Pipeline: 6.503GB)
> `Peak chromosome distribution`	QC_hg38/tutorial_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg38/tutorial_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg38/tutorial_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg38/tutorial_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg38/tutorial_peaks_partition_dist.pdf	Peak partition distribution	QC_hg38/tutorial_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpv2SzMy
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpv2SzMy`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSd_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpz8pvwj
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpz8pvwj`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeats_bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmptVnmNF
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmptVnmNF`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam.bai
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam.bai`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmpLrA_r5
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmpLrA_r5`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed.log`

> `Time`	0:36:21	PEPATAC	_RES_

> `Success`	01-08-10:54:45	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:36:21
*     Peak memory used:  6.5 GB
* Pipeline completed at:  (01-08 10:54:45) elapsed: 25.0 _TIME_

Pypiper terminating spawned child process 151817...(tee)
