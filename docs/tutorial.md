## <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> pipeline step-by-step guide

Welcome to the `PEPATAC` pipeline tutorial! Use this project to learn the ropes. We'll use a provided ATAC-seq dataset and run through the step-by-step process of getting `PEPATAC` up and running including: installing `PEPATAC` and its requirements, setting up the configuration files, running the pipeline, and looking over the results together.
To use this tutorial, you should have a basic familiarity with [working in a command line driven environment](http://matt.might.net/articles/basic-unix/).

---

#### **1.1: `PEPATAC` pipeline**

To begin, we need to get the `PEPATAC` pipeline itself.  The pipeline is hosted on [github](https://github.com/databio/pepatac).  If you don't have [git installed, they have installation instructions located here](https://git-scm.com/download/linux), and here is a [brief introduction to git](https://guides.github.com/introduction/git-handbook/). To install the pipeline, you can use one of the following methods:

* using SSH:
```
git clone git@github.com:databio/pepatac.git
```
* using HTTPS:
```
git clone https://github.com/databio/pepatac.git
```

We'll use SSH in this example.  From an open terminal, let's first create a directory we'll use to run through this guide:
```
mkdir pepatac_tutorial
```

Let's move into our newly created directory and create a few more folders that we'll use later.
```
cd pepatac_tutorial/
mkdir data
mkdir genomes
mkdir processed
mkdir templates
mkdir tools
cd tools/
```

Time to get PEPATAC!
```
git clone git@github.com:databio/pepatac.git
```
Success! If you had any issues, feel free to [reach out to us with questions](contact.md).  Otherwise, let's move on to installing additional [required](tutorial.md#12-install-required-software) and [optional](tutorial.md#13-install-optional-software) software.

---

#### **1.2: Install required software**

You have two options for installing the software prerequisites: 1) use a container, in which case you need only either `docker` or `singularity`; or 2) install all prerequisites natively. If you want to install it natively, skip to the [native installation instructions](tutorial.md#122-install-software-requirements-natively).

---

##### **1.2.1 (ALT): Use containers!**
First, make sure your environment is set up to run either docker or singularity containers. Then, pull the container image:

###### **Docker**

You can pull the docker image from [dockerhub](https://hub.docker.com/r/databio/pepatac/) like this:
```
docker pull databio/pepatac
```

Or build the image using the included Dockerfile (you can use a recipe in the included Makefile):
```
cd pepatac/
make docker
```

###### **Singularity**

You can [download the pre-built singularity image](http://big.databio.org/simages/pepatac) or build it manually from the docker image following the recipe in the Makefile:
```
cd pepatac/
make singularity
```
Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called `$SIMAGES` that points to the folder where your image is stored, or you can tweak the `pipeline_interface.yaml` file so that the `compute.singularity_image` attribute is pointing to the right location on disk.

---

##### **1.2.2: Install software requirements natively** 

To use `PEPATAC`, we need the following software:
**Python packages**. The pipeline uses [`pypiper`](http://pypiper.readthedocs.io/en/latest/) to run a single sample, [`looper`](http://looper.readthedocs.io/en/latest/) to handle multi-sample projects (for either local or cluster computation), and [`pararead`](https://github.com/databio/pararead) for parallel processing sequence reads. For peak calling, the pipeline uses [`MACS2`](http://liulab.dfci.harvard.edu/MACS/) as the default. You can do a user-specific install of these like this:  
```
pip install --user numpy pandas piper https://github.com/pepkit/looper/zipball/master \
pararead MACS2
```
**Required executables**. We will need some common bioinformatics tools installed. The complete list (including optional tools) is specified in the pipeline configuration file (pipelines/pepatac.yaml) tools section.
The following tools are used by the pipeline:  

* [bedtools (v2.25.0+)](http://bedtools.readthedocs.io/en/latest/)
* [bowtie2 (v2.2.9+)](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
* [fastqc (v0.11.5+)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* [samblaster (v0.1.24+)](https://github.com/GregoryFaust/samblaster)
* [samtools (v1.7)](http://www.htslib.org/)
* [skewer (v0.1.126+)](https://github.com/relipmoc/skewer)
* UCSC tools (v3.5.1)
    * [bedGraphToBigWig (v4)](https://www.encodeproject.org/software/bedgraphtobigwig/)
    * [wigToBigWig (v4)](https://www.encodeproject.org/software/wigtobigwig/)
    * [bigWigCat (v4)](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/)
    * [bedSort](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/)
    * [bedToBigBed](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/)

We'll install each of these pieces of software before moving forward.  Let's start right at the beginning and install `bedtools`.  We're going to install from source, but if you would prefer to install from a package manager, you can follow the instructions in the [bedtools' installation guide](http://bedtools.readthedocs.io/en/latest/content/installation.html).
```
cd tools/
wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
tar -zxvf bedtools-2.25.0.tar.gz
rm bedtools-2.25.0.tar.gz
cd bedtools2
make
```

Now, let's add `bedtools` to our `PATH` environment variable.  Look here to [learn more about the concept of environment variables](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps) if you are unfamiliar.
```
export PATH="$PATH:/path/to/pepatac_tutorial/tools/bedtools2/bin/"
```
Next, let's install `bowtie2`.
```
cd ../
wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.3.4.1/bowtie2-2.3.4.1-source.zip
unzip bowtie2-2.3.4.1-source.zip
rm bowtie2-2.3.4.1-source.zip
cd bowtie2-2.3.4.1
make
```
Again, let's add `bowtie2` to our `PATH` environment variable:
```
export PATH="$PATH:/path/to/pepatac_tutorial/tools/bowtie2-2.3.4.1/"
```
Great! On to the next one. Let's get `FastQC`.  Reminder, you will need to have `java` installed to use `FastQC`.  At the command prompt, you can type `java -version`, press enter, and if you don't see an error you should be alright.  You'll need a version greater than 1.6 to work with `FastQC`.  Read more from the [`FastQC` installation instructions](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/INSTALL.txt).
```
cd ../
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
unzip fastqc_v0.11.7.zip
rm fastqc_v0.11.7.zip
```
We also need to make the `FastQC` wrapper executable. To learn more about this, check out this [introduction to `chmod`](https://www.howtoforge.com/tutorial/linux-chmod-command/).
```
chmod 755 FastQC/fastqc
```
Add `FastQC` to our `PATH` environment variable:
```
export PATH="$PATH:/path/to/pepatac_tutorial/tools/FastQC/"
```
Now we'll get `samblaster`.  For a full guide, check out the [`samblaster` installation instructions](https://github.com/GregoryFaust/samblaster/).
```
git clone git://github.com/GregoryFaust/samblaster.git
cd samblaster/
make
export PATH="$PATH:/path/to/pepatac_tutorial/tools/samblaster/"
```
Next up, `samtools`.
```
wget https://sourceforge.net/projects/samtools../files/samtools/1.9/samtools-1.9.tar.bz2
tar xvfj samtools-1.9.tar.bz2
rm samtools-1.9.tar.bz2
cd samtools-1.9
/configure
```
Alternatively, if you do not have the ability to install `samtools` to the default location, you can specify using the `--prefix=/install/destination/dir/` option.  [Learn more about the `--prefix` option here](http://samtools.github.io/bcftools/howtos/install.html).
```
make
make install
```
As for our other tools, add `samtools` to our `PATH` environment variable:
```
export PATH="$PATH:/path/to/pepatac_tutorial/tools/samtools-1.9/"
```
Time to add `skewer` to the collection.
```
cd ../
wget https://downloads.sourceforge.net/project/skewer/Binaries/skewer-0.2.2-linux-x86_64
mv skewer-0.2.2-linux-x86_64 skewer
chmod 755 skewer
```
Finally, we need a few of the UCSC utilities.  You can install the [entire set of tools](https://github.com/ENCODE-DCC/kentUtils) should you choose, but here we'll just grab the subset that we need.
```
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigCat
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
chmod 755 bedGraphToBigWig
chmod 755 wigToBigWig
chmod 755 bigWigCat
chmod 755 bedToBigBed
```
Add our `tools/` directory to our `PATH` environment variable.
```
export PATH="$PATH:/path/to/pepatac_tutorial/tools/"
```
That should do it!  Now we'll [install some **optional** packages](tutorial.md#13-install-optional-software).  Of course, these are not required, but for the purposes of this tutorial we're going to be completionists.

---

#### **1.3: Install optional software**

`PEPATAC` uses `R` to generate quality control plots.  These are **optional** and the pipeline will run without them, but you would not get any QC plots.  If you need to don't have [R installed, you can follow these instructions](https://cran.r-project.org/doc/manuals/r-release/R-admin.html).  We'll use and install the necessary packages in this example.  Here is the list of required packages:

 - [argparser (v0.4)](https://cran.r-project.org/package=argparser)
 - [data.table (v1.11.2)](https://cran.r-project.org/package=data.table)
 - [devtools (v1.13.6)](https://cran.r-project.org/package=devtools)
 - [GenomicRanges (v1.30.3)](https://bioconductor.org/packages/GenomicRanges/)
 - [GenomicDistributions (v0.5)](http://code.databio.org/GenomicDistributions/index.html)
 - [ggplot2 (v2.2.1)](https://cran.r-project.org/package=ggplot2)
 - [gplots (v3.0.1)](https://cran.r-project.org/package=gplots)
 - [gtable (v0.2.0)](https://cran.r-project.org/package=gtable)
 - [pepr (v0.0.2)](http://code.databio.org/pepr/)
 - [scales (v0.5.0)](https://cran.r-project.org/package=scales)

To install the needed packages, enter the following command:
```
Rscript -e "install.packages(c('argparser','devtools', 'data.table', \
  'ggrepel', 'ggplot2', 'gplots', 'gtable', 'scales'), \
  repos='http://cran.us.r-project.org/'); \
  source('https://bioconductor.org/biocLite.R'); \
  biocLite('GenomicRanges'); \
  devtools::install_github(c('pepkit/pepr', 'databio/GenomicDistributions'))"
```
To extract files quicker, `PEPATAC` can also utilize `pigz` in place of `gzip` if you have it installed.  Let's go ahead and do that now. It's not required, but it can help speed everything up when you have many samples to process.
```
cd /path/to/pepatac_tutorial/tools/
wget http://zlib.net/pigz/pigz-2.4.tar.gz
tar xvfz pigz-2.4.tar.gz
rm pigz-2.4.tar.gz
cd pigz-2.4/
make
```
Don't forget to add this to your `PATH` too!
```
export PATH="$PATH:/path/to/pepatac_tutorial/tools/pigz-2.4/"
```
That's it! Everything we need to run `PEPATAC` to its full potential should be installed.  If you are interested and have experience using containers, you can check out the [alternate installation methods](install.md#121-use-containers).

---

#### **1.4: Create environment variables**
We also need to create some environment variables to help point `looper` to where we keep our data files and our tools.  You may either set the environment variables up, like we're going to do now, or you may simply hard code the necessary locations in our configuration files.
First, let's create a `PROCESSED` variable that represents the location where we want to save output.
```
export PROCESSED="/path/to/pepatac_tutorial/processed/"
```
Second, we'll create a variable representing the root path to all our tools named `CODEBASE`.
```
export CODEBASE="/path/to/pepatac_tutorial/tools/"
```
(Add these environment variables to your `.bashrc` or `.profile` so you don't have to always do this step).
Fantastic! Now that we have the pipeline and its requirements installed, we're ready to get our reference genome(s).

---

#### **2.1: Download a reference genome**

Before we analyze anything, we also need a reference genome.  `PEPATAC` uses `refgenie` genomes.  For the purposes of this tutorial, we'll just download pre-built genomes.  Follow the `'refgenie` instructions if you'd like to [build your own reference genome](https://github.com/databio/refgenie). First, let's change into our `genomes/` folder.
```
cd /path/to/pepatac_tutorial/genomes/
wget http://big.databio.org/refgenomes/hg38.tgz
wget http://cloud.databio.org.s3.amazonaws.com/refgenomes/human_repeats_170502.tgz
wget http://cloud.databio.org.s3.amazonaws.com/refgenomes/rCRSd_170502.tgz
tar xvfz hg38.tgz
tar xvfz human_repeats_170502.tgz
tar xvfz rCRSd_170502.tgz
rm hg38.tgz
rm human_repeats_170502.tgz
rm rCRSd_170502.tgz
```
Let's also create another environment variable that points to our genomes.
```
export GENOMES="/path/to/pepatac_tutorial/genomes/
```
(Don't forget to add this to your `.bashrc` or `.profile` to ensure it persists).
Finally, in order to calculate TSS enrichments, you will need a TSS annotation file in your reference genome directory.  Let's do that now.
```
wget -O hg38_TSS_full.txt.gz http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz \
zcat hg38_TSS_full.txt.gz | \
  awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}' | \
  LC_COLLATE=C sort -k1,1 -k2,2n -u > hg38_TSS.tsv
```            
Alright! Time to setup the pipeline configuration files and run our sample.

#### **2.2: Configure project files**

We're going to use `looper` to analyze our data.  For that, we need to pass looper a configuration file.  This project config file describes your project. See [`looper` docs](https://looper.readthedocs.io/en/latest/) for details. A configuration file has been provided for you in the pipeline itself, conveniently named `tutorial.yaml`.  This configuration file also points to our sample.  In this case, we've provided a sample for you with the pipeline.  You don't have to do anything else at this point and may [skip right to running the sample if you'd like](tutorial.md#23-using-looper-to-run-the-pipeline).  Otherwise, we'll briefly touch on what those configuration files look like.
You can open the configuration file in your favorite text editor if you'd like to look closer.  For the purposes of the tutorial you may safely move past this step should you choose.
```
nano tutorial.yaml
```
The following is what you should see in that configuration file.
```
name: tutorial

metadata:
  sample_annotation: tutorial.csv
  output_dir: "$PROCESSED/tutorial/"
  pipeline_interfaces: "$CODEBASE/pepatac/pipeline_interface.yaml"

derived_columns: [read1, read2]

data_sources:
  tutorial_r1: "$CODEBASE/pepatac/examples/data/tutorial_r1.fastq.gz"
  tutorial_r2: "$CODEBASE/pepatac/examples/data/tutorial_r2.fastq.gz"

implied_columns:
  organism:
    human:
    genome: hg38
    macs_genome_size: hs
    prealignments: rCRSd human_repeats`</pre>
```
There is also an annotation file referenced in our configuration file.  The annotation file contains metadata and other information about our sample. Just like before, this file, named `tutorial.csv` has been provided.  You may check it out if you wish, otherwise we're all set.
If you open `tutorial.csv`, you should see the following:
```
sample_name,protocol,organism,read1,read2,read_type
tutorial,ATAC,human,tutorial_r1,tutorial_r2,75,paired
```
That's it! Let's analyze that sample!

---

#### **2.3: Using `looper` to run the pipeline**
Looper requires a few variables and configuration files to work for the specific user. Let's get those set up now. One of those is an environment variable called `PEPENV` that points to the Looper environment configuration file. For more detailed information regarding this file, [check out the `looper`docs](https://looper.readthedocs.io/en/latest/cluster-computing.html#pepenv-overview). Let's set it up.
```
cd /path/to/pepatac_tutorial/
touch pepenv.yaml
```
Open that file in your favorite text editor.  We'll add in the following example for our environment.  You'll need to edit this file further for your own setup and you can [learn more about that in the `looper` docs](https://looper.readthedocs.io/en/latest/index.html).
```
nano pepenv.yaml
```
Paste the following into pepenv.yaml
```
compute:
  local:
    submission_template: templates/localhost_template.sub
    submission_command: sh
```
Now, let's close and save that file and create an environment variable pointing to our configuration file.
```
export PEPENV="/path/to/pepatac_tutorial/pepenv.yaml"
```
(Remember to add `PEPENV` to your `.bashrc` or `.profile` to ensure it persists).
The `Looper` environment configuration file points to submission template(s) in order to know how to run a sample or series of samples.  If you'd like to learn more, check out the [`PEPENV` configuration file and submission templates](https://github.com/pepkit/pepenv). We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create templates for cluster or container use as well!
Let's change to our `templates/` directory to make our first submission template.
```
cd /path/to/pepatac_tutorial/templates/
touch localhost_template.sub
nano localhost_template.sub
```             
Paste the following into the localhost_template.sub:
```
#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE}
```
Save and close that file, and return to our main tutorial directory.
```
cd ../
```
Now, we'll use `looper` to run the sample locally.
```
looper run tutorial.yaml --compute local
```         
Congratulations! Your first sample should be running through the pipeline now.

---

#### **3.1: Browse the output directory**

Now that our sample has finished running through the pipeline, we can look through the output directory together.  We've provided a breakdown of that directory below.

* ??? danger ":fa-folder-open-o: reports/"
    * :fa-file-code-o: [cumulative_frif.html](../files/examples/tutorial/reports/cumulative_frif.html)
    * :fa-file-code-o: [fastqc_report_r2.html](../files/examples/tutorial/reports/fastqc_report_r2.html)
    * :fa-file-code-o: [fastqc_report_r1.html](../files/examples/tutorial/reports/fastqc_report_r1.html)
    * :fa-file-code-o: [fragment_distribution.html](../files/examples/tutorial/reports/fragment_distribution.html)
    * :fa-file-code-o: [objects.html](../files/examples/tutorial/reports/objects.html)
    * :fa-file-code-o: [samples.html](../files/examples/tutorial/reports/samples.html)
    * :fa-file-code-o: [status.html](../files/examples/tutorial/reports/status.html)
    * :fa-file-code-o: [tss_enrichment.html](../files/examples/tutorial/reports/tss_enrichment.html)
    * :fa-file-code-o: [tutorial.html](../files/examples/tutorial/reports/tutorial.html)
* ??? danger ":fa-folder-open-o: results_pipeline/"
    * ??? danger ":fa-folder-open-o: tutorial/"
        * ??? danger ":fa-folder-open-o: fastqc/"
            * [:fa-file-code-o: tutorial_R1.trim_fastqc.html](../files/examples/tutorial/results_pipeline/tutorial/fastqc/tutorial_R1.trim_fastqc.html)
            * :fa-file-archive-o: tutorial_R1.trim_fastqc.zip
            * [:fa-file-code-o: tutorial_R2.trim_fastqc.html](../files/examples/tutorial/results_pipeline/tutorial/fastqc/tutorial_R2.trim_fastqc.html)
            * :fa-file-archive-o: tutorial_R2.trim_fastqc.zip
        * ??? danger ":fa-folder-open-o: raw/"
            * :fa-file-archive-o: tutorial_r1.fastq.gz
            * :fa-file-archive-o: tutorial_r2.fastq.gz
            * :fa-file-archive-o: hg38_annotations.bed.gz 
        * ??? danger ":fa-folder-open-o: aligned_hg38/"
            * :fa-file-o: tutorial_fail_qc.bam
            * :fa-file-o: tutorial_sort.bam
            * :fa-file-o: tutorial_sort.bam.bai
            * :fa-file-o: tutorial_unmap.bam
            * :fa-file-text-o: tutorial_dedup_metrics_log.txt
            * :fa-file-o: tutorial_sort_dedup.bam
            * :fa-file-o: tutorial_sort_dedup.bam.bai
            * :fa-file-o: tutorial_smooth.bw
        * ??? danger ":fa-folder-open-o: aligned_hg38_exact/"
            * :fa-file-o: tutorial_exact.bw
            * :fa-file-o: tutorial_shift.bed
        * ???+ danger ":fa-folder-open-o: fastq/"
        * ??? danger ":fa-folder-open-o: peak_calling_hg38/"
            * :fa-file-o: tutorial_peaks.narrowPeak]
            * :fa-file-excel-o: tutorial_peaks.xls]
            * :fa-file-o: tutorial_summits.bed
            * :fa-file-o: tutorial_peaks.bigBed
            * :fa-file-o: tutorial_peaks_coverage.bed
        * ??? danger ":fa-folder-open-o: prealignments/"
            * :fa-file-text-o: tutorial_rCRSd_bt_aln_summary.log
            * :fa-file-archive-o: tutorial_rCRSd_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial_rCRSd_unmap_R2.fq.gz
            * :fa-file-text-o: tutorial_human_repeats_bt_aln_summary.log
            * :fa-file-archive-o: tutorial_human_repeats_unmap_R1.fq.gz
            * :fa-file-archive-o: tutorial_human_repeats_unmap_R2.fq.gz
        * ??? danger ":fa-folder-open-o: QC_hg38/"
            * :fa-file-o: tutorial_bamQC.tsv
            * :fa-file-text-o: tutorial_TssEnrichment.txt
            * [:fa-file-pdf-o: tutorial_TssEnrichment.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.pdf)
            * [:fa-file-image-o: tutorial_TssEnrichment.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_TssEnrichment.png)
            * :fa-file-text-o: tutorial_fragLen.txt
            * :fa-file-text-o: tutorial_fragCount.txt
            * [:fa-file-image-o: tutorial_fragLenDistribution.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.png)
            * [:fa-file-pdf-o: tutorial_fragLenDistribution.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_fragLenDistribution.pdf)
            * :fa-file-text-o: tutorial_fragLenDistribution.txt
            * :fa-file-o: tutorial_3_UTR_coverage.bed
            * :fa-file-o: tutorial_5_UTR_coverage.bed
            * :fa-file-o: tutorial_Exon_coverage.bed
            * :fa-file-o: tutorial_Intron_coverage.bed
            * :fa-file-o: tutorial_Promoter_coverage.bed
            * :fa-file-o: tutorial_Promoter_Flanking_Region_coverage.bed
            * [:fa-file-pdf-o: tutorial_frif.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.pdf)
            * [:fa-file-image-o: tutorial_frif.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_frif.png)
            * [:fa-file-pdf-o: tutorial_peaks_chr_dist.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_chr_dist.pdf)
            * [:fa-file-image-o: tutorial_peaks_chr_dist.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_chr_dist.png)
            * [:fa-file-pdf-o: tutorial_peaks_TSS_dist.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_TSS_dist.pdf)
            * [:fa-file-image-o: tutorial_peaks_TSS_dist.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_TSS_dist.png)
            * [:fa-file-pdf-o: tutorial_peaks_partition_dist.pdf](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_partition_dist.pdf)
            * [:fa-file-image-o: tutorial_peaks_partition_dist.png](../files/examples/tutorial/results_pipeline/tutorial/QC_hg38/tutorial_peaks_partition_dist.png)
        * [:fa-file-text-o: objects.tsv](../files/examples/tutorial/results_pipeline/tutorial/objects.tsv) 
        * :fa-file-code-o: PEPATAC_cleanup.sh
        * [:fa-file-code-o: PEPATAC_commands.sh](../files/examples/tutorial/results_pipeline/tutorial/PEPATAC_commands.sh)
        * :fa-file-o: PEPATAC_completed.flag
        * [:fa-file-o: PEPATAC_log.md](../files/examples/tutorial/results_pipeline/tutorial/PEPATAC_log.md)
        * [:fa-file-text-o: PEPATAC_profile.tsv](../files/examples/tutorial/results_pipeline/tutorial/PEPATAC_profile.tsv)
        * [:fa-file-text-o: stats.tsv](../files/examples/tutorial/results_pipeline/tutorial/stats.tsv)
* ??? danger ":fa-folder-open-o: submission/"
    * :fa-file-code-o: pepatac.py_tutorial.sub
    * :fa-file-code-o: tutorial.yaml
    * :fa-file-text-o: pepatac.py_tutorial.log
* ??? danger ":fa-folder-open-o: summary/"
    * :fa-file-pdf-o: [tutorial_alignmentPercent.pdf](../files/examples/tutorial/summary/tutorial_alignmentPercent.pdf)
    * :fa-file-image-o: [tutorial_alignmentPercent.png](../files/examples/tutorial/summary/tutorial_alignmentPercent.png)
    * :fa-file-pdf-o: [tutorial_alignmentRaw.pdf](../files/examples/tutorial/summary/tutorial_alignmentRaw.pdf)
    * :fa-file-image-o: [tutorial_alignmentRaw.png](../files/examples/tutorial/summary/tutorial_alignmentRaw.png)
    * :fa-file-pdf-o: [tutorial_TSSEnrichment.pdf](../files/examples/tutorial/summary/tutorial_TSSEnrichment.pdf)
    * :fa-file-image-o: [tutorial_TSSEnrichment.png](../files/examples/tutorial/summary/tutorial_TSSEnrichment.png)
* :fa-file-text-o: [tutorial_stats_summary.tsv](../files/examples/tutorial/tutorial_stats_summary.tsv)
* :fa-file-code-o: [tutorial_summary.html](../files/examples/tutorial/tutorial_summary.html)

---

#### **3.2: Generate an `HTML` report using `looper`**

Let's take full advantage of `looper` and generate a pipeline `HTML` report that makes all our results easy to view and browse.  If you'd like to skip right to the results and see what it looks like, [check out the tutorial results](../files/examples/tutorial/tutorial_summary.html).  Otherwise, let's generate a report ourselves.
Using our same configuration file we used to run the samples through the pipeline, we'll now employ the `summarize` function of `looper`.
```
looper summarize tutorial.yaml --compute local
```         
That's it! Easy, right? `Looper` conveniently provides you with the location where the HTML report is produced.  You may either open the report with your preferred internet browser using the PATH provided, or we can change directories to the report's location and open it there.  Let's go ahead and change into the directory that contains the report.
```
cd /path/to/pepatac_tutorial/processed/tutorial/
firefox tutorial_summary.html
```          
The `HTML` report contains a summary page that integrates the project level summary table and any project level objects including: raw aligned reads, percent aligned reads, and TSS enrichment scores.  The status page lists all the samples in this project along with their current status, a link to their log files, the time it took to run the sample and the peak memory used during the run.  The objects page provides links to separate pages for each object type.  On each object page, all the individual samples' objects are provided.  Similarly, the samples page contains links to individual pages for each sample.  The sample pages list the individual summary statistics for that sample as well as links to log files, command logs, and summary files.  The sample pages also provide links and thumbnails for any individual objects generated for that sample.  Of course, all of these files are present in the sample directory, but the report provides easy access to them all.

---

* [:fa-envelope: Contact Us](contact.md)
* [Learn more about the Databio team!](http://databio.org/)