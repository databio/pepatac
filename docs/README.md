# <img src="img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:70px; margin-top:10px; margin-bottom:-10px" align="left">  

<br clear="all">

[![PEP compatible](http://pepkit.github.io/img/PEP-compatible-green.svg)](http://pepkit.github.io)

`PEPATAC` is an ATAC-seq pipeline for ATAC-seq projects of any size, from one-off experiments to large-scale sequencing projects. It is optimized on unique features of ATAC-seq data to be fast and accurate and provides several unique analytical approaches. It performs adapter trimming, mapping, peak calling, and creates bigwig tracks, TSS enrichment files, and other outputs. 

## Outputs

`PEPATAC` produces quality control plots, summary statistics, and several data formats to set the groundwork for project-specific analysis. We have produced an [interactive display of the output folder structure](browse_output/), which includes:

- [Easily parsable summary statistics file](files/examples/gold/results_pipeline/gold5/stats.tsv)
- Called peaks (in both `narrowPeak` and `bigBed` format)
- BigWig signal tracks:
    - nucleotide-resolution ("exact cut") signal
    - smoothed signal
- Plots:               
    - [TSS enrichment plot](files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.pdf)
    - [TSS distance distribution](files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_TSS_dist.pdf)
    - [Fragment length distribution](files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf)
    - [Peak chromosomal distribution](files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_chr_dist.pdf)
    - [Peak genomic partition distribution](files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_partition_dist.pdf)
    - [Fraction of reads *and/or* peaks in features (FRiF)](files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_frif.pdf)

## User interface

`PEPATAC` reads projects in [PEP format](https://pepkit.github.io/). This means that `PEPATAC` projects are also compatible with other PEP tools, and output can be convenient read into `R` using [the `pepr` package](http://code.databio.org/pepr/) or into `Python` using the [`peppy package`](https://peppy.readthedocs.io/en/latest/). The pipeline itself is customizable, enabling a user to adjust individual command settings or even swap out specific software by editing a few lines of human readable configuration files.

## Availability

You can download the latest version from the [releases](https://github.com/databio/pepatac/releases) page, or find changes listed in the [CHANGELOG](/changelog).
