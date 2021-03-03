# <img src="img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:50px; margin-top:10px; margin-bottom:-10px" align="left">  

<br clear="all">

[![PEP compatible](http://pepkit.github.io/img/PEP-compatible-green.svg)](http://pepkit.github.io)

## What is PEPATAC?

`PEPATAC` is an ATAC-seq pipeline. It trims adapters, maps reads, calls peaks, and creates bigwig tracks, TSS enrichment files, and other outputs. It is optimized on unique features of ATAC-seq data to be fast and accurate and provides several unique analytical approaches.

## What makes PEPATAC better?

`PEPATAC` has many [nice features](features), such as scalability, restartability, copious logging, portability, standardized reference genome assembly, nice QC plots, and beautiful HTML reports. But what really sets it apart from others are these key advantages:

- **Standard project organization**: `PEPATAC` reads sample data formatted in [standard PEP format](http://pep.databio.org/en/latest/). This means  `PEPATAC` projects are compatible with other PEP tools, such as `R` analysis with [`pepr`](http://code.databio.org/pepr/) or `Python` using [`peppy`](https://peppy.readthedocs.io/en/latest/). 
- **Speed and memory use**: `PEPATAC` is employs several speed optimizations, such as using [GenomicDistributions](http://code.databio.org/GenomicDistributions/). It requires substantially lower time and memory than other pipelines.
- **Prealignments**: `PEPATAC` pioneers a *prealignment* strategy to filter mitochondrial reads, leading to faster runtime and more accurate alignment statistics.
- **Flexibility**: Choose from multiple adapter trimmers, peak callers, and output options. Or, just use the defaults.

## Outputs

`PEPATAC` produces many outputs to set the stage for project-specific analysis:

- HTML report: View this [HTML Summary report demo](files/examples/gold/gold_summary.html)
- We have produced an [interactive display of the output folder structure](browse_output.md), which includes:
	- [Easily parsable summary statistics file](files/examples/gold/results_pipeline/gold5/stats.tsv)
	- Called peaks (in both `narrowPeak` and `bigBed` format)
	- BigWig signal tracks:
	    - nucleotide-resolution ("exact cut") signal
	    - smoothed signal
	- Plots:               
	    - [TSS enrichment plot](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_TSS_enrichment.pdf)
	    - [TSS distance distribution](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_TSS_distribution.pdf)
	    - [Fragment length distribution](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_fragLenDistribution.pdf)
	    - [Peak chromosomal distribution](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_chromosome_distribution.pdf)
	    - [Peak genomic partition distribution](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_genomic_distribution.pdf  )
	    - [Fraction of reads *and/or* peaks in features (FRiF)](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_FRiF.pdf)
        - [Cumulative Fraction of reads *and/or* peaks in features (cFRiF)](files/examples/gold/results_pipeline/gold5/QC_hg38/gold5_cFRiF.pdf)

## Quick start

`PEPATAC` is a python script. Once you have all the prerequisites installed, you just run it on the command line (see [usage](usage) for the complete arguments list):

```console
pepatac.py --input reads.fq.gz [options...]
```

## Availability

The latest version is posted on [GitHub releases](https://github.com/databio/pepatac/releases), with changes in the [CHANGELOG](changelog).
