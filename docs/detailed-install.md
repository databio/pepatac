# Detailed installation instructions

This guide walks you through the nitty-gritty of how to install each prerequisite package.


## 1. Install required software

**Python packages**. The pipeline uses [`pypiper`](http://pypiper.readthedocs.io/en/latest/) to run a single sample, [`looper`](http://looper.readthedocs.io/en/latest/) to handle multi-sample projects (for either local or cluster computation), and [`pararead`](https://github.com/databio/pararead) for parallel processing sequence reads. For peak calling, the pipeline uses [`MACS2`](http://liulab.dfci.harvard.edu/MACS/) as the default. You can do a user-specific install using the included requirements.txt file in the pipeline directory:  
```
pip install --user --upgrade -r requirements.txt
```

**Required executables**. We will need some common bioinformatics tools installed. The complete list (including optional tools) is specified in the [pipeline configuration file](../pipelines/pepatac.yaml) tools section.
The following tools are used by the pipeline:  

* [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/)
* [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
* [preseq (v2.0+)](http://smithlabresearch.org/software/preseq/)
* [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster)
* [samtools (v1.7)](http://www.htslib.org/)
* [skewer (v0.1.126+)](https://github.com/relipmoc/skewer)
* UCSC tools (v3.5.1)
    * [wigToBigWig (v4)](https://www.encodeproject.org/software/wigtobigwig/)
    * [bigWigCat (v4)](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/)
    * [bedToBigBed](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/)

#### bedtools
We'll install each of these pieces of software before moving forward.  Let's start right at the beginning and install `bedtools`.  We're going to install from source, but if you would prefer to install from a package manager, you can follow the instructions in the [bedtools' installation guide](http://bedtools.readthedocs.io/en/latest/content/installation.html).
```console
cd tools/
wget https://github.com/arq5x/bedtools2/releases/download/v2.29.2/bedtools-2.29.2.tar.gz
tar -zxvf bedtools-2.29.0.tar.gz
rm bedtools-2.29.0.tar.gz
cd bedtools2
make
```

Now, let's add `bedtools` to our `PATH` environment variable.  Look here to [learn more about the concept of environment variables](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps) if you are unfamiliar.
```console
export PATH="$PATH:/path/to/pepatac_tutorial/tools/bedtools2/bin/"
```

#### bowtie2
Next, let's install `bowtie2`.
```console
cd ../
wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.4.1/bowtie2-2.4.1-source.zip
unzip bowtie2-2.4.1-source.zip
rm bowtie2-2.4.1-source.zip
cd bowtie2-2.4.1
make
```

Again, let's add `bowtie2` to our `PATH` environment variable:

```console
export PATH="$PATH:/path/to/pepatac_tutorial/tools/bowtie2-2.4.1/"
```

#### preseq
The pipeline uses `preseq` to calculate library complexity. Check out the author's [page for more instruction](https://github.com/smithlabcode/preseq).
```console
wget http://smithlabresearch.org/downloads/preseq_linux_v2.0.tar.bz2
tar xvfj preseq_linux_v2.0.tar.bz2
```
Add to `PATH`!
```console
export PATH="$PATH:/path/to/peppro_tutorial/tools/preseq_v2.0/"
```

#### samblaster
Now we'll get `samblaster`.  For a full guide, check out the [`samblaster` installation instructions](https://github.com/GregoryFaust/samblaster/).
```console
git clone git://github.com/GregoryFaust/samblaster.git
cd samblaster/
make
export PATH="$PATH:/path/to/pepatac_tutorial/tools/samblaster/"
```

#### samtools
Next up, `samtools`.
```console
wget https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2
tar xvfj samtools-1.10.tar.bz2
rm samtools-1.10.tar.bz2
cd samtools-1.10
/configure
```
Alternatively, if you do not have the ability to install `samtools` to the default location, you can specify using the `--prefix=/install/destination/dir/` option.  [Learn more about the `--prefix` option here](http://samtools.github.io/bcftools/howtos/install.html).
```console
make
make install
```

As for our other tools, add `samtools` to our `PATH` environment variable:
```console
export PATH="$PATH:/path/to/pepatac_tutorial/tools/samtools-1.10/"
```

#### skewer
Time to add `skewer` to the collection.
```console
cd ../
wget https://downloads.sourceforge.net/project/skewer/Binaries/skewer-0.2.2-linux-x86_64
mv skewer-0.2.2-linux-x86_64 skewer
chmod 755 skewer
```

#### UCSC utilities
Finally, we need a few of the UCSC utilities.  You can install the [entire set of tools](https://github.com/ENCODE-DCC/kentUtils) should you choose, but here we'll just grab the subset that we need.
```console
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigCat
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
chmod 755 wigToBigWig
chmod 755 bigWigCat
chmod 755 bedToBigBed
```
Add our `tools/` directory to our `PATH` environment variable.
```console
export PATH="$PATH:/path/to/pepatac_tutorial/tools/"
```
That should do it!  Now we'll [install some **optional** packages](tutorial.md#13-install-optional-software).  Of course, these are not required, but for the purposes of this tutorial we're going to be completionists.

## 2. Install optional software

`PEPATAC` uses `R` to generate quality control and read/peak annotation plots, so you'll need to have R functional if you want these outputs. We have packaged all the `R` code into a supporting package called [PEPATACr](https://github.com/databio/pepatac/tree/dev/PEPATACr). The `PEPATAC` package relies on a few additional packages which can be installed at the command line as follows:

```
Rscript -e 'install.packages("devtools")'
Rscript -e 'devtools::install_github("pepkit/pepr")'
Rscript -e 'install.packages("BiocManager")'
Rscript -e 'BiocManager::install("GenomicRanges")'
Rscript -e 'devtools::install_github("databio/GenomicDistributions")'
```

Then, install the `PEPATAC` package.  From the `pepatac/` directory:
```
Rscript -e 'devtools::install(file.path("PEPATACr/"), dependencies=TRUE, repos="https://cloud.r-project.org/")'
```

Optionally, `PEPATAC` can mix and match tools for adapter removal, deduplication, and signal track generation. `FastQC`, if present, will be automatically run on input fastq files. `seqOutBias` can be used with the `--sob` argument to take into account mappability at a given read length, the Tn5 sequence bias, and to scale the sample signal tracks by the expected over observed cut frequency.

*Optional tools:*

* [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc)
* [picard](https://broadinstitute.github.io/picard/)
* [pigz (v2.3.4+)](https://zlib.net/pigz/)
* [seqOutBias](https://github.com/guertinlab/seqOutBias): necessitates the following UCSC tools
    * [bedGraphToBigWig](http://hgdownload.soe.ucsc.edu/admin/exe/)
    * [bigWigMerge](http://hgdownload.soe.ucsc.edu/admin/exe/)
* [trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)

#### fastqc
You will need to have `java` installed to use `FastQC`.  At the command prompt, you can type `java -version`, press enter, and if you don't see an error you should be alright.  You'll need a version greater than 1.6 to work with `FastQC`.  Read more from the [`FastQC` installation instructions](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/INSTALL.txt).
```console
cd /path/to/pepatac_tutorial/tools/
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip
unzip fastqc_v0.11.9.zip
rm fastqc_v0.11.9.zip
```
We also need to make the `FastQC` wrapper executable. To learn more about this, check out this [introduction to `chmod`](https://www.howtoforge.com/tutorial/linux-chmod-command/).

```console
chmod 755 FastQC/fastqc
```

Add `FastQC` to our `PATH` environment variable:
```console
export PATH="$PATH:/path/to/pepatac_tutorial/tools/FastQC/"
```

#### picard
`PEPATAC` can alternatively use `picard MarkDuplicates` for duplicate identification and removal.  [Read the `picard` installation guide](http://broadinstitute.github.io/picard/) for more assistance.
```console
wget https://github.com/broadinstitute/picard/releases/download/2.20.3/picard.jar
chmod +x picard.jar
```
Create an environmental variable pointing to the `picard.jar` file called `$PICARD`.  Alternatively, [update the `pepatac.yaml` file](https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml) with the full PATH to the `picard.jar` file.
```
export PICARD="/path/to/peppro_tutorial/tools/picard.jar"
```

#### pigz
To extract files quicker, `PEPATAC` can also utilize `pigz` in place of `gzip` if you have it installed.  Let's go ahead and do that now. It's not required, but it can help speed everything up when you have many samples to process.
```console
cd /path/to/pepatac_tutorial/tools/
wget https://zlib.net/pigz/pigz-2.4.tar.gz
tar xvfz pigz-2.4.tar.gz
rm pigz-2.4.tar.gz
cd pigz-2.4/
make
```
Don't forget to add this to your `PATH` too!
```console
export PATH="$PATH:/path/to/pepatac_tutorial/tools/pigz-2.4/"
```

That's it! Everything we need to run `PEPATAC` to its full potential should be installed.  If you are interested and have experience using containers, you can check out the [alternate installation methods](run-container.md).

## 3. Create environment variables

We also need to create some environment variables to help point `looper` to where we keep our data files and our tools.  You may either set the environment variables up, like we're going to do now, or you may simply hard code the necessary locations in our configuration files.
First, let's create a `PROCESSED` variable that represents the location where we want to save output.
```console
export PROCESSED="/path/to/pepatac_tutorial/processed/"
```
Second, we'll create a variable representing the root path to all our tools named `CODEBASE`.
```console
export CODEBASE="/path/to/pepatac_tutorial/tools/"
```
(Add these environment variables to your `.bashrc` or `.profile` so you don't have to always do this step).  
Fantastic! Now that we have the pipeline and its requirements installed, we're ready to get our reference genome(s).

## 4. Download a reference genome

Before we analyze anything, we also need a reference genome.  `PEPATAC` uses [`refgenie`](http://refgenie.databio.org/) assets for alignment. If you haven't already, initialize a refgenie config file like this:

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
