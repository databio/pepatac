# Install and run <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

## 1: Clone the `PEPATAC` pipeline

```
git clone https://github.com/databio/pepatac.git
```

## 2: Install required software

You have a few options for software prerequisites: 1) use containers, 2) install via `conda`, or 3) install all prerequisites natively. If you want to use containers, you can use either the [multi-container environment manager, `bulker`](https://bulker.databio.org/en/latest/) with `docker` or `singularity`, or just use either `docker` or `singularity` -- see instructions in [how to run PEPATAC with containers](run-container.md). Otherwise, follow these instructions to install the requirements with `conda`:

### Tools

You will need some common bioinformatics tools installed: [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/), [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [preseq (v2.0+)](http://smithlabresearch.org/software/preseq/), [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster), [samtools (v1.7+)](http://www.htslib.org/), [skewer (v0.1.126+)](https://github.com/relipmoc/skewer), [UCSC tools](http://hgdownload.soe.ucsc.edu/admin/exe/) (wigToBigWig, bigWigCat, bedToBigBed), [pigz (v2.3.4+)](https://zlib.net/pigz/). 

Optionally, `PEPATAC` can report on fastq quality ([FastQC](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc)) and utilize swappable tools for adapter removal ([trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)), deduplication ([picard](https://broadinstitute.github.io/picard/)), and signal track generation ([seqOutBias](https://github.com/guertinlab/seqOutBias), [bedGraphToBigWig](http://hgdownload.soe.ucsc.edu/admin/exe/), and [bigWigMerge](http://hgdownload.soe.ucsc.edu/admin/exe/)).

The easiest and preferred way is to utilize `conda` to install all the tools in a single command, albeit be prepared for this initial installation process to take more than an hour to complete.

From the `pepatac/` directory:
```{bash}
conda env create -f requirements-conda.yml
```

Note: The subsequent steps all assume you have installed using `conda`.  Alternatively, you can follow instructions to install each individual program natively. If you need additional direction with this approach, see the [detailed installation instructions](detailed-install.md).

### Python packages

`PEPATAC` uses several Python packages under the hood. Not all of these are available through `conda`, so we'll ensure they are installed ourselves to the `pepatac` `conda` environment. From the `pepatac/` directory:

```{bash}
conda activate pepatac
unset PYTHONPATH
python -m pip install --ignore-installed --upgrade -r requirements.txt
```

### R packages

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots. We have packaged the `pepatac` specific `R` code into a supporting package called [PEPATACr](https://github.com/databio/pepatac/tree/master/PEPATACr). The `PEPATACr` package relies on a few additional packages which can be installed to the `conda` environment.

To ensure these packages are installed to the `pepatac` `conda` environment, make sure to point your `R_LIBS` environment variable to the `conda` environment `R` library. For example:
```{bash}
conda activate pepatac
unset R_LIBS
export R_LIBS="$CONDA_PREFIX/lib/R/library"
```

From the `pepatac/` directory, open `R` and install the following packages:
```{R}
install.packages("optigrab")
devtools::install_github("databio/GenomicDistributions")
install.packages("http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.2.tar.gz", repos=NULL)
devtools::install(file.path("PEPATACr/"), dependencies=TRUE, repos="https://cloud.r-project.org/")
```

## 3: Download `refgenie` assets

PEPATAC uses [`refgenie`](http://refgenie.databio.org/) assets for alignment. If you haven't already, initialize a refgenie config file like this:

```console
export REFGENIE=/path/to/your_genome_folder/genome_config.yaml
refgenie init -c $REFGENIE
```

Add the `export REFGENIE` line to your `.bashrc` or `.profile` to ensure it persists. 

Next, pull the assets you need. Replace `hg38` in the example below if you need to use a different genome assembly. If these assets are not available automatically for your genome of interest, then you'll need to [build them](annotation.md). Download these required assets with this command:

```console
refgenie pull hg38/fasta hg38/bowtie2_index hg38/refgene_anno hg38/ensembl_gtf hg38/ensembl_rb
refgenie build hg38/feat_annotation
```

PEPATAC also requires a `bowtie2_index` asset for any pre-alignment genomes:

```console
refgenie pull rCRSd/bowtie2_index
refgenie pull human_repeats/bowtie2_index
```

## 4: Use `looper` to run the sample processing pipeline

Start by running the example project (`test_config.yaml`) in the `examples/test_project/` folder. `PEPATAC` uses a project management tool called `looper` to run the sample-level pipeline across each sample in a project. Let's use the `-d` argument to first try a dry run, which will create job scripts for every sample in a project, but will not execute them:

From the `pepatac/` folder:
```
looper run -d examples/test_project/test_config.yaml
```

If that looked good, let's actually run the example by taking out the `-d` flag:
```
looper run examples/test_project/test_config.yaml
```

Or, if you're using [`bulker`](https://bulker.databio.org/en/latest/) to run the pipeline in containers:

```
bulker activate databio/pepatac
looper run examples/test_project/test_config.yaml
```

There are lots of other cool things you can do with looper, like dry runs, report results, check on pipeline run status, clean intermediate files to save disk space, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.databio.org/).

## 5: Use `looper` to run the project level pipeline

`PEPATAC` also includes a project-level processing pipeline to do things like: 
 - [Plot alignment statistics](files/examples/gold/summary/gold_alignmentPercent.pdf) for all samples in the project together for easy visualization
 - [Plot TSS enrichment scores](files/examples/gold/summary/gold_TSSEnrichment.pdf) for all the samples in the project in a single figure
 - [Produce a consensus peak set](consensus_peaks.md) for the project
 - [Produce a count table](count_table.md) using the consensus peak set for all the samples in a project

`looper runp examples/test_project/test_config.yaml`

This should take < a minute on the test sample and will generate a summary/ directory containing project level output in the parent project directory. In this small example, there won't be a consensus peak set or count table because it is only a single sample. To see more, you can [run through the extended tutorial](tutorial.md) to see this in action.

# Next steps

This is just the beginning. For your next step, take a look at one of these user guides:

- [Configuring custom project files](peps.md)
- [Extended tutorial for running multiple samples](tutorial.md)
- [Running the pipeline with containers](run-container.md)
- See other detailed user guide links in the side menu

Any questions? Feel free to [reach out to us](contact.md). Otherwise, go analyze some ATAC-seq!
