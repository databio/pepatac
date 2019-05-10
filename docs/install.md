# Install and run <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

Let's get you running `PEPATAC` quickly. If you get stuck or prefer more details, see the [detailed install guide](howto/detailed-install.md) or the [extended tutorial](tutorial.md).

## 1: Clone the `PEPATAC` pipeline

Clone the pipeline:
```
git clone https://github.com/databio/pepatac.git
```

## 2: Install required software

You have two options for software prerequisites: 1) use a container, or 2) install all prerequisites natively. If you want to use a container, you need only either `docker` or `singularity` -- please see instructions in [how to run PEPATAC in a container](howto/user-container.md). Otherwise, follow these instructions to install the requirements natively:

### Python packages

`PEPATAC` uses several  packages under the hood. Make sure you're up-to-date with a user-specific install:

```{bash}
cd pepatac
pip install --user -r requirements.txt
```

### Required executables

We will need some common bioinformatics tools installed: [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/), [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [fastqc (v0.11.5+)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/),  [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster), [samtools (v1.7+)](http://www.htslib.org/), [skewer (v0.1.126+)](https://github.com/relipmoc/skewer), [UCSC tools](http://hgdownload.soe.ucsc.edu/admin/exe/) (bedGraphToBigWig, wigToBigWig, bigWigCat, bedToBigBed), [pigz (v2.3.4+)](https://zlib.net/pigz/). You should follow instructions to install each individual program. If you need help installing these, see the [detailed installation instructions](howto/detailed-install.md).
      
### R packages

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots, so you'll need to have R functional if you want these outputs. We have packaged all the `R` code into a supporting package called [pepatacr](link). Install it with:

```
Rscript -e "install.packages('pepatacr')"
```
That's it! Everything we need to run `PEPATAC` to its full potential should be installed.

## 3: Download `refgenie` assemblies

Whether using the container or native version, you will need to provide reference genome assemblies produced by [refgenie](https://github.com/databio/refgenie). Any [prealignments](howto/prealignments.md) you want to use will also require refgenie assemblies. You may download [pre-indexed references](http://big.databio.org/refgenomes) for common genomes, or you may index your own ([see refgenie instructions](howto/install-refgenie.md)). For this example, let's grab the `hg38` genome to use as our primary assembly, and for prealignments we'll use `human_repeats`, and `rCRSd` (Revised Cambridge Reference Sequence for human mtDNA).

```console
wget http://big.databio.org/refgenomes/hg38.tgz
wget http://big.databio.org/refgenomes/human_repeats_170502.tgz
wget http://big.databio.org/refgenomes/rCRSd_170502.tgz
```

At this point, you could choose to extend `PEPATAC` by adding a few additional files into your refgenie assembly. For more details, see [how to create a custom annotation file](howto/create-annotation-file.md) to explore using your own features of interest.


## 4: Point the pipeline to your Refgenie assemblies

Once you've obtained assemblies for all genomes you wish to use, you must point the pipeline to where you store them. You can do this by adjusting the `resources.genomes` attribute in the [pipeline config file](https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml). By default, this points to the shell variable `$GENOMES`, so all you have to do is set an environment variable to the location of your refgenie genomes:

```
export GENOMES="/path/to/genomes/"
```

## 5: Run the pipeline script directly

The pipeline at its core is just a python script, and you can run it on the command line for a single sample (see [command-line usage](usage)), which you can also get on the command line by running `pipelines/pepatac.py --help`. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. Here's the basic command to run a small test example through the pipeline:

```console
pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input examples/data/test1_r1.fastq.gz \
  --input2 examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

This example should take about 15 minutes to complete.  See [other example commands](https://github.com/databio/pepatac/blob/master/example_cmd.txt) that use test data.

# 6. Next steps

This is just the beginning. For your next step, take a look at one of these user guides:

- [Running on multiple samples with looper](/howto/run-looper)
- [Extended tutorial for running a single sample](tutorial.md)
- [Running the pipeline directly in a container](/howto/use-container)
- See other detailed user guide links in the side menu

Any questions? Feel free to [reach out to us](contact.md). Otherwise, go analyze some ATAC-seq!
