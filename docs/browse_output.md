# Browse the output directory

This is an interactive display of exactly what results you'll get as output from PEPATAC:

* ??? danger ":fa-folder-open-o: PEPATAC_tutorial_reports/"
    * :fa-file-code-o: [cfrif.html](files/examples/tutorial/PEPATAC_tutorial_reports/cfrif.html)
    * :fa-file-code-o: [fastqc_report_r1.html](files/examples/tutorial/PEPATAC_tutorial_reports/fastqc_report_r1.html)
    * :fa-file-code-o: [fastqc_report_r2.html](files/examples/tutorial/PEPATAC_tutorial_reports/fastqc_report_r2.html)
    * :fa-file-code-o: [fragment_distribution.html](files/examples/tutorial/PEPATAC_tutorial_reports/fragment_distribution.html)
    * :fa-file-code-o: [frif.html](files/examples/tutorial/PEPATAC_tutorial_reports/frif.html)
    * :fa-file-code-o: [library_complexity.html](files/examples/tutorial/PEPATAC_tutorial_reports/library_complexity.html)
    * :fa-file-code-o: [objects.html](files/examples/tutorial/PEPATAC_tutorial_reports/objects.html)
    * :fa-file-code-o: [peak_chromosome_distribution.html](files/examples/tutorial/PEPATAC_tutorial_reports/peak_chromosome_distribution.html)
    * :fa-file-code-o: [peak_partition_distribution.html](files/examples/tutorial/PEPATAC_tutorial_reports/peak_partition_distribution.html) 
    * :fa-file-code-o: [samples.html](files/examples/tutorial/PEPATAC_tutorial_reports/samples.html)
    * :fa-file-code-o: [status.html](files/examples/tutorial/PEPATAC_tutorial_reports/status.html)
    * :fa-file-code-o: [tss_distance_distribution.html](files/examples/tutorial/PEPATAC_tutorial_reports/tss_distance_distribution.html)
    * :fa-file-code-o: [tss_enrichment.html](files/examples/tutorial/PEPATAC_tutorial_reports/tss_enrichment.html)
    * :fa-file-code-o: [tutorial1.html](files/examples/tutorial/PEPATAC_tutorial_reports/tutorial1.html)
    * :fa-file-code-o: [tutorial2.html](files/examples/tutorial/PEPATAC_tutorial_reports/tutorial2.html)
* ??? danger ":fa-folder-open-o: results_pipeline/"
    * ??? danger ":fa-folder-open-o: tutorial1/"
        * ??? danger ":fa-folder-open-o: fastqc/"
            * [:fa-file-code-o: tutorial1_R1_trim_fastqc.html](files/examples/tutorial/results_pipeline/tutorial1/fastqc/tutorial1_R1_trim_fastqc.html)
            * :fa-file-archive-o: tutorial1_R1.trim_fastqc.zip
            * [:fa-file-code-o: tutorial1_R2_trim_fastqc.html](files/examples/tutorial/results_pipeline/tutorial1/fastqc/tutorial1_R2_trim_fastqc.html)
            * :fa-file-archive-o: tutorial1_R2.trim_fastqc.zip
        * ??? danger ":fa-folder-open-o: raw/"
            * :fa-file-archive-o: tutorial1_r1.fastq.gz
            * :fa-file-archive-o: tutorial1_r2.fastq.gz
            * :fa-file-archive-o: hg38_annotations.bed.gz 
        * ??? danger ":fa-folder-open-o: aligned_hg38/"
            * :fa-file-o: tutorial1_fail_qc.bam
            * :fa-file-o: tutorial1_sort.bam
            * :fa-file-o: tutorial1_sort.bam.bai
            * :fa-file-o: tutorial1_unmap.bam
            * :fa-file-text-o: tutorial1_dedup_metrics_log.txt
            * :fa-file-o: tutorial1_sort_dedup.bam
            * :fa-file-o: tutorial1_sort_dedup.bam.bai
            * :fa-file-o: tutorial1_smooth.bw
        * ??? danger ":fa-folder-open-o: aligned_hg38_exact/"
            * :fa-file-o: tutorial1_exact.bw
            * :fa-file-o: tutorial1_shift.bed
        * ???+ danger ":fa-folder-open-o: fastq/"
        * ??? danger ":fa-folder-open-o: peak_calling_hg38/"
            * :fa-file-o: tutorial1_peaks.narrowPeak
            * :fa-file-excel-o: tutorial_peaks.xls
            * :fa-file-o: tutorial1_summits.bed
            * :fa-file-o: tutorial1_peaks.bigBed
            * :fa-file-o: tutorial1_peaks_coverage.bed
        * ??? danger ":fa-folder-open-o: prealignments/"
            * :fa-file-text-o: tutorial1_rCRSd_bt_aln_summary.log
            * :fa-file-archive-o: tutorial1_rCRSd_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial1_rCRSd_unmap_R2.fq.gz
            * :fa-file-text-o: tutorial1_human_repeats_bt_aln_summary.log
            * :fa-file-archive-o: tutorial1_human_repeats_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial1_human_repeats_unmap_R2.fq.gz
        * ??? danger ":fa-folder-open-o: QC_hg38/"
            * :fa-file-o: tutorial1_bamQC.tsv
            * [:fa-file-pdf-o: tutorial1_cFRiF.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_cFRiF.pdf)
            * [:fa-file-image-o: tutorial1_cFRiF.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_cFRiF.png)
            * [:fa-file-pdf-o: tutorial1_peak_chromosome_distribution.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_chromosome_distribution.pdf)
            * [:fa-file-image-o: tutorial1_peak_chromosome_distribution.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_chromosome_distribution.png)
            * :fa-file-text-o: tutorial1_fragCount.txt
            * [:fa-file-pdf-o: tutorial1_fragLenDistribution.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.pdf)
            * [:fa-file-image-o: tutorial1_fragLenDistribution.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_fragLenDistribution.png)
            * :fa-file-text-o: tutorial1_fragLenDistribution.txt
            * :fa-file-text-o: tutorial1_fragLen.txt
            * [:fa-file-pdf-o: tutorial1_FRiF.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_FRiF.pdf)
            * [:fa-file-image-o: tutorial1_FRiF.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_FRiF.png)
            * [:fa-file-pdf-o: tutorial1_peak_genomic_distribution.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_genomic_distribution.pdf)
            * [:fa-file-image-o: tutorial1_peak_genomic_distribution.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_genomic_distribution.png)
            * :fa-file-text-o: tutorial1_preseq_counts.txt
            * :fa-file-text-o: tutorial1_preseq_out.txt
            * [:fa-file-pdf-o: tutorial1_preseq_plot.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_plot.pdf)
            * [:fa-file-image-o: tutorial1_preseq_plot.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_preseq_plot.png)
            * :fa-file-text-o: tutorial1_preseq_yield.txt
            * [:fa-file-pdf-o: tutorial1_peak_TSS_distribution.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_TSS_distribution.pdf)
            * [:fa-file-image-o: tutorial1_peak_TSS_distribution.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_peak_TSS_distribution.png)
            * [:fa-file-pdf-o: tutorial1_TSS_enrichment.pdf](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.pdf)
            * [:fa-file-image-o: tutorial1_TSS_enrichment.png](files/examples/tutorial/results_pipeline/tutorial1/QC_hg38/tutorial1_TSS_enrichment.png)
            * :fa-file-text-o: tutorial1_TssEnrichment.txt
        * [:fa-file-text-o: objects.tsv](files/examples/tutorial/results_pipeline/tutorial1/objects.tsv) 
        * :fa-file-code-o: PEPATAC_cleanup.sh
        * [:fa-file-code-o: PEPATAC_commands.sh](files/examples/tutorial/results_pipeline/tutorial1/PEPATAC_commands.sh)
        * :fa-file-o: PEPATAC_completed.flag
        * [:fa-file-o: PEPATAC_log.md](files/examples/tutorial/results_pipeline/tutorial1/PEPATAC_log.txt)
        * [:fa-file-text-o: PEPATAC_profile.tsv](files/examples/tutorial/results_pipeline/tutorial1/PEPATAC_profile.tsv)
        * [:fa-file-text-o: stats.tsv](files/examples/tutorial/results_pipeline/tutorial1/stats.tsv)
    * ??? danger ":fa-folder-open-o: tutorial2/"
        * ??? danger ":fa-folder-open-o: fastqc/"
            * [:fa-file-code-o: tutorial2_R1_trim_fastqc.html](files/examples/tutorial/results_pipeline/tutorial2/fastqc/tutorial2_R1_trim_fastqc.html)
            * :fa-file-archive-o: tutorial2_R1.trim_fastqc.zip
            * [:fa-file-code-o: tutorial2_R2_trim_fastqc.html](files/examples/tutorial/results_pipeline/tutorial2/fastqc/tutorial2_R2_trim_fastqc.html)
            * :fa-file-archive-o: tutorial2_R2.trim_fastqc.zip
        * ??? danger ":fa-folder-open-o: raw/"
            * :fa-file-archive-o: tutorial2_r1.fastq.gz
            * :fa-file-archive-o: tutorial2_r2.fastq.gz
            * :fa-file-archive-o: hg38_annotations.bed.gz 
        * ??? danger ":fa-folder-open-o: aligned_hg38/"
            * :fa-file-o: tutorial2_fail_qc.bam
            * :fa-file-o: tutorial2_sort.bam
            * :fa-file-o: tutorial2_sort.bam.bai
            * :fa-file-o: tutorial2_unmap.bam
            * :fa-file-text-o: tutorial2_dedup_metrics_log.txt
            * :fa-file-o: tutorial2_sort_dedup.bam
            * :fa-file-o: tutorial2_sort_dedup.bam.bai
            * :fa-file-o: tutorial2_smooth.bw
        * ??? danger ":fa-folder-open-o: aligned_hg38_exact/"
            * :fa-file-o: tutorial2_exact.bw
            * :fa-file-o: tutorial2_shift.bed
        * ???+ danger ":fa-folder-open-o: fastq/"
        * ??? danger ":fa-folder-open-o: peak_calling_hg38/"
            * :fa-file-o: tutorial2_peaks.narrowPeak
            * :fa-file-excel-o: tutorial_peaks.xls
            * :fa-file-o: tutorial2_summits.bed
            * :fa-file-o: tutorial2_peaks.bigBed
            * :fa-file-o: tutorial2_peaks_coverage.bed
        * ??? danger ":fa-folder-open-o: prealignments/"
            * :fa-file-text-o: tutorial2_rCRSd_bt_aln_summary.log
            * :fa-file-archive-o: tutorial2_rCRSd_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial2_rCRSd_unmap_R2.fq.gz
            * :fa-file-text-o: tutorial2_human_repeats_bt_aln_summary.log
            * :fa-file-archive-o: tutorial2_human_repeats_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial2_human_repeats_unmap_R2.fq.gz
        * ??? danger ":fa-folder-open-o: QC_hg38/"
            * :fa-file-o: tutorial2_bamQC.tsv
            * [:fa-file-pdf-o: tutorial2_cFRiF.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_cFRiF.pdf)
            * [:fa-file-image-o: tutorial2_cFRiF.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_cFRiF.png)
            * [:fa-file-pdf-o: tutorial2_peak_chromosome_distribution.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_chromosome_distribution.pdf)
            * [:fa-file-image-o: tutorial2_peak_chromosome_distribution.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_chromosome_distribution.png)
            * :fa-file-text-o: tutorial2_fragCount.txt
            * [:fa-file-pdf-o: tutorial2_fragLenDistribution.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLenDistribution.pdf)
            * [:fa-file-image-o: tutorial2_fragLenDistribution.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_fragLenDistribution.png)
            * :fa-file-text-o: tutorial2_fragLenDistribution.txt
            * :fa-file-text-o: tutorial2_fragLen.txt
            * [:fa-file-pdf-o: tutorial2_FRiF.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_FRiF.pdf)
            * [:fa-file-image-o: tutorial2_FRiF.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_FRiF.png)
            * [:fa-file-pdf-o: tutorial2_peak_genomic_distribution.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_genomic_distribution.pdf)
            * [:fa-file-image-o: tutorial2_peak_genomic_distribution.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_genomic_distribution.png)
            * :fa-file-text-o: tutorial2_preseq_out.txt
            * [:fa-file-pdf-o: tutorial2_peak_TSS_distribution.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_TSS_distribution.pdf)
            * [:fa-file-image-o: tutorial2_peak_TSS_distribution.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_peak_TSS_distribution.png)
            * [:fa-file-pdf-o: tutorial2_TSS_enrichment.pdf](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.pdf)
            * [:fa-file-image-o: tutorial2_TSS_enrichment.png](files/examples/tutorial/results_pipeline/tutorial2/QC_hg38/tutorial2_TSS_enrichment.png)
            * :fa-file-text-o: tutorial2_TssEnrichment.txt
        * [:fa-file-text-o: objects.tsv](files/examples/tutorial/results_pipeline/tutorial2/objects.tsv) 
        * :fa-file-code-o: PEPATAC_cleanup.sh
        * [:fa-file-code-o: PEPATAC_commands.sh](files/examples/tutorial/results_pipeline/tutorial2/PEPATAC_commands.sh)
        * :fa-file-o: PEPATAC_completed.flag
        * [:fa-file-o: PEPATAC_log.md](files/examples/tutorial/results_pipeline/tutorial2/PEPATAC_log.txt)
        * [:fa-file-text-o: PEPATAC_profile.tsv](files/examples/tutorial/results_pipeline/tutorial2/PEPATAC_profile.tsv)
        * [:fa-file-text-o: stats.tsv](files/examples/tutorial/results_pipeline/tutorial2/stats.tsv)
* ??? danger ":fa-folder-open-o: submission/"
    * :fa-file-text-o: PEPATAC_summarizer_collate.log
    * :fa-file-code-o: PEPATAC_summarizer_collate.sub
    * :fa-file-text-o: PEPATAC_tutorial.log
    * :fa-file-code-o: PEPATAC_tutorial.sub
    * :fa-file-code-o: tutorial.yaml    
* ??? danger ":fa-folder-open-o: summary/"
    * [:fa-file-code-o: PEPATAC_collator_commands.sh](files/examples/tutorial/summary/PEPATAC_collator_commands.sh)
    * :fa-file-text-o: PEPATAC_collator_completed.flag
    * [:fa-file-o: PEPATAC_collator_log.md](files/examples/tutorial/summary/PEPATAC_collator_log.txt)
    * [:fa-file-text-o: PEPATAC_collator_profile.tsv](files/examples/tutorial/summary/PEPATAC_collator_profile.tsv)
    * [:fa-file-pdf-o: PEPATAC_tutorial_alignmentPercent.pdf](files/examples/tutorial/summary/PEPATAC_tutorial_alignmentPercent.pdf)
    * [:fa-file-image-o: PEPATAC_tutorial_alignmentPercent.png](files/examples/tutorial/summary/PEPATAC_tutorial_alignmentPercent.png)
    * [:fa-file-pdf-o: PEPATAC_tutorial_alignmentRaw.pdf](files/examples/tutorial/summary/PEPATAC_tutorial_alignmentRaw.pdf)
    * [:fa-file-image-o: PEPATAC_tutorial_alignmentRaw.png](files/examples/tutorial/summary/PEPATAC_tutorial_alignmentRaw.png)
    * [:fa-file-pdf-o: PEPATAC_tutorial_libComplexity.pdf](files/examples/tutorial/summary/PEPATAC_tutorial_libComplexity.pdf)
    * [:fa-file-image-o: PEPATAC_tutorial_libComplexity.png](files/examples/tutorial/summary/PEPATAC_tutorial_libComplexity.png)
    * [:fa-file-image-o: PEPATAC_tutorial_peaks_coverage.png](files/examples/tutorial/summary/PEPATAC_tutorial_peaks_coverage.png)
    * [:fa-file-text-o: PEPATAC_tutorial_peaks_coverage.tsv](files/examples/tutorial/summary/PEPATAC_tutorial_peaks_coverage.tsv)
    * [:fa-file-pdf-o: PEPATAC_tutorial_TSSEnrichment.pdf](files/examples/tutorial/summary/PEPATAC_tutorial_TSSEnrichment.pdf)
    * [:fa-file-image-o: PEPATAC_tutorial_TSSEnrichment.png](files/examples/tutorial/summary/PEPATAC_tutorial_TSSEnrichment.png)
    * [:fa-file-text-o: stats.tsv](files/examples/tutorial/summary/stats.tsv)
* :fa-file-text-o: [PEPATAC_tutorial_assets_summary.tsv](files/examples/tutorial/PEPATAC_tutorial_assets_summary.tsv)
* :fa-file-text-o: [PEPATAC_tutorial_objs_summary.tsv](files/examples/tutorial/PEPATAC_tutorial_objs_summary.tsv)
* :fa-file-text-o: [PEPATAC_tutorial_stats_summary.tsv](files/examples/tutorial/PEPATAC_tutorial_stats_summary.tsv)
* :fa-file-code-o: [PEPATAC_tutorial_summary.html](files/examples/tutorial/PEPATAC_tutorial_summary.html)
