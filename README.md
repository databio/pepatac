# 1. PEPATAC pipeline overview

This repository contains a pipeline to process ATAC-seq data. It does adapter trimming, mapping, peak calling, and creates bigwig tracks, TSS enrichment files, and other outputs. You can download the latest version from the [releases page](https://github.com/databio/pepatac/releases), or find changes listed in the [CHANGELOG](CHANGELOG.md).

# 2. Pipeline features at-a-glance

Here are a few of the highlights that make `pepatac` valuable (explained in more detail later in this README).

**Beautiful HTML reports**. Your results are an easy-to-navigate HTML report with a sample table, job status, summary statistics, and QC plots at your fingertips. 

**Scalability**. Run the pipeline easily on a project with a single sample or a thousand. This pipeline is compatible with [looper](https://github.com/pepkit/looper), so it can run locally, in a cloud container engine, or with *any* cluster resource manager (*e.g.* SLURM, SGE, or LFS).

**Restartability**. The pipeline is built using [pypiper](https://github.com/databio/pypiper), so it automatically picks up where it left off in case of preemption or crash.

**Copious logging**. The pipeline produces a detailed log file recording all output from every command run, and also records the time and memory use of every process, the version of the pipeline and other software, and other useful run information.

**Flexibility**. The pipeline provides options for multiple peak callers, multiple adapter trimmers, and fully configurable parameterization for many underlying tools.

**Portability**. Run it using `docker` or `singularity` with no other prerequisites, or it can be run natively without containers. The choice is yours.

**Standardized user interface**. The pipeline reads sample metadata formatted in [standard PEP format](http://pepkit.github.io), so you can use the same sample annotation sheets for your downstream R or python analysis using tools from [pepkit](http://pepkit.github.io).

**Standardized reference genome assembly**. The pipeline uses standard reference genome assemblies produced by [refgenie](http://github.com/databio/refgenie), which provides a *scripted* way to produce a compatible reference assembly for any custom genome. For common genomes, you can either download pre-indexed assemblies or build your own. 

**Fraction of reads in peaks (FRIP)**. By default, the pipeline will calculate the FRIP using the peaks it identifies. Optionally, it can **also** calculate a FRIP using a reference set of peaks (for example, from another experiment). 

**TSS enrichments**. The pipeline produces various nice QC plots.

**Prealignments**. The pipeline can (optionally) first align to any number of reference assemblies separately before the primary genome alignment. This increases both speed and accuracy and can be used, for example, to align sequentially to mtDNA, repeats, or spike-ins.


# 3. Installation

## 3.1 Clone the pipeline

First, **clone the pipeline**. Clone this repository using one of these methods:
- using SSH: `git clone git@github.com:databio/pepatac.git`
- using HTTPS: `git clone https://github.com/databio/pepatac.git`

Next, specify custom sequencing adapter file if desired (in [pipelines/pepatac.yaml](pipelines/pepatac.yaml)).

Next, you have two options for installing the software prerequisites: 1) use a container, in which case you need only either `docker` or `singularity`; or 2) install all prerequisites natively. If you want to install it natively, skip to the [native installation instructions](#33-native-approach).

## 3.2 Use containers

First, make sure your environment is set up to run either [docker](http://docker.com) or [singularity](https://singularity.lbl.gov/) containers. Then, pull the container image:

### Docker

You can pull the `docker` image from `dockerhub` (https://hub.docker.com/r/databio/pepatac/) like this:

```
docker pull databio/pepatac
```

Or build the image using the included [Dockerfile](containers/) (you can use a recipe in the included [Makefile](/Makefile)):

```
cd pepatac
make docker
```

### Singularity

You can download the singularity image from http://big.databio.org/simages/pepatac or build it from the docker image following the recipe in the [Makefile](/Makefile):
```
cd pepatac
make singularity
```
Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called `$SIMAGES` that points to the *folder where your image is stored*, or you can tweak the [pipeline_interface.yaml](pipeline_interface.yaml) file so that the `compute.singularity_image` attribute is pointing to the right location on disk.

## 3.3. Install software requirements natively

*Note: you only need to install these prerequisites if you are not using a container*. 

First we'll need to install all the prerequisites:

**Python packages**. This pipeline uses [pypiper](https://github.com/databio/pypiper) to run a single sample, [looper](https://github.com/pepkit/looper) to handle multi-sample projects (for either local or cluster computation), and [pararead](https://github.com/databio/pararead) for parallel processing sequence reads.  For peak calling, the pipeline uses [MACS2](https://github.com/taoliu/MACS/) as the default.  You can do a user-specific install of these like this:

```
pip install --user piper
pip install --user https://github.com/pepkit/looper/zipball/master
pip install --user pararead
pip install --user MACS2
```

**R packages**. This pipeline uses R to generate QC metric plots. These are **optional** and if you don't install these R packages (or R in general), the pipeline will still work, but you will not get the QC plot outputs. 

The following packages are used by the qc scripts:
- argparser (v0.4)
- data.table (v1.11.2)
- ggplot2 (v2.2.1)
- gplots (v3.0.1)
- gtable (v0.2.0)
- pepr (v0.0.2)
- scales (v0.5.0)
- stringr (v1.3.1)

You can install these packages like this:
```
R # start R
install.packages(c("argparser", "data.table", "ggplot2", "gplots", "gtable", "scales", "stringr"))
devtools::install_github('pepkit/pepr')
```

**Required executables**. You will need some common bioinformatics tools installed. The complete list (including optional tools) is specified in the pipeline configuration file ([pipelines/pepatac.yaml](pipelines/pepatac.yaml)) tools section.

The following tools are used by the pipeline:
- [bedtools](http://bedtools.readthedocs.io/en/latest/) (v2.25.0+)
- [bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml) (v2.2.9+)
- [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) (v0.11.5+)
- [picard](https://broadinstitute.github.io/picard/) (v2.17.4+)
- [samtools](http://www.htslib.org/) (v1.7)
- [skewer](https://github.com/relipmoc/skewer) (v0.1.126+)
- UCSC tools (v3.5.1)
  - [bedGraphToBigWig](https://www.encodeproject.org/software/bedgraphtobigwig/) (v4)
  - [wigToBigWig](https://www.encodeproject.org/software/wigtobigwig/) (v4)
  - [bigWigCat](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/) (v4)
  - [bedSort](http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/)

With the software installed natively, we next need to configure the pipeline:

There are two configuration options: You can either set up environment variables to fit the default configuration, or change the configuration file to fit your environment. For the Chang lab, you may use the pre-made config file and project template described on the [Chang lab configuration](examples/chang_project) page. For others, choose one:

### 3.3.1 Configuration option 1: Default configuration (recommended; [pipelines/pepatac.yaml](pipelines/pepatac.yaml)). 
  - Make sure the executable tools (java, samtools, bowtie2, etc.) are in your PATH (unless using a container).
  - Set up environment variables to point to `jar` files for the java tools (`picard` and `trimmomatic`).
  ```
  export PICARD="/path/to/picard.jar"
  export TRIMMOMATIC="/path/to/trimmomatic.jar"
  ```
    
  - Specify custom sequencing adapter file if desired (in [pipelines/pepatac.yaml](pipelines/pepatac.yaml)).


### 3.3.2  Configuration option 2: Custom configuration.

Instead, you can also put absolute paths to each tool or resource in the configuration file to fit your local setup. Just change the pipeline configuration file ([pipelines/pepatac.yaml](pipelines/pepatac.yaml)) appropriately. 

# 4. Configuring reference genome assemblies

## 4.1 Downloading refgenie assemblies

Whether using the container or native version, you will need to provide external reference genome assemblies. The pipeline requires genome assemblies produced by [refgenie](https://github.com/databio/refgenie). 

One feature of the pipeline is *prealignments*, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to do use will also require refgenie assemblies. By default, the pipeline will pre-align to the mitochondrial genome, so you if you want to use the default settings, you will need refgenie assemblies for `rCRSd` genome (for human) or `mouse_chrM` (for mouse) in addition to the primary assembly you wish to use. Other ideas for common prealignment references are provided by [ref_decoy](https://github.com/databio/ref_decoy). 

You may [download pre-indexed references](http://big.databio.org/refgenomes) or you may index your own (see [refgenie](https://github.com/databio/refgenie) instructions). 

 
## 4.2 Configuring the pipeline to use refgenie assemblies

Once you've procured assemblies for all genomes you wish to use, you must point the pipeline to where you store these. You can do this in two ways, either: 1) with an environment variable, or 2) by adjusting a configuration option.

The pipeline looks for genomes stored in a folder specified by the `resources.genomes` attribute in the [pipeline config file](pipelines/pepatac.yaml). By default, this points to the shell variable `GENOMES`, so all you have to do is set an environment variable to the location of your [refgenie](https://github.com/databio/refgenie) genomes:

  ```
  export GENOMES="/path/to/genomes/folder/"
  ```

  (Add this to your `.bashrc` or `.profile` to ensure it persists).
 
Alternatively, you can skip the `GENOMES` variable and simply change the value of that configuration option to point to the folder where you stored the assemblies. The advantage of using an environment variable is that it makes the configuration file portable, so the same pipeline can be run on any computing environment, as the location to reference assemblies is not hard-coded to a specific computing environment.


# 5. Running the pipeline

The pipeline can be run directly from the command line for a single sample. If you need to run it on many samples, you could write your own sample handling code, but we have pre-configured everything to work nicely with [looper](http://looper.readthedocs.io), our sample handling engine. This section explains how to do both.

## 5.1 Running the pipeline script directly (without looper)

The pipeline is at core just a python script, and you can run it on the command line for a single sample. To see the command-line options for usage, see [usage.txt](usage.txt), which you can get on the command line by running `pipelines/pepatac.py --help`. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. See [example commands](example_cmd.txt) that use test data.

Here's the basic command to run the small test example through the pipeline:

```
pipelines/pepatac.py --single-or-paired paired --genome hg38 --sample-name test1 --input examples/test_data/test1_r1.fastq.gz --input2 examples/test_data/test1_r2.fastq.gz --genome-size hs -O $HOME/test
```

This small example takes about 15 minutes to run to completion.


## 5.1.1 Running the pipeline directly in a container

A full tutorial on using containers it outside the scope of this readme, but here are the basics. Individual jobs can be run in a container by simply running the `pepatac.py` command through `docker run` or `singularity exec`. You can run containers either on your local computer, or in an HPC environment, as long as you have `docker` or `singularity` installed. For example, run it locally in singularity like this:

```
singularity instance.start ${SIMAGES}pepatac atac_image
singularity exec instance://atac_image pipelines/pepatac.py
```

With docker, you can use:
```
docker run --rm -it databio/pepatac pipelines/pepatac.py
```

Be sure to mount the volumes you need with `--volume`.

To run on multiple samples, you can just write a loop to process each sample independently with the pipeline, or you can use...*looper*!

## 5.2 Running the pipeline through looper

This pipeline is pre-configured to work with `looper`. [Looper](http://looper.readthedocs.io/) is a pipeline submission engine that makes it easy to deploy any pipeline across samples. It will let you run the jobs locally, in containers, using any cluster resource manager, or in containers on a cluster.

Install looper using `pip`:

```
pip install --user https://github.com/pepkit/looper/zipball/master
```

Start by running the example project in the [examples/test_project](examples/test_project) folder. Let's use the `-d` argument to do a *dry run*, which will create job scripts for every sample in the project, but will not execute them:

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

There are lots of other cool things you can do with looper, like dry runs, summarize results, check on pipeline run status, clean intermediate files, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.readthedocs.io/).

### Adapting the example for your own project

Now, adapt the example project to your project. (There are more examples in the [examples/test_project](examples/test_project/) folder). You need two files for your project :

- [project config file](examples/test_project/test_config.yaml) -- describes output locations, pointers to data, etc.
- [sample annotation file](examples/test_project/test_annotation.csv) -- comma-separated value (CSV) list of your samples.

Your annotation file must specify these columns:
- sample_name
- library (must be 'ATAC')
- organism (may be 'human' or 'mouse')
- read1
- read2
- whatever else you want

Run your project as above, by passing your project config file to `looper` with `looper run project_config.yaml`. This project format called the *standard Portable Encapsulated Project format* and is outlined in more detail in the [pepkit docs](https://pepkit.github.io/docs/home/).

Looper can also summarize your results, monitor your runs, clean intermediate files to save disk space, and more. You can find additional details on what you can do with this in the [looper docs](http://looper.readthedocs.io/). 

## 5.3 How to run on a cluster or in a container using looper

The pipeline itself does not specify any container or cluster resources, so you *could* just roll your own and submit individual jobs to a cluster however you choose. The easier way is to use `looper`'s built-in template system, which `looper` uses to build flexible shell scripts for job submission. These templates can be used to run jobs in a container, to submit to a cluster resource manager, or both.

### 5.3.1 PEPENV

To use `looper` templates, we must create a *computing environment configuration file* called `PEPENV`. In short, you will need to:

1. Set up a compute configuration file that includes a containerized or cluster compute template (or both).
2. Point the environment variable `PEPENV` to the location of this file.
3. Run the pipeline with `looper run --compute PACKAGE` (where PACKAGE is specified in your PEPENV file).

This enables you to adjust your computing preferences on-the-fly when you run a project.

The complete description of setting up `looper` to use `PEPENV` is generic to any pipeline, and therefore omitted from this readme. If you want to use `looper` with containers or clusters, you should consult the complete docs in the [pepenv readme](https://github.com/pepkit/pepenv). Further instructions can also be found in the documentation on [configuring looper to use a cluster](http://looper.readthedocs.io/en/latest/cluster-computing.html) and [configuring looper to use linux containers](https://looper.readthedocs.io/en/dev/containers.html).


# 6. Outline of analysis steps

## 6.1 Prealignments

Because of the high proportion of mtDNA reads in ATAC-seq data, we recommend first aligning to the mitochondrial DNA. This pipeline does this using prealignments, which are passed to the pipeline via the `--prealignments` argument. This has several advantages: it speeds up the process dramatically, and reduces noise from erroneous alignments (NuMTs). To do this, we use a doubled mtDNA reference that allows even non-circular aligners to draw all reads to the mtDNA. The pipeline will also align *sequentially* to other references, if provided via the `--prealignments` command-line option. For example, you may download the `repbase` assembly to align to all repeats. We have provided indexed assemblies for mtDNA and other repeat classes in the [ref_decoy](https://github.com/databio/ref_decoy) repository. The pipeline is already configured to work with these, but you can also adjust this parameter in your project_config.yaml file (see [project_config.yaml](/examples/gold_atac/metadata/project_config.yaml)) as opposed to providing it at the command-line.

## 6.2 FRIP

By default, the pipeline will calculate the FRIP as a quality control, using the peaks it identifies internally. If you want, it will **additionally** calculate a FRIP using a reference set of peaks (for example, from another experiment). For this you must provide a reference peak set (as a bed file) to the pipeline. You can do this by adding a column named `FRIP_ref` to your annotation sheet (see [pipeline_interface.yaml](/config/pipeline_interface.yaml)). Specify the reference peak filename (or use a derived column and specify the path in the project config file `data_sources` section).

## 6.3 TSS enrichments

In order to calculate TSS enrichments, you will need a TSS annotation file in your reference genome directory. Here's code to generate that.

From refGene:

```
# Provide genome string and gene file
GENOME="hg38"
URL="http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz"

wget -O ${GENOME}_TSS_full.txt.gz ${URL}
zcat ${GENOME}_TSS_full.txt.gz | awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}'  | LC_COLLATE=C sort -k1,1 -k2,2n -u > ${GENOME}_TSS.tsv
echo ${GENOME}_TSS.tsv

Mouse:
GENOME="mm10"
URL="http://hgdownload.soe.ucsc.edu/goldenPath/mm10/database/refGene.txt.gz"

```

Another option from Gencode GTF:

```
grep "level 1" ${GENOME}.gtf | grep "gene" | awk  '{if($7=="+"){print $1"\t"$4"\t"$4"\t"$7}else{print $1"\t"$5"\t"$5"\t"$7}}' | LC_COLLATE=C sort -u -k1,1V -k2,2n > ${GENOME}_TSS.tsv

```

## 6.4 Optional summary plots

1. Run `looper summarize` to generate a summary table in tab-separated values (TSV) format as well as an HTML report describing sample and project level results.

```
looper summarize examples/test_project/test_config.yaml
```

2. You can specify in the [pipeline interface file](pipeline_interface.yaml) any additional summarizers you wish to run, such as the `PEPATAC_summarizer.R`. Alternatively, you may run `PEPATAC_summarizer.R` directly to produce summary plots.

You must pass the path to your project configuration file used to run looper.
```
Rscript PEPATAC_summarizer.R examples/test_project/test_config.yaml
```

This results in the output of multiple PDF plots in a summary/ subdirectory within the project parent directory.


# 7. Contributing

Pull requests welcome. Active development should occur in a development or feature branch.

## Contributors

* Jin Xu, jinxu9@stanford.edu
* Nathan Sheffield, nathan@code.databio.org
* Jason Smith, jasonsmith@virginia.edu
* Ryan Corces, rcorces@stanford.edu
* Vince Reuter, vince.reuter@gmail.com
* Others... (add your name)


# 8. Troubleshooting

A few common issues running the pipeline:

- If 'fseq' fails to create a peaks file and the log file indicates an ArrayIndexOutOfBoundsException, this is likely due to a low read count and can probably be overcome by specifying fragment size with fseq's -f option.


