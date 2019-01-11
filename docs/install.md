## Getting started with <img src="../img/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

This guide is designed to quickly get you up and running with `PEPATAC`. An [extended tutorial is available](tutorial.md) should you find yourself stuck or would prefer more detailed instructions.

---

#### 1.1: Clone the `PEPATAC` pipeline
To begin, we need to [get the `PEPATAC` pipeline](https://github.com/databio/pepatac) itself. To obtain the pipeline, you can use one of the following methods:
- using SSH:
```
git clone git@github.com:databio/pepatac.git
```
- using HTTPS:
```
git clone https://github.com/databio/pepatac.git
```

---

#### 1.2: Install required software

You have two options for installing the software prerequisites: 1) use a container, in which case you need only either `docker` or `singularity`; or 2) install all prerequisites natively. If you want to install it natively, skip to the [native installation instructions](install.md#1.2.2-install-software-requirements-natively).

---

##### 1.2.1: Use containers!
If you have experience using containers, you may simply run `PEPATAC` directly in a provided container.  First, make sure your environment is set up to run either docker or singularity containers. Then, pull the container image:
**Docker**: You can [pull the docker image](https://hub.docker.com/r/databio/pepatac/) from dockerhub like this: `docker pull databio/pepatac`

Or build the image using the included Dockerfile (you can use a recipe in the included Makefile):
```
cd pepatac/
make docker
```

**Singularity**: You can [download the singularity image](http://big.databio.org/simages/pepatac) or build it from the docker image following the recipe in the Makefile:
```
cd pepatac/
make singularity
```

Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called `$SIMAGES` that points to the folder where your image is stored, or you can tweak the `pipeline_interface.yaml` file so that the `compute.singularity_image` attribute is pointing to the right location on disk.
If using containers, jump to [obtaining `refgenie` assemblies](install.md#2.1-download-refgenie-assemblies)) prior to running.

---

##### 1.2.2: Install software requirements natively

To use `PEPATAC`, we need the following software:
**Python packages**. The pipeline uses [pypiper](http://pypiper.readthedocs.io/en/latest/) to run a single sample, [looper](http://looper.readthedocs.io/en/latest/) to handle multi-sample projects (for either local or cluster computation), and [pararead](https://github.com/databio/pararead) for parallel processing sequence reads. For peak calling, the pipeline uses [MACS2](http://liulab.dfci.harvard.edu/MACS/) as the default. You can do a user-specific install of these like this:
```
pip install --user numpy \
  pandas \
  piper \
  https://github.com/pepkit/looper/zipball/master \
  pararead \
  MACS2
```

**Required executables**. We will need some common bioinformatics tools installed. The complete list (including optional tools) is specified in the pipeline configuration file ([pipelines/pepatac.yaml](https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml)) tools section.
The following tools are used by the pipeline:       
- [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/)
- [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
- [fastqc (v0.11.5+)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster)
- [samtools (v1.7+)](http://www.htslib.org/)
- [skewer (v0.1.126+)](https://github.com/relipmoc/skewer)
- [UCSC tools](http://hgdownload.soe.ucsc.edu/admin/exe/)
  - bedGraphToBigWig
  - wigToBigWig
  - bigWigCat
  - bedToBigBed
      
That should do it for required packages!  To obtain the full benefit of `PEPATAC`'s QC and annotation features, install the following `R` packages as well.

---

#### 1.3: Install optional software

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots.  These are *optional* and the pipeline will run without them, but you would not get any QC or annotation plots. The following packages are necessary:
 - [argparser (v0.4)](https://cran.r-project.org/package=argparser)
 - [data.table (v1.11.2)](https://cran.r-project.org/package=data.table)
 - [devtools (v1.13.6)](https://cran.r-project.org/package=devtools)
 - [GenomicRanges (v1.30.3)](https://bioconductor.org/packages/GenomicRanges/)
 - [GenomicDistributions (v0.5)](http://code.databio.org/GenomicDistributions/index.html)
 - [ggplot2 (v2.2.1)](https://cran.r-project.org/package=ggplot2)
 - [ggrepel (v0.8.0)](https://cran.r-project.org/package=ggrepel)
 - [gplots (v3.0.1)](https://cran.r-project.org/package=gplots)
 - [gtable (v0.2.0)](https://cran.r-project.org/package=gtable)
 - [pepr (v0.0.2)](http://code.databio.org/pepr/)
 - [scales (v0.5.0)](https://cran.r-project.org/package=scales)

To install the needed packages, run the following at the command prompt:
```
Rscript -e "install.packages(c('argparser','devtools', 'data.table', \
  'ggrepel', 'ggplot2', 'gplots', 'gtable', 'scales'), \
  repos='http://cran.us.r-project.org/'); \
  source('https://bioconductor.org/biocLite.R'); biocLite('GenomicRanges'); \
  devtools::install_github(c('pepkit/pepr', 'databio/GenomicDistributions'))"
```

To extract files quicker, `PEPATAC` can use `pigz` in place of `gzip` if you have it installed.  It's not required, but it can help speed everything up when you have many samples to process and the ability to leverage multiple processors.
- [pigz (v2.3.4+)](https://zlib.net/pigz/)

Don't forget to add this to your `PATH` too!
That's it! Everything we need to run `PEPATAC` to its full potential should be installed.

---

#### 2.1: Download `refgenie` assemblies

Whether using the container or native version, you will need to provide external reference genome assemblies. The pipeline requires genome assemblies produced by [refgenie](https://github.com/databio/refgenie).
One feature of the pipeline is *prealignments*, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to use will also require [refgenie assemblies](https://github.com/databio/refgenie). Ideas for common prealignment references are provided by [ref_decoy](https://github.com/databio/ref_decoy). 
You may [download pre-indexed references](http://big.databio.org/refgenomes) or you may index your own ([see refgenie instructions](https://github.com/databio/refgenie)). The pre-indexed references are compressed files, so you need to untar/unzip them after download.  For the purposes of this guide, we can download pre-built genomes.
Grab the `hg38`, `human_repeats`, and `rCRSd` (Revised Cambridge Reference Sequence for human mtDNA) genomes.
```
wget http://big.databio.org/refgenomes/hg38.tgz
wget http://big.databio.org/refgenomes/human_repeats_170502.tgz
wget http://big.databio.org/refgenomes/rCRSd_170502.tgz
```

In order to calculate TSS enrichments, you will need a TSS annotation file in your reference genome directory too.  You may generate that using the following commands:
```
wget -O hg38_TSS_full.txt.gz http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz
zcat hg38_TSS_full.txt.gz | \
  awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}' | \
  LC_COLLATE=C sort -k1,1 -k2,2n -u > hg38_TSS.tsv
```

---

#### 2.2: Configure the pipeline

Once you've obtained assemblies for all genomes you wish to use, you must point the pipeline to where you store these. You can do this in two ways, either: 1) with an environment variable, or 2) by adjusting a configuration option.
The pipeline looks for genomes stored in a folder specified by the `resources.genomes` attribute in the [pipeline config file](https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml). By default, this points to the shell variable `GENOMES`, so all you have to do is set an environment variable to the location of your [refgenie genomes](https://github.com/databio/refgenie):
```
export GENOMES="/path/to/genomes/"
```

Alternatively, you can skip the `GENOMES` variable and simply change the value of that configuration option to point to the folder where you stored the assemblies. The advantage of using an environment variable is that it makes the configuration file portable, so the same pipeline can be run on any computing environment, as the location to reference assemblies is not hard-coded to a specific computing environment.

---

#### 2.3: Running the pipeline

The pipeline can be run directly from the command line for a single sample. If you need to run it on many samples, you could write your own sample handling code, but we have pre-configured everything to work nicely with [looper, our sample handling engine](http://looper.readthedocs.io). The extended tutorial includes a more [detailed explanation for how to use looper](tutorial.md#2.3-using-looper-to-run-the-pipeline) to analyze some provided example data.

---

##### 2.3.1: Running the pipeline script directly (without `looper`)

The pipeline is at its core just a python script, and you can run it on the command line for a single sample. To see the command-line options for usage, see [usage.txt](https://github.com/databio/pepatac/blob/master/usage.txt), which you can get on the command line by running `pipelines/pepatac.py --help`. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. See [example commands](https://github.com/databio/pepatac/blob/master/example_cmd.txt) that use test data.
Here's the basic command to run a small test example through the pipeline:
```
pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input examples/data/test1_r1.fastq.gz \
  --input2 examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

This example should take about 15 minutes to complete.

---

##### 2.3.2: Running the pipeline directly in a container

A full tutorial on using containers is outside the scope of this guide, but here are the basics. Individual jobs can be run in a container by simply running the `pepatac.py` command through `docker run` or `singularity exec`. You can run containers either on your local computer, or in an HPC environment, as long as you have `docker` or `singularity` installed. For example, run it locally in singularity like this:
```
singularity exec --bind $GENOMES $SIMAGES/pepatac pipelines/pepatac.py --help
```

With `docker`, you can use:
```
docker run --rm -it databio/pepatac pipelines/pepatac.py --help
```
Be sure to mount the volumes you need with `--volume`.

To run on multiple samples, you can just write a loop to process each sample independently with the pipeline, or you can use...[`looper`!](https://github.com/pepkit/looper)  Learn more about using `looper` with `PEPATAC` in the [how-to guides](howto.md) or in the [extended tutorial](tutorial.md)).
Any questions? Feel free to [reach out to us](contact.md). Otherwise, go analyze some ATAC-seq!

---

- [:fa-envelope: Contact Us](contact.md)
- [Learn more about the Databio team!](http://databio.org/)