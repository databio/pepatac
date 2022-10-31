<img src="img/pepatac_logo_white.svg" alt="pepatac logo" height="70" align="left"/>

<br></br>

---

[![PEP compatible](http://pepkit.github.io/img/PEP-compatible-green.svg)](http://pepkit.github.io)

`PEPATAC` is a standardized ATAC-seq analysis pipeline designed to be modular and highly flexible. `PEPATAC` leverages unique features of ATAC-seq data to optimize for speed and accuracy, and it provides several unique analytical approaches. Downstream analysis is simplified by a standard definition format, modularity of components, and metadata APIs in R and Python. It is restartable, fault-tolerant, and can be run on local hardware, using any cluster resource manager, or in provided Linux containers. We also emphasize the advantage of aligning to the mitochondrial genome (and *more*) serially, which improves alignment and quality control metrics. `PEPATAC` is a robust and portable first step for any ATAC-seq project.

## Outputs

`PEPATAC` includes convenient quality control plots, summary statistics, and a variety of generally useful data formats to set the groundwork for subsequent project-specific data analysis. We have produced an [interactive display of the output folder structure](browse_output/), which includes:

- **HTML report**: an easily-navigable HTML report with pretty plots: [HTML summary report demo](files/examples/tutorial/PEPATAC_summary.html).
- **Stats**: an easily parsable stats file: [Summary statistics demo file](files/examples/tutorial/PEPATAC_stats_summary.tsv).
- **Signal tracks**: bigWig signal tracks with options to produce: smoothed signal and exact (nucleotide-resolution); or nucleotide-resolution signal corrected for enzymatic sequence bias.
- **QC plots**: fragment distributions, TSS enrichment scores, library complexities, FRiP, and more.
- **Processed data**: project-level consensus peaks and peak count tables.

## User interface

`PEPATAC` is a python script that runs on the command line (See [usage](usage)). It can also read projects in [PEP format](https://pepkit.github.io/). This means that `PEPATAC` projects are also compatible with other PEP tools, and output can be conveniently read into `R` using [the `pepr` package](http://code.databio.org/pepr/) or into `Python` using the [`peppy` package](https://peppy.readthedocs.io/en/latest/). The pipeline itself is customizable, enabling a user to adjust individual command settings or even swap out specific software by editing a few lines of human readable configuration files.

## Availability

You can download the latest version from the [releases](https://github.com/databio/PEPATAC/releases) page, or find changes listed in the [CHANGELOG](changelog).

## Citing

If you find PEPATAC useful in your research, please cite: 

Jason P. Smith, M. Ryan Corces, Jin Xu, Vincent P. Reuter, Howard Y. Chang, and Nathan C. Sheffield. <b>PEPATAC: An optimized ATAC-seq pipeline with serial alignments.</b> <i>bioRxiv</i> (2021). <a href="https://doi.org/10.1101/2020.10.21.347054">DOI: 10.1101/2020.10.21.347054</a>

