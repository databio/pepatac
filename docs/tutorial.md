# <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> pipeline step-by-step guide

Welcome to the `PEPATAC` extended tutorial! Use this to learn the ropes. We'll use two provided ATAC-seq datasets and run through the step-by-step process of setting up the configuration files, running the pipeline, and looking over the results together. To use this tutorial, you should have a basic familiarity with [working in a command line driven environment](http://matt.might.net/articles/basic-unix/). You also need to have already installed `PEPATAC` prerequisites, which you can do following the various [install instructions](install.md).  This tutorial will follow two approaches to running the pipeline:  
1. [Using `refgenie` managed genome assets, which we recommend](tutorial.md#tutorial-using-refgenie-managed-genome-assets) OR 
2. [Using manually curated genome assets which do *not* require the installation and setup of `refgenie`](tutorial.md#tutorial-using-manually-downloaded-and-curated-genome-assets).

# Tutorial using `refgenie` managed genome assets

## 1: Set up folders

From an open terminal, let's first create a directory we'll use to run through this guide:
```console
mkdir pepatac_tutorial
```

Let's point an environment variable to our tutorial location (change to match your local path) to link our tutorial samples with your local environment.
```console
export TUTORIAL=/path/to/your/pepatac_tutorial
```

Let's move into our newly created directory and create a few more folders that we'll use later.
```console
cd pepatac_tutorial/
mkdir data
mkdir genomes
mkdir processed
mkdir templates
mkdir tools
cd tools/
```

Time to get PEPATAC!
```console
git clone https://github.com/databio/pepatac.git
```
Success! If you had any issues, feel free to [reach out to us with questions](contact.md).  Otherwise, let's move on to installing additional software.

## 2: Initialize `refgenie` and download assets

As described in the various installation guides, `PEPATAC` can utilize [`refgenie`](http://refgenie.databio.org/) assets. Because assets are user-dependent, these files must always exist outside of any container system or alongside a native installation. Therefore, we still need to [install and initialize a refgenie config file.](http://refgenie.databio.org/en/latest/install/). For example:

```console
pip install refgenie
export REFGENIE=/path/to/your/pepatac_tutorial/refgenie_config.yaml
refgenie init -c $REFGENIE
```

Add the `export REFGENIE` line to your `.bashrc` or `.profile` to ensure it persists. 

Next, pull the assets you need. Replace `hg38` in the example below if you need to use a different genome assembly. If these assets are not available automatically for your genome of interest, then you'll need to [build them](annotation.md).

```console
refgenie pull hg38/fasta hg38/bowtie2_index hg38/refgene_anno hg38/ensembl_gtf hg38/ensembl_rb
refgenie build hg38/feat_annotation
```

`PEPATAC` also requires a `bowtie2_index` asset for any pre-alignment genomes:

```console
refgenie pull rCRSd/bowtie2_index
```

## 3: Download tutorial read files

We're going to work with some files a little larger than the test data included in the pipeline so we can see all the features included in a full run of the pipeline.  Go ahead and download the [tutorial fastq files](http://big.databio.org/pepatac/). 
```console
wget http://big.databio.org/pepatac/tutorial1_r1.fastq.gz
wget http://big.databio.org/pepatac/tutorial1_r2.fastq.gz
wget http://big.databio.org/pepatac/tutorial2_r1.fastq.gz
wget http://big.databio.org/pepatac/tutorial2_r2.fastq.gz
```

To simplify the rest of this tutorial, let's put those files in a standard location we'll use for the rest of this guide. 
```console
mv tutorial1_r1.fastq.gz pepatac/examples/data/
mv tutorial1_r2.fastq.gz pepatac/examples/data/
mv tutorial2_r1.fastq.gz pepatac/examples/data/
mv tutorial2_r2.fastq.gz pepatac/examples/data/
```

## 4: Configure project files

We're going to use `looper` to analyze our data.  For that, we need to pass looper a configuration file.  This project config file describes your project. See [`looper` docs](https://looper.readthedocs.io/en/latest/) for details. A [configuration file has been provided for you in the pipeline repository itself, named `tutorial_refgenie.yaml`](https://github.com/databio/pepatac/blob/master/examples/tutorial/tutorial_refgenie.yaml).  This configuration file also points to our sample.  In this case, we've provided a sample for you with the pipeline.  You don't have to do anything else at this point and may [skip right to running the sample if you'd like](tutorial.md#3-using-looper-to-run-the-pipeline).  Otherwise, we'll briefly touch on what those configuration files look like.
You can open the configuration file in your favorite text editor if you'd like to look closer.  For the purposes of the tutorial you may safely move past this step should you choose.
```console
nano tutorial_refgenie.yaml
```
The following is what you should see in that configuration file.
```console
name: PEPATAC_tutorial

pep_version: 2.0.0
sample_table: tutorial.csv

looper:
  output_dir: "${TUTORIAL}/processed/"
  pipeline_interfaces: ["${TUTORIAL}/tools/pepatac/project_pipeline_interface.yaml"]

sample_modifiers:
  append:
    pipeline_interfaces: ["${TUTORIAL}/tools/pepatac/sample_pipeline_interface.yaml"]
  derive:
    attributes: [read1, read2]
    sources:
      # Obtain tutorial data from http://big.databio.org/pepatac/ then set
      # path to your local saved files
      R1: "${TUTORIAL}/tools/pepatac/examples/data/{sample_name}_r1.fastq.gz"
      R2: "${TUTORIAL}/tools/pepatac/examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        prealignment_names: ["rCRSd"]
        deduplicator: samblaster # Default. [options: picard]
        trimmer: skewer          # Default. [options: pyadapt, trimmomatic]
        peak_type: fixed         # Default. [options: variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```
There is also a sample annotation file referenced in our configuration file.  The sample annotation file contains metadata and other information about our sample. Just like before, [this file, named `tutorial.csv` has been provided](https://github.com/databio/pepatac/blob/master/examples/tutorial/tutorial.csv).  You may check it out if you wish, otherwise we're all set.
If you open `tutorial.csv`, you should see the following:
```console
sample_name,protocol,organism,read1,read2,read_type
tutorial1,ATAC,human,R1,R2,paired
tutorial2,ATAC,human,R1,R2,paired
```
That's it! Let's analyze that sample!

## 5: Using `looper` to run the sample processing pipeline
Looper requires a few variables and configuration files to work for the specific user. Let's get those set up now. `Looper` uses [`divvy`](http://code.databio.org/divvy) to manage computing resource configuration so that projects and pipelines can easily travel among environments. For more detailed information, [check out the `looper` docs](https://looper.readthedocs.io/en/latest/cluster-computing/). Let's set it up.

We should still be in the `tools/` subdirectory, but let's move up one level.
```console
cd ../
touch compute_config.yaml
```
Open that file in your favorite text editor.  We'll add in the following example for running locally.  You'll need to edit this file further for your own setup and you can [learn more about that in the `looper` docs](https://looper.readthedocs.io/en/latest/index.html).
```console
nano compute_config.yaml
```
Paste the following into compute_config.yaml
```console
adapters:
  CODE: looper.command
  JOBNAME: looper.job_name
  CORES: compute.cores
  LOGFILE: looper.log_file
  TIME: compute.time
  MEM: compute.mem

compute_packages:
  default:
    submission_template: templates/localhost_template.sub
    submission_command: sh
```
Now, let's close and save that file and create an environment variable pointing to our configuration file.
```console
export DIVCFG="/path/to/pepatac_tutorial/compute_config.yaml"
```
(Remember to add `DIVCFG` to your `.bashrc` or `.profile` to ensure it persists).  
The `Looper` environment configuration file points to submission template(s) in order to know how to run a samples locally or using cluster resources.  If you'd like to learn more, check out the [`DIVCFG` configuration file and submission templates](http://code.databio.org/divvy). We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create [templates for cluster or container use as well](https://github.com/pepkit/divcfg/tree/master/templates)!
Let's change to our `templates/` directory to make our first submission template.
```console
cd templates/
nano localhost_template.sub
```             
Paste the following into the localhost_template.sub:
```console
#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE} --ignore-interrupts
```

Save and close that file, and change into the `tools/pepatac/` folder.
```console
cd ../tools/pepatac/
```
Now, we'll use `looper` to run the sample locally.
```console
looper run examples/tutorial/tutorial.yaml
```         
Congratulations! Your first samples should be running through the pipeline now. For both samples to run locally should take 30-50 minutes in total depending on your system.

After the pipeline is finished, we can look through the output directory together.  We've provided an example breakdown of just such a directory in the [browse output page](browse_output.md).

## 6: Use `looper` to run the project level pipeline
The pipeline also includes project level analyses that work on all samples concurrently.  This allows for analyses that require output produced by individual sample analysis. We'll run the project analysis much like we run the sample analysis:
```console
looper runp examples/tutorial/tutorial_refgenie.yaml
```
This should take about a minute on the tutorial samples and will generate a `summary/` directory containing project level output in the parent project directory.  You can [browse the tutorial data](browse_output.md) to see the example output.

## 7: Generate an `HTML` report using `looper`

Let's take full advantage of `looper` and generate a pipeline `HTML` report that makes all our results easy to view and browse.  If you'd like to skip right to the results and see what it looks like, [check out the tutorial results](files/examples/tutorial/PEPATAC_tutorial_summary.html).  Otherwise, let's generate a report ourselves.

Using our same configuration file we used to run the samples through the pipeline, we'll now employ the `report` function of `looper`.
```console
looper report examples/tutorial/tutorial.yaml
```         
That's it! Easy, right? `Looper` conveniently provides you with the location where the HTML report is produced.  You may either open the report with your preferred internet browser using the PATH returned with `looper report`, or we can change directories to the report's location and open it there.  Let's go ahead and change into the directory that contains the report.
```console
cd $TUTORIAL/processed/
firefox PEPATAC_tutorial_summary.html
```          
The `HTML` report contains a summary page that integrates the project level summary table and any project level objects including: raw aligned reads, percent aligned reads, TSS enrichment scores, and library complexity plots.  The status page lists all the samples in this project along with their current status, a link to their log files, the time it took to run the sample and the peak memory used during the run.  The objects page provides links to separate pages for each object type.  On each object page, all the individual samples' objects are provided.  Similarly, the samples page contains links to individual pages for each sample.  The sample pages list the individual summary statistics for that sample as well as links to log files, command logs, and summary files.  The sample pages also provide links and thumbnails for any individual objects generated for that sample.  Of course, all of these files are present in the sample directory, but the report provides easy access to them all.

# Tutorial using manually downloaded and curated genome assets

## 1: Set up folders

From an open terminal, let's first create a directory we'll use to run through this guide:
```console
mkdir pepatac_tutorial
```

Let's point an environment variable to our tutorial location (change to match your local path) to link our tutorial samples with your local environment.
```console
export TUTORIAL=/path/to/your/pepatac_tutorial
```

Let's move into our newly created directory and create a few more folders that we'll use later.
```console
cd pepatac_tutorial/
mkdir data
mkdir genomes
mkdir processed
mkdir templates
mkdir tools
cd tools/
```

Time to get PEPATAC!
```console
git clone https://github.com/databio/pepatac.git
```
Success! If you had any issues, feel free to [reach out to us with questions](contact.md).  Otherwise, let's move on to installing additional software.


## 2: Download tutorial read files

We're going to work with some files a little larger than the test data included in the pipeline so we can see all the features included in a full run of the pipeline.  Go ahead and download the [tutorial fastq files](http://big.databio.org/pepatac/). 
```console
wget http://big.databio.org/pepatac/tutorial1_r1.fastq.gz
wget http://big.databio.org/pepatac/tutorial1_r2.fastq.gz
wget http://big.databio.org/pepatac/tutorial2_r1.fastq.gz
wget http://big.databio.org/pepatac/tutorial2_r2.fastq.gz
```

To simplify the rest of this tutorial, let's put those files in a standard location we'll use for the rest of this guide. 
```console
mv tutorial1_r1.fastq.gz pepatac/examples/data/
mv tutorial1_r2.fastq.gz pepatac/examples/data/
mv tutorial2_r1.fastq.gz pepatac/examples/data/
mv tutorial2_r2.fastq.gz pepatac/examples/data/
```

### 2: Get genome assets

We [recommend `refgenie` to manage all required and optional genome assets](run-bulker.md#2a-initialize-refgenie-and-download-assets). However, [`PEPATAC` can also accept file paths to any of the assets](run-bulker.md#2b-download-assets).


## 4: Configure project files

We're going to use `looper` to analyze our data.  For that, we need to pass looper a configuration file.  This project config file describes your project. See [`looper` docs](https://looper.readthedocs.io/en/latest/) for details. A [configuration file has been provided for you in the pipeline repository itself, conveniently named `tutorial.yaml`](https://github.com/databio/pepatac/blob/master/examples/tutorial/tutorial.yaml).  This configuration file also points to our sample.  In this case, we've provided a sample for you with the pipeline.  You don't have to do anything else at this point and may [skip right to running the sample if you'd like](tutorial.md#3-using-looper-to-run-the-pipeline).  Otherwise, we'll briefly touch on what those configuration files look like.
You can open the configuration file in your favorite text editor if you'd like to look closer.  For the purposes of the tutorial you may safely move past this step should you choose.
```console
nano tutorial.yaml
```
The following is what you should see in that configuration file.
```console
name: PEPATAC_tutorial

pep_version: 2.0.0
sample_table: tutorial.csv

looper:
  output_dir: "${TUTORIAL}/processed/"
  pipeline_interfaces: ["${TUTORIAL}/tools/pepatac/project_pipeline_interface.yaml"]

sample_modifiers:
  append:
    pipeline_interfaces: ["${TUTORIAL}/tools/pepatac/sample_pipeline_interface.yaml"]
  derive:
    attributes: [read1, read2]
    sources:
      # Obtain tutorial data from http://big.databio.org/pepatac/ then set
      # path to your local saved files
      R1: "${TUTORIAL}/tools/pepatac/examples/data/{sample_name}_r1.fastq.gz"
      R2: "${TUTORIAL}/tools/pepatac/examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        genome_index: default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4
        chrom_sizes: default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.chrom.sizes
        prealignment_index: ["rCRSd=default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4"]
        deduplicator: samblaster # Default. [options: picard]
        trimmer: skewer          # Default. [options: pyadapt, trimmomatic]
        peak_type: fixed         # Default. [options: variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```
There is also a sample annotation file referenced in our configuration file.  The sample annotation file contains metadata and other information about our sample. Just like before, [this file, named `tutorial.csv` has been provided](https://github.com/databio/pepatac/blob/master/examples/tutorial/tutorial.csv).  You may check it out if you wish, otherwise we're all set.
If you open `tutorial.csv`, you should see the following:
```console
sample_name,protocol,organism,read1,read2,read_type
tutorial1,ATAC,human,R1,R2,paired
tutorial2,ATAC,human,R1,R2,paired
```
That's it! Let's analyze that sample!


## 5: Using `looper` to run the sample processing pipeline
Looper requires a few variables and configuration files to work for the specific user. Let's get those set up now. `Looper` uses [`divvy`](http://code.databio.org/divvy) to manage computing resource configuration so that projects and pipelines can easily travel among environments. For more detailed information, [check out the `looper` docs](https://looper.readthedocs.io/en/latest/cluster-computing/). Let's set it up.

We should still be in the `tools/` subdirectory, but let's move up one level.
```console
cd ../
touch compute_config.yaml
```
Open that file in your favorite text editor.  We'll add in the following example for running locally.  You'll need to edit this file further for your own setup and you can [learn more about that in the `looper` docs](https://looper.readthedocs.io/en/latest/index.html).
```console
nano compute_config.yaml
```
Paste the following into compute_config.yaml
```console
adapters:
  CODE: looper.command
  JOBNAME: looper.job_name
  CORES: compute.cores
  LOGFILE: looper.log_file
  TIME: compute.time
  MEM: compute.mem

compute_packages:
  default:
    submission_template: templates/localhost_template.sub
    submission_command: sh
```
Now, let's close and save that file and create an environment variable pointing to our configuration file.
```console
export DIVCFG="/path/to/pepatac_tutorial/compute_config.yaml"
```
(Remember to add `DIVCFG` to your `.bashrc` or `.profile` to ensure it persists).  
The `Looper` environment configuration file points to submission template(s) in order to know how to run a samples locally or using cluster resources.  If you'd like to learn more, check out the [`DIVCFG` configuration file and submission templates](http://code.databio.org/divvy). We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create [templates for cluster or container use as well](https://github.com/pepkit/divcfg/tree/master/templates)!
Let's change to our `templates/` directory to make our first submission template.
```console
cd templates/
nano localhost_template.sub
```             
Paste the following into the localhost_template.sub:
```console
#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE} --ignore-interrupts
```

Save and close that file, and change into the `tools/pepatac/` folder.
```console
cd ../tools/pepatac/
```
Now, we'll use `looper` to run the sample locally.
```console
looper run examples/tutorial/tutorial.yaml
```         
Congratulations! Your first samples should be running through the pipeline now. For both samples to run locally should take 30-50 minutes in total depending on your system.

After the pipeline is finished, we can look through the output directory together.  We've provided an example breakdown of just such a directory in the [browse output page](browse_output.md).

## 6: Use `looper` to run the project level pipeline
The pipeline also includes project level analyses that work on all samples concurrently.  This allows for analyses that require output produced by individual sample analysis. We'll run the project analysis much like we run the sample analysis:
```console
looper runp examples/tutorial/tutorial.yaml
```
This should take about a minute on the tutorial samples and will generate a `summary/` directory containing project level output in the parent project directory.  You can [browse the tutorial data](browse_output.md) to see the example output.

## 7: Generate an `HTML` report using `looper`

Let's take full advantage of `looper` and generate a pipeline `HTML` report that makes all our results easy to view and browse.  If you'd like to skip right to the results and see what it looks like, [check out the tutorial results](files/examples/tutorial/PEPATAC_tutorial_summary.html).  Otherwise, let's generate a report ourselves.

Using our same configuration file we used to run the samples through the pipeline, we'll now employ the `report` function of `looper`.
```console
looper report examples/tutorial/tutorial.yaml
```         
That's it! Easy, right? `Looper` conveniently provides you with the location where the HTML report is produced.  You may either open the report with your preferred internet browser using the PATH returned with `looper report`, or we can change directories to the report's location and open it there.  Let's go ahead and change into the directory that contains the report.
```console
cd $TUTORIAL/processed/
firefox PEPATAC_tutorial_summary.html
```          
The `HTML` report contains a summary page that integrates the project level summary table and any project level objects including: raw aligned reads, percent aligned reads, TSS enrichment scores, and library complexity plots.  The status page lists all the samples in this project along with their current status, a link to their log files, the time it took to run the sample and the peak memory used during the run.  The objects page provides links to separate pages for each object type.  On each object page, all the individual samples' objects are provided.  Similarly, the samples page contains links to individual pages for each sample.  The sample pages list the individual summary statistics for that sample as well as links to log files, command logs, and summary files.  The sample pages also provide links and thumbnails for any individual objects generated for that sample.  Of course, all of these files are present in the sample directory, but the report provides easy access to them all.
