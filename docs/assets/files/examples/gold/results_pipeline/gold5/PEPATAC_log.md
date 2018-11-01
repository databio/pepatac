----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold5 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-15
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/
*  Pipeline started at:   (09-17 15:47:24) elapsed: 1.0 _TIME_

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
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold5`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz
> `File_mb`	3271.827	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-17 15:47:25) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R1.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R1.fastq.gz`

<pre>
</pre>
Process 103166 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R2.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210390_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R2.fastq.gz`

<pre>
</pre>
Process 103167 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.fastq`
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.fastq`

<pre>
</pre>
Process 103168 returned: (0). Elapsed: 0:00:30.
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.fastq`

<pre>
</pre>
Process 103183 returned: (0). Elapsed: 0:00:56.
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.fastq']
> `Raw_reads`	104881014	PEPATAC	_RES_
> `Fastq_reads`	104881014	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/raw/gold5_R2.fastq.gz']

### Adapter trimming:  (09-17 15:51:21) elapsed: 236.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`
> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.fastq`

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
Mon Sep 17 15:51:21 2018[0;32m >> started[0m

Mon Sep 17 15:55:48 2018[0;32m >> done[0m (266.757s)
52440507 read pairs processed; of these:
     310 ( 0.00%) short read pairs filtered out after trimming by size control
     356 ( 0.00%) empty read pairs filtered out after trimming by size control
52439841 (100.00%) read pairs available; of these:
 3403982 ( 6.49%) trimmed read pairs available after processing
49035859 (93.51%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5-trimmed.log".
</pre>
Process 103408 returned: (0). Elapsed: 0:04:27. Peak memory: (Process: 0.021GB; Pipeline: 0.0GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

<pre>
</pre>
Process 105898 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.021GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.trim.fastq`

<pre>
</pre>
Process 105899 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.021GB)
Follow:
Evaluating read trimming
> `Trimmed_reads`	104879682	PEPATAC	_RES_
> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

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
Process 105959 returned: (0). Elapsed: 0:02:27. Peak memory: (Process: 0.179GB; Pipeline: 0.021GB)

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.trim.fastq`

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
Process 107722 returned: (0). Elapsed: 0:02:27. Peak memory: (Process: 0.176GB; Pipeline: 0.179GB)
> `FastQC report r1`	fastqc/gold5_R1.trim_fastqc.html	FastQC report r1	fastqc/gold5_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold5_R2.trim_fastqc.html	FastQC report r2	fastqc/gold5_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-17 16:00:54) elapsed: 573.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-17 16:00:54) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/bt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/bt2`

<pre>
</pre>
Process 109595 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.179GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 109596

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id gold5 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 109597 returned: (0). Elapsed: 0:06:32.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	19947382.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	19.02	PEPATAC	_RES_

### Map to genome (09-17 16:07:27) elapsed: 392.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold5 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/gold5_rCRSd_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/tmpZZADBE -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`

<pre>
9973691 reads skipped
0 reads lost
42466150 reads; of these:
  42466150 (100.00%) were paired; of these:
    1341068 (3.16%) aligned concordantly 0 times
    33644883 (79.23%) aligned concordantly exactly 1 time
    7480199 (17.61%) aligned concordantly >1 times
    ----
    1341068 pairs aligned concordantly 0 times; of these:
      31684 (2.36%) aligned discordantly 1 time
    ----
    1309384 pairs aligned 0 times concordantly or discordantly; of these:
      2618768 mates make up the pairs; of these:
        1706525 (65.17%) aligned 0 times
        466029 (17.80%) aligned exactly 1 time
        446214 (17.04%) aligned >1 times
97.99% overall alignment rate
[bam_sort_core] merging from 36 files...
</pre>
Process 109864 returned: (0). Elapsed: 1:52:03.
> `samtools view -q 10 -b -@ 8 -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`

<pre>
</pre>
Process 132293 returned: (0). Elapsed: 0:02:45.
Follow:
> `Aligned_reads`	74415730	PEPATAC	_RES_
> `Alignment_rate`	70.95	PEPATAC	_RES_
> `Total_efficiency`	70.95	PEPATAC	_RES_

### Calculate NRF, PBC1, and PBC2 (09-17 18:03:32) elapsed: 6965.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam.bai`
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam`

<pre>
</pre>
Process 134946 returned: (0). Elapsed: 0:01:20. Peak memory: (Process: 0.018GB; Pipeline: 0.179GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`

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
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/tmp_gold5_sort_GXxJfs'
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
[Name: chr6_apd_hap1; Size: 4622290]
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
[Name: chr8; Size: 146364022]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr3; Size: 198022430]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1; Size: 249250621]
[Name: chrY; Size: 59373566]
[Name: chrX; Size: 155270560]
[Name: chr14; Size: 107349540]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chrUn_gl000239; Size: 33824]
[Name: chr9_gl000200_random; Size: 187035]
[Name: chr9; Size: 141213431]
[Name: chr12; Size: 133851895]
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
[Name: chr17; Size: 81195210]
[Name: chr20; Size: 63025520]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr19; Size: 59128983]
[Name: chrM; Size: 16571]
[Name: chr5; Size: 180915260]
[Name: chr2; Size: 243199373]
[Name: chr21; Size: 48129895]
[Name: chr16; Size: 90354753]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chr11; Size: 135006516]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr6; Size: 171115067]
[Name: chr4; Size: 191154276]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000228; Size: 129120]
Discarding 1 chunk(s) of reads: ['chrUn_gl000249']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv'
</pre>
Process 134991 returned: (0). Elapsed: 0:01:15. Peak memory: (Process: 0.059GB; Pipeline: 0.179GB)
Follow:
> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_bamQC.tsv`

> `NRF`	0.94	PEPATAC	_RES_
> `PBC1`	0.97	PEPATAC	_RES_
> `PBC2`	32.03	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_unmap.bam`
> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_unmap.bam`

<pre>
</pre>
Process 135215 returned: (0). Elapsed: 0:00:18.

### Remove dupes, build bigwig and bedgraph files (09-17 18:06:25) elapsed: 173.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`
> `java -Xmx15200m -jar /sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar MarkDuplicates INPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_picard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_picard_metrics_log.txt`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
18:06:26.634 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar!/com/intel/gkl/native/libgkl_compression.so
[Mon Sep 17 18:06:26 EDT 2018] MarkDuplicates INPUT=[/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam] OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_picard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 TAG_DUPLICATE_SET_MEMBERS=false REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag CLEAR_DT=true ADD_PG_TAG_TO_READS=true DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 MAX_OPTICAL_DUPLICATE_SET_SIZE=300000 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json USE_JDK_DEFLATER=false USE_JDK_INFLATER=false
[Mon Sep 17 18:06:26 EDT 2018] Executing as jps3dp@udc-ba26-15 on Linux 3.10.0-514.21.2.el7.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_171-b11; Deflater: Intel; Inflater: Intel; Picard version: 2.17.4-1-gb63d73e-SNAPSHOT
INFO	2018-09-17 18:06:26	MarkDuplicates	Start of doWork freeMemory: 2038258176; totalMemory: 2058354688; maxMemory: 14167834624
INFO	2018-09-17 18:06:26	MarkDuplicates	Reading input file and constructing read end information.
INFO	2018-09-17 18:06:26	MarkDuplicates	Will retain up to 51332734 data points before spilling to disk.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold5
WARNING	2018-09-17 18:06:26	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR5210390.27251296. Cause: String 'SRR5210390.27251296' did not start with a parsable number.
INFO	2018-09-17 18:06:31	MarkDuplicates	Read     1,000,000 records.  Elapsed time: 00:00:04s.  Time for last 1,000,000:    4s.  Last read position: chr1:39,971,487
INFO	2018-09-17 18:06:31	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:06:35	MarkDuplicates	Read     2,000,000 records.  Elapsed time: 00:00:08s.  Time for last 1,000,000:    3s.  Last read position: chr1:80,584,567
INFO	2018-09-17 18:06:35	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:06:38	MarkDuplicates	Read     3,000,000 records.  Elapsed time: 00:00:11s.  Time for last 1,000,000:    3s.  Last read position: chr1:118,951,540
INFO	2018-09-17 18:06:38	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:06:43	MarkDuplicates	Read     4,000,000 records.  Elapsed time: 00:00:16s.  Time for last 1,000,000:    4s.  Last read position: chr1:178,439,281
INFO	2018-09-17 18:06:43	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:06:46	MarkDuplicates	Read     5,000,000 records.  Elapsed time: 00:00:19s.  Time for last 1,000,000:    3s.  Last read position: chr1:215,602,207
INFO	2018-09-17 18:06:46	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:06:50	MarkDuplicates	Read     6,000,000 records.  Elapsed time: 00:00:23s.  Time for last 1,000,000:    3s.  Last read position: chr2:3,361,429
INFO	2018-09-17 18:06:50	MarkDuplicates	Tracking 22 as yet unmatched pairs. 22 records in RAM.
INFO	2018-09-17 18:06:54	MarkDuplicates	Read     7,000,000 records.  Elapsed time: 00:00:27s.  Time for last 1,000,000:    3s.  Last read position: chr2:40,454,875
INFO	2018-09-17 18:06:54	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:06:57	MarkDuplicates	Read     8,000,000 records.  Elapsed time: 00:00:30s.  Time for last 1,000,000:    3s.  Last read position: chr2:75,172,196
INFO	2018-09-17 18:06:57	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 18:07:04	MarkDuplicates	Read     9,000,000 records.  Elapsed time: 00:00:37s.  Time for last 1,000,000:    6s.  Last read position: chr2:121,037,351
INFO	2018-09-17 18:07:04	MarkDuplicates	Tracking 34 as yet unmatched pairs. 34 records in RAM.
INFO	2018-09-17 18:07:07	MarkDuplicates	Read    10,000,000 records.  Elapsed time: 00:00:41s.  Time for last 1,000,000:    3s.  Last read position: chr2:159,720,038
INFO	2018-09-17 18:07:07	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:07:11	MarkDuplicates	Read    11,000,000 records.  Elapsed time: 00:00:44s.  Time for last 1,000,000:    3s.  Last read position: chr2:197,265,019
INFO	2018-09-17 18:07:11	MarkDuplicates	Tracking 20 as yet unmatched pairs. 20 records in RAM.
INFO	2018-09-17 18:07:15	MarkDuplicates	Read    12,000,000 records.  Elapsed time: 00:00:48s.  Time for last 1,000,000:    3s.  Last read position: chr2:231,907,904
INFO	2018-09-17 18:07:15	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:07:18	MarkDuplicates	Read    13,000,000 records.  Elapsed time: 00:00:51s.  Time for last 1,000,000:    3s.  Last read position: chr3:25,824,956
INFO	2018-09-17 18:07:18	MarkDuplicates	Tracking 38 as yet unmatched pairs. 38 records in RAM.
INFO	2018-09-17 18:07:22	MarkDuplicates	Read    14,000,000 records.  Elapsed time: 00:00:55s.  Time for last 1,000,000:    3s.  Last read position: chr3:60,213,514
INFO	2018-09-17 18:07:22	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:07:25	MarkDuplicates	Read    15,000,000 records.  Elapsed time: 00:00:58s.  Time for last 1,000,000:    3s.  Last read position: chr3:105,277,708
INFO	2018-09-17 18:07:25	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:07:29	MarkDuplicates	Read    16,000,000 records.  Elapsed time: 00:01:02s.  Time for last 1,000,000:    3s.  Last read position: chr3:140,664,927
INFO	2018-09-17 18:07:29	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:07:33	MarkDuplicates	Read    17,000,000 records.  Elapsed time: 00:01:06s.  Time for last 1,000,000:    3s.  Last read position: chr3:179,041,356
INFO	2018-09-17 18:07:33	MarkDuplicates	Tracking 54 as yet unmatched pairs. 54 records in RAM.
INFO	2018-09-17 18:07:41	MarkDuplicates	Read    18,000,000 records.  Elapsed time: 00:01:14s.  Time for last 1,000,000:    8s.  Last read position: chr4:15,931,593
INFO	2018-09-17 18:07:41	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:07:44	MarkDuplicates	Read    19,000,000 records.  Elapsed time: 00:01:18s.  Time for last 1,000,000:    3s.  Last read position: chr4:58,216,151
INFO	2018-09-17 18:07:44	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:07:48	MarkDuplicates	Read    20,000,000 records.  Elapsed time: 00:01:21s.  Time for last 1,000,000:    3s.  Last read position: chr4:99,359,096
INFO	2018-09-17 18:07:48	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:07:52	MarkDuplicates	Read    21,000,000 records.  Elapsed time: 00:01:25s.  Time for last 1,000,000:    3s.  Last read position: chr4:139,957,277
INFO	2018-09-17 18:07:52	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:07:55	MarkDuplicates	Read    22,000,000 records.  Elapsed time: 00:01:28s.  Time for last 1,000,000:    3s.  Last read position: chr4:178,363,579
INFO	2018-09-17 18:07:55	MarkDuplicates	Tracking 126 as yet unmatched pairs. 126 records in RAM.
INFO	2018-09-17 18:07:59	MarkDuplicates	Read    23,000,000 records.  Elapsed time: 00:01:32s.  Time for last 1,000,000:    3s.  Last read position: chr5:29,518,644
INFO	2018-09-17 18:07:59	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:08:03	MarkDuplicates	Read    24,000,000 records.  Elapsed time: 00:01:36s.  Time for last 1,000,000:    3s.  Last read position: chr5:73,155,825
INFO	2018-09-17 18:08:03	MarkDuplicates	Tracking 36 as yet unmatched pairs. 36 records in RAM.
INFO	2018-09-17 18:08:06	MarkDuplicates	Read    25,000,000 records.  Elapsed time: 00:01:40s.  Time for last 1,000,000:    3s.  Last read position: chr5:112,241,092
INFO	2018-09-17 18:08:06	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:08:10	MarkDuplicates	Read    26,000,000 records.  Elapsed time: 00:01:43s.  Time for last 1,000,000:    3s.  Last read position: chr5:147,304,997
INFO	2018-09-17 18:08:10	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:08:14	MarkDuplicates	Read    27,000,000 records.  Elapsed time: 00:01:47s.  Time for last 1,000,000:    3s.  Last read position: chr6:3,064,053
INFO	2018-09-17 18:08:14	MarkDuplicates	Tracking 102 as yet unmatched pairs. 102 records in RAM.
INFO	2018-09-17 18:08:18	MarkDuplicates	Read    28,000,000 records.  Elapsed time: 00:01:51s.  Time for last 1,000,000:    3s.  Last read position: chr6:43,230,352
INFO	2018-09-17 18:08:18	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:08:22	MarkDuplicates	Read    29,000,000 records.  Elapsed time: 00:01:55s.  Time for last 1,000,000:    3s.  Last read position: chr6:84,565,460
INFO	2018-09-17 18:08:22	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:08:25	MarkDuplicates	Read    30,000,000 records.  Elapsed time: 00:01:58s.  Time for last 1,000,000:    3s.  Last read position: chr6:123,127,633
INFO	2018-09-17 18:08:25	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:08:29	MarkDuplicates	Read    31,000,000 records.  Elapsed time: 00:02:02s.  Time for last 1,000,000:    3s.  Last read position: chr6:158,683,129
INFO	2018-09-17 18:08:29	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:08:33	MarkDuplicates	Read    32,000,000 records.  Elapsed time: 00:02:06s.  Time for last 1,000,000:    3s.  Last read position: chr7:23,128,628
INFO	2018-09-17 18:08:33	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:08:37	MarkDuplicates	Read    33,000,000 records.  Elapsed time: 00:02:10s.  Time for last 1,000,000:    3s.  Last read position: chr7:64,114,790
INFO	2018-09-17 18:08:37	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:08:40	MarkDuplicates	Read    34,000,000 records.  Elapsed time: 00:02:13s.  Time for last 1,000,000:    3s.  Last read position: chr7:102,985,184
INFO	2018-09-17 18:08:40	MarkDuplicates	Tracking 68 as yet unmatched pairs. 68 records in RAM.
INFO	2018-09-17 18:08:52	MarkDuplicates	Read    35,000,000 records.  Elapsed time: 00:02:25s.  Time for last 1,000,000:   12s.  Last read position: chr7:140,058,754
INFO	2018-09-17 18:08:52	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 18:08:56	MarkDuplicates	Read    36,000,000 records.  Elapsed time: 00:02:29s.  Time for last 1,000,000:    3s.  Last read position: chrX:24,789,417
INFO	2018-09-17 18:08:56	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:09:00	MarkDuplicates	Read    37,000,000 records.  Elapsed time: 00:02:33s.  Time for last 1,000,000:    4s.  Last read position: chrX:76,933,910
INFO	2018-09-17 18:09:00	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:09:04	MarkDuplicates	Read    38,000,000 records.  Elapsed time: 00:02:37s.  Time for last 1,000,000:    3s.  Last read position: chrX:129,065,735
INFO	2018-09-17 18:09:04	MarkDuplicates	Tracking 42 as yet unmatched pairs. 42 records in RAM.
INFO	2018-09-17 18:09:07	MarkDuplicates	Read    39,000,000 records.  Elapsed time: 00:02:41s.  Time for last 1,000,000:    3s.  Last read position: chr8:17,941,059
INFO	2018-09-17 18:09:07	MarkDuplicates	Tracking 30 as yet unmatched pairs. 30 records in RAM.
INFO	2018-09-17 18:09:11	MarkDuplicates	Read    40,000,000 records.  Elapsed time: 00:02:45s.  Time for last 1,000,000:    4s.  Last read position: chr8:56,923,282
INFO	2018-09-17 18:09:11	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 18:09:16	MarkDuplicates	Read    41,000,000 records.  Elapsed time: 00:02:49s.  Time for last 1,000,000:    4s.  Last read position: chr8:94,947,663
INFO	2018-09-17 18:09:16	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 18:09:19	MarkDuplicates	Read    42,000,000 records.  Elapsed time: 00:02:52s.  Time for last 1,000,000:    3s.  Last read position: chr8:131,515,557
INFO	2018-09-17 18:09:19	MarkDuplicates	Tracking 30 as yet unmatched pairs. 30 records in RAM.
INFO	2018-09-17 18:09:23	MarkDuplicates	Read    43,000,000 records.  Elapsed time: 00:02:56s.  Time for last 1,000,000:    4s.  Last read position: chr9:22,159,191
INFO	2018-09-17 18:09:23	MarkDuplicates	Tracking 84 as yet unmatched pairs. 84 records in RAM.
INFO	2018-09-17 18:09:28	MarkDuplicates	Read    44,000,000 records.  Elapsed time: 00:03:01s.  Time for last 1,000,000:    4s.  Last read position: chr9:90,144,488
INFO	2018-09-17 18:09:28	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 18:09:32	MarkDuplicates	Read    45,000,000 records.  Elapsed time: 00:03:05s.  Time for last 1,000,000:    4s.  Last read position: chr9:127,951,963
INFO	2018-09-17 18:09:32	MarkDuplicates	Tracking 28 as yet unmatched pairs. 28 records in RAM.
INFO	2018-09-17 18:09:36	MarkDuplicates	Read    46,000,000 records.  Elapsed time: 00:03:09s.  Time for last 1,000,000:    4s.  Last read position: chr10:23,555,196
INFO	2018-09-17 18:09:36	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:09:40	MarkDuplicates	Read    47,000,000 records.  Elapsed time: 00:03:13s.  Time for last 1,000,000:    4s.  Last read position: chr10:67,177,133
INFO	2018-09-17 18:09:40	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:09:44	MarkDuplicates	Read    48,000,000 records.  Elapsed time: 00:03:17s.  Time for last 1,000,000:    3s.  Last read position: chr10:103,803,161
INFO	2018-09-17 18:09:44	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:10:00	MarkDuplicates	Read    49,000,000 records.  Elapsed time: 00:03:33s.  Time for last 1,000,000:   15s.  Last read position: chr11:2,950,496
INFO	2018-09-17 18:10:00	MarkDuplicates	Tracking 26 as yet unmatched pairs. 26 records in RAM.
INFO	2018-09-17 18:10:04	MarkDuplicates	Read    50,000,000 records.  Elapsed time: 00:03:37s.  Time for last 1,000,000:    3s.  Last read position: chr11:40,182,302
INFO	2018-09-17 18:10:04	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:10:07	MarkDuplicates	Read    51,000,000 records.  Elapsed time: 00:03:41s.  Time for last 1,000,000:    3s.  Last read position: chr11:77,899,619
INFO	2018-09-17 18:10:07	MarkDuplicates	Tracking 86 as yet unmatched pairs. 86 records in RAM.
INFO	2018-09-17 18:10:27	MarkDuplicates	Read    52,000,000 records.  Elapsed time: 00:04:00s.  Time for last 1,000,000:   19s.  Last read position: chr11:116,813,732
INFO	2018-09-17 18:10:27	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:10:31	MarkDuplicates	Read    53,000,000 records.  Elapsed time: 00:04:04s.  Time for last 1,000,000:    3s.  Last read position: chr12:18,179,870
INFO	2018-09-17 18:10:31	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:10:35	MarkDuplicates	Read    54,000,000 records.  Elapsed time: 00:04:08s.  Time for last 1,000,000:    3s.  Last read position: chr12:57,481,783
INFO	2018-09-17 18:10:35	MarkDuplicates	Tracking 40 as yet unmatched pairs. 40 records in RAM.
INFO	2018-09-17 18:10:39	MarkDuplicates	Read    55,000,000 records.  Elapsed time: 00:04:12s.  Time for last 1,000,000:    4s.  Last read position: chr12:95,072,376
INFO	2018-09-17 18:10:39	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 18:10:43	MarkDuplicates	Read    56,000,000 records.  Elapsed time: 00:04:16s.  Time for last 1,000,000:    3s.  Last read position: chr12:130,755,907
INFO	2018-09-17 18:10:43	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:10:47	MarkDuplicates	Read    57,000,000 records.  Elapsed time: 00:04:20s.  Time for last 1,000,000:    4s.  Last read position: chr13:53,937,838
INFO	2018-09-17 18:10:47	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:10:51	MarkDuplicates	Read    58,000,000 records.  Elapsed time: 00:04:24s.  Time for last 1,000,000:    4s.  Last read position: chr13:99,129,000
INFO	2018-09-17 18:10:51	MarkDuplicates	Tracking 28 as yet unmatched pairs. 28 records in RAM.
INFO	2018-09-17 18:10:55	MarkDuplicates	Read    59,000,000 records.  Elapsed time: 00:04:29s.  Time for last 1,000,000:    4s.  Last read position: chr14:41,179,920
INFO	2018-09-17 18:10:55	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:00	MarkDuplicates	Read    60,000,000 records.  Elapsed time: 00:04:33s.  Time for last 1,000,000:    4s.  Last read position: chr14:77,587,984
INFO	2018-09-17 18:11:00	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 18:11:04	MarkDuplicates	Read    61,000,000 records.  Elapsed time: 00:04:37s.  Time for last 1,000,000:    4s.  Last read position: chr15:31,595,758
INFO	2018-09-17 18:11:04	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:09	MarkDuplicates	Read    62,000,000 records.  Elapsed time: 00:04:42s.  Time for last 1,000,000:    4s.  Last read position: chr15:70,559,179
INFO	2018-09-17 18:11:09	MarkDuplicates	Tracking 46 as yet unmatched pairs. 46 records in RAM.
INFO	2018-09-17 18:11:13	MarkDuplicates	Read    63,000,000 records.  Elapsed time: 00:04:46s.  Time for last 1,000,000:    4s.  Last read position: chr16:6,027,538
INFO	2018-09-17 18:11:13	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 18:11:19	MarkDuplicates	Read    64,000,000 records.  Elapsed time: 00:04:52s.  Time for last 1,000,000:    5s.  Last read position: chr16:57,067,968
INFO	2018-09-17 18:11:19	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:23	MarkDuplicates	Read    65,000,000 records.  Elapsed time: 00:04:56s.  Time for last 1,000,000:    4s.  Last read position: chr17:2,653,254
INFO	2018-09-17 18:11:23	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 18:11:28	MarkDuplicates	Read    66,000,000 records.  Elapsed time: 00:05:01s.  Time for last 1,000,000:    4s.  Last read position: chr17:43,227,150
INFO	2018-09-17 18:11:28	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 18:11:32	MarkDuplicates	Read    67,000,000 records.  Elapsed time: 00:05:05s.  Time for last 1,000,000:    4s.  Last read position: chr18:206,228
INFO	2018-09-17 18:11:32	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:36	MarkDuplicates	Read    68,000,000 records.  Elapsed time: 00:05:09s.  Time for last 1,000,000:    4s.  Last read position: chr18:41,513,468
INFO	2018-09-17 18:11:36	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:40	MarkDuplicates	Read    69,000,000 records.  Elapsed time: 00:05:13s.  Time for last 1,000,000:    4s.  Last read position: chr20:63,507
INFO	2018-09-17 18:11:40	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:44	MarkDuplicates	Read    70,000,000 records.  Elapsed time: 00:05:18s.  Time for last 1,000,000:    4s.  Last read position: chr20:38,237,752
INFO	2018-09-17 18:11:44	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:11:48	MarkDuplicates	Read    71,000,000 records.  Elapsed time: 00:05:21s.  Time for last 1,000,000:    3s.  Last read position: chr19:9,484,209
INFO	2018-09-17 18:11:48	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 18:11:52	MarkDuplicates	Read    72,000,000 records.  Elapsed time: 00:05:25s.  Time for last 1,000,000:    3s.  Last read position: chr19:46,012,723
INFO	2018-09-17 18:11:52	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 18:11:56	MarkDuplicates	Read    73,000,000 records.  Elapsed time: 00:05:29s.  Time for last 1,000,000:    3s.  Last read position: chr22:40,335,608
INFO	2018-09-17 18:11:56	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:12:00	MarkDuplicates	Read    74,000,000 records.  Elapsed time: 00:05:33s.  Time for last 1,000,000:    4s.  Last read position: chr21:41,078,284
INFO	2018-09-17 18:12:00	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 18:12:02	MarkDuplicates	Read 74415730 records. 0 pairs never matched.
INFO	2018-09-17 18:12:21	MarkDuplicates	After buildSortedReadEndLists freeMemory: 8305162616; totalMemory: 11250696192; maxMemory: 14167834624
INFO	2018-09-17 18:12:21	MarkDuplicates	Will retain up to 442744832 duplicate indices before spilling to disk.
INFO	2018-09-17 18:12:22	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2018-09-17 18:12:24	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2018-09-17 18:12:42	MarkDuplicates	Sorting list of duplicate records.
INFO	2018-09-17 18:12:42	MarkDuplicates	After generateDuplicateIndexes freeMemory: 8674651184; totalMemory: 12280922112; maxMemory: 14167834624
INFO	2018-09-17 18:12:42	MarkDuplicates	Marking 2617808 records as duplicates.
INFO	2018-09-17 18:12:42	MarkDuplicates	Found 0 optical duplicate clusters.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold5
INFO	2018-09-17 18:12:42	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2018-09-17 18:13:39	MarkDuplicates	Written    10,000,000 records.  Elapsed time: 00:00:56s.  Time for last 10,000,000:   56s.  Last read position: chr2:174,129,402
INFO	2018-09-17 18:14:35	MarkDuplicates	Written    20,000,000 records.  Elapsed time: 00:01:53s.  Time for last 10,000,000:   56s.  Last read position: chr4:128,747,377
INFO	2018-09-17 18:15:32	MarkDuplicates	Written    30,000,000 records.  Elapsed time: 00:02:50s.  Time for last 10,000,000:   56s.  Last read position: chr6:161,943,646
INFO	2018-09-17 18:16:29	MarkDuplicates	Written    40,000,000 records.  Elapsed time: 00:03:47s.  Time for last 10,000,000:   57s.  Last read position: chr8:111,697,399
INFO	2018-09-17 18:17:26	MarkDuplicates	Written    50,000,000 records.  Elapsed time: 00:04:44s.  Time for last 10,000,000:   57s.  Last read position: chr11:110,431,871
INFO	2018-09-17 18:18:24	MarkDuplicates	Written    60,000,000 records.  Elapsed time: 00:05:42s.  Time for last 10,000,000:   57s.  Last read position: chr15:78,498,506
INFO	2018-09-17 18:19:22	MarkDuplicates	Written    70,000,000 records.  Elapsed time: 00:06:39s.  Time for last 10,000,000:   57s.  Last read position: chr22:22,295,125
INFO	2018-09-17 18:19:32	MarkDuplicates	Before output close freeMemory: 11669904952; totalMemory: 11743002624; maxMemory: 14167834624
INFO	2018-09-17 18:19:32	MarkDuplicates	After output close freeMemory: 11723906616; totalMemory: 11797004288; maxMemory: 14167834624
[Mon Sep 17 18:19:32 EDT 2018] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 13.10 minutes.
Runtime.totalMemory()=11797004288
</pre>
Process 135227 returned: (0). Elapsed: 0:13:08.
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

<pre>
</pre>
Process 137352 returned: (0). Elapsed: 0:01:27. Peak memory: (Process: 0.017GB; Pipeline: 0.179GB)
Follow:
> `awk -F'	' -f /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/extract_post_dup_aligned_reads.awk /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_picard_metrics_bam.txt`

> `Duplicate_reads`	2617808.0	PEPATAC	_RES_
> `Dedup_aligned_reads`	71797922	PEPATAC	_RES_
> `Dedup_alignment_rate`	68.46	PEPATAC	_RES_
> `Dedup_total_efficiency`	68.46	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (09-17 18:21:00) elapsed: 875.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/gold5_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/tmp_gold5_sort_dedup_cuttrace_AE_L5L'
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
[Name: chr20; Size: 63025520]
[Name: chrM; Size: 16571]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
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
Discarding 1 chunk(s) of reads: ['chrUn_gl000249']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/gold5_exact.bw'
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_smooth.bw'
</pre>
Process 137552 returned: (0). Elapsed: 0:17:31. Peak memory: (Process: 0.028GB; Pipeline: 0.179GB)
> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 139122 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.179GB)

### Calculate TSS enrichment (09-17 18:38:31) elapsed: 1051.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt`

<pre>
</pre>
Process 139123 returned: (0). Elapsed: 0:00:18. Peak memory: (Process: 0.219GB; Pipeline: 0.179GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.txt
Completed!

</pre>
Process 139170 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.032GB; Pipeline: 0.219GB)
> `TSS_Score`	12.6835133701	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold5_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold5_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-17 18:38:53) elapsed: 21.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragLen.txt`

<pre>
</pre>
Process 139177 returned: (0). Elapsed: 0:03:43. Peak memory: (Process: 0.002GB; Pipeline: 0.219GB)
> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragCount.txt`

<pre>
</pre>
Process 139405 returned: (0). Elapsed: 0:00:21.
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.txt`

<pre>
</pre>
Process 139424 returned: (0). Elapsed: 0:00:10. Peak memory: (Process: 0.423GB; Pipeline: 0.219GB)
> `Fragment distribution`	QC_hg19/gold5_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold5_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-17 18:43:06) elapsed: 254.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak`
> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19 -n gold5 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Mon, 17 Sep 2018 18:43:11: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19 -n gold5 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold5
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/gold5_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Mon, 17 Sep 2018 18:43:11: #1 read tag files... 
INFO  @ Mon, 17 Sep 2018 18:43:11: #1 read treatment tags... 
INFO  @ Mon, 17 Sep 2018 18:43:12:  1000000 
INFO  @ Mon, 17 Sep 2018 18:43:13:  2000000 
INFO  @ Mon, 17 Sep 2018 18:43:14:  3000000 
INFO  @ Mon, 17 Sep 2018 18:43:14:  4000000 
INFO  @ Mon, 17 Sep 2018 18:43:15:  5000000 
INFO  @ Mon, 17 Sep 2018 18:43:16:  6000000 
INFO  @ Mon, 17 Sep 2018 18:43:17:  7000000 
INFO  @ Mon, 17 Sep 2018 18:43:18:  8000000 
INFO  @ Mon, 17 Sep 2018 18:43:19:  9000000 
INFO  @ Mon, 17 Sep 2018 18:43:20:  10000000 
INFO  @ Mon, 17 Sep 2018 18:43:21:  11000000 
INFO  @ Mon, 17 Sep 2018 18:43:22:  12000000 
INFO  @ Mon, 17 Sep 2018 18:43:22:  13000000 
INFO  @ Mon, 17 Sep 2018 18:43:23:  14000000 
INFO  @ Mon, 17 Sep 2018 18:43:24:  15000000 
INFO  @ Mon, 17 Sep 2018 18:43:25:  16000000 
INFO  @ Mon, 17 Sep 2018 18:43:26:  17000000 
INFO  @ Mon, 17 Sep 2018 18:43:27:  18000000 
INFO  @ Mon, 17 Sep 2018 18:43:28:  19000000 
INFO  @ Mon, 17 Sep 2018 18:43:29:  20000000 
INFO  @ Mon, 17 Sep 2018 18:43:30:  21000000 
INFO  @ Mon, 17 Sep 2018 18:43:30:  22000000 
INFO  @ Mon, 17 Sep 2018 18:43:31:  23000000 
INFO  @ Mon, 17 Sep 2018 18:43:32:  24000000 
INFO  @ Mon, 17 Sep 2018 18:43:33:  25000000 
INFO  @ Mon, 17 Sep 2018 18:43:34:  26000000 
INFO  @ Mon, 17 Sep 2018 18:43:35:  27000000 
INFO  @ Mon, 17 Sep 2018 18:43:36:  28000000 
INFO  @ Mon, 17 Sep 2018 18:43:37:  29000000 
INFO  @ Mon, 17 Sep 2018 18:43:37:  30000000 
INFO  @ Mon, 17 Sep 2018 18:43:38:  31000000 
INFO  @ Mon, 17 Sep 2018 18:43:39:  32000000 
INFO  @ Mon, 17 Sep 2018 18:43:40:  33000000 
INFO  @ Mon, 17 Sep 2018 18:43:41:  34000000 
INFO  @ Mon, 17 Sep 2018 18:43:42:  35000000 
INFO  @ Mon, 17 Sep 2018 18:43:42:  36000000 
INFO  @ Mon, 17 Sep 2018 18:43:43:  37000000 
INFO  @ Mon, 17 Sep 2018 18:43:44:  38000000 
INFO  @ Mon, 17 Sep 2018 18:43:45:  39000000 
INFO  @ Mon, 17 Sep 2018 18:43:46:  40000000 
INFO  @ Mon, 17 Sep 2018 18:43:47:  41000000 
INFO  @ Mon, 17 Sep 2018 18:43:47:  42000000 
INFO  @ Mon, 17 Sep 2018 18:43:48:  43000000 
INFO  @ Mon, 17 Sep 2018 18:43:49:  44000000 
INFO  @ Mon, 17 Sep 2018 18:43:50:  45000000 
INFO  @ Mon, 17 Sep 2018 18:43:51:  46000000 
INFO  @ Mon, 17 Sep 2018 18:43:52:  47000000 
INFO  @ Mon, 17 Sep 2018 18:43:53:  48000000 
INFO  @ Mon, 17 Sep 2018 18:43:53:  49000000 
INFO  @ Mon, 17 Sep 2018 18:43:54:  50000000 
INFO  @ Mon, 17 Sep 2018 18:43:55:  51000000 
INFO  @ Mon, 17 Sep 2018 18:43:56:  52000000 
INFO  @ Mon, 17 Sep 2018 18:43:57:  53000000 
INFO  @ Mon, 17 Sep 2018 18:43:58:  54000000 
INFO  @ Mon, 17 Sep 2018 18:43:58:  55000000 
INFO  @ Mon, 17 Sep 2018 18:43:59:  56000000 
INFO  @ Mon, 17 Sep 2018 18:44:00:  57000000 
INFO  @ Mon, 17 Sep 2018 18:44:01:  58000000 
INFO  @ Mon, 17 Sep 2018 18:44:02:  59000000 
INFO  @ Mon, 17 Sep 2018 18:44:03:  60000000 
INFO  @ Mon, 17 Sep 2018 18:44:04:  61000000 
INFO  @ Mon, 17 Sep 2018 18:44:04:  62000000 
INFO  @ Mon, 17 Sep 2018 18:44:05:  63000000 
INFO  @ Mon, 17 Sep 2018 18:44:06:  64000000 
INFO  @ Mon, 17 Sep 2018 18:44:07:  65000000 
INFO  @ Mon, 17 Sep 2018 18:44:08:  66000000 
INFO  @ Mon, 17 Sep 2018 18:44:09:  67000000 
INFO  @ Mon, 17 Sep 2018 18:44:10:  68000000 
INFO  @ Mon, 17 Sep 2018 18:44:10:  69000000 
INFO  @ Mon, 17 Sep 2018 18:44:11:  70000000 
INFO  @ Mon, 17 Sep 2018 18:44:12:  71000000 
INFO  @ Mon, 17 Sep 2018 18:44:14: #1 tag size is determined as 50 bps 
INFO  @ Mon, 17 Sep 2018 18:44:14: #1 tag size = 50 
INFO  @ Mon, 17 Sep 2018 18:44:14: #1  total tags in treatment: 71797857 
INFO  @ Mon, 17 Sep 2018 18:44:14: #1 user defined the maximum tags... 
INFO  @ Mon, 17 Sep 2018 18:44:14: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Mon, 17 Sep 2018 18:44:15: #1  tags after filtering in treatment: 63400769 
INFO  @ Mon, 17 Sep 2018 18:44:15: #1  Redundant rate of treatment: 0.12 
INFO  @ Mon, 17 Sep 2018 18:44:15: #1 finished! 
INFO  @ Mon, 17 Sep 2018 18:44:15: #2 Build Peak Model... 
INFO  @ Mon, 17 Sep 2018 18:44:15: #2 Skipped... 
INFO  @ Mon, 17 Sep 2018 18:44:15: #2 Use 200 as fragment length 
INFO  @ Mon, 17 Sep 2018 18:44:15: #3 Call peaks... 
INFO  @ Mon, 17 Sep 2018 18:44:15: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 17 Sep 2018 18:46:24: #3 Call peaks for each chromosome... 
INFO  @ Mon, 17 Sep 2018 18:47:34: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.xls 
INFO  @ Mon, 17 Sep 2018 18:47:34: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak 
INFO  @ Mon, 17 Sep 2018 18:47:35: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_summits.bed 
INFO  @ Mon, 17 Sep 2018 18:47:35: Done! 
</pre>
Process 139431 returned: (0). Elapsed: 0:04:29. Peak memory: (Process: 0.996GB; Pipeline: 0.423GB)
Follow:
> `Peak_count`	117275	PEPATAC	_RES_

### # Calculate fraction of reads in peaks (FRiP) (09-17 18:47:36) elapsed: 269.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

('74415730', '18373184\n')
> `FRiP`	0.246899197253	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-17 18:48:51) elapsed: 76.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bigBed`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bigBed`

<pre>
pass1 - making usageList (58 chroms): 20 millis
pass2 - checking and writing primary data (117276 records, 10 fields): 387 millis
[1] TRUE
[1] TRUE
</pre>
Process 139696 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.103GB; Pipeline: 0.996GB)

### # Calculate peak coverage (09-17 18:48:57) elapsed: 6.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed`

<pre>
</pre>
Process 139704 returned: (0). Elapsed: 0:00:00.
> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 139706 returned: (0). Elapsed: 0:00:00.
> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed`

<pre>
</pre>
Process 139711 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed`

<pre>
</pre>
Process 139713 returned: (0). Elapsed: 0:01:56.

### # Calculate read coverage (09-17 18:50:54) elapsed: 117.0 _TIME_

> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3' UTR`
> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/"$4}'`

<pre>
</pre>
Process 139919 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 139922 returned: (0). Elapsed: 0:00:03.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed`

<pre>
</pre>
Process 139925 returned: (0). Elapsed: 0:01:37.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 139936 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed`

<pre>
</pre>
Process 139939 returned: (0). Elapsed: 0:01:38.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 139959 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed`

<pre>
</pre>
Process 139962 returned: (0). Elapsed: 0:01:38.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 140158 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed`

<pre>
</pre>
Process 140161 returned: (0). Elapsed: 0:01:58.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 140181 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed`

<pre>
</pre>
Process 140184 returned: (0). Elapsed: 0:01:39.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 140196 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 140199 returned: (0). Elapsed: 0:01:39.

### # Plot FRiP/F (09-17 19:01:12) elapsed: 619.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed', '71491888', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_frif.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_coverage.bed 71491888 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 140446 returned: (0). Elapsed: 0:00:34. Peak memory: (Process: 0.479GB; Pipeline: 0.996GB)
> `Cumulative FRiF`	QC_hg19/gold5_frif.pdf	Cumulative FRiF	QC_hg19/gold5_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-17 19:02:00) elapsed: 48.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/gold5_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.narrowPeak gold5 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Promoter :	found 15541
Promoter Flanking Region :	found 29782
5' UTR :	found 810
3' UTR :	found 1473
Exon :	found 2725
Intron :	found 33632
Peak annotation complete!

</pre>
Process 140462 returned: (0). Elapsed: 0:00:19. Peak memory: (Process: 0.297GB; Pipeline: 0.996GB)
> `Peak chromosome distribution`	QC_hg19/gold5_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold5_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold5_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold5_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold5_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold5_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/tmpIoHcG5
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/tmpIoHcG5`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/prealignments/bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/tmpZZADBE
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/tmpZZADBE`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19/gold5_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/peak_calling_hg19/gold5_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5_R1.trim.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold5/fastq/gold5-trimmed.log`
> `Time`	3:14:56	PEPATAC	_RES_
> `Success`	09-17-19:02:19	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  3:14:56
*     Peak memory used:  1.0 GB
* Pipeline completed at:  (09-17 19:02:19) elapsed: 19.0 _TIME_

Pypiper terminating spawned child process 103139...(tee)
