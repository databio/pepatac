----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold2 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-9
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/
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
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold2`
*              `input`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_1.fastq.gz']`
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
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_2.fastq.gz
> `File_mb`	1603.8181	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-17 15:47:25) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R1.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R1.fastq.gz`

<pre>
</pre>
Process 87282 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R2.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210450_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R2.fastq.gz`

<pre>
</pre>
Process 87284 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.fastq`
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.fastq`

<pre>
</pre>
Process 87286 returned: (0). Elapsed: 0:00:11.
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.fastq`

<pre>
</pre>
Process 87298 returned: (0). Elapsed: 0:00:13.
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.fastq']
> `Raw_reads`	28408648	PEPATAC	_RES_
> `Fastq_reads`	28408648	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/raw/gold2_R2.fastq.gz']

### Adapter trimming:  (09-17 15:48:40) elapsed: 75.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.trim.fastq`
> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.fastq`

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
Mon Sep 17 15:48:40 2018[0;32m >> started[0m

Mon Sep 17 15:49:56 2018[0;32m >> done[0m (76.114s)
14204324 read pairs processed; of these:
      75 ( 0.00%) short read pairs filtered out after trimming by size control
      19 ( 0.00%) empty read pairs filtered out after trimming by size control
14204230 (100.00%) read pairs available; of these:
 2196177 (15.46%) trimmed read pairs available after processing
12008053 (84.54%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2-trimmed.log".
</pre>
Process 87355 returned: (0). Elapsed: 0:01:16. Peak memory: (Process: 0.021GB; Pipeline: 0.0GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.trim.fastq`

<pre>
</pre>
Process 87460 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.021GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.trim.fastq`

<pre>
</pre>
Process 87461 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.021GB)
Follow:
Evaluating read trimming
> `Trimmed_reads`	28408460	PEPATAC	_RES_
> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold2_R1.trim.fastq
Approx 5% complete for gold2_R1.trim.fastq
Approx 10% complete for gold2_R1.trim.fastq
Approx 15% complete for gold2_R1.trim.fastq
Approx 20% complete for gold2_R1.trim.fastq
Approx 25% complete for gold2_R1.trim.fastq
Approx 30% complete for gold2_R1.trim.fastq
Approx 35% complete for gold2_R1.trim.fastq
Approx 40% complete for gold2_R1.trim.fastq
Approx 45% complete for gold2_R1.trim.fastq
Approx 50% complete for gold2_R1.trim.fastq
Approx 55% complete for gold2_R1.trim.fastq
Approx 60% complete for gold2_R1.trim.fastq
Approx 65% complete for gold2_R1.trim.fastq
Approx 70% complete for gold2_R1.trim.fastq
Approx 75% complete for gold2_R1.trim.fastq
Approx 80% complete for gold2_R1.trim.fastq
Approx 85% complete for gold2_R1.trim.fastq
Approx 90% complete for gold2_R1.trim.fastq
Approx 95% complete for gold2_R1.trim.fastq
Analysis complete for gold2_R1.trim.fastq
</pre>
Process 87465 returned: (0). Elapsed: 0:00:56. Peak memory: (Process: 0.179GB; Pipeline: 0.021GB)

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.trim.fastq`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
Started analysis of gold2_R2.trim.fastq
Approx 5% complete for gold2_R2.trim.fastq
Approx 10% complete for gold2_R2.trim.fastq
Approx 15% complete for gold2_R2.trim.fastq
Approx 20% complete for gold2_R2.trim.fastq
Approx 25% complete for gold2_R2.trim.fastq
Approx 30% complete for gold2_R2.trim.fastq
Approx 35% complete for gold2_R2.trim.fastq
Approx 40% complete for gold2_R2.trim.fastq
Approx 45% complete for gold2_R2.trim.fastq
Approx 50% complete for gold2_R2.trim.fastq
Approx 55% complete for gold2_R2.trim.fastq
Approx 60% complete for gold2_R2.trim.fastq
Approx 65% complete for gold2_R2.trim.fastq
Approx 70% complete for gold2_R2.trim.fastq
Approx 75% complete for gold2_R2.trim.fastq
Approx 80% complete for gold2_R2.trim.fastq
Approx 85% complete for gold2_R2.trim.fastq
Approx 90% complete for gold2_R2.trim.fastq
Approx 95% complete for gold2_R2.trim.fastq
Analysis complete for gold2_R2.trim.fastq
</pre>
Process 87675 returned: (0). Elapsed: 0:00:56. Peak memory: (Process: 0.178GB; Pipeline: 0.179GB)
> `FastQC report r1`	fastqc/gold2_R1.trim_fastqc.html	FastQC report r1	fastqc/gold2_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold2_R2.trim_fastqc.html	FastQC report r2	fastqc/gold2_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-17 15:51:50) elapsed: 190.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-17 15:51:50) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/bt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/bt2`

<pre>
</pre>
Process 87704 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.179GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 87705

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id gold2 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 87706 returned: (0). Elapsed: 0:01:26.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	11074130.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	38.98	PEPATAC	_RES_

### Map to genome (09-17 15:53:16) elapsed: 86.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold2 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/gold2_rCRSd_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/tmpKivDbf -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_temp.bam`

<pre>
5537065 reads skipped
0 reads lost
8667165 reads; of these:
  8667165 (100.00%) were paired; of these:
    163432 (1.89%) aligned concordantly 0 times
    6888126 (79.47%) aligned concordantly exactly 1 time
    1615607 (18.64%) aligned concordantly >1 times
    ----
    163432 pairs aligned concordantly 0 times; of these:
      6331 (3.87%) aligned discordantly 1 time
    ----
    157101 pairs aligned 0 times concordantly or discordantly; of these:
      314202 mates make up the pairs; of these:
        205242 (65.32%) aligned 0 times
        52106 (16.58%) aligned exactly 1 time
        56854 (18.09%) aligned >1 times
98.82% overall alignment rate
[bam_sort_core] merging from 8 files...
</pre>
Process 89597 returned: (0). Elapsed: 0:25:13.
> `samtools view -q 10 -b -@ 8 -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam`

<pre>
</pre>
Process 110787 returned: (0). Elapsed: 0:00:35.
Follow:
> `Aligned_reads`	15430056	PEPATAC	_RES_
> `Alignment_rate`	54.32	PEPATAC	_RES_
> `Total_efficiency`	54.31	PEPATAC	_RES_

### Calculate NRF, PBC1, and PBC2 (09-17 16:19:28) elapsed: 1571.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam.bai`
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam`

<pre>
</pre>
Process 110809 returned: (0). Elapsed: 0:00:24. Peak memory: (Process: 0.012GB; Pipeline: 0.179GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_bamQC.tsv`

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
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/tmp_gold2_sort_EHGjBH'
Processing with 8 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr13; Size: 115169878]
[Name: chr10; Size: 135534747]
[Name: chr15; Size: 102531392]
[Name: chr18; Size: 78077248]
[Name: chrUn_gl000238; Size: 39939]
[Name: chrUn_gl000231; Size: 27386]
[Name: chrUn_gl000236; Size: 41934]
[Name: chrUn_gl000230; Size: 43691]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chrUn_gl000235; Size: 34474]
[Name: chrUn_gl000233; Size: 45941]
[Name: chrUn_gl000237; Size: 45867]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chrUn_gl000234; Size: 40531]
[Name: chrUn_gl000232; Size: 40652]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000243; Size: 43341]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000244; Size: 39929]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000241; Size: 42152]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000245; Size: 36651]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr8; Size: 146364022]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr3; Size: 198022430]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1; Size: 249250621]
[Name: chrY; Size: 59373566]
[Name: chrX; Size: 155270560]
[Name: chr9_gl000198_random; Size: 90085]
[Name: chr14; Size: 107349540]
[Name: chrUn_gl000239; Size: 33824]
[Name: chr9; Size: 141213431]
[Name: chr12; Size: 133851895]
[Name: chr17; Size: 81195210]
[Name: chrUn_gl000211; Size: 166566]
[Name: chrUn_gl000213; Size: 164239]
[Name: chrUn_gl000212; Size: 186858]
[Name: chrUn_gl000215; Size: 172545]
[Name: chrUn_gl000214; Size: 137718]
[Name: chrUn_gl000216; Size: 172294]
[Name: chrUn_gl000219; Size: 179198]
[Name: chrUn_gl000217; Size: 172149]
[Name: chr19; Size: 59128983]
[Name: chrUn_gl000218; Size: 161147]
[Name: chr19_gl000209_random; Size: 159169]
[Name: chr22; Size: 51304566]
[Name: chr21; Size: 48129895]
[Name: chrM; Size: 16571]
[Name: chr6_mann_hap4; Size: 4683263]
[Name: chr6; Size: 171115067]
[Name: chr20; Size: 63025520]
[Name: chr16; Size: 90354753]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chrUn_gl000228; Size: 129120]
[Name: chr2; Size: 243199373]
[Name: chr11; Size: 135006516]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr5; Size: 180915260]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chr4; Size: 191154276]
Discarding 6 chunk(s) of reads: ['chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000242', 'chr8_gl000197_random', 'chr9_gl000200_random', 'chr8_gl000196_random']
Keeping 87 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9', 'chrM', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 87 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_bamQC.tsv'
</pre>
Process 110819 returned: (0). Elapsed: 0:00:25. Peak memory: (Process: 0.061GB; Pipeline: 0.179GB)
Follow:
> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_bamQC.tsv`

> `NRF`	0.93	PEPATAC	_RES_
> `PBC1`	0.96	PEPATAC	_RES_
> `PBC2`	27.54	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_unmap.bam`
> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_unmap.bam`

<pre>
</pre>
Process 111059 returned: (0). Elapsed: 0:00:04.

### Remove dupes, build bigwig and bedgraph files (09-17 16:20:20) elapsed: 53.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam`
> `java -Xmx15200m -jar /sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar MarkDuplicates INPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_picard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_picard_metrics_log.txt`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
16:20:21.659 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar!/com/intel/gkl/native/libgkl_compression.so
[Mon Sep 17 16:20:21 EDT 2018] MarkDuplicates INPUT=[/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam] OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_picard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 TAG_DUPLICATE_SET_MEMBERS=false REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag CLEAR_DT=true ADD_PG_TAG_TO_READS=true DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 MAX_OPTICAL_DUPLICATE_SET_SIZE=300000 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json USE_JDK_DEFLATER=false USE_JDK_INFLATER=false
[Mon Sep 17 16:20:21 EDT 2018] Executing as jps3dp@udc-ba26-9 on Linux 3.10.0-514.21.2.el7.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_171-b11; Deflater: Intel; Inflater: Intel; Picard version: 2.17.4-1-gb63d73e-SNAPSHOT
INFO	2018-09-17 16:20:21	MarkDuplicates	Start of doWork freeMemory: 2038257976; totalMemory: 2058354688; maxMemory: 14167834624
INFO	2018-09-17 16:20:21	MarkDuplicates	Reading input file and constructing read end information.
INFO	2018-09-17 16:20:21	MarkDuplicates	Will retain up to 51332734 data points before spilling to disk.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold2
WARNING	2018-09-17 16:20:21	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR5210450.13014071. Cause: String 'SRR5210450.13014071' did not start with a parsable number.
INFO	2018-09-17 16:20:26	MarkDuplicates	Read     1,000,000 records.  Elapsed time: 00:00:04s.  Time for last 1,000,000:    4s.  Last read position: chr1:211,087,916
INFO	2018-09-17 16:20:26	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 16:20:30	MarkDuplicates	Read     2,000,000 records.  Elapsed time: 00:00:08s.  Time for last 1,000,000:    4s.  Last read position: chr2:148,238,450
INFO	2018-09-17 16:20:30	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 16:20:34	MarkDuplicates	Read     3,000,000 records.  Elapsed time: 00:00:12s.  Time for last 1,000,000:    3s.  Last read position: chr3:82,556,344
INFO	2018-09-17 16:20:34	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:20:39	MarkDuplicates	Read     4,000,000 records.  Elapsed time: 00:00:17s.  Time for last 1,000,000:    4s.  Last read position: chr4:74,124,838
INFO	2018-09-17 16:20:39	MarkDuplicates	Tracking 28 as yet unmatched pairs. 28 records in RAM.
INFO	2018-09-17 16:20:42	MarkDuplicates	Read     5,000,000 records.  Elapsed time: 00:00:20s.  Time for last 1,000,000:    3s.  Last read position: chr5:78,520,343
INFO	2018-09-17 16:20:42	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:20:46	MarkDuplicates	Read     6,000,000 records.  Elapsed time: 00:00:24s.  Time for last 1,000,000:    3s.  Last read position: chr6:84,944,858
INFO	2018-09-17 16:20:46	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 16:20:50	MarkDuplicates	Read     7,000,000 records.  Elapsed time: 00:00:29s.  Time for last 1,000,000:    4s.  Last read position: chr7:97,915,893
INFO	2018-09-17 16:20:50	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-17 16:20:54	MarkDuplicates	Read     8,000,000 records.  Elapsed time: 00:00:32s.  Time for last 1,000,000:    3s.  Last read position: chrX:153,296,112
INFO	2018-09-17 16:20:54	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 16:21:01	MarkDuplicates	Read     9,000,000 records.  Elapsed time: 00:00:39s.  Time for last 1,000,000:    7s.  Last read position: chr9:35,110,526
INFO	2018-09-17 16:21:01	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:21:05	MarkDuplicates	Read    10,000,000 records.  Elapsed time: 00:00:43s.  Time for last 1,000,000:    3s.  Last read position: chr10:108,677,337
INFO	2018-09-17 16:21:05	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:21:09	MarkDuplicates	Read    11,000,000 records.  Elapsed time: 00:00:47s.  Time for last 1,000,000:    3s.  Last read position: chr12:15,966,522
INFO	2018-09-17 16:21:09	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:21:13	MarkDuplicates	Read    12,000,000 records.  Elapsed time: 00:00:51s.  Time for last 1,000,000:    4s.  Last read position: chr13:90,779,354
INFO	2018-09-17 16:21:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-17 16:21:17	MarkDuplicates	Read    13,000,000 records.  Elapsed time: 00:00:55s.  Time for last 1,000,000:    4s.  Last read position: chr15:94,027,122
INFO	2018-09-17 16:21:17	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:21:20	MarkDuplicates	Read    14,000,000 records.  Elapsed time: 00:00:59s.  Time for last 1,000,000:    3s.  Last read position: chr18:22,348,292
INFO	2018-09-17 16:21:20	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:21:25	MarkDuplicates	Read    15,000,000 records.  Elapsed time: 00:01:03s.  Time for last 1,000,000:    4s.  Last read position: chr19:57,865,651
INFO	2018-09-17 16:21:25	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-17 16:21:26	MarkDuplicates	Read 15430056 records. 0 pairs never matched.
INFO	2018-09-17 16:21:32	MarkDuplicates	After buildSortedReadEndLists freeMemory: 5195087856; totalMemory: 7366770688; maxMemory: 14167834624
INFO	2018-09-17 16:21:32	MarkDuplicates	Will retain up to 442744832 duplicate indices before spilling to disk.
INFO	2018-09-17 16:21:32	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2018-09-17 16:21:33	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2018-09-17 16:21:33	MarkDuplicates	Sorting list of duplicate records.
INFO	2018-09-17 16:21:36	MarkDuplicates	After generateDuplicateIndexes freeMemory: 7274969824; totalMemory: 10910957568; maxMemory: 14167834624
INFO	2018-09-17 16:21:36	MarkDuplicates	Marking 564704 records as duplicates.
INFO	2018-09-17 16:21:36	MarkDuplicates	Found 0 optical duplicate clusters.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold2
INFO	2018-09-17 16:21:36	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2018-09-17 16:22:44	MarkDuplicates	Written    10,000,000 records.  Elapsed time: 00:01:08s.  Time for last 10,000,000:   68s.  Last read position: chr11:38,708,374
INFO	2018-09-17 16:23:18	MarkDuplicates	Before output close freeMemory: 10856327904; totalMemory: 10952900608; maxMemory: 14167834624
INFO	2018-09-17 16:23:18	MarkDuplicates	After output close freeMemory: 10560629472; totalMemory: 10657202176; maxMemory: 14167834624
[Mon Sep 17 16:23:18 EDT 2018] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 2.94 minutes.
Runtime.totalMemory()=10657202176
</pre>
Process 111071 returned: (0). Elapsed: 0:02:58.
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam`

<pre>
</pre>
Process 111123 returned: (0). Elapsed: 0:00:23. Peak memory: (Process: 0.012GB; Pipeline: 0.179GB)
Follow:
> `awk -F'	' -f /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/extract_post_dup_aligned_reads.awk /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_picard_metrics_bam.txt`

> `Duplicate_reads`	564704.0	PEPATAC	_RES_
> `Dedup_aligned_reads`	14865352	PEPATAC	_RES_
> `Dedup_alignment_rate`	52.33	PEPATAC	_RES_
> `Dedup_total_efficiency`	52.33	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (09-17 16:23:42) elapsed: 202.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/gold2_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/gold2_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/tmp_gold2_sort_dedup_cuttrace_paMZgJ'
Processing with 2 cores...
[Name: chr19_gl000208_random; Size: 92689]
[Name: chr19; Size: 59128983]
[Name: chr21_gl000210_random; Size: 27682]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chr13; Size: 115169878]
[Name: chr18; Size: 78077248]
[Name: chr12; Size: 133851895]
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
[Name: chrUn_gl000247; Size: 36422]
[Name: chrUn_gl000244; Size: 39929]
[Name: chrUn_gl000245; Size: 36651]
[Name: chrUn_gl000243; Size: 43341]
[Name: chrUn_gl000240; Size: 41933]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chr8; Size: 146364022]
[Name: chr11; Size: 135006516]
[Name: chr6_ssto_hap7; Size: 4928567]
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
[Name: chr14; Size: 107349540]
[Name: chrX; Size: 155270560]
[Name: chrM; Size: 16571]
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
[Name: chr9; Size: 141213431]
[Name: chr21; Size: 48129895]
[Name: chr6_mcf_hap5; Size: 4833398]
[Name: chr7; Size: 159138663]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
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
Discarding 6 chunk(s) of reads: ['chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000242', 'chr8_gl000197_random', 'chr9_gl000200_random', 'chr8_gl000196_random']
Keeping 87 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9', 'chrM', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 87 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/gold2_exact.bw'
Merging 87 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_smooth.bw'
</pre>
Process 111127 returned: (0). Elapsed: 0:09:19. Peak memory: (Process: 0.03GB; Pipeline: 0.179GB)
> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 122711 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.179GB)

### Calculate TSS enrichment (09-17 16:33:01) elapsed: 559.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_TssEnrichment.txt`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_TssEnrichment.txt`

<pre>
</pre>
Process 122712 returned: (0). Elapsed: 0:00:10. Peak memory: (Process: 0.046GB; Pipeline: 0.179GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_TssEnrichment.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_TssEnrichment.txt
Completed!

</pre>
Process 122991 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.029GB; Pipeline: 0.179GB)
> `TSS_Score`	12.1223465048	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold2_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold2_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-17 16:33:14) elapsed: 13.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragLenDistribution.pdf`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragLen.txt`

<pre>
</pre>
Process 123034 returned: (0). Elapsed: 0:00:53. Peak memory: (Process: 0.002GB; Pipeline: 0.179GB)
> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragCount.txt`

<pre>
</pre>
Process 123126 returned: (0). Elapsed: 0:00:04.
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_fragLenDistribution.txt`

<pre>
</pre>
Process 123136 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.034GB; Pipeline: 0.179GB)
> `Fragment distribution`	QC_hg19/gold2_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold2_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-17 16:34:14) elapsed: 59.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.narrowPeak`
> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/gold2_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19 -n gold2 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Mon, 17 Sep 2018 16:34:18: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/gold2_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19 -n gold2 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold2
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/gold2_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Mon, 17 Sep 2018 16:34:18: #1 read tag files... 
INFO  @ Mon, 17 Sep 2018 16:34:18: #1 read treatment tags... 
INFO  @ Mon, 17 Sep 2018 16:34:19:  1000000 
INFO  @ Mon, 17 Sep 2018 16:34:20:  2000000 
INFO  @ Mon, 17 Sep 2018 16:34:21:  3000000 
INFO  @ Mon, 17 Sep 2018 16:34:21:  4000000 
INFO  @ Mon, 17 Sep 2018 16:34:22:  5000000 
INFO  @ Mon, 17 Sep 2018 16:34:23:  6000000 
INFO  @ Mon, 17 Sep 2018 16:34:24:  7000000 
INFO  @ Mon, 17 Sep 2018 16:34:25:  8000000 
INFO  @ Mon, 17 Sep 2018 16:34:26:  9000000 
INFO  @ Mon, 17 Sep 2018 16:34:27:  10000000 
INFO  @ Mon, 17 Sep 2018 16:34:28:  11000000 
INFO  @ Mon, 17 Sep 2018 16:34:28:  12000000 
INFO  @ Mon, 17 Sep 2018 16:34:29:  13000000 
INFO  @ Mon, 17 Sep 2018 16:34:30:  14000000 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1 tag size is determined as 50 bps 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1 tag size = 50 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1  total tags in treatment: 14865344 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1 user defined the maximum tags... 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1  tags after filtering in treatment: 14314838 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1  Redundant rate of treatment: 0.04 
INFO  @ Mon, 17 Sep 2018 16:34:31: #1 finished! 
INFO  @ Mon, 17 Sep 2018 16:34:31: #2 Build Peak Model... 
INFO  @ Mon, 17 Sep 2018 16:34:31: #2 Skipped... 
INFO  @ Mon, 17 Sep 2018 16:34:31: #2 Use 200 as fragment length 
INFO  @ Mon, 17 Sep 2018 16:34:31: #3 Call peaks... 
INFO  @ Mon, 17 Sep 2018 16:34:31: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 17 Sep 2018 16:35:00: #3 Call peaks for each chromosome... 
INFO  @ Mon, 17 Sep 2018 16:35:16: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.xls 
INFO  @ Mon, 17 Sep 2018 16:35:16: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.narrowPeak 
INFO  @ Mon, 17 Sep 2018 16:35:16: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_summits.bed 
INFO  @ Mon, 17 Sep 2018 16:35:16: Done! 
</pre>
Process 123143 returned: (0). Elapsed: 0:01:03. Peak memory: (Process: 0.319GB; Pipeline: 0.179GB)
Follow:
> `Peak_count`	49953	PEPATAC	_RES_

### # Calculate fraction of reads in peaks (FRiP) (09-17 16:35:17) elapsed: 63.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam`

('15430056', '2476764\n')
> `FRiP`	0.160515554837	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-17 16:35:28) elapsed: 11.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.bigBed`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.bigBed`

<pre>
pass1 - making usageList (45 chroms): 9 millis
pass2 - checking and writing primary data (49954 records, 10 fields): 166 millis
[1] TRUE
[1] TRUE
</pre>
Process 123363 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.034GB; Pipeline: 0.319GB)

### # Calculate peak coverage (09-17 16:35:30) elapsed: 3.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.bed`

<pre>
</pre>
Process 123371 returned: (0). Elapsed: 0:00:00.
> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 123373 returned: (0). Elapsed: 0:00:00.
> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_sort.bed`

<pre>
</pre>
Process 123378 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_coverage.bed`

<pre>
</pre>
Process 123380 returned: (0). Elapsed: 0:00:26.

### # Calculate read coverage (09-17 16:35:56) elapsed: 26.0 _TIME_

> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3' UTR`
> `zcat /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/"$4}'`

<pre>
</pre>
Process 123412 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 123415 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_3_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_3_UTR_coverage.bed`

<pre>
</pre>
Process 123418 returned: (0). Elapsed: 0:00:24.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 123421 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_5_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_5_UTR_coverage.bed`

<pre>
</pre>
Process 123424 returned: (0). Elapsed: 0:00:24.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 123435 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Exon_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Exon_coverage.bed`

<pre>
</pre>
Process 123438 returned: (0). Elapsed: 0:00:25.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 123441 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Intron_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Intron_coverage.bed`

<pre>
</pre>
Process 123444 returned: (0). Elapsed: 0:00:29.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 123447 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_coverage.bed`

<pre>
</pre>
Process 123450 returned: (0). Elapsed: 0:00:25.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 123460 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_Flanking_Region_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 123463 returned: (0). Elapsed: 0:00:25.

### # Plot FRiP/F (09-17 16:38:31) elapsed: 155.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_coverage.bed', '14797082', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_frif.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_coverage.bed 14797082 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 123475 returned: (0). Elapsed: 0:00:34. Peak memory: (Process: 0.403GB; Pipeline: 0.319GB)
> `Cumulative FRiF`	QC_hg19/gold2_frif.pdf	Cumulative FRiF	QC_hg19/gold2_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-17 16:39:08) elapsed: 37.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/gold2_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.narrowPeak gold2 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Promoter :	found 12448
Promoter Flanking Region :	found 14655
5' UTR :	found 237
3' UTR :	found 388
Exon :	found 720
Intron :	found 10165
Peak annotation complete!

</pre>
Process 123491 returned: (0). Elapsed: 0:00:15. Peak memory: (Process: 0.245GB; Pipeline: 0.403GB)
> `Peak chromosome distribution`	QC_hg19/gold2_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold2_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold2_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold2_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold2_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold2_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/tmpFqP16Z
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/tmpFqP16Z`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/prealignments/bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/tmpKivDbf
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/tmpKivDbf`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19/gold2_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/peak_calling_hg19/gold2_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2_R1.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold2/fastq/gold2-trimmed.log`
> `Time`	0:51:59	PEPATAC	_RES_
> `Success`	09-17-16:39:23	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:51:59
*     Peak memory used:  0.4 GB
* Pipeline completed at:  (09-17 16:39:23) elapsed: 15.0 _TIME_

Pypiper terminating spawned child process 87239...(tee)
