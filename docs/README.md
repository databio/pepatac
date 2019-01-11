# <img src="/img/pepatac_logo_black.png" alt="PEPATAC" class="img-fluid" style="max-height:70px; margin-top:10px; margin-bottom:-10px" align="left">  

<br></br>
<br></br>

[![PEP compatible](http://pepkit.github.io/img/PEP-compatible-green.svg)](http://pepkit.github.io)

`PEPATAC` is an ATAC-seq pipeline that may be easily applied to ATAC-seq projects of any size, from one-off experiments to large-scale sequencing projects. It is optimized on unique features of ATAC-seq data to be fast and accurate and provides several unique analytical approaches. It performs adapter trimming, mapping, peak calling, and creates bigwig tracks, TSS enrichment files, and other outputs. You can download the latest version from the [releases](https://github.com/databio/pepatac/releases) page, or find changes listed in the [CHANGELOG](https://github.com/databio/pepatac/blob/master/CHANGELOG.md).

`PEPATAC` produces convenient quality control plots, summary statistics, and a variety of generally useful data formats to set the groundwork for subsequent project-specific data analysis. Example output includes the following:

- [Easily parsable summary statistics file](/files/examples/gold/results_pipeline/gold5/stats.tsv)
- Called peaks (in both `narrowPeak` and `bigBed` format)
- BigWig signal tracks:
    - nucleotide-resolution ("exact cut") signal
    - smoothed signal
- Plots:               
    - [TSS enrichment plot](/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.pdf)
    - [TSS distance distribution](/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_TSS_dist.pdf)
    - [Fragment length distribution](/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf)
    - [Peak chromosomal distribution](/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_chr_dist.pdf)
    - [Peak genomic partition distribution](/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_partition_dist.pdf)
    - [Fraction of reads *and/or* peaks in features (FRiF)](/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_frif.pdf)

`PEPATAC` is built using a common project definition, the [Portable Encapsulated Projects (PEP) format](https://pepkit.github.io/). This means that projects that are using `PEPATAC` would also be easily compatible with any other PEP-compatible tool. The pipeline itself is also easily customizable, enabling a user to adjust individual command settings or even swap out specific software by editing a few lines of human readable configuration files. The pipeline is constructed with modular components that make it easy to analyze pipeline output using [metadata APIs in `R`](http://code.databio.org/pepr/) and [`Python`](https://peppy.readthedocs.io/en/latest/). `PEPATAC` is a useful first step in universal data analysis for any ATAC-seq project.

---

- [:fa-envelope: Contact Us](contact.md)
- [Learn more about the Databio team!](http://databio.org/)
