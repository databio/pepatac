cd /storage/jinxu/.local/lib/python2.7/site-packages/pypiper; git rev-parse --verify HEAD 2>/dev/null
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `pipelines/ATACseq.py -P 3 -M 100 -O test_out -R -S liver -G mm9 -Q paired -C ATACseq.yaml -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz`
*         Compute host:  localhost.localdomain
*          Working dir:  /storage/jinxu/ATACseq-pipeline/ATACseq
*            Outfolder:  /storage/jinxu/ATACseq-pipeline/ATACseq/test_out/liver/
*  Pipeline started at:   (07-14 21:06:33) elapsed:0:00:00 _TIME_

##### [Version log:]
*       Python version:  2.7.5
*          Pypiper dir:  `/storage/jinxu/.local/lib/python2.7/site-packages/pypiper`
*         Pipeline dir:  `/storage/jinxu/ATACseq-pipeline/ATACseq/pipelines`
*     Pipeline version:  acfe0ca37df4bab753e2574e46767fee0ce19f7a
*      Pipeline branch:  * master
*        Pipeline date:  2016-07-12 11:02:28 -0700
*        Pipeline diff:  1 file changed, 23 insertions(+), 21 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['test_data/liver-CD31_test_R2.fastq.gz']`
*   `single_or_paired`:  `paired`
*         `paired_end`:  `True`
*        `config_file`:  `ATACseq.yaml`
*              `input`:  `['test_data/liver-CD31_test_R1.fastq.gz']`
*                `mem`:  `100`
*        `sample_name`:  `liver`
*            `genomeS`:  `mm`
*      `output_parent`:  `test_out`
*    `genome_assembly`:  `mm9`
*              `cores`:  `3`
*       `force_follow`:  `False`
*              `fresh`:  `False`
*            `recover`:  `True`
*       `manual_clean`:  `False`

----------------------------------------


Change status from initializing to running
Local input file: test_data/liver-CD31_test_R1.fastq.gz
Local input file: test_data/liver-CD31_test_R2.fastq.gz

### Merge/link and fastq conversion:  (07-14 21:06:33) elapsed:0:00:00 _TIME_

Number of input file sets:		2

Target to produce: `test_out/liver/raw/liver_R1.fastq.gz`
> `ln -sf /storage/jinxu/ATACseq-pipeline/ATACseq/test_data/liver-CD31_test_R1.fastq.gz test_out/liver/raw/liver_R1.fastq.gz`

<pre>
</pre>
Process 31702 returned: (0). Elapsed: 0:00:00.
Local input file: test_out/liver/raw/liver_R1.fastq.gz

Target to produce: `test_out/liver/raw/liver_R2.fastq.gz`
> `ln -sf /storage/jinxu/ATACseq-pipeline/ATACseq/test_data/liver-CD31_test_R2.fastq.gz test_out/liver/raw/liver_R2.fastq.gz`

<pre>
</pre>
Process 31703 returned: (0). Elapsed: 0:00:00.
Local input file: test_out/liver/raw/liver_R2.fastq.gz
['test_out/liver/raw/liver_R1.fastq.gz', 'test_out/liver/raw/liver_R2.fastq.gz']
> `File_mb`	0.0218	ATACseq	_RES_
> `Read_type`	paired	ATACseq	_RES_
> `Genome`	mm9	ATACseq	_RES_

### Adapter trimming:  (07-14 21:06:34) elapsed:0:00:01 _TIME_


Target to produce: `test_out/liver/liver_R1_trimmed.fq`
> `/usr/bin/java -Xmx100m -jar /home/jinxu/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE  -threads 3 test_out/liver/raw/liver_R1.fastq.gz test_out/liver/raw/liver_R2.fastq.gz test_out/liver/liver_R1_trimmed.fq test_out/liver/liver_R1_unpaired.fq test_out/liver/liver_R2_trimmed.fq test_out/liver/liver_R2_unpaired.fq ILLUMINACLIP:/home/jinxu/software/Trimmomatic-0.36/adapters/NexteraPE-PE.fa:2:30:10`

<pre>
TrimmomaticPE: Started with arguments:
 -threads 3 test_out/liver/raw/liver_R1.fastq.gz test_out/liver/raw/liver_R2.fastq.gz test_out/liver/liver_R1_trimmed.fq test_out/liver/liver_R1_unpaired.fq test_out/liver/liver_R2_trimmed.fq test_out/liver/liver_R2_unpaired.fq ILLUMINACLIP:/home/jinxu/software/Trimmomatic-0.36/adapters/NexteraPE-PE.fa:2:30:10
Using PrefixPair: 'AGATGTGTATAAGAGACAG' and 'AGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'CTGTCTCTTATACACATCTGACGCTGCCGACGA'
Using Long Clipping Sequence: 'CTGTCTCTTATACACATCTCCGAGCCCACGAGAC'
ILLUMINACLIP: Using 1 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 250 Both Surviving: 139 (55.60%) Forward Only Surviving: 111 (44.40%) Reverse Only Surviving: 0 (0.00%) Dropped: 0 (0.00%)
TrimmomaticPE: Completed successfully
</pre>
Process 31704 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.029GB; Pipeline: 0.0GB)

Target to produce: `test_out/liver/aligned_mm9chrM/liver.chrM.sam`
> `/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all_chrM -1 test_out/liver/liver_R1_trimmed.fq -2 test_out/liver/liver_R2_trimmed.fq -S test_out/liver/aligned_mm9chrM/liver.chrM.sam`

<pre>
139 reads; of these:
  139 (100.00%) were paired; of these:
    88 (63.31%) aligned concordantly 0 times
    51 (36.69%) aligned concordantly exactly 1 time
    0 (0.00%) aligned concordantly >1 times
    ----
    88 pairs aligned concordantly 0 times; of these:
      7 (7.95%) aligned discordantly 1 time
    ----
    81 pairs aligned 0 times concordantly or discordantly; of these:
      162 mates make up the pairs; of these:
        162 (100.00%) aligned 0 times
        0 (0.00%) aligned exactly 1 time
        0 (0.00%) aligned >1 times
41.73% overall alignment rate
</pre>
Process 31768 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.006GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/aligned_mm9chrM/liver.chrM.bam`
> `/usr/local/bin/samtools view -Sb test_out/liver/aligned_mm9chrM/liver.chrM.sam> test_out/liver/aligned_mm9chrM/liver.chrM.bam`

<pre>
</pre>
Process 31783 returned: (0). Elapsed: 0:00:00.

Target to produce: `test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq`
> `/usr/local/bin/samtools view -b -f 0 test_out/liver/aligned_mm9chrM/liver.chrM.bam > test_out/liver/aligned_mm9chrM/liver.unmap.chrM.bam`

<pre>
</pre>
Process 31785 returned: (0). Elapsed: 0:00:00.
> `/seq/bedtools-master/bin/bedtools bamtofastq  -i test_out/liver/aligned_mm9chrM/liver.unmap.chrM.bam -fq test_out/liver/aligned_mm9chrM/liver.unmapchrM_R1.fastq -fq2 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq`

<pre>
</pre>
Process 31787 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/aligned_mm9genom/liver.genom.sam`
> `/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all -1 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R1.fastq -2 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq -S test_out/liver/aligned_mm9genom/liver.genom.sam`

<pre>
139 reads; of these:
  139 (100.00%) were paired; of these:
    46 (33.09%) aligned concordantly 0 times
    56 (40.29%) aligned concordantly exactly 1 time
    37 (26.62%) aligned concordantly >1 times
    ----
    46 pairs aligned concordantly 0 times; of these:
      3 (6.52%) aligned discordantly 1 time
    ----
    43 pairs aligned 0 times concordantly or discordantly; of these:
      86 mates make up the pairs; of these:
        78 (90.70%) aligned 0 times
        0 (0.00%) aligned exactly 1 time
        8 (9.30%) aligned >1 times
71.94% overall alignment rate
</pre>
Process 31788 returned: (0). Elapsed: 0:00:16. Peak memory: (Process: 0.006GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/aligned_mm9genom/liver.genom.bam`
> `/usr/local/bin/samtools view -Sb test_out/liver/aligned_mm9genom/liver.genom.sam | /usr/local/bin/samtools sort -  -o test_out/liver/aligned_mm9genom/liver.genom.bam`

<pre>
</pre>
Process 31813 returned: (0). Elapsed: 0:00:00.

Target to produce: `test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam`
> `/usr/local/bin/samtools view -Sb test_out/liver/aligned_mm9genom/liver.genom.sam | /usr/local/bin/samtools sort -  -o test_out/liver/aligned_mm9genom/liver.genom.bam`

<pre>
</pre>
Process 31816 returned: (0). Elapsed: 0:00:00.
> `/seq/bedtools-master/bin/bedtools bamtofastq  -i test_out/liver/aligned_mm9chrM/liver.unmap.chrM.bam -fq test_out/liver/aligned_mm9chrM/liver.unmapchrM_R1.fastq -fq2 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq`

<pre>
</pre>
Process 31819 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)
> `/usr/bin/java -Xmx4G  -jar /seq/picard-tools-1.79/MarkDuplicates.jar INPUT=test_out/liver/aligned_mm9genom/liver.genom.bam OUTPUT=test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam METRICS_FILE=test_out/liver/aligned_mm9genom/liverpicard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > test_out/liver/aligned_mm9genom/liverpicard_metrics_log.txt`

<pre>
[Thu Jul 14 21:07:02 PDT 2016] net.sf.picard.sam.MarkDuplicates INPUT=[test_out/liver/aligned_mm9genom/liver.genom.bam] OUTPUT=test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam METRICS_FILE=test_out/liver/aligned_mm9genom/liverpicard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 READ_NAME_REGEX=[a-zA-Z0-9]+:[0-9]:([0-9]+):([0-9]+):([0-9]+).* OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false
[Thu Jul 14 21:07:02 PDT 2016] Executing as jinxu@localhost.localdomain on Linux 3.10.0-123.el7.x86_64 amd64; OpenJDK 64-Bit Server VM 1.7.0_51-mockbuild_2014_04_04_16_39-b00; Picard version: 1.79(1282)
INFO	2016-07-14 21:07:02	MarkDuplicates	Start of doWork freeMemory: 2046700288; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-14 21:07:02	MarkDuplicates	Reading input file and constructing read end information.
INFO	2016-07-14 21:07:02	MarkDuplicates	Will retain up to 15150258 data points before spilling to disk.
INFO	2016-07-14 21:07:03	MarkDuplicates	Read 200 records. 0 pairs never matched.
INFO	2016-07-14 21:07:03	MarkDuplicates	After buildSortedReadEndLists freeMemory: 1925105208; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-14 21:07:03	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2016-07-14 21:07:04	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2016-07-14 21:07:04	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2016-07-14 21:07:04	MarkDuplicates	Sorting list of duplicate records.
INFO	2016-07-14 21:07:04	MarkDuplicates	After generateDuplicateIndexes freeMemory: 1092278816; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-14 21:07:04	MarkDuplicates	Marking 0 records as duplicates.
INFO	2016-07-14 21:07:04	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2016-07-14 21:07:05	MarkDuplicates	Before output close freeMemory: 2046437856; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-14 21:07:05	MarkDuplicates	After output close freeMemory: 2046521264; totalMemory: 2058354688; maxMemory: 3817865216
[Thu Jul 14 21:07:05 PDT 2016] net.sf.picard.sam.MarkDuplicates done. Elapsed time: 0.04 minutes.
Runtime.totalMemory()=2058354688
</pre>
Process 31820 returned: (0). Elapsed: 0:00:06.
> `/usr/local/bin/samtools index test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam`

<pre>
</pre>
Process 31875 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed`
> `/seq/ATAC-seq/Code/bam2bed_shift.pl test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam`

<pre>

Creating bed file
</pre>
Process 31876 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/aligned_mm9genom/liver.pe.q10.rmdup.norm.bw`
> `/seq/bedtools-master/bin/bedtools genomecov  -bg  -split  -i test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed -g /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.chrsize > test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph`

<pre>
</pre>
Process 31878 returned: (0). Elapsed: 0:00:16.
> `/seq/scripts/norm_bedGraph.pl test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph.norm`

<pre>
</pre>
Process 31880 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)
> `/seq/ucsc/bedGraphToBigWig test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph.norm /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.chrsize test_out/liver/aligned_mm9genom/liver.pe.q10.rmdup.norm.bw`

<pre>
</pre>
Process 31881 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/QC_mm9/liver.TssEnrichment`
> `/seq/ATAC-seq/Code/pyMakeVplot.py -a test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam -b /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.refseq.TSS.txt -p ends -e 2000 -u -v -o test_out/liver/QC_mm9/liver.TssEnrichment`

<pre>
</pre>
Process 31882 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.034GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/QC_mm9/liver.fragL.distribution.pdf`
> `perl /seq/ATAC-seq/Code/fragment_length_dist.pl test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam test_out/liver/QC_mm9/liver.fragLen.txt`

<pre>
</pre>
Process 31912 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.034GB)
> `sort -n  test_out/liver/QC_mm9/liver.fragLen.txt | uniq -c  > test_out/liver/QC_mm9/liver.frag_count.txt`

<pre>
</pre>
Process 31917 returned: (0). Elapsed: 0:00:00.
> `Rscript /seq/ATAC-seq/Code/fragment_length_dist.R test_out/liver/QC_mm9/liver.fragLen.txt test_out/liver/QC_mm9/liver.frag_count.txt test_out/liver/QC_mm9/liver.fragL.distribution.pdf test_out/liver/QC_mm9/liver.fragL.distribution.txt`

<pre>
null device 
          1 
</pre>
Process 31920 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.034GB)

Target to produce: `test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak`
> `/usr/bin/macs2 callpeak  -t  test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed -f BED  -g mm --outdir test_out/liver/peak_calling_mm9 -n liver  -q 0.01 --shift 0 --nomodel `

<pre>
INFO  @ Thu, 14 Jul 2016 21:07:31: 
# Command line: callpeak -t test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed -f BED -g mm --outdir test_out/liver/peak_calling_mm9 -n liver -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = liver
# format = BED
# ChIP-seq file = ['test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed']
# control file = None
# effective genome size = 1.87e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 read tag files... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 read treatment tags... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 tag size is determined as 50 bps 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 tag size = 50 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1  total tags in treatment: 186 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 user defined the maximum tags... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1  tags after filtering in treatment: 185 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1  Redundant rate of treatment: 0.01 
INFO  @ Thu, 14 Jul 2016 21:07:31: #1 finished! 
INFO  @ Thu, 14 Jul 2016 21:07:31: #2 Build Peak Model... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #2 Skipped... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #2 Use 200 as fragment length 
INFO  @ Thu, 14 Jul 2016 21:07:31: #3 Call peaks... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #3 Call peaks for each chromosome... 
INFO  @ Thu, 14 Jul 2016 21:07:31: #4 Write output xls file... test_out/liver/peak_calling_mm9/liver_peaks.xls 
INFO  @ Thu, 14 Jul 2016 21:07:31: #4 Write peak in narrowPeak format file... test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak 
INFO  @ Thu, 14 Jul 2016 21:07:31: #4 Write summits bed file... test_out/liver/peak_calling_mm9/liver_summits.bed 
INFO  @ Thu, 14 Jul 2016 21:07:31: Done! 
</pre>
Process 31927 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.034GB)

Target to produce: `test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak.rmBlacklist`
> `/seq/bedtools-master/bin/bedtools intersect  -a test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak -b /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.blaklist.bed -v  >test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak.rmBlacklist`

<pre>
</pre>
Process 31928 returned: (0). Elapsed: 0:00:00.

Change status from running to completed
> `Time`	0:00:58	ATACseq	_RES_
> `Success`	07-14 21:07:31	ATACseq	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:00:58
*     Peak memory used:  0.03 GB
* Pipeline completed at:  (07-14 21:07:31) elapsed:0:00:57 _TIME_

Pypiper terminating spawned child process 31688
cd /storage/jinxu/.local/lib/python2.7/site-packages/pypiper; git rev-parse --verify HEAD 2>/dev/null
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `pipelines/ATACseq.py -P 3 -M 100 -O test_out -R -S liver -G mm9 -Q paired -C ATACseq.yaml -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz`
*         Compute host:  localhost.localdomain
*          Working dir:  /storage/jinxu/ATACseq-pipeline/ATACseq
*            Outfolder:  /storage/jinxu/ATACseq-pipeline/ATACseq/test_out/liver/
*  Pipeline started at:   (07-14 21:09:50) elapsed:0:00:00 _TIME_

##### [Version log:]
*       Python version:  2.7.5
*          Pypiper dir:  `/storage/jinxu/.local/lib/python2.7/site-packages/pypiper`
*         Pipeline dir:  `/storage/jinxu/ATACseq-pipeline/ATACseq/pipelines`
*     Pipeline version:  acfe0ca37df4bab753e2574e46767fee0ce19f7a
*      Pipeline branch:  * master
*        Pipeline date:  2016-07-12 11:02:28 -0700
*        Pipeline diff:  1 file changed, 25 insertions(+), 21 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['test_data/liver-CD31_test_R2.fastq.gz']`
*   `single_or_paired`:  `paired`
*         `paired_end`:  `True`
*        `config_file`:  `ATACseq.yaml`
*              `input`:  `['test_data/liver-CD31_test_R1.fastq.gz']`
*                `mem`:  `100`
*        `sample_name`:  `liver`
*            `genomeS`:  `mm`
*      `output_parent`:  `test_out`
*    `genome_assembly`:  `mm9`
*              `cores`:  `3`
*       `force_follow`:  `False`
*              `fresh`:  `False`
*            `recover`:  `True`
*       `manual_clean`:  `False`

----------------------------------------


Change status from initializing to running
Local input file: test_data/liver-CD31_test_R1.fastq.gz
Local input file: test_data/liver-CD31_test_R2.fastq.gz

### Merge/link and fastq conversion:  (07-14 21:09:50) elapsed:0:00:00 _TIME_

Number of input file sets:		2

Target exists: `test_out/liver/raw/liver_R1.fastq.gz`
Local input file: test_out/liver/raw/liver_R1.fastq.gz

Target exists: `test_out/liver/raw/liver_R2.fastq.gz`
Local input file: test_out/liver/raw/liver_R2.fastq.gz
['test_out/liver/raw/liver_R1.fastq.gz', 'test_out/liver/raw/liver_R2.fastq.gz']
> `File_mb`	0.0218	ATACseq	_RES_
> `Read_type`	paired	ATACseq	_RES_
> `Genome`	mm9	ATACseq	_RES_

### Adapter trimming:  (07-14 21:09:50) elapsed:0:00:00 _TIME_


Target exists: `test_out/liver/liver_R1_trimmed.fq`

Target exists: `test_out/liver/aligned_mm9chrM/liver.chrM.sam`

Target exists: `test_out/liver/aligned_mm9chrM/liver.chrM.bam`

Target exists: `test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq`

Target exists: `test_out/liver/aligned_mm9genom/liver.genom.sam`

Target exists: `test_out/liver/aligned_mm9genom/liver.genom.bam`

Target exists: `test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam`

Target exists: `test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed`

Target exists: `test_out/liver/aligned_mm9genom/liver.pe.q10.rmdup.norm.bw`

Target exists: `test_out/liver/QC_mm9/liver.TssEnrichment`

Target exists: `test_out/liver/QC_mm9/liver.fragL.distribution.pdf`

Target exists: `test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak`

Target exists: `test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak.rmBlacklist`

Change status from running to completed

Cleaning up conditional list...

Removing glob: test_out/liver/liver*.fq
`rm test_out/liver/liver_R1_trimmed.fq`
`rm test_out/liver/liver_R1_unpaired.fq`
`rm test_out/liver/liver_R2_trimmed.fq`
`rm test_out/liver/liver_R2_unpaired.fq`
> `Time`	0:00:00	ATACseq	_RES_
> `Success`	07-14 21:09:50	ATACseq	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:00:00
*     Peak memory used:  0.0 GB
* Pipeline completed at:  (07-14 21:09:50) elapsed:0:00:00 _TIME_

Pypiper terminating spawned child process 32005
cd /storage/jinxu/.local/lib/python2.7/site-packages/pypiper; git rev-parse --verify HEAD 2>/dev/null
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `pipelines/ATACseq.py -P 3 -M 100 -O test_out -R -S liver -G hg19 -Q paired -C ATACseq_hg19.yaml -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz`
*         Compute host:  localhost.localdomain
*          Working dir:  /storage/jinxu/ATACseq-pipeline/ATACseq
*            Outfolder:  /storage/jinxu/ATACseq-pipeline/ATACseq/test_out/liver/
*  Pipeline started at:   (07-18 18:14:33) elapsed:0:00:00 _TIME_

##### [Version log:]
*       Python version:  2.7.5
*          Pypiper dir:  `/storage/jinxu/.local/lib/python2.7/site-packages/pypiper`
*         Pipeline dir:  `/storage/jinxu/ATACseq-pipeline/ATACseq/pipelines`
*     Pipeline version:  0cbff9c949d95f91c88ecab340accd795e3fa657
*      Pipeline branch:  * master
*        Pipeline date:  2016-07-14 21:11:53 -0700
*        Pipeline diff:  4 files changed, 3 insertions(+), 47 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['test_data/liver-CD31_test_R2.fastq.gz']`
*   `single_or_paired`:  `paired`
*         `paired_end`:  `True`
*        `config_file`:  `ATACseq_hg19.yaml`
*              `input`:  `['test_data/liver-CD31_test_R1.fastq.gz']`
*                `mem`:  `100`
*        `sample_name`:  `liver`
*            `genomeS`:  `mm`
*      `output_parent`:  `test_out`
*    `genome_assembly`:  `hg19`
*              `cores`:  `3`
*       `force_follow`:  `False`
*              `fresh`:  `False`
*            `recover`:  `True`
*       `manual_clean`:  `False`

----------------------------------------


Change status from initializing to running
Local input file: test_data/liver-CD31_test_R1.fastq.gz
Local input file: test_data/liver-CD31_test_R2.fastq.gz

### Merge/link and fastq conversion:  (07-18 18:14:33) elapsed:0:00:00 _TIME_

Number of input file sets:		2

Target exists: `test_out/liver/raw/liver_R1.fastq.gz`
Local input file: test_out/liver/raw/liver_R1.fastq.gz

Target exists: `test_out/liver/raw/liver_R2.fastq.gz`
Local input file: test_out/liver/raw/liver_R2.fastq.gz
['test_out/liver/raw/liver_R1.fastq.gz', 'test_out/liver/raw/liver_R2.fastq.gz']
> `File_mb`	0.0218	ATACseq	_RES_
> `Read_type`	paired	ATACseq	_RES_
> `Genome`	hg19	ATACseq	_RES_

### Adapter trimming:  (07-18 18:14:33) elapsed:0:00:00 _TIME_


Target to produce: `test_out/liver/liver_R1_trimmed.fq`
> `/usr/bin/java -Xmx100m -jar /home/jinxu/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE  -threads 3 test_out/liver/raw/liver_R1.fastq.gz test_out/liver/raw/liver_R2.fastq.gz test_out/liver/liver_R1_trimmed.fq test_out/liver/liver_R1_unpaired.fq test_out/liver/liver_R2_trimmed.fq test_out/liver/liver_R2_unpaired.fq ILLUMINACLIP:/home/jinxu/software/Trimmomatic-0.36/adapters/NexteraPE-PE.fa:2:30:10`

<pre>
TrimmomaticPE: Started with arguments:
 -threads 3 test_out/liver/raw/liver_R1.fastq.gz test_out/liver/raw/liver_R2.fastq.gz test_out/liver/liver_R1_trimmed.fq test_out/liver/liver_R1_unpaired.fq test_out/liver/liver_R2_trimmed.fq test_out/liver/liver_R2_unpaired.fq ILLUMINACLIP:/home/jinxu/software/Trimmomatic-0.36/adapters/NexteraPE-PE.fa:2:30:10
Using PrefixPair: 'AGATGTGTATAAGAGACAG' and 'AGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'CTGTCTCTTATACACATCTGACGCTGCCGACGA'
Using Long Clipping Sequence: 'CTGTCTCTTATACACATCTCCGAGCCCACGAGAC'
ILLUMINACLIP: Using 1 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 250 Both Surviving: 139 (55.60%) Forward Only Surviving: 111 (44.40%) Reverse Only Surviving: 0 (0.00%) Dropped: 0 (0.00%)
TrimmomaticPE: Completed successfully
</pre>
Process 45196 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.028GB; Pipeline: 0.0GB)

Target to produce: `test_out/liver/aligned_hg19chrM/liver.chrM.sam`
> `/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/hg19_chrM -1 test_out/liver/liver_R1_trimmed.fq -2 test_out/liver/liver_R2_trimmed.fq -S test_out/liver/aligned_hg19chrM/liver.chrM.sam`

<pre>
Could not locate a Bowtie index corresponding to basename "/home/jinxu/DB/hg19_chrM"
Error: Encountered internal Bowtie 2 exception (#1)
Command: /seq/bowtie2-2.1.0/bowtie2-align --wrapper basic-0 -p 10 --very-sensitive -x /home/jinxu/DB/hg19_chrM -S test_out/liver/aligned_hg19chrM/liver.chrM.sam -1 test_out/liver/liver_R1_trimmed.fq -2 test_out/liver/liver_R2_trimmed.fq 
bowtie2-align exited with value 1
</pre>
Process 45258 returned: (1). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.028GB)

Change status from running to failed

### Pipeline failed at:  (07-18 18:14:39) elapsed:0:00:06 _TIME_

('Total time: ', '0:00:06')
Traceback (most recent call last):
  File "pipelines/ATACseq.py", line 103, in <module>
    pm.run(cmd, mapping_chrM_sam)
  File "/home/jinxu/.local/lib/python2.7/site-packages/pypiper/pypiper.py", line 440, in run
    process_return_code, local_maxmem = self.callprint(cmd, shell, nofail)  # Run command
  File "/home/jinxu/.local/lib/python2.7/site-packages/pypiper/pypiper.py", line 604, in callprint
    self.fail_pipeline(e)
  File "/home/jinxu/.local/lib/python2.7/site-packages/pypiper/pypiper.py", line 931, in fail_pipeline
    raise e
Exception: Subprocess returned nonzero result.

Pypiper terminating spawned child process 45182
cd /storage/jinxu/.local/lib/python2.7/site-packages/pypiper; git rev-parse --verify HEAD 2>/dev/null
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `pipelines/ATACseq.py -P 3 -M 100 -O test_out -R -S liver -G hg19 -Q paired -C ATACseq_hg19.yaml -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz`
*         Compute host:  localhost.localdomain
*          Working dir:  /storage/jinxu/ATACseq-pipeline/ATACseq
*            Outfolder:  /storage/jinxu/ATACseq-pipeline/ATACseq/test_out/liver/
*  Pipeline started at:   (07-18 18:17:56) elapsed:0:00:00 _TIME_

##### [Version log:]
*       Python version:  2.7.5
*          Pypiper dir:  `/storage/jinxu/.local/lib/python2.7/site-packages/pypiper`
*         Pipeline dir:  `/storage/jinxu/ATACseq-pipeline/ATACseq/pipelines`
*     Pipeline version:  0cbff9c949d95f91c88ecab340accd795e3fa657
*      Pipeline branch:  * master
*        Pipeline date:  2016-07-14 21:11:53 -0700
*        Pipeline diff:  7 files changed, 121 insertions(+), 47 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['test_data/liver-CD31_test_R2.fastq.gz']`
*   `single_or_paired`:  `paired`
*         `paired_end`:  `True`
*        `config_file`:  `ATACseq_hg19.yaml`
*              `input`:  `['test_data/liver-CD31_test_R1.fastq.gz']`
*                `mem`:  `100`
*        `sample_name`:  `liver`
*            `genomeS`:  `mm`
*      `output_parent`:  `test_out`
*    `genome_assembly`:  `hg19`
*              `cores`:  `3`
*       `force_follow`:  `False`
*              `fresh`:  `False`
*            `recover`:  `True`
*       `manual_clean`:  `False`

----------------------------------------


Change status from initializing to running
Local input file: test_data/liver-CD31_test_R1.fastq.gz
Local input file: test_data/liver-CD31_test_R2.fastq.gz

### Merge/link and fastq conversion:  (07-18 18:17:56) elapsed:0:00:00 _TIME_

Number of input file sets:		2

Target exists: `test_out/liver/raw/liver_R1.fastq.gz`
Local input file: test_out/liver/raw/liver_R1.fastq.gz

Target exists: `test_out/liver/raw/liver_R2.fastq.gz`
Local input file: test_out/liver/raw/liver_R2.fastq.gz
['test_out/liver/raw/liver_R1.fastq.gz', 'test_out/liver/raw/liver_R2.fastq.gz']
> `File_mb`	0.0218	ATACseq	_RES_
> `Read_type`	paired	ATACseq	_RES_
> `Genome`	hg19	ATACseq	_RES_

### Adapter trimming:  (07-18 18:17:56) elapsed:0:00:00 _TIME_


Target exists: `test_out/liver/liver_R1_trimmed.fq`
Found lock file; overwriting this target...

Target to produce: `test_out/liver/aligned_hg19chrM/liver.chrM.sam`
> `/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/hg19/hg19_all_chrM -1 test_out/liver/liver_R1_trimmed.fq -2 test_out/liver/liver_R2_trimmed.fq -S test_out/liver/aligned_hg19chrM/liver.chrM.sam`

<pre>
139 reads; of these:
  139 (100.00%) were paired; of these:
    137 (98.56%) aligned concordantly 0 times
    2 (1.44%) aligned concordantly exactly 1 time
    0 (0.00%) aligned concordantly >1 times
    ----
    137 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    137 pairs aligned 0 times concordantly or discordantly; of these:
      274 mates make up the pairs; of these:
        273 (99.64%) aligned 0 times
        1 (0.36%) aligned exactly 1 time
        0 (0.00%) aligned >1 times
1.80% overall alignment rate
</pre>
Process 45408 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.006GB; Pipeline: 0.0GB)

Target to produce: `test_out/liver/aligned_hg19chrM/liver.chrM.bam`
> `/usr/local/bin/samtools view -Sb test_out/liver/aligned_hg19chrM/liver.chrM.sam> test_out/liver/aligned_hg19chrM/liver.chrM.bam`

<pre>
</pre>
Process 45421 returned: (0). Elapsed: 0:00:00.

Target to produce: `test_out/liver/aligned_hg19chrM/liver.unmapchrM_R2.fastq`
> `/usr/local/bin/samtools view -b -f 0 test_out/liver/aligned_hg19chrM/liver.chrM.bam > test_out/liver/aligned_hg19chrM/liver.unmap.chrM.bam`

<pre>
</pre>
Process 45423 returned: (0). Elapsed: 0:00:00.
> `/seq/bedtools-master/bin/bedtools bamtofastq  -i test_out/liver/aligned_hg19chrM/liver.unmap.chrM.bam -fq test_out/liver/aligned_hg19chrM/liver.unmapchrM_R1.fastq -fq2 test_out/liver/aligned_hg19chrM/liver.unmapchrM_R2.fastq`

<pre>
</pre>
Process 45425 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.006GB)

Target to produce: `test_out/liver/aligned_hg19genom/liver.genom.sam`
> `/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/hg19/hg19_all -1 test_out/liver/aligned_hg19chrM/liver.unmapchrM_R1.fastq -2 test_out/liver/aligned_hg19chrM/liver.unmapchrM_R2.fastq -S test_out/liver/aligned_hg19genom/liver.genom.sam`

<pre>
139 reads; of these:
  139 (100.00%) were paired; of these:
    136 (97.84%) aligned concordantly 0 times
    1 (0.72%) aligned concordantly exactly 1 time
    2 (1.44%) aligned concordantly >1 times
    ----
    136 pairs aligned concordantly 0 times; of these:
      0 (0.00%) aligned discordantly 1 time
    ----
    136 pairs aligned 0 times concordantly or discordantly; of these:
      272 mates make up the pairs; of these:
        271 (99.63%) aligned 0 times
        1 (0.37%) aligned exactly 1 time
        0 (0.00%) aligned >1 times
2.52% overall alignment rate
</pre>
Process 45426 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.006GB; Pipeline: 0.006GB)

Target to produce: `test_out/liver/aligned_hg19genom/liver.genom.bam`
> `/usr/local/bin/samtools view -Sb test_out/liver/aligned_hg19genom/liver.genom.sam | /usr/local/bin/samtools sort -  -o test_out/liver/aligned_hg19genom/liver.genom.bam`

<pre>
</pre>
Process 45440 returned: (0). Elapsed: 0:00:00.

Target to produce: `test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam`
> `/usr/local/bin/samtools view -Sb test_out/liver/aligned_hg19genom/liver.genom.sam | /usr/local/bin/samtools sort -  -o test_out/liver/aligned_hg19genom/liver.genom.bam`

<pre>
</pre>
Process 45443 returned: (0). Elapsed: 0:00:00.
> `/seq/bedtools-master/bin/bedtools bamtofastq  -i test_out/liver/aligned_hg19chrM/liver.unmap.chrM.bam -fq test_out/liver/aligned_hg19chrM/liver.unmapchrM_R1.fastq -fq2 test_out/liver/aligned_hg19chrM/liver.unmapchrM_R2.fastq`

<pre>
</pre>
Process 45446 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.006GB)
> `/usr/bin/java -Xmx4G  -jar /seq/picard-tools-1.79/MarkDuplicates.jar INPUT=test_out/liver/aligned_hg19genom/liver.genom.bam OUTPUT=test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam METRICS_FILE=test_out/liver/aligned_hg19genom/liverpicard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > test_out/liver/aligned_hg19genom/liverpicard_metrics_log.txt`

<pre>
[Mon Jul 18 18:18:09 PDT 2016] net.sf.picard.sam.MarkDuplicates INPUT=[test_out/liver/aligned_hg19genom/liver.genom.bam] OUTPUT=test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam METRICS_FILE=test_out/liver/aligned_hg19genom/liverpicard_metrics_bam.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 READ_NAME_REGEX=[a-zA-Z0-9]+:[0-9]:([0-9]+):([0-9]+):([0-9]+).* OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false
[Mon Jul 18 18:18:09 PDT 2016] Executing as jinxu@localhost.localdomain on Linux 3.10.0-123.el7.x86_64 amd64; OpenJDK 64-Bit Server VM 1.7.0_51-mockbuild_2014_04_04_16_39-b00; Picard version: 1.79(1282)
INFO	2016-07-18 18:18:09	MarkDuplicates	Start of doWork freeMemory: 2046700264; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-18 18:18:09	MarkDuplicates	Reading input file and constructing read end information.
INFO	2016-07-18 18:18:09	MarkDuplicates	Will retain up to 15150258 data points before spilling to disk.
INFO	2016-07-18 18:18:09	MarkDuplicates	Read 8 records. 0 pairs never matched.
INFO	2016-07-18 18:18:10	MarkDuplicates	After buildSortedReadEndLists freeMemory: 1925129992; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-18 18:18:10	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2016-07-18 18:18:10	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2016-07-18 18:18:10	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2016-07-18 18:18:10	MarkDuplicates	Sorting list of duplicate records.
INFO	2016-07-18 18:18:11	MarkDuplicates	After generateDuplicateIndexes freeMemory: 1092283824; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-18 18:18:11	MarkDuplicates	Marking 0 records as duplicates.
INFO	2016-07-18 18:18:11	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2016-07-18 18:18:11	MarkDuplicates	Before output close freeMemory: 2046414504; totalMemory: 2058354688; maxMemory: 3817865216
INFO	2016-07-18 18:18:11	MarkDuplicates	After output close freeMemory: 2046497832; totalMemory: 2058354688; maxMemory: 3817865216
[Mon Jul 18 18:18:11 PDT 2016] net.sf.picard.sam.MarkDuplicates done. Elapsed time: 0.03 minutes.
Runtime.totalMemory()=2058354688
</pre>
Process 45447 returned: (0). Elapsed: 0:00:06.
> `/usr/local/bin/samtools index test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam`

<pre>
</pre>
Process 45509 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.006GB)

Target to produce: `test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed`
> `/seq/ATAC-seq/Code/bam2bed_shift.pl test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam`

<pre>

Creating bed file
</pre>
Process 45510 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.006GB)

Target to produce: `test_out/liver/aligned_hg19genom/liver.pe.q10.rmdup.norm.bw`
> `/seq/bedtools-master/bin/bedtools genomecov  -bg  -split  -i test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed -g /home/jinxu/DB/hg19/hg19_all.chrsize > test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bedGraph`

<pre>
Error: The requested genome file (/home/jinxu/DB/hg19/hg19_all.chrsize) could not be opened. Exiting!
</pre>
Process 45512 returned: (1). Elapsed: 0:00:00.

Change status from running to failed

### Pipeline failed at:  (07-18 18:18:15) elapsed:0:00:19 _TIME_

('Total time: ', '0:00:19')
Traceback (most recent call last):
  File "pipelines/ATACseq.py", line 161, in <module>
    pm.run([cmd,cmd2,cmd3], bw)
  File "/home/jinxu/.local/lib/python2.7/site-packages/pypiper/pypiper.py", line 435, in run
    list_ret, list_maxmem = self.callprint(cmd_i, shell, nofail)
  File "/home/jinxu/.local/lib/python2.7/site-packages/pypiper/pypiper.py", line 604, in callprint
    self.fail_pipeline(e)
  File "/home/jinxu/.local/lib/python2.7/site-packages/pypiper/pypiper.py", line 931, in fail_pipeline
    raise e
Exception: Subprocess returned nonzero result.

Pypiper terminating spawned child process 45394
cd /storage/jinxu/.local/lib/python2.7/site-packages/pypiper; git rev-parse --verify HEAD 2>/dev/null
----------------------------------------
##### [Pipeline run code and environment:]
*              Command:  `pipelines/ATACseq.py -P 3 -M 100 -O test_out -R -S liver -G hg19 -Q paired -C ATACseq_hg19.yaml -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz`
*         Compute host:  localhost.localdomain
*          Working dir:  /storage/jinxu/ATACseq-pipeline/ATACseq
*            Outfolder:  /storage/jinxu/ATACseq-pipeline/ATACseq/test_out/liver/
*  Pipeline started at:   (07-18 18:18:59) elapsed:0:00:00 _TIME_

##### [Version log:]
*       Python version:  2.7.5
*          Pypiper dir:  `/storage/jinxu/.local/lib/python2.7/site-packages/pypiper`
*         Pipeline dir:  `/storage/jinxu/ATACseq-pipeline/ATACseq/pipelines`
*     Pipeline version:  0cbff9c949d95f91c88ecab340accd795e3fa657
*      Pipeline branch:  * master
*        Pipeline date:  2016-07-14 21:11:53 -0700
*        Pipeline diff:  7 files changed, 370 insertions(+), 47 deletions(-)

##### [Arguments passed to pipeline:]
*             `input2`:  `['test_data/liver-CD31_test_R2.fastq.gz']`
*   `single_or_paired`:  `paired`
*         `paired_end`:  `True`
*        `config_file`:  `ATACseq_hg19.yaml`
*              `input`:  `['test_data/liver-CD31_test_R1.fastq.gz']`
*                `mem`:  `100`
*        `sample_name`:  `liver`
*            `genomeS`:  `mm`
*      `output_parent`:  `test_out`
*    `genome_assembly`:  `hg19`
*              `cores`:  `3`
*       `force_follow`:  `False`
*              `fresh`:  `False`
*            `recover`:  `True`
*       `manual_clean`:  `False`

----------------------------------------


Change status from initializing to running
Local input file: test_data/liver-CD31_test_R1.fastq.gz
Local input file: test_data/liver-CD31_test_R2.fastq.gz

### Merge/link and fastq conversion:  (07-18 18:18:59) elapsed:0:00:00 _TIME_

Number of input file sets:		2

Target exists: `test_out/liver/raw/liver_R1.fastq.gz`
Local input file: test_out/liver/raw/liver_R1.fastq.gz

Target exists: `test_out/liver/raw/liver_R2.fastq.gz`
Local input file: test_out/liver/raw/liver_R2.fastq.gz
['test_out/liver/raw/liver_R1.fastq.gz', 'test_out/liver/raw/liver_R2.fastq.gz']
> `File_mb`	0.0218	ATACseq	_RES_
> `Read_type`	paired	ATACseq	_RES_
> `Genome`	hg19	ATACseq	_RES_

### Adapter trimming:  (07-18 18:18:59) elapsed:0:00:00 _TIME_


Target exists: `test_out/liver/liver_R1_trimmed.fq`

Target exists: `test_out/liver/aligned_hg19chrM/liver.chrM.sam`

Target exists: `test_out/liver/aligned_hg19chrM/liver.chrM.bam`

Target exists: `test_out/liver/aligned_hg19chrM/liver.unmapchrM_R2.fastq`

Target exists: `test_out/liver/aligned_hg19genom/liver.genom.sam`

Target exists: `test_out/liver/aligned_hg19genom/liver.genom.bam`

Target exists: `test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam`

Target exists: `test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed`
Found lock file; overwriting this target...

Target to produce: `test_out/liver/aligned_hg19genom/liver.pe.q10.rmdup.norm.bw`
> `/seq/bedtools-master/bin/bedtools genomecov  -bg  -split  -i test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed -g /home/jinxu/DB/hg19/hg19_all.chrsize > test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bedGraph`

<pre>
</pre>
Process 45535 returned: (0). Elapsed: 0:00:06.
> `/seq/scripts/norm_bedGraph.pl test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bedGraph test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bedGraph.norm`

<pre>
</pre>
Process 45537 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)
> `/seq/ucsc/bedGraphToBigWig test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bedGraph.norm /home/jinxu/DB/hg19/hg19_all.chrsize test_out/liver/aligned_hg19genom/liver.pe.q10.rmdup.norm.bw`

<pre>
</pre>
Process 45539 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.0GB)

Target to produce: `test_out/liver/QC_hg19/liver.TssEnrichment`
> `/seq/ATAC-seq/Code/pyMakeVplot.py -a test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam -b /home/jinxu/DB/hg19/hg19_all.refseq.TSS.txt -p ends -e 2000 -u -v -o test_out/liver/QC_hg19/liver.TssEnrichment`

<pre>
/seq/ATAC-seq/Code/pyMakeVplot.py:150: RuntimeWarning: invalid value encountered in divide
  plt.plot(mat/np.mean(mat[1:200]),'k.')
/seq/ATAC-seq/Code/pyMakeVplot.py:151: RuntimeWarning: invalid value encountered in divide
  plt.plot(np.convolve(mat,np.ones(int(options.window)),'same')/int(options.window)/np.mean(mat[1:200]),'r')
</pre>
Process 45540 returned: (0). Elapsed: 0:00:06. Peak memory: (Process: 0.029GB; Pipeline: 0.0GB)

Target to produce: `test_out/liver/QC_hg19/liver.fragL.distribution.pdf`
> `perl /seq/ATAC-seq/Code/fragment_length_dist.pl test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bam test_out/liver/QC_hg19/liver.fragLen.txt`

<pre>
</pre>
Process 45573 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)
> `sort -n  test_out/liver/QC_hg19/liver.fragLen.txt | uniq -c  > test_out/liver/QC_hg19/liver.frag_count.txt`

<pre>
</pre>
Process 45575 returned: (0). Elapsed: 0:00:00.
> `Rscript /seq/ATAC-seq/Code/fragment_length_dist.R test_out/liver/QC_hg19/liver.fragLen.txt test_out/liver/QC_hg19/liver.frag_count.txt test_out/liver/QC_hg19/liver.fragL.distribution.pdf test_out/liver/QC_hg19/liver.fragL.distribution.txt`

<pre>
null device 
          1 
</pre>
Process 45578 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/peak_calling_hg19/liver_peaks.narrowPeak`
> `/usr/bin/macs2 callpeak  -t  test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed -f BED  -g mm --outdir test_out/liver/peak_calling_hg19 -n liver  -q 0.01 --shift 0 --nomodel `

<pre>
INFO  @ Mon, 18 Jul 2016 18:19:11: 
# Command line: callpeak -t test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed -f BED -g mm --outdir test_out/liver/peak_calling_hg19 -n liver -q 0.01 --shift 0 --nomodel
# ARGUMENTS LIST:
# name = liver
# format = BED
# ChIP-seq file = ['test_out/liver/aligned_hg19genom/liver.pe.q10.sort.rmdup.bed']
# control file = None
# effective genome size = 1.87e+09
# band width = 300
# model fold = [5, 50]
# qvalue cutoff = 1.00e-02
# Larger dataset will be scaled towards smaller dataset.
# Range for calculating regional lambda is: 10000 bps
# Broad region calling is off
 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 read tag files... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 read treatment tags... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 tag size is determined as 50 bps 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 tag size = 50 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1  total tags in treatment: 6 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 user defined the maximum tags... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 filter out redundant tags at the same location and the same strand by allowing at most 1 tag(s) 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1  tags after filtering in treatment: 6 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1  Redundant rate of treatment: 0.00 
INFO  @ Mon, 18 Jul 2016 18:19:11: #1 finished! 
INFO  @ Mon, 18 Jul 2016 18:19:11: #2 Build Peak Model... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #2 Skipped... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #2 Use 200 as fragment length 
INFO  @ Mon, 18 Jul 2016 18:19:11: #3 Call peaks... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #3 Pre-compute pvalue-qvalue table... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #3 Call peaks for each chromosome... 
INFO  @ Mon, 18 Jul 2016 18:19:11: #4 Write output xls file... test_out/liver/peak_calling_hg19/liver_peaks.xls 
INFO  @ Mon, 18 Jul 2016 18:19:11: #4 Write peak in narrowPeak format file... test_out/liver/peak_calling_hg19/liver_peaks.narrowPeak 
INFO  @ Mon, 18 Jul 2016 18:19:11: #4 Write summits bed file... test_out/liver/peak_calling_hg19/liver_summits.bed 
INFO  @ Mon, 18 Jul 2016 18:19:11: Done! 
</pre>
Process 45585 returned: (0). Elapsed: 0:00:00. Peak memory: (Process: 0.0GB; Pipeline: 0.029GB)

Target to produce: `test_out/liver/peak_calling_hg19/liver_peaks.narrowPeak.rmBlacklist`
> `/seq/bedtools-master/bin/bedtools intersect  -a test_out/liver/peak_calling_hg19/liver_peaks.narrowPeak -b /home/jinxu/DB/hg19/hg19_all.blaklist.bed -v  >test_out/liver/peak_calling_hg19/liver_peaks.narrowPeak.rmBlacklist`

<pre>
</pre>
Process 45586 returned: (0). Elapsed: 0:00:00.

Change status from running to completed

Conditional flag found: ['ATACseq_failed.flag']

These conditional files were left in place:['test_out/liver/liver*.fq']
> `Time`	0:00:13	ATACseq	_RES_
> `Success`	07-18 18:19:12	ATACseq	_RES_

##### [Epilogue:]
*   Total elapsed time:  0:00:13
*     Peak memory used:  0.03 GB
* Pipeline completed at:  (07-18 18:19:12) elapsed:0:00:13 _TIME_

Pypiper terminating spawned child process 45521
