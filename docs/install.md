# Install and run <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

## 1: Clone the `PEPATAC` pipeline

```
git clone https://github.com/databio/pepatac.git
```

## 2: Download `refgenie` assets

PEPATAC uses [`refgenie`](http://refgenie.databio.org/) assets for alignment. If you haven't already, initialize a refgenie config file like this:

```console
pip install --user refgenie
export REFGENIE=your_genome_folder/genome_config.yaml
refgenie init -c $REFGENIE
```

Add the `export REFGENIE` line to your `.bashrc` or `.profile` to ensure it persists. 

Next, pull the assets you need. Replace `hg38` in the example below if you need to use a different genome assembly. If these assets are not available automatically for your genome of interest, then you'll need to [build them](annotation.md). Download these required assets with this command:

```console
refgenie pull hg38/bowtie2_index refgene_anno feat_annotation
```

PEPATAC also requires `bowtie2_index` for any pre-alignment genomes:

```console
refgenie pull rCRSd/bowtie2_index
refgenie pull human_repeats/bowtie2_index
```

## 3: Install required software

You have two options for software prerequisites: 1) use a container, or 2) install all prerequisites natively. If you want to use containers, you need our [multi-container environment manager, `bulker`](https://bulker.databio.org/en/latest/), and either `docker` or `singularity` -- please see instructions in [how to run PEPATAC with containers](run-container.md). Otherwise, follow these instructions to install the requirements natively:

### Python packages

`PEPATAC` uses several packages under the hood. From the `pepatac/` directory:

```{bash}
pip install --user -r requirements.txt
```

### R packages

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots, so you'll need to have R functional if you want these outputs. We have packaged all the `R` code into a supporting package called [PEPATACr](https://github.com/databio/pepatac/tree/dev/PEPATACr). The `PEPATAC` package relies on a few additional packages which can be installed at the command line as follows:

```
Rscript -e 'install.packages("devtools")'
Rscript -e 'devtools::install_github("pepkit/pepr")'
Rscript -e 'install.packages("BiocManager")'
Rscript -e 'BiocManager::install("GenomicRanges")'
Rscript -e 'devtools::install_github("databio/GenomicDistributions")'
Rscript -e 'install.packages("http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.1.tar.gz", repos=NULL)'
```

Then, install the `PEPATAC` package.  From the `pepatac/` directory:
```
Rscript -e 'devtools::install(file.path("PEPATACr/"), dependencies=TRUE, repos="https://cloud.r-project.org/")'
```

### Tools

We will need some common bioinformatics tools installed: [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/), [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [preseq (v2.0+)](http://smithlabresearch.org/software/preseq/), [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster), [samtools (v1.7+)](http://www.htslib.org/), [skewer (v0.1.126+)](https://github.com/relipmoc/skewer), [UCSC tools](http://hgdownload.soe.ucsc.edu/admin/exe/) (wigToBigWig, bigWigCat, bedToBigBed), [pigz (v2.3.4+)](https://zlib.net/pigz/).  Optionally, `PEPATAC` can report on fastq quality ([FastQC](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc)) and utilize swappable tools for adapter removal ([trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)), deduplication ([picard](https://broadinstitute.github.io/picard/)), and signal track generation ([seqOutBias](https://github.com/guertinlab/seqOutBias), [bedGraphToBigWig](http://hgdownload.soe.ucsc.edu/admin/exe/), and [bigWigMerge](http://hgdownload.soe.ucsc.edu/admin/exe/)).

You should follow instructions to install each individual program. If you need help installing these, see the [detailed installation instructions](detailed-install.md).

## 4: Run an example project through `PEPATAC`

Start by running the example project (test_config.yaml) in the `examples/test_project/` folder. `PEPATAC` uses a project management tool called `looper` to run the pipeline across samples in a project. Let's use the `-d` argument to do a dry run, which will create job scripts for every sample in a project, but will not execute them:

```
cd pepatac
looper run -d examples/test_project/test_config.yaml
```

If the looper executable is not in your $PATH, add the following line to your .bashrc or .profile:

```
export PATH=$PATH:~/.local/bin
```

If that worked, let's actually run the example by taking out the -d flag:
```
looper run examples/test_project/test_config.yaml
```

Or, if you're using [`bulker`](https://bulker.databio.org/en/latest/) to run the pipeline in containers:

```
bulker activate databio/pepatac
looper run examples/test_project/test_config.yaml
```

There are lots of other cool things you can do with looper, like dry runs, summarize results, check on pipeline run status, clean intermediate files to save disk space, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.databio.org/).

## 5: Configure your project files

To run your own samples, you'll need to organize them in **PEP format**, which is explained in [how to create a PEP](https://pepkit.github.io/docs/home/) and is universal to all pipelines that read PEPs, including `PEPATAC`. To get you started, there are multiple examples you can adapt in the `examples/` folder (*e.g.* [example test PEP](https://github.com/databio/pepatac/tree/master/examples/test_project)). In short, you need two files for your project:

  1. project config file -- describes output locations, pointers to data, etc.
  2. sample annotation file -- comma-separated value (CSV) list of your samples.

The sample annotation file must specify these columns:

- sample_name
- library ('ATAC' or 'ATACSEQ' or 'ATAC-seq')
- organism (may be 'human' or 'mouse')
- read1
- read2
- whatever else you want

# Next steps

This is just the beginning. For your next step, take a look at one of these user guides:

- [Extended tutorial for running a single sample](tutorial.md)
- [Running the pipeline directly in a container](run-container.md)
- See other detailed user guide links in the side menu

Any questions? Feel free to [reach out to us](contact.md). Otherwise, go analyze some ATAC-seq!
