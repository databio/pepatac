# <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> pipeline step-by-step guide

Welcome to the `PEPATAC` extended tutorial! Use this to learn the ropes. We'll use a provided ATAC-seq dataset and run through the step-by-step process of setting up the configuration files, running the pipeline, and looking over the results together. To use this tutorial, you should have a basic familiarity with [working in a command line driven environment](http://matt.might.net/articles/basic-unix/). You also need to have already installed `PEPATAC` prerequisites, which you can do following the [install instructions](install.md).

## 1: Set up folders

From an open terminal, let's first create a directory we'll use to run through this guide:
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
Success! If you had any issues, feel free to [reach out to us with questions](contact.md).  Otherwise, let's move on to installing additional software.


## 2: Download tutorial read files

We're going to work with some files a little larger than the test data included in the pipeline so we can see all the features included in a full run of the pipeline.  Go ahead and download the [tutorial_r1.fastq.gz](http://big.databio.org/pepatac/tutorial_r1.fastq.gz) and [tutorial_r2.fastq.gz](http://big.databio.org/pepatac/tutorial_r2.fastq.gz) files. 
```console
wget http://big.databio.org/pepatac/tutorial_r1.fastq.gz
wget http://big.databio.org/pepatac/tutorial_r2.fastq.gz
```

To simplify the rest of this tutorial, let's put those files in a standard location we'll use for the rest of this guide. 
```console
mv tutorial_r1.fastq.gz pepatac/examples/data/
mv tutorial_r2.fastq.gz pepatac/examples/data/
```

## 3: Configure project files

We're going to use `looper` to analyze our data.  For that, we need to pass looper a configuration file.  This project config file describes your project. See [`looper` docs](https://looper.readthedocs.io/en/latest/) for details. A configuration file has been provided for you in the pipeline itself, conveniently named `tutorial.yaml`.  This configuration file also points to our sample.  In this case, we've provided a sample for you with the pipeline.  You don't have to do anything else at this point and may [skip right to running the sample if you'd like](tutorial.md#3-using-looper-to-run-the-pipeline).  Otherwise, we'll briefly touch on what those configuration files look like.
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
      prealignments: rCRSd human_repeats
      deduplicator: samblaster # Default. [options: picard]
      trimmer: skewer          # Default. [options: pyadapt, trimmomatic]
      peak_type: variable      # Default. [options: fixed]
      extend: 250              # Default. For fixed-width peaks, extend this distance up- and down-stream.
      frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
      blacklist: $GENOMES/hg38/hg38.blacklist.bed.gz

pipeline_args:
#  peppro.py:
#    "--motif": null      # Default is FALSE. Pass flag to perform motif analysis (requires Homer)
#    "--prioritize": null # Default is FALSE. Pass flag to priority rank the features by order in feat_annotation asset
#    "--keep": null       # Default is FALSE. Pass flag to keep prealignment BAM files.
#    "--noFIFO": null     # Default is FALSE. Pass flag to NOT use named pipes during prealignments.
#    "--lite": null       # Default is FALSE. Pass flag to only keep minimal, essential output to conserve disk space.

```
There is also a sample annotation file referenced in our configuration file.  The sample annotation file contains metadata and other information about our sample. Just like before, this file, named `tutorial.csv` has been provided.  You may check it out if you wish, otherwise we're all set.
If you open `tutorial.csv`, you should see the following:
```
sample_name,protocol,organism,read1,read2,read_type
tutorial,ATAC,human,tutorial_r1,tutorial_r2,paired
```
That's it! Let's analyze that sample!


## 4: Using `looper` to run the pipeline
Looper requires a few variables and configuration files to work for the specific user. Let's get those set up now. `Looper` uses [`divvy`](http://code.databio.org/divvy) to manage computing resource configuration so that projects and pipelines can easily travel among environments. For more detailed information, [check out the `looper` docs](https://looper.readthedocs.io/en/latest/cluster-computing/). Let's set it up.

```
cd /path/to/pepatac_tutorial/
touch compute_config.yaml
```
Open that file in your favorite text editor.  We'll add in the following example for running locally.  You'll need to edit this file further for your own setup and you can [learn more about that in the `looper` docs](https://looper.readthedocs.io/en/latest/index.html).
```
nano compute_config.yaml
```
Paste the following into compute_config.yaml
```
compute:
  default:
    submission_template: templates/localhost_template.sub
    submission_command: sh
```
Now, let's close and save that file and create an environment variable pointing to our configuration file.
```
export DIVCFG="/path/to/pepatac_tutorial/compute_config.yaml"
```
(Remember to add `DIVCFG` to your `.bashrc` or `.profile` to ensure it persists).  
The `Looper` environment configuration file points to submission template(s) in order to know how to run a samples locally or using cluster resources.  If you'd like to learn more, check out the [`DIVCFG` configuration file and submission templates](http://code.databio.org/divvy). We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create [templates for cluster or container use as well](https://github.com/pepkit/divcfg/tree/master/templates)!
Let's change to our `templates/` directory to make our first submission template.
```
cd /path/to/pepatac_tutorial/templates/
nano localhost_template.sub
```             
Paste the following into the localhost_template.sub:
```
#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE} --ignore-interrupts
```
Save and close that file, and return to our main tutorial directory.
```
cd ../
```
Now, we'll use `looper` to run the sample locally.
```
looper run tutorial.yaml
```         
Congratulations! Your first sample should be running through the pipeline now.

After the pipeline is finished, we can look through the output directory together.  We've provided a breakdown of that directory in the [browse output page](/browse_output/).


## 5: Generate an `HTML` report using `looper`

Let's take full advantage of `looper` and generate a pipeline `HTML` report that makes all our results easy to view and browse.  If you'd like to skip right to the results and see what it looks like, [check out the tutorial results](../files/examples/tutorial/tutorial_summary.html).  Otherwise, let's generate a report ourselves.
Using our same configuration file we used to run the samples through the pipeline, we'll now employ the `summarize` function of `looper`.
```
looper summarize tutorial.yaml
```         
That's it! Easy, right? `Looper` conveniently provides you with the location where the HTML report is produced.  You may either open the report with your preferred internet browser using the PATH provided, or we can change directories to the report's location and open it there.  Let's go ahead and change into the directory that contains the report.
```
cd /path/to/pepatac_tutorial/processed/tutorial/
firefox tutorial_summary.html
```          
The `HTML` report contains a summary page that integrates the project level summary table and any project level objects including: raw aligned reads, percent aligned reads, and TSS enrichment scores.  The status page lists all the samples in this project along with their current status, a link to their log files, the time it took to run the sample and the peak memory used during the run.  The objects page provides links to separate pages for each object type.  On each object page, all the individual samples' objects are provided.  Similarly, the samples page contains links to individual pages for each sample.  The sample pages list the individual summary statistics for that sample as well as links to log files, command logs, and summary files.  The sample pages also provide links and thumbnails for any individual objects generated for that sample.  Of course, all of these files are present in the sample directory, but the report provides easy access to them all.
