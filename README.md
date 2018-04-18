# ATACseq pipeline

This repository contains a pipeline to process ATAC-seq data. It does adapter trimming, mapping, peak calling, and creates bigwig tracks, TSS enrichment files, and other outputs. You can download the latest version from the [releases page](https://github.com/databio/ATACseq/releases) and a history of version changes is in the [CHANGELOG](CHANGELOG.md).

## 1. Pipeline features at-a-glance

These features are explained in more detail later in this README.

**Prealignments**. The pipeline can (optionally) first align to any number of reference assemblies separately before the primary genome alignment. This increases both speed and accuracy and can be used, for example, to align sequentially to mtDNA, repeats, or spike-ins.

**Scalability**. This pipeline is built on [looper](https://github.com/epigen/looper), so it can run locally or with any cluster resource manager.

**Fraction of reads in peaks (FRIP)**. By default, the pipeline will calculate the FRIP using the peaks it identifies. Optionally, it can **also** calculate a FRIP using a reference set of peaks (for example, from another experiment). 

**TSS enrichments**. The pipeline produces various nice QC plots.

## 2. Installing

### 2.1 Prequisites

**Python packages**. This pipeline uses [pypiper](https://github.com/epigen/pypiper) to run a single sample, [pararead](https://github.com/databio/pararead) for parallel processing sequence reads, and [looper](https://github.com/epigen/looper) to handle multi-sample projects (for either local or cluster computation). You can do a user-specific install of these like this:

```
pip install --user https://github.com/epigen/pypiper/zipball/master
pip install --user https://github.com/epigen/looper/zipball/master
pip install --user https://github.com/databio/pararead/zipball/master
```
**R packages**. This pipeline uses R to generate QC metric plots. These are **optional** and if you don't install these R packages (or R in general), the pipeline will still work, but you will not get the QC plot outputs. 

The following packages are used by the qc scripts:
- ggplot2
- gplots (v3.0.1)
- reshape2 (v1.4.2)

You can install these packages like this:
```
R # start R
install.packages(c("ggplot2", "gplots", "reshape2"))
```

**Required executables**. You will need some common bioinformatics tools installed. The list is specified in the pipeline configuration file ([pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)) tools section.

**Genome resources**. This pipeline requires genome assemblies produced by [refgenie](https://github.com/databio/refgenie). You may [download pre-indexed references](http://cloud.databio.org/refgenomes) or you may index your own (see [refgenie](https://github.com/databio/refgenie) instructions). Any prealignments you want to do use will also require refgenie assemblies. Some common examples are provided by [ref_decoy](https://github.com/databio/ref_decoy).

### 2.2 Configuring the pipeline

**Clone the pipeline**. Clone this repository using one of these methods:
- using SSH: `git clone git@github.com:databio/ATACseq.git`
- using HTTPS: `git clone https://github.com/databio/ATACseq.git`

There are two configuration options: You can either set up environment variables to fit the default configuration, or change the configuration file to fit your environment. For the Chang lab, you may use the pre-made config file and project template described on the [Chang lab configuration](examples/chang_project) page. For others, choose one:

**Configuration option 1: Default configuration** (recommended; [pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)). 
  - Make sure the executable tools (java, samtools, bowtie2, etc.) are in your PATH.
  - Set up environment variables to point to `jar` files for the java tools (`picard` and `trimmomatic`).
  ```
  export PICARD="/path/to/picard.jar"
  export TRIMMOMATIC="/path/to/trimmomatic.jar"
  ```
  
  - Define environment variable `GENOMES` for refgenie genomes. 
  ```
  export GENOMES="/path/to/genomes/folder/"
  ```
  
  - Specify custom sequencing adapter file if desired (in [pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)).


**Configuration option 2: Custom configuration**. Instead, you can also put absolute paths to each tool or resource in the configuration file to fit your local setup. Just change the pipeline configuration file ([pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)) appropriately. 

## 3. Usage

You have two options for running the pipeline. 

### 3.1 Run option 1: Running the pipeline script directly

To see the command-line options for usage, see [usage.txt](usage.txt), which you can get on the command line by running `pipelines/ATACseq.py --help`. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. See [example commands](example_cmd.txt) that use test data.

To run on multiple samples, you can just write a loop to process each sample independently with the pipeline, or you can use *option 2*...

### 3.2 Run option 2: Running the pipeline through looper

This pipeline is pre-configured to work with `looper`. [Looper](http://looper.readthedocs.io/) is a pipeline submission engine that makes it easy to deploy any pipeline across samples. It will let you run the jobs locally or using any cluster resource manager.

Start by running the example project in the [examples/test_project](examples/test_project) folder. This command runs the pipeline across all samples in the test project:

```
cd ATACseq
looper run examples/test_project/test_config.yaml
```

If the looper executable in not your `$PATH`, add the following line to your `.bashrc` or `.profile`:

```
export PATH=$PATH:~/.local/bin
```

Now, adapt the example project to your project. Detailed instructions for how to define your project are in the [Looper documentation on defining a project](http://looper.readthedocs.io/en/latest/define-your-project.html). Looper reads the [standard Portable Encapsulated Project format](https://pepkit.github.io/docs/home/). Here's a quick start: You need to build two files for your project (follow examples in the [examples/test_project](examples/test_project/) folder):

- [project config file](examples/test_project/test_config.yaml) -- describes output locations, pointers to data, etc.
- [sample annotation file](examples/test_project/test_annotation.csv) -- comma-separated value (CSV) list of your samples.

Your annotation file must specify these columns:
- sample_name
- library (must be 'ATAC')
- organism (may be 'human' or 'mouse')
- read1
- read2
- whatever else you want

Run your project as above, by passing your project config file to `looper` with `looper run project_config.yaml`. Looper can also summarize your results, monitor your runs, clean intermediate files to save disk space, and more. You can find additional details on what you can do with this in the [looper docs](http://looper.readthedocs.io/). 

### 3.3 Using a cluster

The pipeline itself does not specify any cluster resources, so you can submit individual jobs to a cluster however you choose. We recommend using `looper`, which will let you submit jobs to any cluster with a simple change to your configuration file. Follow instructions in [configuring looper to use a cluster](http://looper.readthedocs.io/en/latest/cluster-computing.html).

## 4. Outline of analysis steps

### Prealignments

Because of the high proportion of mtDNA reads in ATAC-seq data, we recommend first aligning to the mitochondrial DNA. This pipeline does this using prealignments, which are passed to the pipeline via the `--prealignments` argument. This has several advantages: it speeds up the process dramatically, and reduces noise from erroneous alignments (NuMTs). To do this, we use a doubled mtDNA reference that allows even non-circular aligners to draw all reads to the mtDNA. The pipeline will also align *sequentially* to other references, if provided via the `--prealignments` command-line option. For example, you may download the `repbase` assembly to align to all repeats. We have provided indexed assemblies for mtDNA and other repeat classes in the [ref_decoy](https://github.com/databio/ref_decoy) repository. The pipeline is already configured to work with these, but you can change to however you wish by adjusting the 

### FRIP

By default, the pipeline will calculate the FRIP as a quality control, using the peaks it identifies internally. If you want, it will **additionally** calculate a FRIP using a reference set of peaks (for example, from another experiment). For this you must provide a reference peak set (as a bed file) to the pipeline. You can do this by adding a column named `FRIP_ref` to your annotation sheet (see [pipeline_interface.yaml](/config/pipeline_interface.yaml)). Specify the reference peak filename (or use a derived column and specify the path in the project config file `data_sources` section).

### TSS enrichments

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

### Optional summary plots

1. Run `looper summarize` to generate a summary table in tab-separated values (TSV) format

```
looper summarize examples/test_project/test_config.yaml
```

2. Run `ATAC_Looper_Summary_plot.R` to produce summary plots.

You must pass the full path to your TSV file that resulted from the call to looper summarize.
```
Rscript ATAC_Looper_Summary_plot.R </path/to/looper/summarize/summary.TSV>
```

This results in the output of multiple PDF plots in the directory containing the TSV input file.

## Contributing

Pull requests welcome. Active development should occur in a development or feature branch.

## Contributors

* Jin Xu, jinxu9@stanford.edu
* Nathan Sheffield
* Others... (add your name)
