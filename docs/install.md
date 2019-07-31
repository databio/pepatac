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
refgenie pull -g hg38 -a bowtie2_index refgene_anno feat_annotation
```

PEPATAC also requires `bowtie2_index` for any pre-alignment genomes:

```console
refgenie pull -g human_rDNA -a bowtie2_index
refgenie pull -g rCRSd -a bowtie2_index
refgenie pull -g human_repeats -a bowtie2_index
```


## 3: Install required software

You have two options for software prerequisites: 1) use a container, or 2) install all prerequisites natively. If you want to use a container, you need only either `docker` or `singularity` -- please see instructions in [how to run PEPATAC in a container](run-container.md). Otherwise, follow these instructions to install the requirements natively:

### Python packages

`PEPATAC` uses several packages under the hood. Make sure you're up-to-date with a user-specific install:

```{bash}
cd pepatac
pip install --user -r requirements.txt
```

### Required executables

We will need some common bioinformatics tools installed: [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/), [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [fastqc (v0.11.5+)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/),  [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster), [samtools (v1.7+)](http://www.htslib.org/), [skewer (v0.1.126+)](https://github.com/relipmoc/skewer), [UCSC tools](http://hgdownload.soe.ucsc.edu/admin/exe/) (bedGraphToBigWig, wigToBigWig, bigWigCat, bedToBigBed), [pigz (v2.3.4+)](https://zlib.net/pigz/). You should follow instructions to install each individual program. If you need help installing these, see the [detailed installation instructions](detailed-install.md).
      
### R packages

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots, so you'll need to have R functional if you want these outputs. We have packaged all the `R` code into a supporting package called [pepatacr](link). Install it with:

```
Rscript -e "install.packages('pepatacr')"
```
That's it! Everything we need to run `PEPATAC` to its full potential should be installed.


## 4: Run an example through `looper`

Start by running the example project in the [`examples/test_project/`](https://github.com/databio/pepatac/tree/master/examples/test_project) folder. Let's use the looper's `-d` argument to do a *dry run*, which will create job scripts for every sample in the project, but will not execute them:

```
cd pepatac
looper run -d examples/test_project/test_config.yaml
```

If the looper executable is not in your `$PATH`, add the following line to your `.bashrc` or `.profile`:
```
export PATH=$PATH:~/.local/bin
```
If that worked, let's actually run the example by taking out the `-d` flag:

```
looper run examples/test_project/test_config.yaml
```

There are lots of other cool things you can do with looper, like dry runs, summarize results, check on pipeline run status, clean intermediate files to save disk space, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.databio.org/).

## 5: Configure your project files

To run your own samples, you'll need to organize them in **PEP format**, which is explained in [how to create a PEP](https://pepkit.github.io/docs/home/) and is universal to all pipelines that read PEPs, including PEPATAC. To get you started, there are multiple examples you can adapt in the `examples/` folder (*e.g.* [example test PEP](https://github.com/databio/pepatac/tree/master/examples/test_project)). In short, you need two files for your project:

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

- [Running on multiple samples with looper](run-looper.md)
- [Extended tutorial for running a single sample](tutorial.md)
- [Running the pipeline directly in a container](run-container.md)
- See other detailed user guide links in the side menu

Any questions? Feel free to [reach out to us](contact.md). Otherwise, go analyze some ATAC-seq!
