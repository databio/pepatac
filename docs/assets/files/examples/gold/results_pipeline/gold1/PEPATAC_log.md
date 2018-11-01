----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
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
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-17 15:47:24) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`

<pre>
</pre>
Process 133870 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`

<pre>
</pre>
Process 133871 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`

<pre>
</pre>
Process 133872 returned: (0). Elapsed: 0:01:02.
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.fastq`

<pre>
</pre>
Process 133941 returned: (0). Elapsed: 0:01:03.
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.fastq']
> `Raw_reads`	137944752	PEPATAC	_RES_
> `Fastq_reads`	137944752	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-17 15:54:12) elapsed: 408.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.fastq`

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
Mon Sep 17 15:54:12 2018[0;32m >> started[0m

Mon Sep 17 16:04:58 2018[0;32m >> done[0m (645.859s)
68972376 read pairs processed; of these:
    1333 ( 0.00%) short read pairs filtered out after trimming by size control
    8642 ( 0.01%) empty read pairs filtered out after trimming by size control
68962401 (99.99%) read pairs available; of these:
27985138 (40.58%) trimmed read pairs available after processing
40977263 (59.42%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1-trimmed.log".
</pre>
Process 136798 returned: (0). Elapsed: 0:10:46. Peak memory: (Process: 0.02GB; Pipeline: 0.0GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`

<pre>
</pre>
Process 149894 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.02GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.trim.fastq`

<pre>
</pre>
Process 149895 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.02GB)
Follow:
Evaluating read trimming
> `Trimmed_reads`	137924802	PEPATAC	_RES_
> `Trim_loss_rate`	0.01	PEPATAC	_RES_

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`

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
Process 150082 returned: (0). Elapsed: 0:04:49. Peak memory: (Process: 0.195GB; Pipeline: 0.02GB)

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.trim.fastq`

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
Process 151889 returned: (0). Elapsed: 0:05:07. Peak memory: (Process: 0.193GB; Pipeline: 0.195GB)
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-17 16:15:22) elapsed: 1270.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-17 16:15:22) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

<pre>
</pre>
Process 158268 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.195GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 158274

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id gold1 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 158275 returned: (0). Elapsed: 0:09:30.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-17 16:24:52) elapsed: 571.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold1 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpeQXFZk -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam`

<pre>
10524950 reads skipped
0 reads lost
58437451 reads; of these:
  58437451 (100.00%) were paired; of these:
    2770057 (4.74%) aligned concordantly 0 times
    43370388 (74.22%) aligned concordantly exactly 1 time
    12297006 (21.04%) aligned concordantly >1 times
    ----
    2770057 pairs aligned concordantly 0 times; of these:
      67958 (2.45%) aligned discordantly 1 time
    ----
    2702099 pairs aligned 0 times concordantly or discordantly; of these:
      5404198 mates make up the pairs; of these:
        4165606 (77.08%) aligned 0 times
        682849 (12.64%) aligned exactly 1 time
        555743 (10.28%) aligned >1 times
96.44% overall alignment rate
[bam_sort_core] merging from 49 files...
</pre>
Process 160147 returned: (0). Elapsed: 3:11:15.
> `samtools view -q 10 -b -@ 8 -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

<pre>
</pre>
Process 9340 returned: (0). Elapsed: 0:04:37.
Follow:
> `Aligned_reads`	99103986	PEPATAC	_RES_
> `Alignment_rate`	71.85	PEPATAC	_RES_
> `Total_efficiency`	71.84	PEPATAC	_RES_

### Calculate NRF, PBC1, and PBC2 (09-17 19:43:05) elapsed: 11892.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

<pre>
</pre>
Process 11601 returned: (0). Elapsed: 0:02:23. Peak memory: (Process: 0.02GB; Pipeline: 0.195GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

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
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/tmp_gold1_sort_OH9kUi'
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
[Name: chr21_gl000210_random; Size: 27682]
[Name: chrUn_gl000230; Size: 43691]
[Name: chrUn_gl000234; Size: 40531]
[Name: chrUn_gl000232; Size: 40652]
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
[Name: chrUn_gl000248; Size: 39786]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr8; Size: 146364022]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr3; Size: 198022430]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chrX; Size: 155270560]
[Name: chrY; Size: 59373566]
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
[Name: chr14; Size: 107349540]
[Name: chrUn_gl000239; Size: 33824]
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
[Name: chr11; Size: 135006516]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chr16; Size: 90354753]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr5; Size: 180915260]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chr4; Size: 191154276]
Got SIGTERM. Failing gracefully... (09-17 19:47:50) elapsed: 286.0 _TIME_
Got SIGTERM. Failing gracefully... (09-17 19:47:50) elapsed: 0.0 _TIME_
</pre>

Pypiper terminating spawned child process 158274...(perl)
Child not responding to SIGTERM, trying SIGKILL...
Child process SIGKILLed after 5.0 seconds.
</pre>

Pypiper terminating spawned child process 12306...(/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py)
Process PoolWorker-6:
Traceback (most recent call last):
  File "/apps/software/standard/core/anaconda2/4.4.0/lib/python2.7/multiprocessing/process.py", line 267, in _bootstrap
    self.run()
  File "/apps/software/standard/core/anaconda2/4.4.0/lib/python2.7/multiprocessing/process.py", line 114, in run
    self._target(*self._args, **self._kwargs)
  File "/apps/software/standard/core/anaconda2/4.4.0/lib/python2.7/multiprocessing/pool.py", line 122, in worker
    put((job, i, (False, wrapped)))
  File "/apps/software/standard/core/anaconda2/4.4.0/lib/python2.7/multiprocessing/queues.py", line 390, in put
    return send(obj)
IOError: [Errno 32] Broken pipe
Child not responding to SIGTERM, trying SIGKILL...
Child process SIGKILLed after 5.0 seconds.
Setting dynamic recover file: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/recover.lock.QC_hg19__gold1_bamQC.tsv

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmp2Vw4fx', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpeQXFZk']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmp2Vw4fx', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpeQXFZk', skipping

### Pipeline failed at:  (09-17 19:48:01) elapsed: 10.0 _TIME_

Total time: 4:00:37

Changed status from running to failed.
Pipeline aborted.

Pypiper terminating spawned child process 133842...(tee)
Child not responding to SIGTERM, trying SIGKILL...----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-17 20:26:58) elapsed: 1.0 _TIME_

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
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-17 20:26:59) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-17 20:26:59) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-17 20:26:59) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-17 20:26:59) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-17 20:26:59) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-17 20:26:59) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

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
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/tmp_gold1_sort_oqxVY4'
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
[Name: chrUn_gl000245; Size: 36651]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000242; Size: 43523]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000243; Size: 43341]
[Name: chrUn_gl000248; Size: 39786]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr8; Size: 146364022]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr3; Size: 198022430]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_gl000194_random; Size: 191469]
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
[Name: chr21; Size: 48129895]
[Name: chr14; Size: 107349540]
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
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chr11; Size: 135006516]
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
Merging 93 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv'
</pre>
Process 37812 returned: (0). Elapsed: 0:02:29. Peak memory: (Process: 0.059GB; Pipeline: 0.0GB)
Follow:
> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

> `NRF`	0.94	PEPATAC	_RES_
> `PBC1`	0.97	PEPATAC	_RES_
> `PBC2`	31.62	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`
> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

<pre>
</pre>
Process 38794 returned: (0). Elapsed: 0:00:37.

### Remove dupes, build bigwig and bedgraph files (09-17 20:30:06) elapsed: 187.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`
> `java -Xmx15200m -jar /sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar MarkDuplicates INPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_picard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_picard_metrics_log.txt`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
20:30:07.154 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar!/com/intel/gkl/native/libgkl_compression.so
[Mon Sep 17 20:30:07 EDT 2018] MarkDuplicates INPUT=[/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam] OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_picard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 TAG_DUPLICATE_SET_MEMBERS=false REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag CLEAR_DT=true ADD_PG_TAG_TO_READS=true DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 MAX_OPTICAL_DUPLICATE_SET_SIZE=300000 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json USE_JDK_DEFLATER=false USE_JDK_INFLATER=false
[Mon Sep 17 20:30:07 EDT 2018] Executing as jps3dp@udc-ba26-18 on Linux 3.10.0-514.21.2.el7.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_171-b11; Deflater: Intel; Inflater: Intel; Picard version: 2.17.4-1-gb63d73e-SNAPSHOT
INFO	2018-09-17 20:30:07	MarkDuplicates	Start of doWork freeMemory: 2038258288; totalMemory: 2058354688; maxMemory: 14167834624
INFO	2018-09-17 20:30:07	MarkDuplicates	Reading input file and constructing read end information.
INFO	2018-09-17 20:30:07	MarkDuplicates	Will retain up to 51332734 data points before spilling to disk.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold1
WARNING	2018-09-17 20:30:07	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR5210416.23722984. Cause: String 'SRR5210416.23722984' did not start with a parsable number.
INFO	2018-09-17 20:30:12	MarkDuplicates	Read     1,000,000 records.  Elapsed time: 00:00:04s.  Time for last 1,000,000:    4s.  Last read position: chr1:26,406,444
INFO	2018-09-17 20:30:12	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:30:17	MarkDuplicates	Read     2,000,000 records.  Elapsed time: 00:00:09s.  Time for last 1,000,000:    4s.  Last read position: chr1:53,729,171
INFO	2018-09-17 20:30:17	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:30:21	MarkDuplicates	Read     3,000,000 records.  Elapsed time: 00:00:13s.  Time for last 1,000,000:    4s.  Last read position: chr1:84,852,930
INFO	2018-09-17 20:30:21	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:30:25	MarkDuplicates	Read     4,000,000 records.  Elapsed time: 00:00:18s.  Time for last 1,000,000:    4s.  Last read position: chr1:114,814,864
INFO	2018-09-17 20:30:25	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:30:29	MarkDuplicates	Read     5,000,000 records.  Elapsed time: 00:00:22s.  Time for last 1,000,000:    3s.  Last read position: chr1:165,562,601
INFO	2018-09-17 20:30:29	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:30:34	MarkDuplicates	Read     6,000,000 records.  Elapsed time: 00:00:26s.  Time for last 1,000,000:    4s.  Last read position: chr1:194,948,113
INFO	2018-09-17 20:30:34	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:30:40	MarkDuplicates	Read     7,000,000 records.  Elapsed time: 00:00:32s.  Time for last 1,000,000:    6s.  Last read position: chr1:223,549,964
INFO	2018-09-17 20:30:40	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:30:44	MarkDuplicates	Read     8,000,000 records.  Elapsed time: 00:00:36s.  Time for last 1,000,000:    3s.  Last read position: chr2:2,061,008
INFO	2018-09-17 20:30:44	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:30:51	MarkDuplicates	Read     9,000,000 records.  Elapsed time: 00:00:44s.  Time for last 1,000,000:    7s.  Last read position: chr2:29,441,576
INFO	2018-09-17 20:30:51	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:30:55	MarkDuplicates	Read    10,000,000 records.  Elapsed time: 00:00:48s.  Time for last 1,000,000:    4s.  Last read position: chr2:58,748,184
INFO	2018-09-17 20:30:55	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:30:59	MarkDuplicates	Read    11,000,000 records.  Elapsed time: 00:00:51s.  Time for last 1,000,000:    3s.  Last read position: chr2:86,811,655
INFO	2018-09-17 20:30:59	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:31:03	MarkDuplicates	Read    12,000,000 records.  Elapsed time: 00:00:55s.  Time for last 1,000,000:    4s.  Last read position: chr2:121,855,650
INFO	2018-09-17 20:31:03	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:31:09	MarkDuplicates	Read    13,000,000 records.  Elapsed time: 00:01:01s.  Time for last 1,000,000:    5s.  Last read position: chr2:151,619,311
INFO	2018-09-17 20:31:09	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:31:12	MarkDuplicates	Read    14,000,000 records.  Elapsed time: 00:01:05s.  Time for last 1,000,000:    3s.  Last read position: chr2:181,244,553
INFO	2018-09-17 20:31:12	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:31:16	MarkDuplicates	Read    15,000,000 records.  Elapsed time: 00:01:09s.  Time for last 1,000,000:    4s.  Last read position: chr2:210,475,622
INFO	2018-09-17 20:31:16	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:31:21	MarkDuplicates	Read    16,000,000 records.  Elapsed time: 00:01:13s.  Time for last 1,000,000:    4s.  Last read position: chr2:238,074,416
INFO	2018-09-17 20:31:21	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 20:31:24	MarkDuplicates	Read    17,000,000 records.  Elapsed time: 00:01:17s.  Time for last 1,000,000:    3s.  Last read position: chr3:21,946,125
INFO	2018-09-17 20:31:24	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:31:36	MarkDuplicates	Read    18,000,000 records.  Elapsed time: 00:01:28s.  Time for last 1,000,000:   11s.  Last read position: chr3:49,397,459
INFO	2018-09-17 20:31:36	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:31:40	MarkDuplicates	Read    19,000,000 records.  Elapsed time: 00:01:32s.  Time for last 1,000,000:    4s.  Last read position: chr3:77,517,284
INFO	2018-09-17 20:31:40	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:31:43	MarkDuplicates	Read    20,000,000 records.  Elapsed time: 00:01:36s.  Time for last 1,000,000:    3s.  Last read position: chr3:112,510,399
INFO	2018-09-17 20:31:43	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:31:48	MarkDuplicates	Read    21,000,000 records.  Elapsed time: 00:01:41s.  Time for last 1,000,000:    5s.  Last read position: chr3:139,251,969
INFO	2018-09-17 20:31:48	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:31:53	MarkDuplicates	Read    22,000,000 records.  Elapsed time: 00:01:45s.  Time for last 1,000,000:    4s.  Last read position: chr3:169,772,568
INFO	2018-09-17 20:31:53	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:31:57	MarkDuplicates	Read    23,000,000 records.  Elapsed time: 00:01:49s.  Time for last 1,000,000:    3s.  Last read position: chr4:101,557
INFO	2018-09-17 20:31:57	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:32:01	MarkDuplicates	Read    24,000,000 records.  Elapsed time: 00:01:54s.  Time for last 1,000,000:    4s.  Last read position: chr4:26,304,265
INFO	2018-09-17 20:32:01	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 20:32:17	MarkDuplicates	Read    25,000,000 records.  Elapsed time: 00:02:10s.  Time for last 1,000,000:   15s.  Last read position: chr4:60,107,482
INFO	2018-09-17 20:32:17	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:32:21	MarkDuplicates	Read    26,000,000 records.  Elapsed time: 00:02:13s.  Time for last 1,000,000:    3s.  Last read position: chr4:91,535,091
INFO	2018-09-17 20:32:21	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:32:26	MarkDuplicates	Read    27,000,000 records.  Elapsed time: 00:02:18s.  Time for last 1,000,000:    4s.  Last read position: chr4:122,936,961
INFO	2018-09-17 20:32:26	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:32:37	MarkDuplicates	Read    28,000,000 records.  Elapsed time: 00:02:29s.  Time for last 1,000,000:   11s.  Last read position: chr4:154,387,747
INFO	2018-09-17 20:32:37	MarkDuplicates	Tracking 20 as yet unmatched pairs. 20 records in RAM.
INFO	2018-09-17 20:32:41	MarkDuplicates	Read    29,000,000 records.  Elapsed time: 00:02:33s.  Time for last 1,000,000:    3s.  Last read position: chr4:185,396,304
INFO	2018-09-17 20:32:41	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 20:32:54	MarkDuplicates	Read    30,000,000 records.  Elapsed time: 00:02:47s.  Time for last 1,000,000:   13s.  Last read position: chr5:23,629,194
INFO	2018-09-17 20:32:54	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:32:58	MarkDuplicates	Read    31,000,000 records.  Elapsed time: 00:02:51s.  Time for last 1,000,000:    4s.  Last read position: chr5:57,730,307
INFO	2018-09-17 20:32:58	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:33:02	MarkDuplicates	Read    32,000,000 records.  Elapsed time: 00:02:54s.  Time for last 1,000,000:    3s.  Last read position: chr5:90,422,853
INFO	2018-09-17 20:33:02	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:33:18	MarkDuplicates	Read    33,000,000 records.  Elapsed time: 00:03:10s.  Time for last 1,000,000:   15s.  Last read position: chr5:121,249,276
INFO	2018-09-17 20:33:18	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:33:23	MarkDuplicates	Read    34,000,000 records.  Elapsed time: 00:03:16s.  Time for last 1,000,000:    5s.  Last read position: chr5:148,302,847
INFO	2018-09-17 20:33:23	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:33:27	MarkDuplicates	Read    35,000,000 records.  Elapsed time: 00:03:19s.  Time for last 1,000,000:    3s.  Last read position: chr5:176,065,058
INFO	2018-09-17 20:33:27	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:33:34	MarkDuplicates	Read    36,000,000 records.  Elapsed time: 00:03:27s.  Time for last 1,000,000:    7s.  Last read position: chr6:22,477,536
INFO	2018-09-17 20:33:34	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:33:38	MarkDuplicates	Read    37,000,000 records.  Elapsed time: 00:03:31s.  Time for last 1,000,000:    4s.  Last read position: chr6:54,890,201
INFO	2018-09-17 20:33:38	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:33:42	MarkDuplicates	Read    38,000,000 records.  Elapsed time: 00:03:35s.  Time for last 1,000,000:    3s.  Last read position: chr6:87,345,707
INFO	2018-09-17 20:33:42	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:33:46	MarkDuplicates	Read    39,000,000 records.  Elapsed time: 00:03:39s.  Time for last 1,000,000:    4s.  Last read position: chr6:117,923,786
INFO	2018-09-17 20:33:46	MarkDuplicates	Tracking 40 as yet unmatched pairs. 40 records in RAM.
INFO	2018-09-17 20:33:50	MarkDuplicates	Read    40,000,000 records.  Elapsed time: 00:03:43s.  Time for last 1,000,000:    3s.  Last read position: chr6:147,237,069
INFO	2018-09-17 20:33:50	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 20:33:54	MarkDuplicates	Read    41,000,000 records.  Elapsed time: 00:03:47s.  Time for last 1,000,000:    4s.  Last read position: chr7:2,093,043
INFO	2018-09-17 20:33:54	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:34:09	MarkDuplicates	Read    42,000,000 records.  Elapsed time: 00:04:02s.  Time for last 1,000,000:   14s.  Last read position: chr7:30,469,891
INFO	2018-09-17 20:34:09	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:34:13	MarkDuplicates	Read    43,000,000 records.  Elapsed time: 00:04:06s.  Time for last 1,000,000:    3s.  Last read position: chr7:61,556,433
INFO	2018-09-17 20:34:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:34:31	MarkDuplicates	Read    44,000,000 records.  Elapsed time: 00:04:23s.  Time for last 1,000,000:   17s.  Last read position: chr7:91,992,319
INFO	2018-09-17 20:34:31	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:34:36	MarkDuplicates	Read    45,000,000 records.  Elapsed time: 00:04:28s.  Time for last 1,000,000:    4s.  Last read position: chr7:120,660,725
INFO	2018-09-17 20:34:36	MarkDuplicates	Tracking 10 as yet unmatched pairs. 10 records in RAM.
INFO	2018-09-17 20:34:40	MarkDuplicates	Read    46,000,000 records.  Elapsed time: 00:04:32s.  Time for last 1,000,000:    3s.  Last read position: chr7:149,771,186
INFO	2018-09-17 20:34:40	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:34:44	MarkDuplicates	Read    47,000,000 records.  Elapsed time: 00:04:36s.  Time for last 1,000,000:    4s.  Last read position: chrX:22,116,689
INFO	2018-09-17 20:34:44	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:34:48	MarkDuplicates	Read    48,000,000 records.  Elapsed time: 00:04:41s.  Time for last 1,000,000:    4s.  Last read position: chrX:55,026,679
INFO	2018-09-17 20:34:48	MarkDuplicates	Tracking 32 as yet unmatched pairs. 32 records in RAM.
INFO	2018-09-17 20:34:52	MarkDuplicates	Read    49,000,000 records.  Elapsed time: 00:04:44s.  Time for last 1,000,000:    3s.  Last read position: chrX:94,729,634
INFO	2018-09-17 20:34:52	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:35:08	MarkDuplicates	Read    50,000,000 records.  Elapsed time: 00:05:00s.  Time for last 1,000,000:   16s.  Last read position: chrX:128,937,891
INFO	2018-09-17 20:35:08	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:35:12	MarkDuplicates	Read    51,000,000 records.  Elapsed time: 00:05:04s.  Time for last 1,000,000:    3s.  Last read position: chr8:6,045,024
INFO	2018-09-17 20:35:12	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:35:34	MarkDuplicates	Read    52,000,000 records.  Elapsed time: 00:05:27s.  Time for last 1,000,000:   22s.  Last read position: chr8:34,182,058
INFO	2018-09-17 20:35:34	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:35:38	MarkDuplicates	Read    53,000,000 records.  Elapsed time: 00:05:31s.  Time for last 1,000,000:    4s.  Last read position: chr8:65,010,106
INFO	2018-09-17 20:35:38	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:35:42	MarkDuplicates	Read    54,000,000 records.  Elapsed time: 00:05:34s.  Time for last 1,000,000:    3s.  Last read position: chr8:95,549,827
INFO	2018-09-17 20:35:42	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:35:54	MarkDuplicates	Read    55,000,000 records.  Elapsed time: 00:05:47s.  Time for last 1,000,000:   12s.  Last read position: chr8:125,093,002
INFO	2018-09-17 20:35:54	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:03	MarkDuplicates	Read    56,000,000 records.  Elapsed time: 00:05:55s.  Time for last 1,000,000:    8s.  Last read position: chr9:4,826,437
INFO	2018-09-17 20:36:03	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:07	MarkDuplicates	Read    57,000,000 records.  Elapsed time: 00:05:59s.  Time for last 1,000,000:    3s.  Last read position: chr9:35,181,149
INFO	2018-09-17 20:36:07	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:11	MarkDuplicates	Read    58,000,000 records.  Elapsed time: 00:06:04s.  Time for last 1,000,000:    4s.  Last read position: chr9:93,708,504
INFO	2018-09-17 20:36:11	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:15	MarkDuplicates	Read    59,000,000 records.  Elapsed time: 00:06:07s.  Time for last 1,000,000:    3s.  Last read position: chr9:122,478,687
INFO	2018-09-17 20:36:15	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:32	MarkDuplicates	Read    60,000,000 records.  Elapsed time: 00:06:25s.  Time for last 1,000,000:   17s.  Last read position: chr10:5,767,835
INFO	2018-09-17 20:36:32	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:48	MarkDuplicates	Read    61,000,000 records.  Elapsed time: 00:06:41s.  Time for last 1,000,000:   15s.  Last read position: chr10:34,476,657
INFO	2018-09-17 20:36:48	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:36:52	MarkDuplicates	Read    62,000,000 records.  Elapsed time: 00:06:44s.  Time for last 1,000,000:    3s.  Last read position: chr10:69,157,556
INFO	2018-09-17 20:36:52	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:36:56	MarkDuplicates	Read    63,000,000 records.  Elapsed time: 00:06:48s.  Time for last 1,000,000:    4s.  Last read position: chr10:96,917,931
INFO	2018-09-17 20:36:56	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:37:00	MarkDuplicates	Read    64,000,000 records.  Elapsed time: 00:06:52s.  Time for last 1,000,000:    4s.  Last read position: chr10:123,734,275
INFO	2018-09-17 20:37:00	MarkDuplicates	Tracking 50 as yet unmatched pairs. 50 records in RAM.
INFO	2018-09-17 20:37:04	MarkDuplicates	Read    65,000,000 records.  Elapsed time: 00:06:56s.  Time for last 1,000,000:    3s.  Last read position: chr11:12,638,848
INFO	2018-09-17 20:37:04	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:08	MarkDuplicates	Read    66,000,000 records.  Elapsed time: 00:07:00s.  Time for last 1,000,000:    4s.  Last read position: chr11:42,629,023
INFO	2018-09-17 20:37:08	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:11	MarkDuplicates	Read    67,000,000 records.  Elapsed time: 00:07:04s.  Time for last 1,000,000:    3s.  Last read position: chr11:71,103,607
INFO	2018-09-17 20:37:11	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:16	MarkDuplicates	Read    68,000,000 records.  Elapsed time: 00:07:09s.  Time for last 1,000,000:    4s.  Last read position: chr11:100,765,620
INFO	2018-09-17 20:37:16	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:20	MarkDuplicates	Read    69,000,000 records.  Elapsed time: 00:07:13s.  Time for last 1,000,000:    4s.  Last read position: chr11:128,269,250
INFO	2018-09-17 20:37:20	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 20:37:24	MarkDuplicates	Read    70,000,000 records.  Elapsed time: 00:07:16s.  Time for last 1,000,000:    3s.  Last read position: chr12:21,584,426
INFO	2018-09-17 20:37:24	MarkDuplicates	Tracking 10 as yet unmatched pairs. 10 records in RAM.
INFO	2018-09-17 20:37:28	MarkDuplicates	Read    71,000,000 records.  Elapsed time: 00:07:21s.  Time for last 1,000,000:    4s.  Last read position: chr12:53,298,406
INFO	2018-09-17 20:37:28	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:32	MarkDuplicates	Read    72,000,000 records.  Elapsed time: 00:07:25s.  Time for last 1,000,000:    4s.  Last read position: chr12:82,209,576
INFO	2018-09-17 20:37:32	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:36	MarkDuplicates	Read    73,000,000 records.  Elapsed time: 00:07:28s.  Time for last 1,000,000:    3s.  Last read position: chr12:110,939,807
INFO	2018-09-17 20:37:36	MarkDuplicates	Tracking 24 as yet unmatched pairs. 24 records in RAM.
INFO	2018-09-17 20:37:40	MarkDuplicates	Read    74,000,000 records.  Elapsed time: 00:07:33s.  Time for last 1,000,000:    4s.  Last read position: chr13:22,352,490
INFO	2018-09-17 20:37:40	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:37:44	MarkDuplicates	Read    75,000,000 records.  Elapsed time: 00:07:36s.  Time for last 1,000,000:    3s.  Last read position: chr13:50,864,251
INFO	2018-09-17 20:37:44	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 20:37:48	MarkDuplicates	Read    76,000,000 records.  Elapsed time: 00:07:40s.  Time for last 1,000,000:    4s.  Last read position: chr13:84,685,860
INFO	2018-09-17 20:37:48	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:52	MarkDuplicates	Read    77,000,000 records.  Elapsed time: 00:07:45s.  Time for last 1,000,000:    4s.  Last read position: chr13:114,770,566
INFO	2018-09-17 20:37:52	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:37:56	MarkDuplicates	Read    78,000,000 records.  Elapsed time: 00:07:48s.  Time for last 1,000,000:    3s.  Last read position: chr14:49,487,678
INFO	2018-09-17 20:37:56	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:38:21	MarkDuplicates	Read    79,000,000 records.  Elapsed time: 00:08:14s.  Time for last 1,000,000:   25s.  Last read position: chr14:76,575,806
INFO	2018-09-17 20:38:21	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:38:25	MarkDuplicates	Read    80,000,000 records.  Elapsed time: 00:08:18s.  Time for last 1,000,000:    3s.  Last read position: chr14:103,534,059
INFO	2018-09-17 20:38:25	MarkDuplicates	Tracking 12 as yet unmatched pairs. 12 records in RAM.
INFO	2018-09-17 20:38:39	MarkDuplicates	Read    81,000,000 records.  Elapsed time: 00:08:32s.  Time for last 1,000,000:   14s.  Last read position: chr15:47,041,508
INFO	2018-09-17 20:38:39	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:38:46	MarkDuplicates	Read    82,000,000 records.  Elapsed time: 00:08:38s.  Time for last 1,000,000:    6s.  Last read position: chr15:76,270,688
INFO	2018-09-17 20:38:46	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:38:49	MarkDuplicates	Read    83,000,000 records.  Elapsed time: 00:08:42s.  Time for last 1,000,000:    3s.  Last read position: chr16:1,829,031
INFO	2018-09-17 20:38:49	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:02	MarkDuplicates	Read    84,000,000 records.  Elapsed time: 00:08:54s.  Time for last 1,000,000:   12s.  Last read position: chr16:30,365,987
INFO	2018-09-17 20:39:02	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-17 20:39:13	MarkDuplicates	Read    85,000,000 records.  Elapsed time: 00:09:06s.  Time for last 1,000,000:   11s.  Last read position: chr16:67,646,997
INFO	2018-09-17 20:39:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:17	MarkDuplicates	Read    86,000,000 records.  Elapsed time: 00:09:09s.  Time for last 1,000,000:    3s.  Last read position: chr17:2,574,382
INFO	2018-09-17 20:39:17	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:21	MarkDuplicates	Read    87,000,000 records.  Elapsed time: 00:09:14s.  Time for last 1,000,000:    4s.  Last read position: chr17:32,744,682
INFO	2018-09-17 20:39:21	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:28	MarkDuplicates	Read    88,000,000 records.  Elapsed time: 00:09:20s.  Time for last 1,000,000:    6s.  Last read position: chr17:61,777,908
INFO	2018-09-17 20:39:28	MarkDuplicates	Tracking 14 as yet unmatched pairs. 14 records in RAM.
INFO	2018-09-17 20:39:31	MarkDuplicates	Read    89,000,000 records.  Elapsed time: 00:09:24s.  Time for last 1,000,000:    3s.  Last read position: chr18:6,257,256
INFO	2018-09-17 20:39:31	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 20:39:35	MarkDuplicates	Read    90,000,000 records.  Elapsed time: 00:09:28s.  Time for last 1,000,000:    4s.  Last read position: chr18:38,191,025
INFO	2018-09-17 20:39:35	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:39:39	MarkDuplicates	Read    91,000,000 records.  Elapsed time: 00:09:32s.  Time for last 1,000,000:    3s.  Last read position: chr18:67,350,716
INFO	2018-09-17 20:39:39	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:49	MarkDuplicates	Read    92,000,000 records.  Elapsed time: 00:09:41s.  Time for last 1,000,000:    9s.  Last read position: chr20:16,956,577
INFO	2018-09-17 20:39:49	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:54	MarkDuplicates	Read    93,000,000 records.  Elapsed time: 00:09:47s.  Time for last 1,000,000:    5s.  Last read position: chr20:46,174,320
INFO	2018-09-17 20:39:54	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:39:58	MarkDuplicates	Read    94,000,000 records.  Elapsed time: 00:09:50s.  Time for last 1,000,000:    3s.  Last read position: chr19:6,027,300
INFO	2018-09-17 20:39:58	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-17 20:40:07	MarkDuplicates	Read    95,000,000 records.  Elapsed time: 00:10:00s.  Time for last 1,000,000:    9s.  Last read position: chr19:33,422,106
INFO	2018-09-17 20:40:07	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 20:40:14	MarkDuplicates	Read    96,000,000 records.  Elapsed time: 00:10:07s.  Time for last 1,000,000:    7s.  Last read position: chr19:56,613,648
INFO	2018-09-17 20:40:14	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 20:40:18	MarkDuplicates	Read    97,000,000 records.  Elapsed time: 00:10:11s.  Time for last 1,000,000:    3s.  Last read position: chr22:41,255,937
INFO	2018-09-17 20:40:18	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:40:22	MarkDuplicates	Read    98,000,000 records.  Elapsed time: 00:10:15s.  Time for last 1,000,000:    4s.  Last read position: chr21:31,218,073
INFO	2018-09-17 20:40:22	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 20:40:42	MarkDuplicates	Read    99,000,000 records.  Elapsed time: 00:10:34s.  Time for last 1,000,000:   19s.  Last read position: chrUn_gl000220:138,138
INFO	2018-09-17 20:40:42	MarkDuplicates	Tracking 232 as yet unmatched pairs. 232 records in RAM.
INFO	2018-09-17 20:40:42	MarkDuplicates	Read 99103986 records. 0 pairs never matched.
INFO	2018-09-17 20:41:15	MarkDuplicates	After buildSortedReadEndLists freeMemory: 10664701848; totalMemory: 14539554816; maxMemory: 14539554816
INFO	2018-09-17 20:41:15	MarkDuplicates	Will retain up to 454361088 duplicate indices before spilling to disk.
INFO	2018-09-17 20:41:16	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2018-09-17 20:41:19	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2018-09-17 20:41:46	MarkDuplicates	Sorting list of duplicate records.
INFO	2018-09-17 20:41:46	MarkDuplicates	After generateDuplicateIndexes freeMemory: 10674489664; totalMemory: 14408482816; maxMemory: 14408482816
INFO	2018-09-17 20:41:46	MarkDuplicates	Marking 4230328 records as duplicates.
INFO	2018-09-17 20:41:46	MarkDuplicates	Found 0 optical duplicate clusters.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold1
INFO	2018-09-17 20:41:46	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2018-09-17 20:42:57	MarkDuplicates	Written    10,000,000 records.  Elapsed time: 00:01:10s.  Time for last 10,000,000:   70s.  Last read position: chr2:71,519,216
INFO	2018-09-17 20:44:07	MarkDuplicates	Written    20,000,000 records.  Elapsed time: 00:02:20s.  Time for last 10,000,000:   70s.  Last read position: chr3:137,038,285
INFO	2018-09-17 20:45:19	MarkDuplicates	Written    30,000,000 records.  Elapsed time: 00:03:32s.  Time for last 10,000,000:   71s.  Last read position: chr5:68,444,895
INFO	2018-09-17 20:46:31	MarkDuplicates	Written    40,000,000 records.  Elapsed time: 00:04:45s.  Time for last 10,000,000:   72s.  Last read position: chr7:24,893,967
INFO	2018-09-17 20:47:43	MarkDuplicates	Written    50,000,000 records.  Elapsed time: 00:05:56s.  Time for last 10,000,000:   71s.  Last read position: chr8:41,080,858
INFO	2018-09-17 20:48:54	MarkDuplicates	Written    60,000,000 records.  Elapsed time: 00:07:07s.  Time for last 10,000,000:   70s.  Last read position: chr10:87,989,341
INFO	2018-09-17 20:50:04	MarkDuplicates	Written    70,000,000 records.  Elapsed time: 00:08:17s.  Time for last 10,000,000:   69s.  Last read position: chr12:114,112,184
INFO	2018-09-17 20:51:14	MarkDuplicates	Written    80,000,000 records.  Elapsed time: 00:09:27s.  Time for last 10,000,000:   69s.  Last read position: chr16:16,245,305
INFO	2018-09-17 20:52:23	MarkDuplicates	Written    90,000,000 records.  Elapsed time: 00:10:36s.  Time for last 10,000,000:   69s.  Last read position: chr19:5,664,877
INFO	2018-09-17 20:52:57	MarkDuplicates	Before output close freeMemory: 14666273760; totalMemory: 14771814400; maxMemory: 14771814400
INFO	2018-09-17 20:52:57	MarkDuplicates	After output close freeMemory: 14688818144; totalMemory: 14794358784; maxMemory: 14794358784
[Mon Sep 17 20:52:57 EDT 2018] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 22.84 minutes.
Runtime.totalMemory()=14794358784
</pre>
Process 39250 returned: (0). Elapsed: 0:22:53.
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

<pre>
</pre>
Process 45324 returned: (0). Elapsed: 0:02:27. Peak memory: (Process: 0.02GB; Pipeline: 0.059GB)
Follow:
> `awk -F'	' -f /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/extract_post_dup_aligned_reads.awk /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_picard_metrics_bam.txt`

> `Duplicate_reads`	4230328.0	PEPATAC	_RES_
> `Dedup_aligned_reads`	94873658	PEPATAC	_RES_
> `Dedup_alignment_rate`	68.79	PEPATAC	_RES_
> `Dedup_total_efficiency`	68.78	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (09-17 20:55:26) elapsed: 1520.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/gold1_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/tmp_gold1_sort_dedup_cuttrace_YSp0Ou'
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
[Name: chr15; Size: 102531392]
[Name: chrY; Size: 59373566]
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
[Name: chr20; Size: 63025520]
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
Discarding 0 chunk(s) of reads: []
Keeping 93 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9_gl000200_random', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 93 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/gold1_exact.bw'
Merging 93 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_smooth.bw'
</pre>
Process 45991 returned: (0). Elapsed: 0:21:05. Peak memory: (Process: 0.03GB; Pipeline: 0.059GB)
> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 54007 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.059GB)

### Calculate TSS enrichment (09-17 21:16:31) elapsed: 1265.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

<pre>
</pre>
Process 54009 returned: (0). Elapsed: 0:00:32. Peak memory: (Process: 0.375GB; Pipeline: 0.059GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt
Completed!

</pre>
Process 54163 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.032GB; Pipeline: 0.375GB)
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-17 21:17:07) elapsed: 36.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLen.txt`

<pre>
</pre>
Process 54179 returned: (0). Elapsed: 0:06:24. Peak memory: (Process: 0.002GB; Pipeline: 0.375GB)
> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragCount.txt`

<pre>
</pre>
Process 55830 returned: (0). Elapsed: 0:01:01.
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.txt`

<pre>
</pre>
Process 56026 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.423GB; Pipeline: 0.375GB)
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-17 21:24:46) elapsed: 459.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`
> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19 -n gold1 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Mon, 17 Sep 2018 21:24:50: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19 -n gold1 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold1
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/gold1_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Mon, 17 Sep 2018 21:24:50: #1 read tag files... 
INFO  @ Mon, 17 Sep 2018 21:24:50: #1 read treatment tags... 
INFO  @ Mon, 17 Sep 2018 21:24:51:  1000000 
INFO  @ Mon, 17 Sep 2018 21:24:52:  2000000 
INFO  @ Mon, 17 Sep 2018 21:24:53:  3000000 
INFO  @ Mon, 17 Sep 2018 21:24:53:  4000000 
INFO  @ Mon, 17 Sep 2018 21:24:54:  5000000 
INFO  @ Mon, 17 Sep 2018 21:24:55:  6000000 
INFO  @ Mon, 17 Sep 2018 21:24:56:  7000000 
INFO  @ Mon, 17 Sep 2018 21:24:57:  8000000 
INFO  @ Mon, 17 Sep 2018 21:24:58:  9000000 
INFO  @ Mon, 17 Sep 2018 21:24:59:  10000000 
INFO  @ Mon, 17 Sep 2018 21:25:00:  11000000 
INFO  @ Mon, 17 Sep 2018 21:25:01:  12000000 
INFO  @ Mon, 17 Sep 2018 21:25:02:  13000000 
INFO  @ Mon, 17 Sep 2018 21:25:03:  14000000 
INFO  @ Mon, 17 Sep 2018 21:25:04:  15000000 
INFO  @ Mon, 17 Sep 2018 21:25:05:  16000000 
INFO  @ Mon, 17 Sep 2018 21:25:06:  17000000 
INFO  @ Mon, 17 Sep 2018 21:25:07:  18000000 
INFO  @ Mon, 17 Sep 2018 21:25:08:  19000000 
INFO  @ Mon, 17 Sep 2018 21:25:08:  20000000 
INFO  @ Mon, 17 Sep 2018 21:25:09:  21000000 
INFO  @ Mon, 17 Sep 2018 21:25:10:  22000000 
INFO  @ Mon, 17 Sep 2018 21:25:11:  23000000 
INFO  @ Mon, 17 Sep 2018 21:25:12:  24000000 
INFO  @ Mon, 17 Sep 2018 21:25:13:  25000000 
INFO  @ Mon, 17 Sep 2018 21:25:14:  26000000 
INFO  @ Mon, 17 Sep 2018 21:25:15:  27000000 
INFO  @ Mon, 17 Sep 2018 21:25:16:  28000000 
INFO  @ Mon, 17 Sep 2018 21:25:17:  29000000 
INFO  @ Mon, 17 Sep 2018 21:25:17:  30000000 
INFO  @ Mon, 17 Sep 2018 21:25:18:  31000000 
INFO  @ Mon, 17 Sep 2018 21:25:19:  32000000 
INFO  @ Mon, 17 Sep 2018 21:25:20:  33000000 
INFO  @ Mon, 17 Sep 2018 21:25:21:  34000000 
INFO  @ Mon, 17 Sep 2018 21:25:22:  35000000 
INFO  @ Mon, 17 Sep 2018 21:25:23:  36000000 
INFO  @ Mon, 17 Sep 2018 21:25:24:  37000000 
INFO  @ Mon, 17 Sep 2018 21:25:25:  38000000 
INFO  @ Mon, 17 Sep 2018 21:25:26:  39000000 
INFO  @ Mon, 17 Sep 2018 21:25:26:  40000000 
INFO  @ Mon, 17 Sep 2018 21:25:27:  41000000 
INFO  @ Mon, 17 Sep 2018 21:25:28:  42000000 
INFO  @ Mon, 17 Sep 2018 21:25:29:  43000000 
INFO  @ Mon, 17 Sep 2018 21:25:30:  44000000 
INFO  @ Mon, 17 Sep 2018 21:25:31:  45000000 
INFO  @ Mon, 17 Sep 2018 21:25:32:  46000000 
INFO  @ Mon, 17 Sep 2018 21:25:33:  47000000 
INFO  @ Mon, 17 Sep 2018 21:25:33:  48000000 
INFO  @ Mon, 17 Sep 2018 21:25:34:  49000000 
INFO  @ Mon, 17 Sep 2018 21:25:35:  50000000 
INFO  @ Mon, 17 Sep 2018 21:25:36:  51000000 
INFO  @ Mon, 17 Sep 2018 21:25:37:  52000000 
INFO  @ Mon, 17 Sep 2018 21:25:38:  53000000 
INFO  @ Mon, 17 Sep 2018 21:25:39:  54000000 
INFO  @ Mon, 17 Sep 2018 21:25:40:  55000000 
INFO  @ Mon, 17 Sep 2018 21:25:40:  56000000 
INFO  @ Mon, 17 Sep 2018 21:25:41:  57000000 
INFO  @ Mon, 17 Sep 2018 21:25:42:  58000000 
INFO  @ Mon, 17 Sep 2018 21:25:43:  59000000 
INFO  @ Mon, 17 Sep 2018 21:25:44:  60000000 
INFO  @ Mon, 17 Sep 2018 21:25:45:  61000000 
INFO  @ Mon, 17 Sep 2018 21:25:46:  62000000 
INFO  @ Mon, 17 Sep 2018 21:25:47:  63000000 
INFO  @ Mon, 17 Sep 2018 21:25:47:  64000000 
INFO  @ Mon, 17 Sep 2018 21:25:48:  65000000 
INFO  @ Mon, 17 Sep 2018 21:25:49:  66000000 
INFO  @ Mon, 17 Sep 2018 21:25:50:  67000000 
INFO  @ Mon, 17 Sep 2018 21:25:51:  68000000 
INFO  @ Mon, 17 Sep 2018 21:25:52:  69000000 
INFO  @ Mon, 17 Sep 2018 21:25:53:  70000000 
INFO  @ Mon, 17 Sep 2018 21:25:54:  71000000 
INFO  @ Mon, 17 Sep 2018 21:25:55:  72000000 
INFO  @ Mon, 17 Sep 2018 21:25:55:  73000000 
INFO  @ Mon, 17 Sep 2018 21:25:56:  74000000 
INFO  @ Mon, 17 Sep 2018 21:25:57:  75000000 
INFO  @ Mon, 17 Sep 2018 21:25:58:  76000000 
INFO  @ Mon, 17 Sep 2018 21:25:59:  77000000 
INFO  @ Mon, 17 Sep 2018 21:26:00:  78000000 
INFO  @ Mon, 17 Sep 2018 21:26:01:  79000000 
INFO  @ Mon, 17 Sep 2018 21:26:02:  80000000 
INFO  @ Mon, 17 Sep 2018 21:26:03:  81000000 
INFO  @ Mon, 17 Sep 2018 21:26:03:  82000000 
INFO  @ Mon, 17 Sep 2018 21:26:04:  83000000 
INFO  @ Mon, 17 Sep 2018 21:26:05:  84000000 
INFO  @ Mon, 17 Sep 2018 21:26:06:  85000000 
INFO  @ Mon, 17 Sep 2018 21:26:07:  86000000 
INFO  @ Mon, 17 Sep 2018 21:26:08:  87000000 
INFO  @ Mon, 17 Sep 2018 21:26:09:  88000000 
INFO  @ Mon, 17 Sep 2018 21:26:10:  89000000 
INFO  @ Mon, 17 Sep 2018 21:26:11:  90000000 
INFO  @ Mon, 17 Sep 2018 21:26:11:  91000000 
INFO  @ Mon, 17 Sep 2018 21:26:12:  92000000 
INFO  @ Mon, 17 Sep 2018 21:26:13:  93000000 
INFO  @ Mon, 17 Sep 2018 21:26:14:  94000000 
INFO  @ Mon, 17 Sep 2018 21:26:16: #1 tag size is determined as 50 bps 
INFO  @ Mon, 17 Sep 2018 21:26:16: #1 tag size = 50 
INFO  @ Mon, 17 Sep 2018 21:26:16: #1  total tags in treatment: 94873592 
INFO  @ Mon, 17 Sep 2018 21:26:16: #1 user defined the maximum tags... 
INFO  @ Mon, 17 Sep 2018 21:26:16: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Mon, 17 Sep 2018 21:26:18: #1  tags after filtering in treatment: 87021841 
INFO  @ Mon, 17 Sep 2018 21:26:18: #1  Redundant rate of treatment: 0.08 
INFO  @ Mon, 17 Sep 2018 21:26:18: #1 finished! 
INFO  @ Mon, 17 Sep 2018 21:26:18: #2 Build Peak Model... 
INFO  @ Mon, 17 Sep 2018 21:26:18: #2 Skipped... 
INFO  @ Mon, 17 Sep 2018 21:26:18: #2 Use 200 as fragment length 
INFO  @ Mon, 17 Sep 2018 21:26:18: #3 Call peaks... 
INFO  @ Mon, 17 Sep 2018 21:26:18: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 17 Sep 2018 21:29:27: #3 Call peaks for each chromosome... 
INFO  @ Mon, 17 Sep 2018 21:31:10: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.xls 
INFO  @ Mon, 17 Sep 2018 21:31:10: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak 
INFO  @ Mon, 17 Sep 2018 21:31:11: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_summits.bed 
INFO  @ Mon, 17 Sep 2018 21:31:11: Done! 
</pre>
Process 56072 returned: (0). Elapsed: 0:06:26. Peak memory: (Process: 1.378GB; Pipeline: 0.423GB)
Follow:
> `Peak_count`	96574	PEPATAC	_RES_

### # Calculate fraction of reads in peaks (FRiP) (09-17 21:31:12) elapsed: 386.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-17 21:32:39) elapsed: 87.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

<pre>
pass1 - making usageList (56 chroms): 17 millis
pass2 - checking and writing primary data (96575 records, 10 fields): 312 millis
[1] TRUE
[1] TRUE
</pre>
Process 60136 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.029GB; Pipeline: 1.378GB)

### # Calculate peak coverage (09-17 21:32:43) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed`

<pre>
</pre>
Process 60239 returned: (0). Elapsed: 0:00:00.
> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 60243 returned: (0). Elapsed: 0:00:00.
> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

<pre>
</pre>
Process 60250 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

<pre>
</pre>
Process 60255 returned: (0). Elapsed: 0:02:50.

### # Calculate read coverage (09-17 21:35:34) elapsed: 171.0 _TIME_

> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3' UTR`
> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 62922 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 62939 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

<pre>
</pre>
Process 62942 returned: (0). Elapsed: 0:02:29.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 64289 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

<pre>
</pre>
Process 64292 returned: (0). Elapsed: 0:02:31.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 64999 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

<pre>
</pre>
Process 65005 returned: (0). Elapsed: 0:02:33.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 65839 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

<pre>
</pre>
Process 65842 returned: (0). Elapsed: 0:03:45.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 68364 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

<pre>
</pre>
Process 68381 returned: (0). Elapsed: 0:02:37.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 71471 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 71486 returned: (0). Elapsed: 0:02:33.

### # Plot FRiP/F (09-17 21:52:08) elapsed: 994.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '94321160', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed 94321160 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 74188 returned: (0). Elapsed: 0:00:39. Peak memory: (Process: 0.468GB; Pipeline: 1.378GB)
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-17 21:53:10) elapsed: 62.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak gold1 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Error in getConnection(set[i]) : there is no connection 3
Execution halted
</pre>
Process 74532 returned: (1). Elapsed: 0:00:18. Peak memory: (Process: 0.266GB; Pipeline: 1.378GB)

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpcc_xiq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpxEA7DQ', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpcc_xiq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpxEA7DQ', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed', skipping

### Pipeline failed at:  (09-17 21:53:28) elapsed: 18.0 _TIME_

Total time: 1:26:30

Changed status from running to failed.
Traceback (most recent call last):
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1211, in <module>
    sys.exit(main())
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1183, in main
    pm.run(cmd, gpPDF, container=pm.container)            
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 708, in run
    self.callprint(cmd, shell, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 885, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1959, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1567, in fail_pipeline
    raise e
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details

Pypiper terminating spawned child process 37775...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-18 08:14:06) elapsed: 1.0 _TIME_

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
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 08:14:06) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-18 08:14:06) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 08:14:06) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 08:14:06) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

### Calculate TSS enrichment (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 08:14:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`

### # Calculate fraction of reads in peaks (FRiP) (09-18 08:14:07) elapsed: 0.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 08:15:31) elapsed: 85.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

### # Calculate peak coverage (09-18 08:15:31) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

### # Calculate read coverage (09-18 08:15:31) elapsed: 0.0 _TIME_

> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3' UTR`
> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 151108 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

### # Plot FRiP/F (09-18 08:15:33) elapsed: 1.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '94321160', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 08:15:55) elapsed: 22.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak gold1 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Error in getConnection(set[i]) : there is no connection 3
Execution halted
</pre>
Process 151625 returned: (1). Elapsed: 0:00:16. Peak memory: (Process: 0.292GB; Pipeline: 0.0GB)

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpzG8We4', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmp4PDNEX', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpzG8We4', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmp4PDNEX', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed', skipping

### Pipeline failed at:  (09-18 08:16:11) elapsed: 16.0 _TIME_

Total time: 0:02:06

Changed status from running to failed.
Traceback (most recent call last):
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1211, in <module>
    sys.exit(main())
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1183, in main
    pm.run(cmd, gpPDF, container=pm.container)            
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 708, in run
    self.callprint(cmd, shell, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 885, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1959, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1567, in fail_pipeline
    raise e
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details

Pypiper terminating spawned child process 149683...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-18 08:44:37) elapsed: 1.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  2ffe53bb5058a51fd450bb3d660d64b2fbd4c7fa
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-17 14:37:30 -0400
*        Pipeline diff:  1 file changed, 11 insertions(+), 3 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 08:44:37) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 08:44:37) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

### Calculate TSS enrichment (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 08:44:37) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`

### # Calculate fraction of reads in peaks (FRiP) (09-18 08:44:37) elapsed: 0.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 08:46:02) elapsed: 85.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

### # Calculate peak coverage (09-18 08:46:02) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

### # Calculate read coverage (09-18 08:46:02) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`
> `ln -sf/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`

<pre>
ln: invalid option -- '/'
Try 'ln --help' for more information.
</pre>
Process 183069 returned: (1). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.0GB)

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpvF3q_p', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpMBnbqq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpvF3q_p', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpMBnbqq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', skipping

### Pipeline failed at:  (09-18 08:46:02) elapsed: 0.0 _TIME_

Total time: 0:01:26

Changed status from running to failed.
Traceback (most recent call last):
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1219, in <module>
    sys.exit(main())
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1097, in main
    pm.run(cmd, anno_local, container=pm.container)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 708, in run
    self.callprint(cmd, shell, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 885, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1959, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1567, in fail_pipeline
    raise e
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details

Pypiper terminating spawned child process 182016...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-16
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-18 08:46:58) elapsed: 0.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  2ffe53bb5058a51fd450bb3d660d64b2fbd4c7fa
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-17 14:37:30 -0400
*        Pipeline diff:  1 file changed, 11 insertions(+), 3 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 08:46:58) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 08:46:58) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

### Calculate TSS enrichment (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 08:46:58) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`

### # Calculate fraction of reads in peaks (FRiP) (09-18 08:46:58) elapsed: 0.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 08:48:20) elapsed: 82.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

### # Calculate peak coverage (09-18 08:48:20) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

### # Calculate read coverage (09-18 08:48:20) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`
> `ln -sf /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`

<pre>
</pre>
Process 171050 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.0GB)
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3' UTR`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 171055 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

### # Plot FRiP/F (09-18 08:48:21) elapsed: 1.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '94321160', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 08:48:42) elapsed: 21.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak gold1 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Error in getConnection(set[i]) : there is no connection 3
Execution halted
</pre>
Process 171068 returned: (1). Elapsed: 0:00:14. Peak memory: (Process: 0.256GB; Pipeline: 0.0GB)

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpNi32IP', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpadp8X2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpNi32IP', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpadp8X2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed', skipping

### Pipeline failed at:  (09-18 08:48:56) elapsed: 14.0 _TIME_

Total time: 0:01:59

Changed status from running to failed.
Traceback (most recent call last):
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1219, in <module>
    sys.exit(main())
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1191, in main
    pm.run(cmd, gpPDF, container=pm.container)            
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 708, in run
    self.callprint(cmd, shell, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 885, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1959, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1567, in fail_pipeline
    raise e
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details

Pypiper terminating spawned child process 170996...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-18 09:02:44) elapsed: 1.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  59c27e307ea415a17ec91c8253f4e7be5895024e
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-18 09:02:13 -0400

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 09:02:44) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 09:02:44) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

### Calculate TSS enrichment (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 09:02:44) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`

### # Calculate fraction of reads in peaks (FRiP) (09-18 09:02:44) elapsed: 0.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 09:04:09) elapsed: 85.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

### # Calculate peak coverage (09-18 09:04:09) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

### # Calculate read coverage (09-18 09:04:09) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3' UTR`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 4948 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

### # Plot FRiP/F (09-18 09:04:10) elapsed: 1.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '94321160', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 09:04:32) elapsed: 22.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak gold1 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Error in getConnection(set[i]) : there is no connection 3
Execution halted
</pre>
Process 5449 returned: (1). Elapsed: 0:00:16. Peak memory: (Process: 0.256GB; Pipeline: 0.0GB)

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmppqOUow', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpOzghhV', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmppqOUow', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpOzghhV', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed', skipping

### Pipeline failed at:  (09-18 09:04:48) elapsed: 16.0 _TIME_

Total time: 0:02:04

Changed status from running to failed.
Traceback (most recent call last):
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1219, in <module>
    sys.exit(main())
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1191, in main
    pm.run(cmd, gpPDF, container=pm.container)            
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 708, in run
    self.callprint(cmd, shell, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 885, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1959, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1567, in fail_pipeline
    raise e
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details

Pypiper terminating spawned child process 3012...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-18 09:10:41) elapsed: 0.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  59c27e307ea415a17ec91c8253f4e7be5895024e
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-18 09:02:13 -0400
*        Pipeline diff:  1 file changed, 4 insertions(+), 4 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 09:10:41) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-18 09:10:41) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 09:10:41) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 09:10:41) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

### Calculate TSS enrichment (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 09:10:42) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`

### # Calculate fraction of reads in peaks (FRiP) (09-18 09:10:42) elapsed: 0.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 09:12:06) elapsed: 85.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

### # Calculate peak coverage (09-18 09:12:06) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

### # Calculate read coverage (09-18 09:12:06) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3' UTR`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 15805 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

### # Plot FRiP/F (09-18 09:12:08) elapsed: 1.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '94321160', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 09:12:29) elapsed: 22.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak gold1 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Error in getConnection(set[i]) : there is no connection 3
Execution halted
</pre>
Process 16281 returned: (1). Elapsed: 0:00:15. Peak memory: (Process: 0.256GB; Pipeline: 0.0GB)

Conditional flag found: []

These conditional files were left in place:['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmplAc7Xc', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpdkgQLE', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed']
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmplAc7Xc', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpdkgQLE', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region', skipping
Could not produce cleanup script for item '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed', skipping

### Pipeline failed at:  (09-18 09:12:45) elapsed: 15.0 _TIME_

Total time: 0:02:03

Changed status from running to failed.
Traceback (most recent call last):
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1219, in <module>
    sys.exit(main())
  File "/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py", line 1191, in main
    pm.run(cmd, gpPDF, container=pm.container)            
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 708, in run
    self.callprint(cmd, shell, nofail, container)  # Run command
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 885, in callprint
    self._triage_error(SubprocessError(msg), nofail)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1959, in _triage_error
    self.fail_pipeline(e)
  File "/home/jps3dp/.local/lib/python2.7/site-packages/pypiper/manager.py", line 1567, in fail_pipeline
    raise e
pypiper.exceptions.SubprocessError: Subprocess returned nonzero result. Check above output for details

Pypiper terminating spawned child process 14016...(tee)
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold1 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/
*  Pipeline started at:   (09-18 09:13:42) elapsed: 0.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.7.3
*        Pipeline hash:  59c27e307ea415a17ec91c8253f4e7be5895024e
*      Pipeline branch:  * dev
*        Pipeline date:  2018-09-18 09:02:13 -0400
*        Pipeline diff:  1 file changed, 4 insertions(+), 4 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold1`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210416_2.fastq.gz
> `File_mb`	6493.3235	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 09:13:43) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz'

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz`
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/gold1_R2.fastq.gz']

### Adapter trimming:  (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
> `FastQC report r1`	fastqc/gold1_R1.trim_fastqc.html	FastQC report r1	fastqc/gold1_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold1_R2.trim_fastqc.html	FastQC report r2	fastqc/gold1_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 09:13:43) elapsed: 0.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_unmap_R2.fq`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log`
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/gold1_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	21049900.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	15.26	PEPATAC	_RES_

### Map to genome (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam`

### Calculate NRF, PBC1, and PBC2 (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort.bam.bai`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_bamQC.tsv`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_unmap.bam`

### Remove dupes, build bigwig and bedgraph files (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

### Produce smoothed and nucleotide-resolution tracks (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

### Calculate TSS enrichment (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.txt`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_TssEnrichment.pdf`
> `TSS_Score`	8.62420357458	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold1_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold1_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_fragLenDistribution.pdf`
> `Fragment distribution`	QC_hg19/gold1_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold1_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 09:13:43) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak`

### # Calculate fraction of reads in peaks (FRiP) (09-18 09:13:43) elapsed: 0.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

('99103986', '14266235\n')
> `FRiP`	0.143952181701	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 09:15:07) elapsed: 84.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bigBed`

### # Calculate peak coverage (09-18 09:15:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed`

### # Calculate read coverage (09-18 09:15:07) elapsed: 0.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3' UTR`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/"$4}'`

<pre>
</pre>
Process 19872 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed`

### # Plot FRiP/F (09-18 09:15:08) elapsed: 1.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_coverage.bed', '94321160', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_Promoter_Flanking_Region_coverage.bed']

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_frif.pdf`
> `Cumulative FRiF`	QC_hg19/gold1_frif.pdf	Cumulative FRiF	QC_hg19/gold1_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 09:15:30) elapsed: 22.0 _TIME_


Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/gold1_peaks_partition_dist.pdf`
> `Peak chromosome distribution`	QC_hg19/gold1_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold1_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold1_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold1_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold1_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold1_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpuwSpCv
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/tmpuwSpCv`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/prealignments/bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpTt7dDz
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/tmpTt7dDz`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19/gold1_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/peak_calling_hg19/gold1_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1_R1.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold1/fastq/gold1-trimmed.log`
> `Time`	0:01:47	PEPATAC	_RES_
> `Success`	09-18-09:15:30	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:01:47
*     Peak memory used:  0.0 GB
* Pipeline completed at:  (09-18 09:15:30) elapsed: 0.0 _TIME_

Pypiper terminating spawned child process 17902...(tee)
