# Run <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> in a conda environment.

We also enable setup of the pipeline using `conda`. As with container-based approaches, some native installation is required for complete setup. 

## 1: Clone the `PEPATAC` pipeline

```console
git clone https://github.com/databio/pepatac.git
```

## 2: Install bioinformatic tools

You will need some common bioinformatics tools installed: [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/), [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [preseq (v2.0+)](http://smithlabresearch.org/software/preseq/), [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster), [samtools (v1.7+)](http://www.htslib.org/), [skewer (v0.1.126+)](https://github.com/relipmoc/skewer), [UCSC tools](http://hgdownload.soe.ucsc.edu/admin/exe/) (wigToBigWig, bigWigCat, bedToBigBed), [pigz (v2.3.4+)](https://zlib.net/pigz/). 

Optionally, `PEPATAC` can report on fastq quality ([FastQC](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc)) and utilize swappable tools for adapter removal ([trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)), deduplication ([picard](https://broadinstitute.github.io/picard/)), and signal track generation ([seqOutBias](https://github.com/guertinlab/seqOutBias), [bedGraphToBigWig](http://hgdownload.soe.ucsc.edu/admin/exe/), and [bigWigMerge](http://hgdownload.soe.ucsc.edu/admin/exe/)).

Be prepared for this initial installation process to take more than an hour to complete.

From the `pepatac/` repository directory:
```{bash}
conda env create -f requirements-conda.yml
```

Note: The subsequent steps all assume you have installed using `conda`.  Alternatively, you can [follow instructions to install each individual program natively](detailed-install.md).

## 3. Install python packages

`PEPATAC` uses several Python packages under the hood. Not all of these are available through `conda`, so we'll ensure they are installed ourselves to the `pepatac` `conda` environment. From the `pepatac/` directory:

```{bash}
conda activate pepatac
unset PYTHONPATH
python -m pip install --ignore-installed --upgrade -r requirements.txt
```

## 4. Install R packages

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots. We have packaged the `pepatac` specific `R` code into a supporting package called [PEPATACr](https://github.com/databio/pepatac/tree/master/PEPATACr). The `PEPATACr` package relies on a few additional packages which can be installed to the `conda` environment.

To ensure these packages are installed to the `pepatac` `conda` environment, make sure to point your `R_LIBS` environment variable to the `conda` environment `R` library. For example:
```{bash}
conda activate pepatac
unset R_LIBS
export R_LIBS="$CONDA_PREFIX/lib/R/library"
export R_LIBS_USER="$CONDA_PREFIX/lib/R/library"
```

From the `pepatac/` directory, open `R` and install the following packages:
Note: if receiving an error for GenomicDistributionsData_0.0.2.tar.gz, download the file manually and install directly using `install.packages("local/path/to/GenomicDistributionsData_0.0.2.tar.gz", repos=NULL)`
```{R}
install.packages('argparser')
install.packages("optigrab")
devtools::install_github("databio/GenomicDistributions")
#increase the download.file time limits:
options(timeout = max(1000, getOption("timeout")))
install.packages("http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.2.tar.gz", repos=NULL)
devtools::install(file.path("PEPATACr/"), dependencies=TRUE, repos="https://cloud.r-project.org/")
```

## 5: Get genome assets

### 5a: Initialize `refgenie` and download assets

`PEPATAC` can utilize [`refgenie`](http://refgenie.databio.org/) assets. Because assets are user-dependent, these files must still be available natively. Therefore, we need to [install and initialize a refgenie config file.](http://refgenie.databio.org/en/latest/install/). For example:

```console
pip install refgenie
export REFGENIE=/path/to/your_genome_folder/genome_config.yaml
refgenie init -c $REFGENIE
```

Add the `export REFGENIE` line to your `.bashrc` or `.profile` to ensure it persists. 

Next, pull the assets you need. Replace `hg38` in the example below if you need to use a different genome assembly. If these assets are not available automatically for your genome of interest, then you'll need to [build them](annotation.md). Download these required assets with this command:

```console
refgenie pull hg38/fasta hg38/bowtie2_index hg38/refgene_anno hg38/ensembl_gtf hg38/ensembl_rb
refgenie build hg38/feat_annotation
```

`PEPATAC` also requires a `fasta` and `bowtie2_index` asset for any pre-alignment genomes:

```console
refgenie pull rCRSd/fasta
refgenie pull rCRSd/bowtie2_index
```

### 5b: Download assets manually

If you prefer not to use `refgenie`, you can also download and construct assets manually.  The minimum required assets for a genome includes: 
 
 - a chromosome sizes file: a text file containing "chr" and "size" columns.
 - a [`bowtie2` genome index](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer).

Optional assets include: 
 
 - a TSS annotation file: a BED file containing "chr", "start", "end", "gene name", "score", and "strand" columns.
 - a region blacklist: e.g. [the ENCODE blacklist](https://github.com/Boyle-Lab/Blacklist)
 - a [genomic feature annotation file](annotation.md)

## 6. Confirm installation 

After setting up your environment to run `PEPATAC` with `conda`, you can confirm the pipeline is now executable with `conda` using the included `checkinstall` script.  This can either be run directly from the `pepatac/` repository...

```console
./checkinstall
```

or from the web:
```console
curl -sSL https://raw.githubusercontent.com/databio/pepatac/checkinstall | bash
```

## 7: Use `looper` to run the sample processing pipeline

Start by running the example project (`test_config.yaml`) in the `examples/test_project/` folder. `PEPATAC` can utilize a project management tool called `looper` to run the sample-level pipeline across each sample in a project. Let's use the `-d` argument to first try a dry run, which will create job scripts for every sample in a project, but will not execute them:

If you are using `refgenie`, you can grab the path to the `--chrom-sizes` and `--genome-index` files as follows:
```console
refgenie seek hg38/fasta.chrom_sizes
refgenie seek hg38/bowtie2_index.dir
refgenie seek rCRSd/bowtie2_index.dir
```

Alternatively, if you are *not* using `refgenie`, you can still grab premade `--chrom-sizes` and `--genome-index` files from the `refgenie` servers. `Refgenie` uses algorithmically derived genome digests under-the-hood to unambiguously define genomes. That's what you'll see being used in the example below when we manually download these assets. Therefore, `2230c535660fb4774114bfa966a62f823fdb6d21acf138d4` is the digest for the human readable alias, "hg38", and `94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4` is the digest for "rCRSd."
```console
wget -O hg38.fasta.tgz http://rg.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/fasta?tag=default
wget  -O hg38.bowtie2_index.tgz http://rg.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/bowtie2_index?tag=default
wget  -O rCRSd.bowtie2_index.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/bowtie2_index?tag=default
```

Then, extract these files:
```console
tar xvf hg38.fasta.tgz
tar xvf hg38.bowtie2_index.tgz 
tar xvf rCRSd.bowtie2_index.tgz
```

From the `pepatac/` repository folder (using the manually downloaded genome assets):
```console
looper run -d examples/test_project/test_config.yaml
```

If that looked good, let's actually run the example by taking out the `-d` flag:
```console
looper run examples/test_project/test_config.yaml
```

There are lots of other cool things you can do with `looper`, like dry runs, report results, check on pipeline run status, clean intermediate files to save disk space, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.databio.org/).

## 8: Use `looper` to run the project level pipeline

`PEPATAC` also includes a project-level processing pipeline to do things like:

 - [Plot alignment statistics](files/examples/gold/summary/gold_alignmentPercent.pdf) for all samples in the project together for easy visualization
 - [Plot TSS enrichment scores](files/examples/gold/summary/gold_TSSEnrichment.pdf) for all the samples in the project in a single figure
 - [Produce a consensus peak set](consensus_peaks.md) for the project
 - [Produce a count table](count_table.md) using the consensus peak set for all the samples in a project

From the `pepatac/` repository folder (using the manually downloaded genome assets):
```console
looper runp examples/test_project/test_config.yaml
```

This should take < a minute on the test sample and will generate a `summary/` directory containing project level output in the parent project directory. In this small example, there won't be a consensus peak set or count table because it is only a single sample. To see more, you can [run through the extended tutorial](tutorial.md) to see this in action.
