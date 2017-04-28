# ATACseq pipeline

This repository contains a pipeline to process ATAC-seq data. It does adapter trimming, mapping, peak calling, and creates bigwig tracks, TSS enrichment files, and other outputs. You can download the latest version from the [releases page](https://github.com/databio/ATACseq/releases) and a history of version changes is in the [CHANGELOG](CHANGELOG.md).

## Pipeline features outlined

**mtDNA prealignment**. If provided, the pipeline will first align to chrM separately. Because of the high proportion of mtDNA reads in ATAC-seq data, this has several advantages: it speeds up the process dramatically, and reduces noise from erroneous alignments (NuMTs). To do this, we use a doubled mtDNA reference that allows even non-circular aligners to draw all reads to the mtDNA.

**Other prealignments**. The pipeline will also align *sequentially* to other references, if provided via the `--prealignments` command-line option. For example, you may download the `repbase` assembly to align to all repeats. We have also provided indexed assemblies for some repeat classes for download in the [ref_decoy](https://github.com/databio/ref_decoy) repository.

**Fraction of reads in peaks (FRIP)**. By default, the pipeline will calculate the FRIP as a quality control, using the peaks it identifies internally. If you want, it will **additionally** calculate a FRIP using a reference set of peaks (for example, from another experiment). For this you must provide a reference peak set (as a bed file) to the pipeline. You can do this by adding a column named `FRIP_ref` to your annotation sheet (see [pipeline_interface.yaml](/config/pipeline_interface.yaml)). Specify the reference peak filename (or use a derived column and specify the path in the project config file `data_sources` section).

## Installing

**Prerequisites**. This pipeline uses [pypiper](https://github.com/epigen/pypiper) to run a pipeline for a single sample, and [looper](https://github.com/epigen/looper) to handle multi-sample projects (for either local or cluster computation). It uses the [pararead](https://github.com/databio/pararead) module for processing reads in parallel. You can do a user-specific install of these like this:

```
pip install --user https://github.com/epigen/pypiper/zipball/master
pip install --user https://github.com/epigen/looper/zipball/master
pip install --user https://github.com/databio/pararead/zipball/master

```

To put the looper executable in your $PATH, add the following line to your `.bashrc` or `.profile`:

```
export PATH=$PATH:~/.local/bin
```

**Required executables**. To run the pipeline, you will also need some common bioinformatics tools installed. The list is specified in the pipeline configuration file ([pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)) tools section.

**Genome resources**. This pipeline requires genome assemblies produced by [refgenie](https://github.com/databio/refgenie). Downloads for common genomes are available or you may index your own (see [refgenie](https://github.com/databio/refgenie) instructions). Any prealignments you want to do use will also require refgenie assemblies. Some common examples are provided [ref_decoy](https://github.com/databio/ref_decoy).

**Clone the pipeline**. Then, clone this repository using one of these methods:
- using SSH: `git clone git@github.com:databio/ATACseq.git`
- using HTTPS: `git clone https://github.com/databio/ATACseq.git`

## Configuring

You can either set up environment variables to fit the default configuration, or change the configuration file to fit your environment. For the Chang lab, you may use the pre-made config file and project template described on the [Chang lab configuration](examples/chang_project) page. For others, choose one of these options:

**Option 1: Default configuration** (recommended; [pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)). 
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
  
  - Specify custom sequencing adapter file if desired.


**Option 2: Custom configuration**. Instead, you can also put absolute paths to each tool or resource in the configuration file to fit your local setup. Just change the pipeline configuration file ([pipelines/ATACseq.yaml](pipelines/ATACseq.yaml)) appropriately. 


## Running the pipeline

You never need to interface with the pipeline directly, but you can if you want. Just run `python pipelines/ATACseq.py -h` to see usage. See example command in [cmd.sh](cmd.sh).

But the best way to use this pipeline is to run it using looper. You will need to tell looper about your project. Example project data are in the [examples/test_project](examples/test_project) folder. Run the pipeline across all samples in the test project with this command:
```
looper run examples/test_project/test_config.yaml
```

Now, adapt for your project. Here's a quick start: You need to build two files for your project (follow examples in the [examples/test_project](examples/test_project/) folder):

- [project config file](examples/test_project/test_config.yaml) -- describes output locations, pointers to data, etc.
- [sample annotation file](examples/test_project/test_annotation.csv) -- comma-separated value (CSV) list of your samples.

Your annotation file must specify these columns:
- sample_name
- library (must be 'ATAC')
- organism (may be 'human' or 'mouse')
- read1
- read2
- whatever else you want

Run your project as above, by passing your project config file to `looper run`. More detailed instructions and advanced options for how to define your project are in the [Looper documentation on defining a project](http://looper.readthedocs.io/en/latest/define-your-project.html). Of particular interest may be the section on [using looper derived columns](http://looper.readthedocs.io/en/latest/advanced.html#pointing-to-flexible-data-with-derived-columns).

## TSS enrichments

In order to calculate TSS enrichments, you will need a TSS annotation file in your reference genome directory. Here's code to generate that.

From refGene:

```
# Provide genome string and gene file
GENOME="hg38"
URL="http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz"

wget -O ${GENOME}_TSS_full.txt.gz ${URL}
zcat ${GENOME}_TSS_full.txt.gz | awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}'  | LC_COLLATE=C sort -k1,1 -k2,2n -u > ${GENOME}_TSS.tsv
echo ${GENOME}_TSS.tsv
```

Another option from Gencode GTF:

```
grep "level 1" ${GENOME}.gtf | grep "gene" | awk  '{if($7=="+"){print $1"\t"$4"\t"$4"\t"$7}else{print $1"\t"$5"\t"$5"\t"$7}}' | LC_COLLATE=C sort -u -k1,1V -k2,2n > ${GENOME}_TSS.tsv

```

## Using a cluster

Once you've specified your project to work with this pipeline, you will also inherit all the power of looper for your project.  You can submit these jobs to a cluster with a simple change to your configuration file. Follow instructions in [configuring looper to use a cluster](http://looper.readthedocs.io/en/latest/cluster-computing.html).

Looper can also summarize your results, monitor your runs, clean intermediate files to save disk space, and more. You can find additional details on what you can do with this in the [looper docs](http://looper.readthedocs.io/). 

## Contributing

Pull requests welcome. Active development should occur in a development or feature branch.

## Contributors

* Jin Xu, jinxu9@stanford.edu
* Nathan Sheffield
* Others... (add your name)
