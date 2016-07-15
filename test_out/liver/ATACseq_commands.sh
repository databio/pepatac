# Pipeline started at 07-14 21:06:33

ln -sf /storage/jinxu/ATACseq-pipeline/ATACseq/test_data/liver-CD31_test_R1.fastq.gz test_out/liver/raw/liver_R1.fastq.gz

ln -sf /storage/jinxu/ATACseq-pipeline/ATACseq/test_data/liver-CD31_test_R2.fastq.gz test_out/liver/raw/liver_R2.fastq.gz

/usr/bin/java -Xmx100m -jar /home/jinxu/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE  -threads 3 test_out/liver/raw/liver_R1.fastq.gz test_out/liver/raw/liver_R2.fastq.gz test_out/liver/liver_R1_trimmed.fq test_out/liver/liver_R1_unpaired.fq test_out/liver/liver_R2_trimmed.fq test_out/liver/liver_R2_unpaired.fq ILLUMINACLIP:/home/jinxu/software/Trimmomatic-0.36/adapters/NexteraPE-PE.fa:2:30:10

/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all_chrM -1 test_out/liver/liver_R1_trimmed.fq -2 test_out/liver/liver_R2_trimmed.fq -S test_out/liver/aligned_mm9chrM/liver.chrM.sam

/usr/local/bin/samtools view -Sb test_out/liver/aligned_mm9chrM/liver.chrM.sam> test_out/liver/aligned_mm9chrM/liver.chrM.bam

/usr/local/bin/samtools view -b -f 0 test_out/liver/aligned_mm9chrM/liver.chrM.bam > test_out/liver/aligned_mm9chrM/liver.unmap.chrM.bam

/seq/bedtools-master/bin/bedtools bamtofastq  -i test_out/liver/aligned_mm9chrM/liver.unmap.chrM.bam -fq test_out/liver/aligned_mm9chrM/liver.unmapchrM_R1.fastq -fq2 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq

/seq/bowtie2-2.1.0/bowtie2 -p 10 --very-sensitive  -x /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all -1 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R1.fastq -2 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq -S test_out/liver/aligned_mm9genom/liver.genom.sam

/usr/local/bin/samtools view -Sb test_out/liver/aligned_mm9genom/liver.genom.sam | /usr/local/bin/samtools sort -  -o test_out/liver/aligned_mm9genom/liver.genom.bam

/usr/local/bin/samtools view -Sb test_out/liver/aligned_mm9genom/liver.genom.sam | /usr/local/bin/samtools sort -  -o test_out/liver/aligned_mm9genom/liver.genom.bam

/seq/bedtools-master/bin/bedtools bamtofastq  -i test_out/liver/aligned_mm9chrM/liver.unmap.chrM.bam -fq test_out/liver/aligned_mm9chrM/liver.unmapchrM_R1.fastq -fq2 test_out/liver/aligned_mm9chrM/liver.unmapchrM_R2.fastq

/usr/bin/java -Xmx4G  -jar /seq/picard-tools-1.79/MarkDuplicates.jar INPUT=test_out/liver/aligned_mm9genom/liver.genom.bam OUTPUT=test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam METRICS_FILE=test_out/liver/aligned_mm9genom/liverpicard_metrics_bam.txt VALIDATION_STRINGENCY=LENIENT ASSUME_SORTED=true REMOVE_DUPLICATES=true > test_out/liver/aligned_mm9genom/liverpicard_metrics_log.txt

/usr/local/bin/samtools index test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam

/seq/ATAC-seq/Code/bam2bed_shift.pl test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam

/seq/bedtools-master/bin/bedtools genomecov  -bg  -split  -i test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed -g /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.chrsize > test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph

/seq/scripts/norm_bedGraph.pl test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph.norm

/seq/ucsc/bedGraphToBigWig test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bedGraph.norm /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.chrsize test_out/liver/aligned_mm9genom/liver.pe.q10.rmdup.norm.bw

/seq/ATAC-seq/Code/pyMakeVplot.py -a test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam -b /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.refseq.TSS.txt -p ends -e 2000 -u -v -o test_out/liver/QC_mm9/liver.TssEnrichment

perl /seq/ATAC-seq/Code/fragment_length_dist.pl test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bam test_out/liver/QC_mm9/liver.fragLen.txt

sort -n  test_out/liver/QC_mm9/liver.fragLen.txt | uniq -c  > test_out/liver/QC_mm9/liver.frag_count.txt

Rscript /seq/ATAC-seq/Code/fragment_length_dist.R test_out/liver/QC_mm9/liver.fragLen.txt test_out/liver/QC_mm9/liver.frag_count.txt test_out/liver/QC_mm9/liver.fragL.distribution.pdf test_out/liver/QC_mm9/liver.fragL.distribution.txt

/usr/bin/macs2 callpeak  -t  test_out/liver/aligned_mm9genom/liver.pe.q10.sort.rmdup.bed -f BED  -g mm --outdir test_out/liver/peak_calling_mm9 -n liver  -q 0.01 --shift 0 --nomodel 

/seq/bedtools-master/bin/bedtools intersect  -a test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak -b /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.blaklist.bed -v  >test_out/liver/peak_calling_mm9/liver_peaks.narrowPeak.rmBlacklist

# Pipeline started at 07-14 21:09:50

