----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg19 --sample-name gold4 --input /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz --input2 /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz --prealignments rCRSd --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-18
*          Working dir:  /sfs/lustre/scratch/jps3dp/DATA/meta
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/
*  Pipeline started at:   (09-18 09:41:39) elapsed: 0.0 _TIME_

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
*             `input2`:  `['/sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//gold/pepatac/hg19/09_17_18/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `gold4`
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
Using custom config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Loading config file: /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/pipelines/pepatac.yaml
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz
Local input file: /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz
> `File_mb`	3135.7354	PEPATAC	_RES_
> `Read_type`	paired	PEPATAC	_RES_
> `Genome`	hg19	PEPATAC	_RES_

### Merge/link and fastq conversion:  (09-18 09:41:39) elapsed: 0.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R1.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_1.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R1.fastq.gz`

<pre>
</pre>
Process 43641 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R2.fastq.gz`
> `ln -sf /sfs/lustre/allocations/shefflab/data/sra_fastq/SRR5210428_2.fastq.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R2.fastq.gz`

<pre>
</pre>
Process 43642 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.fastq`
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.fastq`

<pre>
</pre>
Process 43643 returned: (0). Elapsed: 0:00:27.
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.fastq`

<pre>
</pre>
Process 43655 returned: (0). Elapsed: 0:00:32.
Follow:
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.fastq']
> `Raw_reads`	101078490	PEPATAC	_RES_
> `Fastq_reads`	101078490	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/gold4_R2.fastq.gz']

### Adapter trimming:  (09-18 09:45:01) elapsed: 202.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`
> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.fastq`

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
Tue Sep 18 09:45:01 2018[0;32m >> started[0m

Tue Sep 18 09:49:19 2018[0;32m >> done[0m (258.315s)
50539245 read pairs processed; of these:
     297 ( 0.00%) short read pairs filtered out after trimming by size control
     178 ( 0.00%) empty read pairs filtered out after trimming by size control
50538770 (100.00%) read pairs available; of these:
 3227085 ( 6.39%) trimmed read pairs available after processing
47311685 (93.61%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4-trimmed.log".
</pre>
Process 47333 returned: (0). Elapsed: 0:04:18. Peak memory: (Process: 0.02GB; Pipeline: 0.0GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`

<pre>
</pre>
Process 52932 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.02GB)
> `mv /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.trim.fastq`

<pre>
</pre>
Process 52937 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.02GB)
Follow:
Evaluating read trimming
> `Trimmed_reads`	101077540	PEPATAC	_RES_
> `Trim_loss_rate`	0.0	PEPATAC	_RES_

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`

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
Process 53227 returned: (0). Elapsed: 0:02:23. Peak memory: (Process: 0.197GB; Pipeline: 0.02GB)

Targetless command, running...
> `fastqc --noextract --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastqc /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.trim.fastq`

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
Process 56446 returned: (0). Elapsed: 0:02:39. Peak memory: (Process: 0.166GB; Pipeline: 0.197GB)
> `FastQC report r1`	fastqc/gold4_R1.trim_fastqc.html	FastQC report r1	fastqc/gold4_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/gold4_R2.trim_fastqc.html	FastQC report r2	fastqc/gold4_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 09:54:36) elapsed: 575.0 _TIME_

Prealignment assemblies: ['rCRSd']

### Map to rCRSd (09-18 09:54:36) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/bt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/bt2`

<pre>
</pre>
Process 61078 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.197GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/bt2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 61080

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id gold4 -U /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/bt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 61081 returned: (0). Elapsed: 0:05:56.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	14045392.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	13.9	PEPATAC	_RES_

### Map to genome (09-18 10:00:32) elapsed: 356.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id gold4 -x /nm/t1/genomes/hg19/indexed_bowtie2/hg19 -1 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/gold4_rCRSd_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/tmpnZAVxY -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_temp.bam`

<pre>
7022696 reads skipped
0 reads lost
43516074 reads; of these:
  43516074 (100.00%) were paired; of these:
    1424879 (3.27%) aligned concordantly 0 times
    32973840 (75.77%) aligned concordantly exactly 1 time
    9117355 (20.95%) aligned concordantly >1 times
    ----
    1424879 pairs aligned concordantly 0 times; of these:
      35170 (2.47%) aligned discordantly 1 time
    ----
    1389709 pairs aligned 0 times concordantly or discordantly; of these:
      2779418 mates make up the pairs; of these:
        1807205 (65.02%) aligned 0 times
        447406 (16.10%) aligned exactly 1 time
        524807 (18.88%) aligned >1 times
97.92% overall alignment rate
[bam_sort_core] merging from 37 files...
</pre>
Process 66025 returned: (0). Elapsed: 2:13:11.
> `samtools view -q 10 -b -@ 8 -f 2 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`

<pre>
</pre>
Process 196045 returned: (0). Elapsed: 0:02:37.
Follow:
> `Aligned_reads`	74462784	PEPATAC	_RES_
> `Alignment_rate`	73.67	PEPATAC	_RES_
> `Total_efficiency`	73.67	PEPATAC	_RES_

### Calculate NRF, PBC1, and PBC2 (09-18 12:17:45) elapsed: 8234.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam.bai`
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam`

<pre>
</pre>
Process 4011 returned: (0). Elapsed: 0:01:28. Peak memory: (Process: 0.017GB; Pipeline: 0.197GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`

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
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/tmp_gold4_sort_DiKsdU'
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
[Name: chrUn_gl000234; Size: 40531]
[Name: chrUn_gl000232; Size: 40652]
[Name: chr6_apd_hap1; Size: 4622290]
[Name: chrUn_gl000237; Size: 45867]
[Name: chr6_qbl_hap6; Size: 4611984]
[Name: chr6_cox_hap2; Size: 4795371]
[Name: chrUn_gl000249; Size: 38502]
[Name: chrUn_gl000244; Size: 39929]
[Name: chrUn_gl000246; Size: 38154]
[Name: chr11_gl000202_random; Size: 40103]
[Name: chr4_gl000193_random; Size: 189789]
[Name: chrUn_gl000245; Size: 36651]
[Name: chrUn_gl000247; Size: 36422]
[Name: chr17_gl000206_random; Size: 41001]
[Name: chrUn_gl000242; Size: 43523]
[Name: chrUn_gl000248; Size: 39786]
[Name: chrUn_gl000243; Size: 43341]
[Name: chr17_gl000204_random; Size: 81310]
[Name: chr9_gl000199_random; Size: 169874]
[Name: chr6_ssto_hap7; Size: 4928567]
[Name: chrUn_gl000240; Size: 41933]
[Name: chr17_ctg5_hap1; Size: 1680828]
[Name: chr8_gl000197_random; Size: 37175]
[Name: chr9_gl000201_random; Size: 36148]
[Name: chrUn_gl000241; Size: 42152]
[Name: chr17_gl000205_random; Size: 174588]
[Name: chr8; Size: 146364022]
[Name: chr6_dbb_hap3; Size: 4610396]
[Name: chr7_gl000195_random; Size: 182896]
[Name: chr3; Size: 198022430]
[Name: chr17_gl000203_random; Size: 37498]
[Name: chr4_gl000194_random; Size: 191469]
[Name: chr1_gl000191_random; Size: 106433]
[Name: chr4_ctg9_hap1; Size: 590426]
[Name: chrY; Size: 59373566]
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
[Name: chr5; Size: 180915260]
[Name: chr9; Size: 141213431]
[Name: chr17; Size: 81195210]
[Name: chr19; Size: 59128983]
[Name: chr2; Size: 243199373]
[Name: chrUn_gl000229; Size: 19913]
[Name: chr1; Size: 249250621]
[Name: chrUn_gl000225; Size: 211173]
[Name: chrUn_gl000226; Size: 15008]
[Name: chrUn_gl000227; Size: 128374]
[Name: chrUn_gl000220; Size: 161802]
[Name: chr16; Size: 90354753]
[Name: chrUn_gl000221; Size: 155397]
[Name: chrUn_gl000222; Size: 186861]
[Name: chrUn_gl000223; Size: 180455]
[Name: chr18_gl000207_random; Size: 4262]
[Name: chr11; Size: 135006516]
[Name: chr6; Size: 171115067]
[Name: chrM; Size: 16571]
[Name: chr4; Size: 191154276]
[Name: chr1_gl000192_random; Size: 547496]
[Name: chrUn_gl000224; Size: 179693]
[Name: chrUn_gl000228; Size: 129120]
Discarding 1 chunk(s) of reads: ['chr9_gl000200_random']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv'
</pre>
Process 6221 returned: (0). Elapsed: 0:01:22. Peak memory: (Process: 0.058GB; Pipeline: 0.197GB)
Follow:
> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_bamQC.tsv`

> `NRF`	0.94	PEPATAC	_RES_
> `PBC1`	0.97	PEPATAC	_RES_
> `PBC2`	35.78	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_unmap.bam`
> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_temp.bam > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_unmap.bam`

<pre>
</pre>
Process 8164 returned: (0). Elapsed: 0:00:18.

### Remove dupes, build bigwig and bedgraph files (09-18 12:20:53) elapsed: 188.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`
> `java -Xmx15200m -jar /sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar MarkDuplicates INPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_picard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_picard_metrics_log.txt`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
12:20:54.989 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar!/com/intel/gkl/native/libgkl_compression.so
[Tue Sep 18 12:20:55 EDT 2018] MarkDuplicates INPUT=[/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam] OUTPUT=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_picard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 TAG_DUPLICATE_SET_MEMBERS=false REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag CLEAR_DT=true ADD_PG_TAG_TO_READS=true DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 MAX_OPTICAL_DUPLICATE_SET_SIZE=300000 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json USE_JDK_DEFLATER=false USE_JDK_INFLATER=false
[Tue Sep 18 12:20:55 EDT 2018] Executing as jps3dp@udc-ba26-18 on Linux 3.10.0-514.21.2.el7.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_171-b11; Deflater: Intel; Inflater: Intel; Picard version: 2.17.4-1-gb63d73e-SNAPSHOT
INFO	2018-09-18 12:20:55	MarkDuplicates	Start of doWork freeMemory: 2038258480; totalMemory: 2058354688; maxMemory: 14167834624
INFO	2018-09-18 12:20:55	MarkDuplicates	Reading input file and constructing read end information.
INFO	2018-09-18 12:20:55	MarkDuplicates	Will retain up to 51332734 data points before spilling to disk.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold4
WARNING	2018-09-18 12:20:55	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR5210428.15767598. Cause: String 'SRR5210428.15767598' did not start with a parsable number.
INFO	2018-09-18 12:20:59	MarkDuplicates	Read     1,000,000 records.  Elapsed time: 00:00:04s.  Time for last 1,000,000:    4s.  Last read position: chr1:37,423,379
INFO	2018-09-18 12:20:59	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:21:04	MarkDuplicates	Read     2,000,000 records.  Elapsed time: 00:00:09s.  Time for last 1,000,000:    4s.  Last read position: chr1:75,638,226
INFO	2018-09-18 12:21:04	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:21:08	MarkDuplicates	Read     3,000,000 records.  Elapsed time: 00:00:12s.  Time for last 1,000,000:    3s.  Last read position: chr1:115,102,313
INFO	2018-09-18 12:21:08	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:21:12	MarkDuplicates	Read     4,000,000 records.  Elapsed time: 00:00:17s.  Time for last 1,000,000:    4s.  Last read position: chr1:175,736,588
INFO	2018-09-18 12:21:12	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:21:16	MarkDuplicates	Read     5,000,000 records.  Elapsed time: 00:00:21s.  Time for last 1,000,000:    3s.  Last read position: chr1:213,924,738
INFO	2018-09-18 12:21:16	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:21:20	MarkDuplicates	Read     6,000,000 records.  Elapsed time: 00:00:25s.  Time for last 1,000,000:    4s.  Last read position: chr2:2,097,981
INFO	2018-09-18 12:21:20	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:21:24	MarkDuplicates	Read     7,000,000 records.  Elapsed time: 00:00:29s.  Time for last 1,000,000:    4s.  Last read position: chr2:39,070,278
INFO	2018-09-18 12:21:24	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:21:28	MarkDuplicates	Read     8,000,000 records.  Elapsed time: 00:00:33s.  Time for last 1,000,000:    3s.  Last read position: chr2:75,698,955
INFO	2018-09-18 12:21:28	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:21:35	MarkDuplicates	Read     9,000,000 records.  Elapsed time: 00:00:40s.  Time for last 1,000,000:    7s.  Last read position: chr2:121,999,062
INFO	2018-09-18 12:21:35	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:21:39	MarkDuplicates	Read    10,000,000 records.  Elapsed time: 00:00:44s.  Time for last 1,000,000:    3s.  Last read position: chr2:160,806,252
INFO	2018-09-18 12:21:39	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:21:43	MarkDuplicates	Read    11,000,000 records.  Elapsed time: 00:00:48s.  Time for last 1,000,000:    3s.  Last read position: chr2:199,079,080
INFO	2018-09-18 12:21:43	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:21:47	MarkDuplicates	Read    12,000,000 records.  Elapsed time: 00:00:52s.  Time for last 1,000,000:    4s.  Last read position: chr2:235,405,570
INFO	2018-09-18 12:21:47	MarkDuplicates	Tracking 34 as yet unmatched pairs. 34 records in RAM.
INFO	2018-09-18 12:21:51	MarkDuplicates	Read    13,000,000 records.  Elapsed time: 00:00:55s.  Time for last 1,000,000:    3s.  Last read position: chr3:29,377,491
INFO	2018-09-18 12:21:51	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:21:55	MarkDuplicates	Read    14,000,000 records.  Elapsed time: 00:00:59s.  Time for last 1,000,000:    4s.  Last read position: chr3:65,230,551
INFO	2018-09-18 12:21:55	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:21:59	MarkDuplicates	Read    15,000,000 records.  Elapsed time: 00:01:03s.  Time for last 1,000,000:    4s.  Last read position: chr3:108,518,942
INFO	2018-09-18 12:21:59	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:22:02	MarkDuplicates	Read    16,000,000 records.  Elapsed time: 00:01:07s.  Time for last 1,000,000:    3s.  Last read position: chr3:144,972,301
INFO	2018-09-18 12:22:02	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:22:06	MarkDuplicates	Read    17,000,000 records.  Elapsed time: 00:01:11s.  Time for last 1,000,000:    4s.  Last read position: chr3:184,063,259
INFO	2018-09-18 12:22:06	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:22:16	MarkDuplicates	Read    18,000,000 records.  Elapsed time: 00:01:20s.  Time for last 1,000,000:    9s.  Last read position: chr4:22,627,144
INFO	2018-09-18 12:22:16	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:22:19	MarkDuplicates	Read    19,000,000 records.  Elapsed time: 00:01:24s.  Time for last 1,000,000:    3s.  Last read position: chr4:65,907,095
INFO	2018-09-18 12:22:19	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:22:23	MarkDuplicates	Read    20,000,000 records.  Elapsed time: 00:01:28s.  Time for last 1,000,000:    4s.  Last read position: chr4:105,959,176
INFO	2018-09-18 12:22:23	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:22:27	MarkDuplicates	Read    21,000,000 records.  Elapsed time: 00:01:32s.  Time for last 1,000,000:    4s.  Last read position: chr4:146,556,993
INFO	2018-09-18 12:22:27	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:22:31	MarkDuplicates	Read    22,000,000 records.  Elapsed time: 00:01:36s.  Time for last 1,000,000:    3s.  Last read position: chr4:185,454,966
INFO	2018-09-18 12:22:31	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:22:35	MarkDuplicates	Read    23,000,000 records.  Elapsed time: 00:01:40s.  Time for last 1,000,000:    4s.  Last read position: chr5:33,963,372
INFO	2018-09-18 12:22:35	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:22:39	MarkDuplicates	Read    24,000,000 records.  Elapsed time: 00:01:44s.  Time for last 1,000,000:    4s.  Last read position: chr5:77,929,771
INFO	2018-09-18 12:22:39	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:22:43	MarkDuplicates	Read    25,000,000 records.  Elapsed time: 00:01:48s.  Time for last 1,000,000:    3s.  Last read position: chr5:117,311,696
INFO	2018-09-18 12:22:43	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:22:47	MarkDuplicates	Read    26,000,000 records.  Elapsed time: 00:01:52s.  Time for last 1,000,000:    4s.  Last read position: chr5:153,081,101
INFO	2018-09-18 12:22:47	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:22:51	MarkDuplicates	Read    27,000,000 records.  Elapsed time: 00:01:56s.  Time for last 1,000,000:    4s.  Last read position: chr6:9,486,891
INFO	2018-09-18 12:22:51	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:22:55	MarkDuplicates	Read    28,000,000 records.  Elapsed time: 00:02:00s.  Time for last 1,000,000:    3s.  Last read position: chr6:51,248,858
INFO	2018-09-18 12:22:55	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:22:59	MarkDuplicates	Read    29,000,000 records.  Elapsed time: 00:02:04s.  Time for last 1,000,000:    4s.  Last read position: chr6:92,768,250
INFO	2018-09-18 12:22:59	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:23:03	MarkDuplicates	Read    30,000,000 records.  Elapsed time: 00:02:08s.  Time for last 1,000,000:    3s.  Last read position: chr6:131,844,397
INFO	2018-09-18 12:23:03	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:23:07	MarkDuplicates	Read    31,000,000 records.  Elapsed time: 00:02:12s.  Time for last 1,000,000:    4s.  Last read position: chr6:168,408,684
INFO	2018-09-18 12:23:07	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-18 12:23:12	MarkDuplicates	Read    32,000,000 records.  Elapsed time: 00:02:16s.  Time for last 1,000,000:    4s.  Last read position: chr7:34,884,378
INFO	2018-09-18 12:23:12	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:23:25	MarkDuplicates	Read    33,000,000 records.  Elapsed time: 00:02:30s.  Time for last 1,000,000:   13s.  Last read position: chr7:77,843,045
INFO	2018-09-18 12:23:25	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:23:29	MarkDuplicates	Read    34,000,000 records.  Elapsed time: 00:02:34s.  Time for last 1,000,000:    3s.  Last read position: chr7:116,261,167
INFO	2018-09-18 12:23:29	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:23:33	MarkDuplicates	Read    35,000,000 records.  Elapsed time: 00:02:38s.  Time for last 1,000,000:    4s.  Last read position: chr7:154,810,667
INFO	2018-09-18 12:23:33	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:23:37	MarkDuplicates	Read    36,000,000 records.  Elapsed time: 00:02:42s.  Time for last 1,000,000:    4s.  Last read position: chrX:38,719,186
INFO	2018-09-18 12:23:37	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:23:41	MarkDuplicates	Read    37,000,000 records.  Elapsed time: 00:02:46s.  Time for last 1,000,000:    4s.  Last read position: chrX:85,566,867
INFO	2018-09-18 12:23:41	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:23:45	MarkDuplicates	Read    38,000,000 records.  Elapsed time: 00:02:50s.  Time for last 1,000,000:    3s.  Last read position: chrX:131,121,761
INFO	2018-09-18 12:23:45	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:23:49	MarkDuplicates	Read    39,000,000 records.  Elapsed time: 00:02:54s.  Time for last 1,000,000:    4s.  Last read position: chr8:17,829,597
INFO	2018-09-18 12:23:49	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:23:54	MarkDuplicates	Read    40,000,000 records.  Elapsed time: 00:02:59s.  Time for last 1,000,000:    4s.  Last read position: chr8:57,078,207
INFO	2018-09-18 12:23:54	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:23:58	MarkDuplicates	Read    41,000,000 records.  Elapsed time: 00:03:03s.  Time for last 1,000,000:    4s.  Last read position: chr8:95,456,850
INFO	2018-09-18 12:23:58	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:24:03	MarkDuplicates	Read    42,000,000 records.  Elapsed time: 00:03:07s.  Time for last 1,000,000:    4s.  Last read position: chr8:133,058,235
INFO	2018-09-18 12:24:03	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:24:06	MarkDuplicates	Read    43,000,000 records.  Elapsed time: 00:03:11s.  Time for last 1,000,000:    3s.  Last read position: chr9:23,658,136
INFO	2018-09-18 12:24:06	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:24:11	MarkDuplicates	Read    44,000,000 records.  Elapsed time: 00:03:16s.  Time for last 1,000,000:    4s.  Last read position: chr9:92,071,902
INFO	2018-09-18 12:24:11	MarkDuplicates	Tracking 10 as yet unmatched pairs. 10 records in RAM.
INFO	2018-09-18 12:24:15	MarkDuplicates	Read    45,000,000 records.  Elapsed time: 00:03:20s.  Time for last 1,000,000:    4s.  Last read position: chr9:129,899,904
INFO	2018-09-18 12:24:15	MarkDuplicates	Tracking 6 as yet unmatched pairs. 6 records in RAM.
INFO	2018-09-18 12:24:19	MarkDuplicates	Read    46,000,000 records.  Elapsed time: 00:03:24s.  Time for last 1,000,000:    4s.  Last read position: chr10:25,204,487
INFO	2018-09-18 12:24:19	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:24:24	MarkDuplicates	Read    47,000,000 records.  Elapsed time: 00:03:28s.  Time for last 1,000,000:    4s.  Last read position: chr10:68,696,575
INFO	2018-09-18 12:24:24	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:24:40	MarkDuplicates	Read    48,000,000 records.  Elapsed time: 00:03:45s.  Time for last 1,000,000:   16s.  Last read position: chr10:105,111,058
INFO	2018-09-18 12:24:40	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-18 12:24:44	MarkDuplicates	Read    49,000,000 records.  Elapsed time: 00:03:49s.  Time for last 1,000,000:    3s.  Last read position: chr11:4,629,484
INFO	2018-09-18 12:24:44	MarkDuplicates	Tracking 50 as yet unmatched pairs. 50 records in RAM.
INFO	2018-09-18 12:24:48	MarkDuplicates	Read    50,000,000 records.  Elapsed time: 00:03:53s.  Time for last 1,000,000:    3s.  Last read position: chr11:42,449,209
INFO	2018-09-18 12:24:48	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:24:52	MarkDuplicates	Read    51,000,000 records.  Elapsed time: 00:03:57s.  Time for last 1,000,000:    4s.  Last read position: chr11:81,607,074
INFO	2018-09-18 12:24:52	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:13	MarkDuplicates	Read    52,000,000 records.  Elapsed time: 00:04:18s.  Time for last 1,000,000:   20s.  Last read position: chr11:119,840,976
INFO	2018-09-18 12:25:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:17	MarkDuplicates	Read    53,000,000 records.  Elapsed time: 00:04:22s.  Time for last 1,000,000:    3s.  Last read position: chr12:22,157,541
INFO	2018-09-18 12:25:17	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:21	MarkDuplicates	Read    54,000,000 records.  Elapsed time: 00:04:26s.  Time for last 1,000,000:    3s.  Last read position: chr12:62,770,676
INFO	2018-09-18 12:25:21	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:25	MarkDuplicates	Read    55,000,000 records.  Elapsed time: 00:04:30s.  Time for last 1,000,000:    4s.  Last read position: chr12:101,070,959
INFO	2018-09-18 12:25:25	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:29	MarkDuplicates	Read    56,000,000 records.  Elapsed time: 00:04:34s.  Time for last 1,000,000:    4s.  Last read position: chr13:22,573,540
INFO	2018-09-18 12:25:29	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 12:25:33	MarkDuplicates	Read    57,000,000 records.  Elapsed time: 00:04:38s.  Time for last 1,000,000:    4s.  Last read position: chr13:61,699,038
INFO	2018-09-18 12:25:33	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:37	MarkDuplicates	Read    58,000,000 records.  Elapsed time: 00:04:42s.  Time for last 1,000,000:    3s.  Last read position: chr13:103,103,160
INFO	2018-09-18 12:25:37	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:41	MarkDuplicates	Read    59,000,000 records.  Elapsed time: 00:04:46s.  Time for last 1,000,000:    4s.  Last read position: chr14:46,442,600
INFO	2018-09-18 12:25:41	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:46	MarkDuplicates	Read    60,000,000 records.  Elapsed time: 00:04:51s.  Time for last 1,000,000:    4s.  Last read position: chr14:83,338,297
INFO	2018-09-18 12:25:46	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:50	MarkDuplicates	Read    61,000,000 records.  Elapsed time: 00:04:55s.  Time for last 1,000,000:    4s.  Last read position: chr15:36,104,478
INFO	2018-09-18 12:25:50	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:25:55	MarkDuplicates	Read    62,000,000 records.  Elapsed time: 00:05:00s.  Time for last 1,000,000:    4s.  Last read position: chr15:74,272,235
INFO	2018-09-18 12:25:55	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:00	MarkDuplicates	Read    63,000,000 records.  Elapsed time: 00:05:05s.  Time for last 1,000,000:    5s.  Last read position: chr16:8,738,249
INFO	2018-09-18 12:26:00	MarkDuplicates	Tracking 18 as yet unmatched pairs. 18 records in RAM.
INFO	2018-09-18 12:26:05	MarkDuplicates	Read    64,000,000 records.  Elapsed time: 00:05:10s.  Time for last 1,000,000:    4s.  Last read position: chr16:57,957,722
INFO	2018-09-18 12:26:05	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:09	MarkDuplicates	Read    65,000,000 records.  Elapsed time: 00:05:14s.  Time for last 1,000,000:    4s.  Last read position: chr17:4,004,566
INFO	2018-09-18 12:26:09	MarkDuplicates	Tracking 8 as yet unmatched pairs. 8 records in RAM.
INFO	2018-09-18 12:26:13	MarkDuplicates	Read    66,000,000 records.  Elapsed time: 00:05:18s.  Time for last 1,000,000:    4s.  Last read position: chr17:45,808,705
INFO	2018-09-18 12:26:13	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:18	MarkDuplicates	Read    67,000,000 records.  Elapsed time: 00:05:22s.  Time for last 1,000,000:    4s.  Last read position: chr18:1,197,999
INFO	2018-09-18 12:26:18	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:22	MarkDuplicates	Read    68,000,000 records.  Elapsed time: 00:05:27s.  Time for last 1,000,000:    4s.  Last read position: chr18:42,339,432
INFO	2018-09-18 12:26:22	MarkDuplicates	Tracking 16 as yet unmatched pairs. 16 records in RAM.
INFO	2018-09-18 12:26:26	MarkDuplicates	Read    69,000,000 records.  Elapsed time: 00:05:31s.  Time for last 1,000,000:    3s.  Last read position: chr20:1,214,704
INFO	2018-09-18 12:26:26	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:30	MarkDuplicates	Read    70,000,000 records.  Elapsed time: 00:05:35s.  Time for last 1,000,000:    3s.  Last read position: chr20:40,037,197
INFO	2018-09-18 12:26:30	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:44	MarkDuplicates	Read    71,000,000 records.  Elapsed time: 00:05:49s.  Time for last 1,000,000:   14s.  Last read position: chr19:10,752,513
INFO	2018-09-18 12:26:44	MarkDuplicates	Tracking 4 as yet unmatched pairs. 4 records in RAM.
INFO	2018-09-18 12:26:48	MarkDuplicates	Read    72,000,000 records.  Elapsed time: 00:05:53s.  Time for last 1,000,000:    3s.  Last read position: chr19:47,892,588
INFO	2018-09-18 12:26:48	MarkDuplicates	Tracking 34 as yet unmatched pairs. 34 records in RAM.
INFO	2018-09-18 12:26:52	MarkDuplicates	Read    73,000,000 records.  Elapsed time: 00:05:57s.  Time for last 1,000,000:    3s.  Last read position: chr22:42,163,645
INFO	2018-09-18 12:26:52	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:56	MarkDuplicates	Read    74,000,000 records.  Elapsed time: 00:06:01s.  Time for last 1,000,000:    4s.  Last read position: chr21:42,266,471
INFO	2018-09-18 12:26:56	MarkDuplicates	Tracking 2 as yet unmatched pairs. 2 records in RAM.
INFO	2018-09-18 12:26:58	MarkDuplicates	Read 74462784 records. 0 pairs never matched.
INFO	2018-09-18 12:27:18	MarkDuplicates	After buildSortedReadEndLists freeMemory: 7314150528; totalMemory: 10263461888; maxMemory: 14167834624
INFO	2018-09-18 12:27:18	MarkDuplicates	Will retain up to 442744832 duplicate indices before spilling to disk.
INFO	2018-09-18 12:27:18	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2018-09-18 12:27:21	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2018-09-18 12:27:38	MarkDuplicates	Sorting list of duplicate records.
INFO	2018-09-18 12:27:39	MarkDuplicates	After generateDuplicateIndexes freeMemory: 7642419448; totalMemory: 11251220480; maxMemory: 14167834624
INFO	2018-09-18 12:27:39	MarkDuplicates	Marking 2180250 records as duplicates.
INFO	2018-09-18 12:27:39	MarkDuplicates	Found 0 optical duplicate clusters.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:gold4
INFO	2018-09-18 12:27:39	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2018-09-18 12:28:38	MarkDuplicates	Written    10,000,000 records.  Elapsed time: 00:00:58s.  Time for last 10,000,000:   58s.  Last read position: chr2:173,048,411
INFO	2018-09-18 12:29:36	MarkDuplicates	Written    20,000,000 records.  Elapsed time: 00:01:57s.  Time for last 10,000,000:   58s.  Last read position: chr4:130,422,933
INFO	2018-09-18 12:30:35	MarkDuplicates	Written    30,000,000 records.  Elapsed time: 00:02:56s.  Time for last 10,000,000:   58s.  Last read position: chr6:165,311,108
INFO	2018-09-18 12:31:34	MarkDuplicates	Written    40,000,000 records.  Elapsed time: 00:03:55s.  Time for last 10,000,000:   58s.  Last read position: chr8:103,353,390
INFO	2018-09-18 12:32:32	MarkDuplicates	Written    50,000,000 records.  Elapsed time: 00:04:53s.  Time for last 10,000,000:   58s.  Last read position: chr11:102,217,393
INFO	2018-09-18 12:33:33	MarkDuplicates	Written    60,000,000 records.  Elapsed time: 00:05:54s.  Time for last 10,000,000:   60s.  Last read position: chr15:66,909,740
INFO	2018-09-18 12:34:33	MarkDuplicates	Written    70,000,000 records.  Elapsed time: 00:06:54s.  Time for last 10,000,000:   60s.  Last read position: chr19:50,931,171
INFO	2018-09-18 12:34:47	MarkDuplicates	Before output close freeMemory: 10702869864; totalMemory: 10779361280; maxMemory: 14167834624
INFO	2018-09-18 12:34:47	MarkDuplicates	After output close freeMemory: 10763162984; totalMemory: 10839654400; maxMemory: 14167834624
[Tue Sep 18 12:34:47 EDT 2018] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 13.88 minutes.
Runtime.totalMemory()=10839654400
</pre>
Process 8565 returned: (0). Elapsed: 0:13:54.
> `samtools index /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

<pre>
</pre>
Process 21275 returned: (0). Elapsed: 0:01:30. Peak memory: (Process: 0.017GB; Pipeline: 0.197GB)
Follow:
> `awk -F'	' -f /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/extract_post_dup_aligned_reads.awk /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_picard_metrics_bam.txt`

> `Duplicate_reads`	2180250.0	PEPATAC	_RES_
> `Dedup_aligned_reads`	72282534	PEPATAC	_RES_
> `Dedup_alignment_rate`	71.51	PEPATAC	_RES_
> `Dedup_total_efficiency`	71.51	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (09-18 12:36:18) elapsed: 924.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -c /nm/t1/genomes/hg19/hg19.chromSizes -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/gold4_exact.bw -w /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/tmp_gold4_sort_dedup_cuttrace_9_WpJE'
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
Discarding 1 chunk(s) of reads: ['chr9_gl000200_random']
Keeping 92 chunk(s) of reads: ['chr19_gl000208_random', 'chr21_gl000210_random', 'chr6_apd_hap1', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chr14', 'chr19', 'chr18', 'chr9_gl000198_random', 'chrUn_gl000239', 'chrUn_gl000238', 'chrUn_gl000233', 'chrUn_gl000232', 'chrUn_gl000231', 'chrUn_gl000230', 'chrUn_gl000237', 'chrUn_gl000236', 'chrUn_gl000235', 'chrUn_gl000234', 'chr6_qbl_hap6', 'chr11_gl000202_random', 'chr17_gl000206_random', 'chr6_cox_hap2', 'chr4_gl000193_random', 'chrUn_gl000248', 'chrUn_gl000249', 'chrUn_gl000246', 'chrUn_gl000247', 'chrUn_gl000244', 'chrUn_gl000245', 'chrUn_gl000242', 'chrUn_gl000243', 'chrUn_gl000240', 'chrUn_gl000241', 'chr17_gl000204_random', 'chr17_ctg5_hap1', 'chr17_gl000205_random', 'chr9_gl000199_random', 'chr9_gl000201_random', 'chr8', 'chr6_ssto_hap7', 'chr8_gl000197_random', 'chr6_dbb_hap3', 'chr7_gl000195_random', 'chr1_gl000191_random', 'chr4_ctg9_hap1', 'chr3', 'chrUn_gl000229', 'chr1', 'chr17_gl000203_random', 'chr4_gl000194_random', 'chrY', 'chrX', 'chr9', 'chrM', 'chr8_gl000196_random', 'chr6_mann_hap4', 'chrUn_gl000211', 'chrUn_gl000213', 'chrUn_gl000212', 'chrUn_gl000215', 'chrUn_gl000214', 'chrUn_gl000217', 'chrUn_gl000216', 'chrUn_gl000219', 'chrUn_gl000218', 'chr19_gl000209_random', 'chr22', 'chr20', 'chr21', 'chr6_mcf_hap5', 'chr7', 'chr6', 'chr5', 'chr4', 'chrUn_gl000228', 'chr2', 'chr1_gl000192_random', 'chrUn_gl000224', 'chrUn_gl000225', 'chrUn_gl000226', 'chrUn_gl000227', 'chrUn_gl000220', 'chrUn_gl000221', 'chrUn_gl000222', 'chrUn_gl000223', 'chr18_gl000207_random']
Reduce step (merge files)...
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/gold4_exact.bw'
Merging 92 files into output file: '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_smooth.bw'
</pre>
Process 22557 returned: (0). Elapsed: 0:17:35. Peak memory: (Process: 0.03GB; Pipeline: 0.197GB)
> `touch /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed`

<pre>
</pre>
Process 42955 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.197GB)

### Calculate TSS enrichment (09-18 12:53:53) elapsed: 1055.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt`
> `/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -b /nm/t1/genomes/hg19/hg19_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt`

<pre>
</pre>
Process 42956 returned: (0). Elapsed: 0:00:15. Peak memory: (Process: 0.044GB; Pipeline: 0.197GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_TssEnrichment.txt
Completed!

</pre>
Process 42997 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.034GB; Pipeline: 0.197GB)
> `TSS_Score`	7.10991349906	PEPATAC	_RES_
> `TSS enrichment`	QC_hg19/gold4_TssEnrichment.pdf	TSS enrichment	QC_hg19/gold4_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 12:54:11) elapsed: 18.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragLenDistribution.pdf`
> `perl /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragLen.txt`

<pre>
</pre>
Process 43004 returned: (0). Elapsed: 0:03:48. Peak memory: (Process: 0.002GB; Pipeline: 0.197GB)
> `sort -n  /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragCount.txt`

<pre>
</pre>
Process 45885 returned: (0). Elapsed: 0:00:24.
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragLen.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragCount.txt /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_fragLenDistribution.txt`

<pre>
</pre>
Process 46425 returned: (0). Elapsed: 0:00:10. Peak memory: (Process: 0.423GB; Pipeline: 0.197GB)
> `Fragment distribution`	QC_hg19/gold4_fragLenDistribution.pdf	Fragment distribution	QC_hg19/gold4_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 12:58:33) elapsed: 262.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak`
> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19 -n gold4 -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Tue, 18 Sep 2018 12:58:37: 
# Command line: callpeak -t /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19 -n gold4 -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = gold4
# format = BED
# ChIP-seq file = ['/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/gold4_shift.bed']
# control file = None
# effective genome size = 2.70e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Tue, 18 Sep 2018 12:58:37: #1 read tag files... 
INFO  @ Tue, 18 Sep 2018 12:58:37: #1 read treatment tags... 
INFO  @ Tue, 18 Sep 2018 12:58:38:  1000000 
INFO  @ Tue, 18 Sep 2018 12:58:39:  2000000 
INFO  @ Tue, 18 Sep 2018 12:58:40:  3000000 
INFO  @ Tue, 18 Sep 2018 12:58:41:  4000000 
INFO  @ Tue, 18 Sep 2018 12:58:41:  5000000 
INFO  @ Tue, 18 Sep 2018 12:58:42:  6000000 
INFO  @ Tue, 18 Sep 2018 12:58:43:  7000000 
INFO  @ Tue, 18 Sep 2018 12:58:44:  8000000 
INFO  @ Tue, 18 Sep 2018 12:58:45:  9000000 
INFO  @ Tue, 18 Sep 2018 12:58:46:  10000000 
INFO  @ Tue, 18 Sep 2018 12:58:46:  11000000 
INFO  @ Tue, 18 Sep 2018 12:58:47:  12000000 
INFO  @ Tue, 18 Sep 2018 12:58:48:  13000000 
INFO  @ Tue, 18 Sep 2018 12:58:49:  14000000 
INFO  @ Tue, 18 Sep 2018 12:58:50:  15000000 
INFO  @ Tue, 18 Sep 2018 12:58:51:  16000000 
INFO  @ Tue, 18 Sep 2018 12:58:52:  17000000 
INFO  @ Tue, 18 Sep 2018 12:58:52:  18000000 
INFO  @ Tue, 18 Sep 2018 12:58:53:  19000000 
INFO  @ Tue, 18 Sep 2018 12:58:54:  20000000 
INFO  @ Tue, 18 Sep 2018 12:58:55:  21000000 
INFO  @ Tue, 18 Sep 2018 12:58:56:  22000000 
INFO  @ Tue, 18 Sep 2018 12:58:57:  23000000 
INFO  @ Tue, 18 Sep 2018 12:58:57:  24000000 
INFO  @ Tue, 18 Sep 2018 12:58:58:  25000000 
INFO  @ Tue, 18 Sep 2018 12:58:59:  26000000 
INFO  @ Tue, 18 Sep 2018 12:59:00:  27000000 
INFO  @ Tue, 18 Sep 2018 12:59:01:  28000000 
INFO  @ Tue, 18 Sep 2018 12:59:02:  29000000 
INFO  @ Tue, 18 Sep 2018 12:59:03:  30000000 
INFO  @ Tue, 18 Sep 2018 12:59:03:  31000000 
INFO  @ Tue, 18 Sep 2018 12:59:04:  32000000 
INFO  @ Tue, 18 Sep 2018 12:59:05:  33000000 
INFO  @ Tue, 18 Sep 2018 12:59:06:  34000000 
INFO  @ Tue, 18 Sep 2018 12:59:07:  35000000 
INFO  @ Tue, 18 Sep 2018 12:59:08:  36000000 
INFO  @ Tue, 18 Sep 2018 12:59:08:  37000000 
INFO  @ Tue, 18 Sep 2018 12:59:09:  38000000 
INFO  @ Tue, 18 Sep 2018 12:59:10:  39000000 
INFO  @ Tue, 18 Sep 2018 12:59:11:  40000000 
INFO  @ Tue, 18 Sep 2018 12:59:12:  41000000 
INFO  @ Tue, 18 Sep 2018 12:59:13:  42000000 
INFO  @ Tue, 18 Sep 2018 12:59:13:  43000000 
INFO  @ Tue, 18 Sep 2018 12:59:14:  44000000 
INFO  @ Tue, 18 Sep 2018 12:59:15:  45000000 
INFO  @ Tue, 18 Sep 2018 12:59:16:  46000000 
INFO  @ Tue, 18 Sep 2018 12:59:17:  47000000 
INFO  @ Tue, 18 Sep 2018 12:59:18:  48000000 
INFO  @ Tue, 18 Sep 2018 12:59:19:  49000000 
INFO  @ Tue, 18 Sep 2018 12:59:19:  50000000 
INFO  @ Tue, 18 Sep 2018 12:59:20:  51000000 
INFO  @ Tue, 18 Sep 2018 12:59:21:  52000000 
INFO  @ Tue, 18 Sep 2018 12:59:22:  53000000 
INFO  @ Tue, 18 Sep 2018 12:59:23:  54000000 
INFO  @ Tue, 18 Sep 2018 12:59:24:  55000000 
INFO  @ Tue, 18 Sep 2018 12:59:24:  56000000 
INFO  @ Tue, 18 Sep 2018 12:59:25:  57000000 
INFO  @ Tue, 18 Sep 2018 12:59:26:  58000000 
INFO  @ Tue, 18 Sep 2018 12:59:27:  59000000 
INFO  @ Tue, 18 Sep 2018 12:59:28:  60000000 
INFO  @ Tue, 18 Sep 2018 12:59:29:  61000000 
INFO  @ Tue, 18 Sep 2018 12:59:29:  62000000 
INFO  @ Tue, 18 Sep 2018 12:59:30:  63000000 
INFO  @ Tue, 18 Sep 2018 12:59:31:  64000000 
INFO  @ Tue, 18 Sep 2018 12:59:32:  65000000 
INFO  @ Tue, 18 Sep 2018 12:59:33:  66000000 
INFO  @ Tue, 18 Sep 2018 12:59:34:  67000000 
INFO  @ Tue, 18 Sep 2018 12:59:35:  68000000 
INFO  @ Tue, 18 Sep 2018 12:59:36:  69000000 
INFO  @ Tue, 18 Sep 2018 12:59:36:  70000000 
INFO  @ Tue, 18 Sep 2018 12:59:37:  71000000 
INFO  @ Tue, 18 Sep 2018 12:59:38:  72000000 
INFO  @ Tue, 18 Sep 2018 12:59:39: #1 tag size is determined as 50 bps 
INFO  @ Tue, 18 Sep 2018 12:59:39: #1 tag size = 50 
INFO  @ Tue, 18 Sep 2018 12:59:39: #1  total tags in treatment: 72282484 
INFO  @ Tue, 18 Sep 2018 12:59:39: #1 user defined the maximum tags... 
INFO  @ Tue, 18 Sep 2018 12:59:39: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Tue, 18 Sep 2018 12:59:41: #1  tags after filtering in treatment: 68319709 
INFO  @ Tue, 18 Sep 2018 12:59:41: #1  Redundant rate of treatment: 0.05 
INFO  @ Tue, 18 Sep 2018 12:59:41: #1 finished! 
INFO  @ Tue, 18 Sep 2018 12:59:41: #2 Build Peak Model... 
INFO  @ Tue, 18 Sep 2018 12:59:41: #2 Skipped... 
INFO  @ Tue, 18 Sep 2018 12:59:41: #2 Use 200 as fragment length 
INFO  @ Tue, 18 Sep 2018 12:59:41: #3 Call peaks... 
INFO  @ Tue, 18 Sep 2018 12:59:41: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Tue, 18 Sep 2018 13:02:08: #3 Call peaks for each chromosome... 
INFO  @ Tue, 18 Sep 2018 13:03:33: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.xls 
INFO  @ Tue, 18 Sep 2018 13:03:34: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak 
INFO  @ Tue, 18 Sep 2018 13:03:34: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_summits.bed 
INFO  @ Tue, 18 Sep 2018 13:03:34: Done! 
</pre>
Process 46644 returned: (0). Elapsed: 0:05:01. Peak memory: (Process: 1.021GB; Pipeline: 0.423GB)
Follow:
> `Peak_count`	77519	PEPATAC	_RES_

### # Calculate fraction of reads in peaks (FRiP) (09-18 13:03:34) elapsed: 301.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

('74462784', '7975954\n')
> `FRiP`	0.107113292997	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 13:04:44) elapsed: 70.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bigBed`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak /nm/t1/genomes/hg19/hg19.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bigBed`

<pre>
pass1 - making usageList (51 chroms): 13 millis
pass2 - checking and writing primary data (77520 records, 10 fields): 286 millis
[1] TRUE
[1] TRUE
</pre>
Process 54740 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.032GB; Pipeline: 1.021GB)

### # Calculate peak coverage (09-18 13:04:48) elapsed: 4.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed`

<pre>
</pre>
Process 54824 returned: (0). Elapsed: 0:00:00.
> `samtools view -H /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt`

<pre>
</pre>
Process 54827 returned: (0). Elapsed: 0:00:00.
> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed`

<pre>
</pre>
Process 54833 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed`

<pre>
</pre>
Process 54838 returned: (0). Elapsed: 0:01:59.

### # Calculate read coverage (09-18 13:06:48) elapsed: 120.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/hg19_annotations.bed.gz`
> `ln -sf /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/anno/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/hg19_annotations.bed.gz`

<pre>
</pre>
Process 57562 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 1.021GB)
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/hg19_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3' UTR`
> `zcat /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/hg19_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/"$4}'`

<pre>
</pre>
Process 57577 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed`

<pre>
</pre>
Process 57595 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed`

<pre>
</pre>
Process 57602 returned: (0). Elapsed: 0:01:38.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed`

<pre>
</pre>
Process 59729 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed`

<pre>
</pre>
Process 59738 returned: (0). Elapsed: 0:01:41.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon_sort.bed`

<pre>
</pre>
Process 62051 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed`

<pre>
</pre>
Process 62067 returned: (0). Elapsed: 0:01:41.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron_sort.bed`

<pre>
</pre>
Process 63925 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed`

<pre>
</pre>
Process 63928 returned: (0). Elapsed: 0:02:23.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_sort.bed`

<pre>
</pre>
Process 63948 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed`

<pre>
</pre>
Process 63951 returned: (0). Elapsed: 0:01:40.

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 64104 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 64107 returned: (0). Elapsed: 0:01:41.

### # Plot FRiP/F (09-18 13:17:36) elapsed: 648.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed', '71904176', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_frif.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_frip.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_coverage.bed 71904176 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 65722 returned: (0). Elapsed: 0:00:33. Peak memory: (Process: 0.511GB; Pipeline: 1.021GB)
> `Cumulative FRiF`	QC_hg19/gold4_frif.pdf	Cumulative FRiF	QC_hg19/gold4_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 13:18:22) elapsed: 46.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/gold4_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/DATA/pepatac/tutorial/tools/pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/hg19_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.narrowPeak gold4 hg19 /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19`

<pre>
Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Warning message:
In "bit64" %chin% loadedNamespaces() :
  closing unused connection 3 (/sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/raw/hg19_annotations.bed.gz)
Promoter :	found 13893
Promoter Flanking Region :	found 21749
5' UTR :	found 449
3' UTR :	found 777
Exon :	found 1485
Intron :	found 19248
Peak annotation complete!

</pre>
Process 66434 returned: (0). Elapsed: 0:00:17. Peak memory: (Process: 0.395GB; Pipeline: 1.021GB)
> `Peak chromosome distribution`	QC_hg19/gold4_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg19/gold4_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg19/gold4_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg19/gold4_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg19/gold4_peaks_partition_dist.pdf	Peak partition distribution	QC_hg19/gold4_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/tmpB9OlQH
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/tmpB9OlQH`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/prealignments/bt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/tmpnZAVxY
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/tmpnZAVxY`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19/gold4_temp.bam`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/temp/flag_completed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/temp
`rmdir /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/aligned_hg19_exact/temp`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/chr_order.txt`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/peak_calling_hg19/gold4_peaks_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/3_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/5_UTR_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Exon_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Intron_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_sort.bed`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/QC_hg19/Promoter_Flanking_Region_sort.bed`

Cleaning up conditional list...

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4*.fastq
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R2.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.trim.fastq`
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4_R1.fastq`

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/*.fq

Removing glob: /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/*.log
`rm /sfs/lustre/allocations/shefflab/processed/gold/pepatac/hg19/09_17_18/results_pipeline/gold4/fastq/gold4-trimmed.log`
> `Time`	3:37:00	PEPATAC	_RES_
> `Success`	09-18-13:18:39	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  3:37:00
*     Peak memory used:  1.02 GB
* Pipeline completed at:  (09-18 13:18:39) elapsed: 17.0 _TIME_

Pypiper terminating spawned child process 43613...(tee)
