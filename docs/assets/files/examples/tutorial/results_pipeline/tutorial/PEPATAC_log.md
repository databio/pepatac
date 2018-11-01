----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac.py --single-or-paired paired --genome hg38 --sample-name tutorial --input /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz --input2 /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz --prealignments rCRSd human_repeats --genome-size hs -O /sfs/lustre/allocations/shefflab/processed//tutorial/results_pipeline -P 8 -M 16000`
*         Compute host:  udc-ba26-16
*          Working dir:  /sfs/qumulo/qhome/jps3dp
*            Outfolder:  /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/
*  Pipeline started at:   (09-18 13:31:37) elapsed: 1.0 _TIME_

##### [Version log:]
*       Python version:  2.7.14
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python2.7/site-packages/pypiper`
*      Pypiper version:  0.8.0-dev
*         Pipeline dir:  `/sfs/lustre/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.8.0
*        Pipeline hash:  0e03ca39e4bc8b97932f0532460ca8fa2c6bf62d
*      Pipeline branch:  * master
*        Pipeline date:  2018-09-18 10:03:59 -0400
*        Pipeline diff:  1 file changed, 5 insertions(+), 1 deletion(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz']`
*         `paired_end`:  `True`
*      `prealignments`:  `['rCRSd', 'human_repeats']`
*          `new_start`:  `False`
*      `output_parent`:  `/sfs/lustre/allocations/shefflab/processed//tutorial/results_pipeline`
*     `frip_ref_peaks`:  `None`
*            `recover`:  `False`
*           `TSS_name`:  `None`
*        `sample_name`:  `tutorial`
*              `input`:  `['/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz']`
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

### Merge/link and fastq conversion:  (09-18 13:31:38) elapsed: 1.0 _TIME_

Number of input file sets:		2

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz`
> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r1.fastq.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz`

<pre>
</pre>
Process 76180 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz'

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz`
> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/examples/data/tutorial_r2.fastq.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz`

<pre>
</pre>
Process 76181 returned: (0). Elapsed: 0:00:00.
Local input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz'
Found .fastq.gz file
Found .fastq.gz file

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq`
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq`

<pre>
</pre>
Process 76182 returned: (0). Elapsed: 0:00:00.
> `pigz -p 8 -d -c /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq`

<pre>
</pre>
Process 76187 returned: (0). Elapsed: 0:00:00.
Follow:
['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz']
['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq']
> `Raw_reads`	2000000	PEPATAC	_RES_
> `Fastq_reads`	2000000	PEPATAC	_RES_
['/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R1.fastq.gz', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/tutorial_R2.fastq.gz']

### Adapter trimming:  (09-18 13:31:40) elapsed: 3.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq`
> `skewer -f sanger -t 8 -m pe -x /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/NexteraPE-PE.fa --quiet -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.fastq`

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
Tue Sep 18 13:31:40 2018[0;32m >> started[0m

Tue Sep 18 13:31:45 2018[0;32m >> done[0m (4.751s)
1000000 read pairs processed; of these:
      0 ( 0.00%) short read pairs filtered out after trimming by size control
      0 ( 0.00%) empty read pairs filtered out after trimming by size control
1000000 (100.00%) read pairs available; of these:
1000000 (100.00%) untrimmed read pairs available after processing
log has been saved to "/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed.log".
</pre>
Process 76206 returned: (0). Elapsed: 0:00:05. Peak memory: (Process: 0.019GB; Pipeline: 0.0GB)
> `mv /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed-pair1.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq`

<pre>
</pre>
Process 76214 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.019GB)
> `mv /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial-trimmed-pair2.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.trim.fastq`

<pre>
</pre>
Process 76215 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.019GB)
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
Process 76219 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.161GB; Pipeline: 0.019GB)

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
Process 76237 returned: (0). Elapsed: 0:00:13. Peak memory: (Process: 0.162GB; Pipeline: 0.161GB)
> `FastQC report r1`	fastqc/tutorial_R1.trim_fastqc.html	FastQC report r1	fastqc/tutorial_R1.trim_fastqc.html	PEPATAC	_OBJ_
> `FastQC report r2`	fastqc/tutorial_R2.trim_fastqc.html	FastQC report r2	fastqc/tutorial_R2.trim_fastqc.html	PEPATAC	_OBJ_

### Prealignments (09-18 13:32:12) elapsed: 31.0 _TIME_

Prealignment assemblies: ['rCRSd', 'human_repeats']

### Map to rCRSd (09-18 13:32:12) elapsed: 0.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSdbt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSdbt2`

<pre>
</pre>
Process 76254 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.162GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSdbt2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R2.trim.fastq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 76255

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/rCRSd/indexed_bowtie2/rCRSd --rg-id tutorial -U /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/fastq/tutorial_R1.trim.fastq --un /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSdbt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log`

<pre>
</pre>
Process 76256 returned: (0). Elapsed: 0:00:06.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_rCRSd`	199916.0	PEPATAC	_RES_
> `Alignment_rate_rCRSd`	10.0	PEPATAC	_RES_

### Map to human_repeats (09-18 13:32:18) elapsed: 6.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeatsbt2`
> `mkfifo /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeatsbt2`

<pre>
</pre>
Process 76271 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.162GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq`
> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/filter_paired_fq.pl /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeatsbt2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R2.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq`

<pre>
</pre>
Not waiting for subprocess: 76272

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log`
> `(bowtie2 -p 8 -k 1 -D 20 -R 3 -N 1 -L 20 -i S,1,0.50 -x /nm/t1/genomes/human_repeats/indexed_bowtie2/human_repeats --rg-id tutorial -U /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_rCRSd_unmap_R1.fq --un /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeatsbt2 > /dev/null) 2>/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log`

<pre>
99958 reads skipped
0 reads lost
</pre>
Process 76273 returned: (0). Elapsed: 0:00:06.
> `grep 'aligned exactly 1 time' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_bt_aln_summary.log | awk '{print $1}'`

> `Aligned_reads_human_repeats`	39944.0	PEPATAC	_RES_
> `Alignment_rate_human_repeats`	2.0	PEPATAC	_RES_

### Map to genome (09-18 13:32:24) elapsed: 6.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`
> `bowtie2 -p 8 --very-sensitive -X 2000 --rg-id tutorial -x /nm/t1/genomes/hg38/indexed_bowtie2/hg38 -1 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R1.fq -2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tutorial_human_repeats_unmap_R2.fq | samtools view -bS - -@ 1  | samtools sort - -@ 1 -T /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmp7CC7q5 -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`

<pre>
19972 reads skipped
0 reads lost
880070 reads; of these:
  880070 (100.00%) were paired; of these:
    83 (0.01%) aligned concordantly 0 times
    806758 (91.67%) aligned concordantly exactly 1 time
    73229 (8.32%) aligned concordantly >1 times
    ----
    83 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    83 pairs aligned 0 times concordantly or discordantly; of these:
      166 mates make up the pairs; of these:
        124 (74.70%) aligned 0 times
        13 (7.83%) aligned exactly 1 time
        29 (17.47%) aligned >1 times
99.99% overall alignment rate
</pre>
Process 76289 returned: (0). Elapsed: 0:01:52.
> `samtools view -q 10 -b -@ 8 -f 2 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`

<pre>
</pre>
Process 76323 returned: (0). Elapsed: 0:00:04.
Follow:
> `Aligned_reads`	1752770	PEPATAC	_RES_
> `Alignment_rate`	87.64	PEPATAC	_RES_
> `Total_efficiency`	87.64	PEPATAC	_RES_

### Calculate NRF, PBC1, and PBC2 (09-18 13:34:21) elapsed: 118.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam.bai`
> `samtools index /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam`

<pre>
</pre>
Process 76436 returned: (0). Elapsed: 0:00:02. Peak memory: (Process: 0.003GB; Pipeline: 0.162GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`
> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamQC.py -i /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam -c 8 -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

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
Registering input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tmp_tutorial_sort_doW_ny'
Processing with 8 cores...
[Name: chrUn_KI270749v1; Size: 158759]
[Name: chr13; Size: 114364328]
[Name: chr11; Size: 135086622]
[Name: chr17; Size: 83257441]
[Name: chr15; Size: 101991189]
[Name: chrUn_GL000219v1; Size: 179198]
[Name: chr19; Size: 58617616]
[Name: chr16_KI270728v1_random; Size: 1872759]
[Name: chrUn_GL000214v1; Size: 137718]
[Name: chr1_KI270713v1_random; Size: 40745]
[Name: chrUn_GL000213v1; Size: 164239]
[Name: chrUn_KI270744v1; Size: 168472]
[Name: chrUn_GL000216v2; Size: 176608]
[Name: chrUn_KI270742v1; Size: 186739]
[Name: chr18; Size: 80373285]
[Name: chrUn_GL000218v1; Size: 161147]
[Name: chr16; Size: 90338345]
[Name: chr22_KI270732v1_random; Size: 41543]
[Name: chr14_GL000194v1_random; Size: 191469]
[Name: chrUn_GL000195v1; Size: 182896]
[Name: chr12; Size: 133275309]
[Name: chrUn_KI270751v1; Size: 150742]
[Name: chr9_KI270719v1_random; Size: 176845]
[Name: chr17_GL000205v2_random; Size: 185591]
[Name: chr14_KI270726v1_random; Size: 43739]
[Name: chr10; Size: 133797422]
[Name: chrUn_KI270750v1; Size: 148850]
[Name: chr14; Size: 107043718]
[Name: chr4_GL000008v2_random; Size: 209709]
[Name: chr22_KI270733v1_random; Size: 179772]
[Name: chrUn_KI270754v1; Size: 40191]
[Name: chr1_KI270706v1_random; Size: 175055]
[Name: chrUn_KI270519v1; Size: 138126]
[Name: chr5; Size: 181538259]
[Name: chrUn_KI270757v1; Size: 71251]
[Name: chrUn_KI270442v1; Size: 392061]
[Name: chr14_KI270722v1_random; Size: 194050]
[Name: chr14_GL000009v2_random; Size: 201709]
[Name: chrUn_KI270438v1; Size: 112505]
[Name: chr5_GL000208v1_random; Size: 92689]
[Name: chr14_KI270725v1_random; Size: 172810]
[Name: chrY; Size: 57227415]
[Name: chrUn_GL000220v1; Size: 161802]
[Name: chrUn_GL000224v1; Size: 179693]
[Name: chr20; Size: 64444167]
[Name: chr14_GL000225v1_random; Size: 211173]
[Name: chr1_KI270714v1_random; Size: 41717]
[Name: chr7; Size: 159345973]
[Name: chrX; Size: 156040895]
[Name: chrM; Size: 16569]
[Name: chr22; Size: 50818468]
[Name: chr4; Size: 190214555]
[Name: chr2; Size: 242193529]
[Name: chr9; Size: 138394717]
[Name: chr21; Size: 46709983]
[Name: chr22_KI270736v1_random; Size: 181920]
[Name: chrUn_KI270741v1; Size: 157432]
[Name: chr8; Size: 145138636]
[Name: chr6; Size: 170805979]
[Name: chr3; Size: 198295559]
[Name: chr1; Size: 248956422]
Discarding 134 chunk(s) of reads: ['chrUn_KI270748v1', 'chrUn_KI270337v1', 'chrUn_KI270418v1', 'chrUn_KI270305v1', 'chrUn_KI270376v1', 'chrUn_KI270320v1', 'chrUn_KI270518v1', 'chr3_GL000221v1_random', 'chr17_KI270729v1_random', 'chrUn_KI270746v1', 'chrUn_KI270516v1', 'chrUn_KI270521v1', 'chrUn_KI270372v1', 'chr9_KI270720v1_random', 'chrUn_KI270593v1', 'chrUn_KI270538v1', 'chr22_KI270731v1_random', 'chr1_KI270707v1_random', 'chrUn_KI270322v1', 'chrUn_KI270579v1', 'chrUn_KI270756v1', 'chrUn_KI270335v1', 'chrUn_KI270378v1', 'chrEBV', 'chrUn_KI270381v1', 'chrUn_KI270303v1', 'chrUn_KI270333v1', 'chrUn_KI270435v1', 'chr15_KI270727v1_random', 'chrUn_KI270302v1', 'chrUn_KI270530v1', 'chrUn_KI270548v1', 'chrUn_KI270304v1', 'chrUn_KI270745v1', 'chrY_KI270740v1_random', 'chrUn_KI270590v1', 'chrUn_KI270374v1', 'chrUn_KI270311v1', 'chr22_KI270737v1_random', 'chrUn_KI270362v1', 'chrUn_KI270363v1', 'chrUn_KI270508v1', 'chrUn_KI270747v1', 'chrUn_KI270509v1', 'chrUn_KI270753v1', 'chrUn_KI270752v1', 'chr17_KI270730v1_random', 'chrUn_KI270755v1', 'chr22_KI270734v1_random', 'chrUn_KI270448v1', 'chrUn_KI270422v1', 'chrUn_KI270417v1', 'chr1_KI270711v1_random', 'chrUn_KI270371v1', 'chrUn_KI270420v1', 'chr11_KI270721v1_random', 'chrUn_KI270425v1', 'chrUn_KI270315v1', 'chrUn_KI270424v1', 'chrUn_KI270588v1', 'chr22_KI270739v1_random', 'chrUn_KI270364v1', 'chrUn_KI270366v1', 'chrUn_KI270522v1', 'chr14_KI270724v1_random', 'chrUn_KI270517v1', 'chrUn_KI270429v1', 'chr1_KI270709v1_random', 'chrUn_KI270580v1', 'chr2_KI270715v1_random', 'chrUn_KI270507v1', 'chrUn_KI270317v1', 'chrUn_KI270388v1', 'chrUn_KI270389v1', 'chrUn_KI270584v1', 'chrUn_KI270336v1', 'chrUn_KI270511v1', 'chrUn_KI270383v1', 'chrUn_KI270419v1', 'chr1_KI270712v1_random', 'chr1_KI270708v1_random', 'chr14_KI270723v1_random', 'chrUn_KI270386v1', 'chr9_KI270718v1_random', 'chrUn_KI270423v1', 'chrUn_KI270387v1', 'chrUn_KI270373v1', 'chrUn_KI270587v1', 'chrUn_KI270515v1', 'chrUn_KI270582v1', 'chrUn_KI270411v1', 'chrUn_KI270583v1', 'chrUn_KI270330v1', 'chrUn_KI270379v1', 'chrUn_KI270334v1', 'chrUn_KI270743v1', 'chr9_KI270717v1_random', 'chrUn_KI270589v1', 'chrUn_KI270375v1', 'chr1_KI270710v1_random', 'chrUn_KI270384v1', 'chrUn_KI270338v1', 'chrUn_KI270385v1', 'chrUn_KI270394v1', 'chrUn_KI270591v1', 'chrUn_KI270382v1', 'chrUn_KI270391v1', 'chrUn_KI270390v1', 'chrUn_KI270310v1', 'chrUn_KI270544v1', 'chrUn_GL000226v1', 'chrUn_KI270340v1', 'chrUn_KI270393v1', 'chrUn_KI270392v1', 'chr22_KI270738v1_random', 'chrUn_KI270528v1', 'chrUn_KI270467v1', 'chrUn_KI270529v1', 'chrUn_KI270316v1', 'chrUn_KI270539v1', 'chrUn_KI270512v1', 'chr22_KI270735v1_random', 'chrUn_KI270312v1', 'chrUn_KI270329v1', 'chr2_KI270716v1_random', 'chrUn_KI270468v1', 'chrUn_KI270414v1', 'chrUn_KI270510v1', 'chrUn_KI270466v1', 'chrUn_KI270395v1', 'chrUn_KI270412v1', 'chrUn_KI270465v1', 'chrUn_KI270396v1', 'chrUn_KI270581v1']
Keeping 61 chunk(s) of reads: ['chrUn_KI270749v1', 'chr1_KI270713v1_random', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chrUn_GL000218v1', 'chr19', 'chr18', 'chrUn_GL000219v1', 'chrUn_GL000213v1', 'chr16_KI270728v1_random', 'chrUn_GL000214v1', 'chrUn_KI270744v1', 'chr22_KI270732v1_random', 'chrUn_GL000216v2', 'chrUn_GL000195v1', 'chrUn_KI270742v1', 'chr14_GL000194v1_random', 'chrUn_KI270751v1', 'chrUn_KI270750v1', 'chr9_KI270719v1_random', 'chr14', 'chr17_GL000205v2_random', 'chr4_GL000008v2_random', 'chr14_KI270726v1_random', 'chr22_KI270733v1_random', 'chrUn_KI270754v1', 'chr14_GL000009v2_random', 'chr1_KI270706v1_random', 'chr14_KI270722v1_random', 'chrUn_KI270519v1', 'chrUn_KI270442v1', 'chr5', 'chr22_KI270736v1_random', 'chrUn_KI270757v1', 'chr5_GL000208v1_random', 'chrUn_KI270438v1', 'chr1_KI270714v1_random', 'chr14_KI270725v1_random', 'chr14_GL000225v1_random', 'chrY', 'chrX', 'chrUn_GL000220v1', 'chrM', 'chrUn_GL000224v1', 'chr22', 'chr20', 'chr21', 'chr7', 'chr6', 'chr4', 'chr3', 'chr2', 'chr1', 'chr9', 'chr8', 'chrUn_KI270741v1']
Reduce step (merge files)...
Merging 61 files into output file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv'
</pre>
Process 76456 returned: (0). Elapsed: 0:00:04. Peak memory: (Process: 0.014GB; Pipeline: 0.162GB)
Follow:
> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "NRF") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC1") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

> `awk '{ for (i=1; i<=NF; ++i) { if ($i ~ "PBC2") c=i } getline; print $c }' /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_bamQC.tsv`

> `NRF`	1.0	PEPATAC	_RES_
> `PBC1`	1.0	PEPATAC	_RES_
> `PBC2`	876373.0	PEPATAC	_RES_

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_unmap.bam`
> `samtools view -b -@ 8 -f 12  /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_unmap.bam`

<pre>
</pre>
Process 76508 returned: (0). Elapsed: 0:00:00.

### Remove dupes, build bigwig and bedgraph files (09-18 13:34:28) elapsed: 7.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`
> `java -Xmx15200m -jar /sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar MarkDuplicates INPUT=/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam OUTPUT=/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_picard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_picard_metrics_log.txt`

<pre>
Picked up JAVA_TOOL_OPTIONS: -Xss1280k
Picked up _JAVA_OPTIONS: -Djava.io.tmpdir=/scratch/jps3dp/tmp
13:34:29.226 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/sfs/lustre/scratch/jps3dp/tools/picard/build/libs/picard.jar!/com/intel/gkl/native/libgkl_compression.so
[Tue Sep 18 13:34:29 EDT 2018] MarkDuplicates INPUT=[/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam] OUTPUT=/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam METRICS_FILE=/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_picard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 TAG_DUPLICATE_SET_MEMBERS=false REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag CLEAR_DT=true ADD_PG_TAG_TO_READS=true DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 MAX_OPTICAL_DUPLICATE_SET_SIZE=300000 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json USE_JDK_DEFLATER=false USE_JDK_INFLATER=false
[Tue Sep 18 13:34:29 EDT 2018] Executing as jps3dp@udc-ba26-16 on Linux 3.10.0-514.21.2.el7.x86_64 amd64; Java HotSpot(TM) 64-Bit Server VM 1.8.0_171-b11; Deflater: Intel; Inflater: Intel; Picard version: 2.17.4-1-gb63d73e-SNAPSHOT
INFO	2018-09-18 13:34:29	MarkDuplicates	Start of doWork freeMemory: 2038258448; totalMemory: 2058354688; maxMemory: 14167834624
INFO	2018-09-18 13:34:29	MarkDuplicates	Reading input file and constructing read end information.
INFO	2018-09-18 13:34:29	MarkDuplicates	Will retain up to 51332734 data points before spilling to disk.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:tutorial
WARNING	2018-09-18 13:34:29	AbstractOpticalDuplicateFinderCommandLineProgram	A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR5210390.50720840. Cause: String 'SRR5210390.50720840' did not start with a parsable number.
INFO	2018-09-18 13:34:33	MarkDuplicates	Read     1,000,000 records.  Elapsed time: 00:00:04s.  Time for last 1,000,000:    4s.  Last read position: chr9:134,914,127
INFO	2018-09-18 13:34:33	MarkDuplicates	Tracking 0 as yet unmatched pairs. 0 records in RAM.
INFO	2018-09-18 13:34:36	MarkDuplicates	Read 1752770 records. 0 pairs never matched.
INFO	2018-09-18 13:34:37	MarkDuplicates	After buildSortedReadEndLists freeMemory: 3024913672; totalMemory: 3670540288; maxMemory: 14167834624
INFO	2018-09-18 13:34:37	MarkDuplicates	Will retain up to 442744832 duplicate indices before spilling to disk.
INFO	2018-09-18 13:34:38	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2018-09-18 13:34:38	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2018-09-18 13:34:38	MarkDuplicates	Sorting list of duplicate records.
INFO	2018-09-18 13:34:38	MarkDuplicates	After generateDuplicateIndexes freeMemory: 3704021192; totalMemory: 7292321792; maxMemory: 14167834624
INFO	2018-09-18 13:34:38	MarkDuplicates	Marking 0 records as duplicates.
INFO	2018-09-18 13:34:38	MarkDuplicates	Found 0 optical duplicate clusters.
Ignoring SAM validation error: ERROR: File /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort.bam, Error parsing SAM header. @RG line missing SM tag. Line:
@RG	ID:tutorial
INFO	2018-09-18 13:34:38	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2018-09-18 13:34:49	MarkDuplicates	Before output close freeMemory: 9344601760; totalMemory: 9434038272; maxMemory: 14167834624
INFO	2018-09-18 13:34:49	MarkDuplicates	After output close freeMemory: 9184169632; totalMemory: 9273606144; maxMemory: 14167834624
[Tue Sep 18 13:34:49 EDT 2018] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.34 minutes.
Runtime.totalMemory()=9273606144
</pre>
Process 76520 returned: (0). Elapsed: 0:00:21.
> `samtools index /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

<pre>
</pre>
Process 85821 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.003GB; Pipeline: 0.162GB)
Follow:
> `awk -F'	' -f /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/extract_post_dup_aligned_reads.awk /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_picard_metrics_bam.txt`

> `Duplicate_reads`	0.0	PEPATAC	_RES_
> `Dedup_aligned_reads`	1752770	PEPATAC	_RES_
> `Dedup_alignment_rate`	87.64	PEPATAC	_RES_
> `Dedup_total_efficiency`	87.64	PEPATAC	_RES_

### Produce smoothed and nucleotide-resolution tracks (09-18 13:34:52) elapsed: 24.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp/flag_completed`
> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/bamSitesToWig.py -i /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -c /nm/t1/genomes/hg38/hg38.chromSizes -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw -w /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw -p 5`

<pre>
Using INFO as logging level.
Configured logger 'root' using pararead v0.5.0
Cutting parallel chroms in half to accommodate smooth track.
Registering input file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam'
Temporary files will be stored in: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tmp_tutorial_sort_dedup_cuttrace_tSOVDj'
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
[Name: chr11; Size: 135086622]
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
[Name: chr10; Size: 133797422]
[Name: chr17; Size: 83257441]
[Name: chr22_KI270736v1_random; Size: 181920]
[Name: chrUn_KI270757v1; Size: 71251]
[Name: chr5_GL000208v1_random; Size: 92689]
[Name: chrUn_KI270438v1; Size: 112505]
[Name: chr1_KI270714v1_random; Size: 41717]
[Name: chr14_KI270725v1_random; Size: 172810]
[Name: chr14_GL000225v1_random; Size: 211173]
[Name: chrY; Size: 57227415]
[Name: chrX; Size: 156040895]
[Name: chr16; Size: 90338345]
[Name: chrUn_GL000224v1; Size: 179693]
[Name: chr22; Size: 50818468]
[Name: chr20; Size: 64444167]
[Name: chrUn_GL000220v1; Size: 161802]
[Name: chrM; Size: 16569]
[Name: chr2; Size: 242193529]
[Name: chr21; Size: 46709983]
[Name: chr7; Size: 159345973]
[Name: chr1; Size: 248956422]
[Name: chr6; Size: 170805979]
[Name: chr4; Size: 190214555]
[Name: chr9; Size: 138394717]
[Name: chr3; Size: 198295559]
[Name: chr8; Size: 145138636]
[Name: chrUn_KI270741v1; Size: 157432]
Discarding 134 chunk(s) of reads: ['chrUn_KI270748v1', 'chrUn_KI270337v1', 'chrUn_KI270418v1', 'chrUn_KI270305v1', 'chrUn_KI270376v1', 'chrUn_KI270320v1', 'chrUn_KI270518v1', 'chr3_GL000221v1_random', 'chr17_KI270729v1_random', 'chrUn_KI270746v1', 'chrUn_KI270516v1', 'chrUn_KI270521v1', 'chrUn_KI270372v1', 'chr9_KI270720v1_random', 'chrUn_KI270593v1', 'chrUn_KI270538v1', 'chr22_KI270731v1_random', 'chr1_KI270707v1_random', 'chrUn_KI270322v1', 'chrUn_KI270579v1', 'chrUn_KI270756v1', 'chrUn_KI270335v1', 'chrUn_KI270378v1', 'chrEBV', 'chrUn_KI270381v1', 'chrUn_KI270303v1', 'chrUn_KI270333v1', 'chrUn_KI270435v1', 'chr15_KI270727v1_random', 'chrUn_KI270302v1', 'chrUn_KI270530v1', 'chrUn_KI270548v1', 'chrUn_KI270304v1', 'chrUn_KI270745v1', 'chrY_KI270740v1_random', 'chrUn_KI270590v1', 'chrUn_KI270374v1', 'chrUn_KI270311v1', 'chr22_KI270737v1_random', 'chrUn_KI270362v1', 'chrUn_KI270363v1', 'chrUn_KI270508v1', 'chrUn_KI270747v1', 'chrUn_KI270509v1', 'chrUn_KI270753v1', 'chrUn_KI270752v1', 'chr17_KI270730v1_random', 'chrUn_KI270755v1', 'chr22_KI270734v1_random', 'chrUn_KI270448v1', 'chrUn_KI270422v1', 'chrUn_KI270417v1', 'chr1_KI270711v1_random', 'chrUn_KI270371v1', 'chrUn_KI270420v1', 'chr11_KI270721v1_random', 'chrUn_KI270425v1', 'chrUn_KI270315v1', 'chrUn_KI270424v1', 'chrUn_KI270588v1', 'chr22_KI270739v1_random', 'chrUn_KI270364v1', 'chrUn_KI270366v1', 'chrUn_KI270522v1', 'chr14_KI270724v1_random', 'chrUn_KI270517v1', 'chrUn_KI270429v1', 'chr1_KI270709v1_random', 'chrUn_KI270580v1', 'chr2_KI270715v1_random', 'chrUn_KI270507v1', 'chrUn_KI270317v1', 'chrUn_KI270388v1', 'chrUn_KI270389v1', 'chrUn_KI270584v1', 'chrUn_KI270336v1', 'chrUn_KI270511v1', 'chrUn_KI270383v1', 'chrUn_KI270419v1', 'chr1_KI270712v1_random', 'chr1_KI270708v1_random', 'chr14_KI270723v1_random', 'chrUn_KI270386v1', 'chr9_KI270718v1_random', 'chrUn_KI270423v1', 'chrUn_KI270387v1', 'chrUn_KI270373v1', 'chrUn_KI270587v1', 'chrUn_KI270515v1', 'chrUn_KI270582v1', 'chrUn_KI270411v1', 'chrUn_KI270583v1', 'chrUn_KI270330v1', 'chrUn_KI270379v1', 'chrUn_KI270334v1', 'chrUn_KI270743v1', 'chr9_KI270717v1_random', 'chrUn_KI270589v1', 'chrUn_KI270375v1', 'chr1_KI270710v1_random', 'chrUn_KI270384v1', 'chrUn_KI270338v1', 'chrUn_KI270385v1', 'chrUn_KI270394v1', 'chrUn_KI270591v1', 'chrUn_KI270382v1', 'chrUn_KI270391v1', 'chrUn_KI270390v1', 'chrUn_KI270310v1', 'chrUn_KI270544v1', 'chrUn_GL000226v1', 'chrUn_KI270340v1', 'chrUn_KI270393v1', 'chrUn_KI270392v1', 'chr22_KI270738v1_random', 'chrUn_KI270528v1', 'chrUn_KI270467v1', 'chrUn_KI270529v1', 'chrUn_KI270316v1', 'chrUn_KI270539v1', 'chrUn_KI270512v1', 'chr22_KI270735v1_random', 'chrUn_KI270312v1', 'chrUn_KI270329v1', 'chr2_KI270716v1_random', 'chrUn_KI270468v1', 'chrUn_KI270414v1', 'chrUn_KI270510v1', 'chrUn_KI270466v1', 'chrUn_KI270395v1', 'chrUn_KI270412v1', 'chrUn_KI270465v1', 'chrUn_KI270396v1', 'chrUn_KI270581v1']
Keeping 61 chunk(s) of reads: ['chrUn_KI270749v1', 'chr1_KI270713v1_random', 'chr13', 'chr12', 'chr11', 'chr10', 'chr17', 'chr16', 'chr15', 'chrUn_GL000218v1', 'chr19', 'chr18', 'chrUn_GL000219v1', 'chrUn_GL000213v1', 'chr16_KI270728v1_random', 'chrUn_GL000214v1', 'chrUn_KI270744v1', 'chr22_KI270732v1_random', 'chrUn_GL000216v2', 'chrUn_GL000195v1', 'chrUn_KI270742v1', 'chr14_GL000194v1_random', 'chrUn_KI270751v1', 'chrUn_KI270750v1', 'chr9_KI270719v1_random', 'chr14', 'chr17_GL000205v2_random', 'chr4_GL000008v2_random', 'chr14_KI270726v1_random', 'chr22_KI270733v1_random', 'chrUn_KI270754v1', 'chr14_GL000009v2_random', 'chr1_KI270706v1_random', 'chr14_KI270722v1_random', 'chrUn_KI270519v1', 'chrUn_KI270442v1', 'chr5', 'chr22_KI270736v1_random', 'chrUn_KI270757v1', 'chr5_GL000208v1_random', 'chrUn_KI270438v1', 'chr1_KI270714v1_random', 'chr14_KI270725v1_random', 'chr14_GL000225v1_random', 'chrY', 'chrX', 'chrUn_GL000220v1', 'chrM', 'chrUn_GL000224v1', 'chr22', 'chr20', 'chr21', 'chr7', 'chr6', 'chr4', 'chr3', 'chr2', 'chr1', 'chr9', 'chr8', 'chrUn_KI270741v1']
Reduce step (merge files)...
Merging 61 files into output file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_exact.bw'
Merging 61 files into output file: '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_smooth.bw'
</pre>
Process 86553 returned: (0). Elapsed: 0:06:06. Peak memory: (Process: 0.037GB; Pipeline: 0.162GB)
> `touch /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/temp/flag_completed`

<pre>
</pre>
Process 194395 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.162GB)

### Calculate TSS enrichment (09-18 13:40:58) elapsed: 366.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt`
> `/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/pyTssEnrichment.py -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -b /nm/t1/genomes/hg38/hg38_TSS.tsv -p ends -c 8 -e 2000 -u -v -s 4 -o /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt`

<pre>
</pre>
Process 194396 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.015GB; Pipeline: 0.162GB)

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_TSSenrichmentPlot.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt pdf`

<pre>

Generating TSS plot with /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.txt
Completed!

</pre>
Process 194435 returned: (0). Elapsed: 0:00:03. Peak memory: (Process: 0.032GB; Pipeline: 0.162GB)
> `TSS_Score`	13.3269261573	PEPATAC	_RES_
> `TSS enrichment`	QC_hg38/tutorial_TssEnrichment.pdf	TSS enrichment	QC_hg38/tutorial_TssEnrichment.png	PEPATAC	_OBJ_

### Plot fragment distribution (09-18 13:41:03) elapsed: 6.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf`
> `perl /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.pl /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt`

<pre>
</pre>
Process 194442 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.002GB; Pipeline: 0.162GB)
> `sort -n  /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt | uniq -c  > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragCount.txt`

<pre>
</pre>
Process 194444 returned: (0). Elapsed: 0:00:00.
> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/fragment_length_dist.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLen.txt /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragCount.txt /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.txt`

<pre>
</pre>
Process 194454 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.038GB; Pipeline: 0.162GB)
> `Fragment distribution`	QC_hg38/tutorial_fragLenDistribution.pdf	Fragment distribution	QC_hg38/tutorial_fragLenDistribution.png	PEPATAC	_OBJ_

### Call peaks (09-18 13:41:10) elapsed: 7.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak`
> `macs2 callpeak -t /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38_exact/tutorial_shift.bed -f BED -g hs --outdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38 -n tutorial -q 0.01 --shift 0 --nomodel`

<pre>
INFO  @ Tue, 18 Sep 2018 13:41:14: 
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
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
# Paired-End mode is off
 
INFO  @ Tue, 18 Sep 2018 13:41:14: #1 read tag files... 
INFO  @ Tue, 18 Sep 2018 13:41:14: #1 read treatment tags... 
INFO  @ Tue, 18 Sep 2018 13:41:15:  1000000 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1 tag size is determined as 50 bps 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1 tag size = 50 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1  total tags in treatment: 1752770 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1 user defined the maximum tags... 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1  tags after filtering in treatment: 1741407 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1  Redundant rate of treatment: 0.01 
INFO  @ Tue, 18 Sep 2018 13:41:16: #1 finished! 
INFO  @ Tue, 18 Sep 2018 13:41:16: #2 Build Peak Model... 
INFO  @ Tue, 18 Sep 2018 13:41:16: #2 Skipped... 
INFO  @ Tue, 18 Sep 2018 13:41:16: #2 Use 200 as fragment length 
INFO  @ Tue, 18 Sep 2018 13:41:16: #3 Call peaks... 
INFO  @ Tue, 18 Sep 2018 13:41:16: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Tue, 18 Sep 2018 13:41:20: #3 Call peaks for each chromosome... 
INFO  @ Tue, 18 Sep 2018 13:41:21: #4 Write output xls file... /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.xls 
INFO  @ Tue, 18 Sep 2018 13:41:22: #4 Write peak in narrowPeak format file... /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak 
INFO  @ Tue, 18 Sep 2018 13:41:22: #4 Write summits bed file... /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_summits.bed 
INFO  @ Tue, 18 Sep 2018 13:41:22: Done! 
</pre>
Process 194461 returned: (0). Elapsed: 0:00:12. Peak memory: (Process: 0.088GB; Pipeline: 0.162GB)
Follow:
> `Peak_count`	16038	PEPATAC	_RES_

### # Calculate fraction of reads in peaks (FRiP) (09-18 13:41:22) elapsed: 12.0 _TIME_

> `samtools view -@ 4 -c -L /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

('1752770', '193128\n')
> `FRiP`	0.110184450898	PEPATAC	_RES_

### # Produce bigBed formatted narrowPeak file (09-18 13:41:22) elapsed: 1.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bigBed`
> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/narrowPeakToBigBed.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak /nm/t1/genomes/hg38/hg38.chromSizes bedToBigBed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bigBed`

<pre>
pass1 - making usageList (26 chroms): 3 millis
pass2 - checking and writing primary data (16039 records, 10 fields): 44 millis
[1] TRUE
[1] TRUE
</pre>
Process 194498 returned: (0). Elapsed: 0:00:01. Peak memory: (Process: 0.039GB; Pipeline: 0.162GB)

### # Calculate peak coverage (09-18 13:41:24) elapsed: 1.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed`

<pre>
</pre>
Process 194506 returned: (0). Elapsed: 0:00:00.
> `samtools view -H /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam | grep 'SN:' | awk -F':' '{print $2,$3}' | awk -F' ' -v OFS='	' '{print $1,$3}' > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt`

<pre>
</pre>
Process 194508 returned: (0). Elapsed: 0:00:00.
> `bedtools sort -i /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.bed -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed`

<pre>
</pre>
Process 194513 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed`

<pre>
</pre>
Process 194515 returned: (0). Elapsed: 0:00:03.

### # Calculate read coverage (09-18 13:41:26) elapsed: 3.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz`
> `ln -sf /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/anno/hg38_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz`

<pre>
</pre>
Process 194517 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: -1.0GB; Pipeline: 0.162GB)
> `zcat /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz | cut -f 4 | sort -u`


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3' UTR`
> `zcat /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz | awk -F'	' '{print>"/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/"$4}'`

<pre>
</pre>
Process 194522 returned: (0). Elapsed: 0:00:01.

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed`

<pre>
</pre>
Process 194525 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/3_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed`

<pre>
</pre>
Process 194528 returned: (0). Elapsed: 0:00:03.

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5' UTR`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed`

<pre>
</pre>
Process 194530 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/5_UTR_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed`

<pre>
</pre>
Process 194533 returned: (0). Elapsed: 0:00:03.

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed`

<pre>
</pre>
Process 194543 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Exon_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed`

<pre>
</pre>
Process 194546 returned: (0). Elapsed: 0:00:03.

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed`

<pre>
</pre>
Process 194549 returned: (0). Elapsed: 0:00:01.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Intron_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed`

<pre>
</pre>
Process 194552 returned: (0). Elapsed: 0:00:04.

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed`

<pre>
</pre>
Process 194554 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed`

<pre>
</pre>
Process 194557 returned: (0). Elapsed: 0:00:03.

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter Flanking Region`

Target exists: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region`

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed`
> `cut -f 1-3 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region | bedtools sort -i stdin -faidx /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed`

<pre>
</pre>
Process 194559 returned: (0). Elapsed: 0:00:00.

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`
> `bedtools coverage -sorted -counts -a /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/Promoter_Flanking_Region_sort.bed -b /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam -g /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/chr_order.txt > /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`

<pre>
</pre>
Process 194562 returned: (0). Elapsed: 0:00:03.

### # Plot FRiP/F (09-18 13:41:48) elapsed: 22.0 _TIME_

> `samtools view -@ 8 -q 15 -c -F4 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_sort_dedup.bam`

['Rscript', '/sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed', '1747846', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf', '--bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed', '/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed']

Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_frip.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks_coverage.bed 1747846 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf --bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_3_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_5_UTR_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Exon_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Intron_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_coverage.bed /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_Promoter_Flanking_Region_coverage.bed`

<pre>
Cumulative FRiF plots completed!

</pre>
Process 194574 returned: (0). Elapsed: 0:00:25. Peak memory: (Process: 0.386GB; Pipeline: 0.162GB)
> `Cumulative FRiF`	QC_hg38/tutorial_frif.pdf	Cumulative FRiF	QC_hg38/tutorial_frif.png	PEPATAC	_OBJ_

### # Annotate peaks (09-18 13:42:13) elapsed: 26.0 _TIME_


Target to produce: `/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_partition_dist.pdf`
> `Rscript /sfs/lustre/scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_annotation.R /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/peak_calling_hg38/tutorial_peaks.narrowPeak tutorial hg38 /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/QC_hg38`

<pre>
BSAggregate: Calculating sizes. You can speed this up by supplying a regionsGRL.length vector...Done counting regionsGRL lengths.
Finding overlaps...
Setting regionIDs...
jExpr: .N
Combining...
Warning message:
In alloc.col(ans) :
  closing unused connection 3 (/sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/raw/hg38_annotations.bed.gz)
Promoter :	found 6354
Promoter Flanking Region :	found 4494
5' UTR :	found 57
3' UTR :	found 103
Exon :	found 267
Intron :	found 2663
Peak annotation complete!

</pre>
Process 194581 returned: (0). Elapsed: 0:00:16. Peak memory: (Process: 0.465GB; Pipeline: 0.386GB)
> `Peak chromosome distribution`	QC_hg38/tutorial_peaks_chr_dist.pdf	Peak chromosome distribution	QC_hg38/tutorial_peaks_chr_dist.png	PEPATAC	_OBJ_
> `TSS distance distribution`	QC_hg38/tutorial_peaks_TSS_dist.pdf	TSS distance distribution	QC_hg38/tutorial_peaks_TSS_dist.png	PEPATAC	_OBJ_
> `Peak partition distribution`	QC_hg38/tutorial_peaks_partition_dist.pdf	Peak partition distribution	QC_hg38/tutorial_peaks_partition_dist.png	PEPATAC	_OBJ_

Changed status from running to completed.

Cleaning up flagged intermediate files...

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpta58mA
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpta58mA`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/rCRSdbt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpZ7p9p_
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/tmpZ7p9p_`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/prealignments/human_repeatsbt2

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmp7CC7q5
`rmdir /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tmp7CC7q5`

Removing glob: /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam
`rm /sfs/lustre/allocations/shefflab/processed/tutorial/results_pipeline/tutorial/aligned_hg38/tutorial_temp.bam`

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
> `Time`	0:10:54	PEPATAC	_RES_
> `Success`	09-18-13:42:30	PEPATAC	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:10:54
*     Peak memory used:  0.47 GB
* Pipeline completed at:  (09-18 13:42:30) elapsed: 17.0 _TIME_

Pypiper terminating spawned child process 76151...(tee)
