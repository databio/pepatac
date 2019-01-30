# Browse the output directory

This is an interactive display of exactly what results you'll get as output from PEPATAC:

* ??? danger ":fa-folder-open-o: reports/"
    * :fa-file-code-o: [cumulative_frif.html](../files/examples/tutorial/reports/cumulative_frif.html)
    * :fa-file-code-o: [fastqc_report_r2.html](../files/examples/tutorial/reports/fastqc_report_r2.html)
    * :fa-file-code-o: [fastqc_report_r1.html](../files/examples/tutorial/reports/fastqc_report_r1.html)
    * :fa-file-code-o: [fragment_distribution.html](../files/examples/tutorial/reports/fragment_distribution.html)
    * :fa-file-code-o: [objects.html](../files/examples/tutorial/reports/objects.html)
    * :fa-file-code-o: [samples.html](../files/examples/tutorial/reports/samples.html)
    * :fa-file-code-o: [status.html](../files/examples/tutorial/reports/status.html)
    * :fa-file-code-o: [tss_enrichment.html](../files/examples/tutorial/reports/tss_enrichment.html)
    * :fa-file-code-o: [tutorial.html](../files/examples/tutorial/reports/tutorial.html)
* ??? danger ":fa-folder-open-o: results_pipeline/"
    * ??? danger ":fa-folder-open-o: tutorial/"
        * ??? danger ":fa-folder-open-o: fastqc/"
            * [:fa-file-code-o: tutorial_R1.trim_fastqc.html](../files/examples/tutorial/results_pipeline/tutorial/fastqc/tutorial_R1.trim_fastqc.html)
            * :fa-file-archive-o: tutorial_R1.trim_fastqc.zip
            * [:fa-file-code-o: tutorial_R2.trim_fastqc.html](../files/examples/tutorial/results_pipeline/tutorial/fastqc/tutorial_R2.trim_fastqc.html)
            * :fa-file-archive-o: tutorial_R2.trim_fastqc.zip
        * ??? danger ":fa-folder-open-o: raw/"
            * :fa-file-archive-o: tutorial_r1.fastq.gz
            * :fa-file-archive-o: tutorial_r2.fastq.gz
            * :fa-file-archive-o: hg38_annotations.bed.gz 
        * ??? danger ":fa-folder-open-o: aligned_hg38/"
            * :fa-file-o: tutorial_fail_qc.bam
            * :fa-file-o: tutorial_sort.bam
            * :fa-file-o: tutorial_sort.bam.bai
            * :fa-file-o: tutorial_unmap.bam
            * :fa-file-text-o: tutorial_dedup_metrics_log.txt
            * :fa-file-o: tutorial_sort_dedup.bam
            * :fa-file-o: tutorial_sort_dedup.bam.bai
            * :fa-file-o: tutorial_smooth.bw
        * ??? danger ":fa-folder-open-o: aligned_hg38_exact/"
            * :fa-file-o: tutorial_exact.bw
            * :fa-file-o: tutorial_shift.bed
        * ???+ danger ":fa-folder-open-o: fastq/"
        * ??? danger ":fa-folder-open-o: peak_calling_hg38/"
            * :fa-file-o: tutorial_peaks.narrowPeak
            * :fa-file-excel-o: tutorial_peaks.xls
            * :fa-file-o: tutorial_summits.bed
            * :fa-file-o: tutorial_peaks.bigBed
            * :fa-file-o: tutorial_peaks_coverage.bed
        * ??? danger ":fa-folder-open-o: prealignments/"
            * :fa-file-text-o: tutorial_rCRSd_bt_aln_summary.log
            * :fa-file-archive-o: tutorial_rCRSd_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial_rCRSd_unmap_R2.fq.gz
            * :fa-file-text-o: tutorial_human_repeats_bt_aln_summary.log
            * :fa-file-archive-o: tutorial_human_repeats_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial_human_repeats_unmap_R2.fq.gz
        * ??? danger ":fa-folder-open-o: QC_hg38/"
            * :fa-file-o: tutorial_bamQC.tsv
            * :fa-file-text-o: tutorial_TssEnrichment.txt
            * [:fa-file-pdf-o: tutorial_TssEnrichment.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.pdf)
            * [:fa-file-image-o: tutorial_TssEnrichment.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.png)
            * :fa-file-text-o: tutorial_fragLen.txt
            * :fa-file-text-o: tutorial_fragCount.txt
            * [:fa-file-image-o: tutorial_fragLenDistribution.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.png)
            * [:fa-file-pdf-o: tutorial_fragLenDistribution.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf)
            * :fa-file-text-o: tutorial_fragLenDistribution.txt
            * :fa-file-o: tutorial_3_UTR_coverage.bed
            * :fa-file-o: tutorial_5_UTR_coverage.bed
            * :fa-file-o: tutorial_Exon_coverage.bed
            * :fa-file-o: tutorial_Intron_coverage.bed
            * :fa-file-o: tutorial_Promoter_coverage.bed
            * :fa-file-o: tutorial_Promoter_Flanking_Region_coverage.bed
            * [:fa-file-pdf-o: tutorial_frif.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf)
            * [:fa-file-image-o: tutorial_frif.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.png)
            * [:fa-file-pdf-o: tutorial_peaks_chr_dist.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_chr_dist.pdf)
            * [:fa-file-image-o: tutorial_peaks_chr_dist.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_chr_dist.png)
            * [:fa-file-pdf-o: tutorial_peaks_TSS_dist.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_TSS_dist.pdf)
            * [:fa-file-image-o: tutorial_peaks_TSS_dist.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_TSS_dist.png)
            * [:fa-file-pdf-o: tutorial_peaks_partition_dist.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_partition_dist.pdf)
            * [:fa-file-image-o: tutorial_peaks_partition_dist.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_partition_dist.png)
        * [:fa-file-text-o: objects.tsv](../files/examples/tutorial/results_pipeline/tutorial/objects.tsv) 
        * :fa-file-code-o: PEPATAC_cleanup.sh
        * [:fa-file-code-o: PEPATAC_commands.sh](../files/examples/tutorial/results_pipeline/tutorial/PEPATAC_commands.sh)
        * :fa-file-o: PEPATAC_completed.flag
        * [:fa-file-o: PEPATAC_log.md](../files/examples/tutorial/results_pipeline/tutorial/PEPATAC_log.md)
        * [:fa-file-text-o: PEPATAC_profile.tsv](../files/examples/tutorial/results_pipeline/tutorial/PEPATAC_profile.tsv)
        * [:fa-file-text-o: stats.tsv](../files/examples/tutorial/results_pipeline/tutorial/stats.tsv)
* ??? danger ":fa-folder-open-o: submission/"
    * :fa-file-code-o: pepatac.py_tutorial.sub
    * :fa-file-code-o: tutorial.yaml
    * :fa-file-text-o: pepatac.py_tutorial.log
* ??? danger ":fa-folder-open-o: summary/"
    * :fa-file-pdf-o: [tutorial_alignmentPercent.pdf](../files/examples/tutorial/summary/tutorial_alignmentPercent.pdf)
    * :fa-file-image-o: [tutorial_alignmentPercent.png](../files/examples/tutorial/summary/tutorial_alignmentPercent.png)
    * :fa-file-pdf-o: [tutorial_alignmentRaw.pdf](../files/examples/tutorial/summary/tutorial_alignmentRaw.pdf)
    * :fa-file-image-o: [tutorial_alignmentRaw.png](../files/examples/tutorial/summary/tutorial_alignmentRaw.png)
    * :fa-file-pdf-o: [tutorial_TSSEnrichment.pdf](../files/examples/tutorial/summary/tutorial_TSSEnrichment.pdf)
    * :fa-file-image-o: [tutorial_TSSEnrichment.png](../files/examples/tutorial/summary/tutorial_TSSEnrichment.png)
* :fa-file-text-o: [tutorial_stats_summary.tsv](../files/examples/tutorial/tutorial_stats_summary.tsv)
* :fa-file-code-o: [tutorial_summary.html](../files/examples/tutorial/tutorial_summary.html)
