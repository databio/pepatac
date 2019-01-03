---
layout: toc_page
title: Tutorial
permalink: /tutorial/
tags: nav
---

<div class="container">
  <div class="row">
    <!-- sidebar, which will move to the top on a small screen -->
    <div class="col-sm-3">
      <nav id="toc" data-toggle="toc" class="sticky-top"></nav>
    </div>
    <!-- main content area -->
    <div class="col-sm-9">
      <div class="container">
        <div id="intro">
          <p></p>
          <h2><img src="{{ "/assets/images/logo_pepatac_black.png" | prepend: site.baseurl }}" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"> pipeline step-by-step guide</h2>
          <p>Welcome to the <code class="language-python">PEPATAC</code> pipeline tutorial! Use this project to learn the ropes. We'll use a provided ATAC-seq dataset and run through the step-by-step process of getting <code class="language-python">PEPATAC</code> up and running including: installing <code class="language-python">PEPATAC</code> and its requirements, setting up the configuration files, running the pipeline, and looking over the results together.</p>
          <p>To use this tutorial, you should have a basic familiarity with working in a command line driven environment. If you need or would like a quick refresher, check out this <a href="http://matt.might.net/articles/basic-unix/">guide</a>.</p>
        </div><!-- /.intro -->
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-install" data-offset="100" class="scrollspy">
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-install-1"><strong>1.1: <code class="language-python">PEPATAC</code> pipeline</strong></h4>
            <p>To begin, we need to get the <code class="language-python">PEPATAC</code> pipeline itself.  The pipeline is hosted on <a href="https://github.com/databio/pepatac">github</a>.  If you don't have git installed, they have installation instructions located <a href="https://git-scm.com/download/linux">here</a>, and a brief introduction to git can be found <a href="https://guides.github.com/introduction/git-handbook/">here</a>. To install the pipeline, you can use one of the following methods:</p>
            <ul>
              <li>using SSH:<pre><code class="language-git">git clone git@github.com:databio/pepatac.git</code></pre></li>
              <li>using HTTPS:<pre><code class="language-git">git clone https://github.com/databio/pepatac.git</code></pre></li>
            </ul>
            <p>We'll use SSH in this example.  From an open terminal, let's first create a directory we'll use to run through this guide:
            <pre><code class="language-bash">mkdir pepatac_tutorial</code></pre>
            </p>
            <p>Let's move into our newly created directory and create a few more folders that we'll use later.
            <pre><code class="language-bash">cd pepatac_tutorial/
mkdir data
mkdir genomes
mkdir processed
mkdir templates
mkdir tools
cd tools/</code></pre>
            </p>
            <p>Time to get PEPATAC!</p>
            <pre><code class="language-git">git clone git@github.com:databio/pepatac.git</code></pre>
            <p>Success! If you had any issues, feel free to <a href="#contact">reach out to us with questions</a>.  Otherwise, let's move on to installing additional <a href="#list-install-2">required</a> and <a href="#list-install-3">optional</a> software.</p>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-install-2"><strong>1.2: Install required software</strong></h4>
            <p>You have two options for installing the software prerequisites: 1) use a container, in which case you need only either <code>docker</code> or <code>singularity</code>; or 2) install all prerequisites natively. If you want to install it natively, skip to the <a href="#list-install-2.2">native installation instructions</a>.</p>
            <hr>
            <h5 style="padding-top: 80px; margin-top: -80px;" id="list-install-2.1"><strong>1.2.1 (ALT): Use containers!</strong></h5>
              <p>First, make sure your environment is set up to run either docker or singularity containers. Then, pull the container image:</p>
              <h6><b>Docker</b></h6>
              <p>You can pull the docker image from <a href="https://hub.docker.com/r/databio/pepatac/">dockerhub</a> like this:
              <pre><code class="language-bash">docker pull databio/pepatac</code></pre>
              </p>
              <p>Or build the image using the included Dockerfile (you can use a recipe in the included Makefile):</p>
              <pre><code class="language-bash">cd pepatac/
make docker</code></pre>
              <h6><b>Singularity</b></h6>
              <p>You can download the singularity image <a href="http://big.databio.org/simages/pepatac">here</a> or build it from the docker image following the recipe in the Makefile:</p>
              <pre><code class="language-bash">cd pepatac/
make singularity</code></pre>
              <p>Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called <code class="language-bash">$SIMAGES</code> that points to the folder where your image is stored, or you can tweak the <code class="language-yaml">pipeline_interface.yaml</code> file so that the <code class="language-yaml">compute.singularity_image</code> attribute is pointing to the right location on disk.</p>
            <hr>
            <h5 style="padding-top: 80px; margin-top: -80px;" id="list-install-2.2"><strong>1.2.2: Install software requirements natively</strong></h5>                      
              <p>To use <code class="language-python">PEPATAC</code>, we need the following software:</p>
              <p><b>Python packages</b>. The pipeline uses <a href="http://pypiper.readthedocs.io/en/latest/">pypiper</a> to run a single sample, <a href="http://looper.readthedocs.io/en/latest/">looper</a> to handle multi-sample projects (for either local or cluster computation), and <a href="https://github.com/databio/pararead">pararead</a> for parallel processing sequence reads. For peak calling, the pipeline uses <a href="http://liulab.dfci.harvard.edu/MACS/">MACS2</a> as the default. You can do a user-specific install of these like this:
              <pre><code class="language-python">pip install --user numpy pandas piper https://github.com/pepkit/looper/zipball/master \
    pararead MACS2</code></pre>
              </p>
              <p><b>Required executables</b>. We will need some common bioinformatics tools installed. The complete list (including optional tools) is specified in the pipeline configuration file (pipelines/pepatac.yaml) tools section.
                The following tools are used by the pipeline:       
              <ul>
                <li><a href="http://bedtools.readthedocs.io/en/latest/">bedtools (v2.25.0+)</a></li>
                <li><a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">bowtie2 (v2.2.9+)</a></li>
                <li><a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">fastqc (v0.11.5+)</a></li>
                <li><a href="https://github.com/GregoryFaust/samblaster">samblaster (v0.1.24+)</a></li>
                <li><a href="http://www.htslib.org/">samtools (v1.7)</a></li>
                <li><a href="https://github.com/relipmoc/skewer">skewer (v0.1.126+)</a></li>
                <li><a href="">UCSC tools (v3.5.1)</a></li>
                  <ul>
                    <li><a href="https://www.encodeproject.org/software/bedgraphtobigwig/">bedGraphToBigWig (v4)</a></li>
                    <li><a href="https://www.encodeproject.org/software/wigtobigwig/">wigToBigWig (v4)</a></li>
                    <li><a href="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/">bigWigCat (v4)</a></li>
                    <li><a href="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/">bedSort</a></li>
                    <li><a href="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/">bedToBigBed</a></li>
                  </ul>
              </ul>
              </p>
              <p>We'll install each of these pieces of software before moving forward.  Let's start right at the beginning and install <samp>bedtools</samp>.  We're going to install from source, but if you would prefer to install from a package manager, you can follow the instructions on bedtools' installation <a href="http://bedtools.readthedocs.io/en/latest/content/installation.html">guide</a>.
              <pre><code class="language-bash">cd tools/
wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
tar -zxvf bedtools-2.25.0.tar.gz
rm bedtools-2.25.0.tar.gz
cd bedtools2
make</code></pre>
              </p>      
              <p>Now, let's add <code class="language-bash">bedtools</code> to our <code class="language-bash">PATH</code> environment variable.  If you are unfamiliar with the concept of environment variables, check out <a href="https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps">this</a> introduction.</p>
              <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/bedtools2/bin/"</code></pre>
              <p>Next, let's install <samp>bowtie2</samp>.</p>
              <pre><code class="language-bash">cd ../
wget https://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.3.4.1/bowtie2-2.3.4.1-source.zip
unzip bowtie2-2.3.4.1-source.zip
rm bowtie2-2.3.4.1-source.zip
cd bowtie2-2.3.4.1
make</code></pre>
              <p>Again, let's add <code>bowtie2</code> to our <code class="language-bash">PATH</code> environment variable:</p>
              <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/bowtie2-2.3.4.1/"</code></pre>
              <p>Great! On to the next one. Let's get <code class="language-bash">FastQC</code>.  Reminder, you will need to have <code class="language-java">java</code> installed to use <code class="language-bash">FastQC</code>.  At the command prompt, you can type <code class="language-java">java -version</code>, press enter, and if you don't see an error you should be alright.  You'll need a version greater than 1.6 to work with <code class="language-bash">FastQC</code>.  Read more from the <code class="language-bash">FastQC</code> installation instructions <a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/INSTALL.txt">here</a>.</p>
              <pre><code class="language-bash">cd ../
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
unzip fastqc_v0.11.7.zip
rm fastqc_v0.11.7.zip</code></pre>
              <p>We also need to make the FastQC wrapper executable. To learn more about this, check out this introduction to <a href="https://www.howtoforge.com/tutorial/linux-chmod-command/">chmod</a>.</p>
              <pre><code class="language-bash">chmod 755 FastQC/fastqc</code></pre>
              <p>Add <code class="language-bash">FastQC</code> to our <code class="language-bash">PATH</code> environment variable:</p>
              <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/FastQC/"</code></pre>
              <p>Now we'll get <code class="language-cpp">samblaster</code>.  For a full guide, check out the <a href="https://github.com/GregoryFaust/samblaster/"><code class="language-cpp">samblaster</code> installation instructions</a>.</p>
              <pre><code class="language-git">git clone git://github.com/GregoryFaust/samblaster.git</code></pre>
              <pre><code class="language-bash">cd samblaster/</code></pre>
              <pre><code class="language-bash">make</code></pre>
              <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/samblaster/"</code></pre>
              <p>Next up, <code class="language-bash">samtools</code>.</p>
              <pre><code class="language-bash">wget https://sourceforge.net/projects/samtools/files/samtools/1.9/samtools-1.9.tar.bz2
tar xvfj samtools-1.9.tar.bz2
rm samtools-1.9.tar.bz2
cd samtools-1.9
/configure</code></pre>
              <p>Alternatively, if you do not have the ability to install <code class="language-bash">samtools</code> to the default location, you can specify using the <code class="language-bash">--prefix=/install/destination/dir/</code> option.  Learn more about this option <a href="http://samtools.github.io/bcftools/howtos/install.html">here</a>.</p>
              <pre><code class="language-bash">make
make install</code></pre>      
              <p>As for our other tools, add <code class="language-bash">samtools</code> to our <code class="language-bash">PATH</code> environment variable:</p>
              <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/samtools-1.9/"</code></pre>
              <p>Time to add <code class="language-bash">skewer</code> to the collection.</p>
              <pre><code class="language-bash">cd ../
wget https://downloads.sourceforge.net/project/skewer/Binaries/skewer-0.2.2-linux-x86_64
mv skewer-0.2.2-linux-x86_64 skewer
chmod 755 skewer</code></pre>
              <p>Finally, we need a few of the UCSC utilities.  You can install the <a href="https://github.com/ENCODE-DCC/kentUtils">entire set of tools</a> should you choose, but here we'll just grab the subset that we need.</p>
              <pre><code class="language-bash">wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigCat
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
chmod 755 bedGraphToBigWig
chmod 755 wigToBigWig
chmod 755 bigWigCat
chmod 755 bedToBigBed</code></pre>
              <p>Add our <code class="language-bash">tools/</code> directory to our <code class="language-bash">PATH</code> environment variable.</p>
              <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/"</code></pre>
              <p>That should do it!  Now we'll <a href="#list-install-3">install some <b>optional</b> packages</a>.  Of course, these are not required, but for the purposes of this tutorial we're going to be completionists.</p>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-install-3"><strong>1.3: Install optional software</strong></h4>
            <p><code class="language-bash">PEPATAC</code> uses <code class="language-r">R</code> to generate quality control plots.  These are <b>optional</b> and the pipeline will run without them, but you would not get any QC plots.  If you need to don't have <a href="https://cran.r-project.org/doc/manuals/r-release/R-admin.html">R installed, you can follow these instructions</a>.  We'll use and install the necessary packages in this example.  Here is the list of required packages:</p>
            <ul>
              <li>argparser (v0.4)</li>
              <li>data.table (v1.11.2)</li>
              <li>devtools (v1.13.6)</li>
              <li>GenomicRanges (v1.30.3)</li>
              <li>GenomicDistributions (v0.5)</li>
              <li>ggplot2 (v2.2.1)</li>
              <li>ggrepel (v0.8.0)</li>
              <li>gplots (v3.0.1)</li>
              <li>gtable (v0.2.0)</li>
              <li>pepr (v0.0.2)</li>
              <li>scales (v0.5.0)</li>
            </ul>
            <p>To install the needed packages, enter the following command:</p>
            <pre><code class="language-bash">Rscript -e "install.packages(c('argparser','devtools', 'data.table', 'ggrepel', 'ggplot2', 'gplots', 'gtable', 'scales'), repos='http://cran.us.r-project.org/'); source('https://bioconductor.org/biocLite.R'); biocLite('GenomicRanges'); devtools::install_github(c('pepkit/pepr', 'databio/GenomicDistributions'))"</code></pre>
            <p>To extract files quicker, <code class="language-bash">PEPATAC</code> can also utilize <code class="language-bash">pigz</code> in place of <code class="language-bash">gzip</code> if you have it installed.  Let's go ahead and do that now. It's not required, but it can help speed everything up when you have many samples to process.</p>
            <pre><code class="language-bash">cd /path/to/pepatac_tutorial/tools/
wget http://zlib.net/pigz/pigz-2.4.tar.gz
tar xvfz pigz-2.4.tar.gz
rm pigz-2.4.tar.gz
cd pigz-2.4/
make</code></pre>
            <p>Don't forget to add this to your <code class="language-bash">PATH</code> too!</p>
            <pre><code class="language-bash">export PATH="$PATH:/path/to/pepatac_tutorial/tools/pigz-2.4/"</code></pre>
            <p>That's it! Everything we need to run <code class="language-bash">PEPATAC</code> to its full potential should be installed.  If you are interested and have experience using containers, you can check out the <a href="#list-install-5">alternate installation methods</a>.</p>
          <hr>
          <h4 id="list-install-4"><strong>1.4: Create environment variables</strong></h4>
            <p>We also need to create some environment variables to help point <code>looper</code> to where we keep our data files and our tools.  You may either set the environment variables up, like we're going to do now, or you may simply hard code the necessary locations in our configuration files.</p>
            <p>First, let's create a <code class="language-bash">PROCESSED</code> variable that represents the location where we want to save output.</p>
            <pre><code class="language-bash">export PROCESSED="/path/to/pepatac_tutorial/processed/"</code></pre>
            <p>Second, we'll create a variable representing the root path to all our tools named <code class="language-bash">CODEBASE</code>.</p>
            <pre><code class="language-bash">export CODEBASE="/path/to/pepatac_tutorial/tools/"</code></pre>
            <p>(Add these environment variables to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code> so you don't have to always do this step).</p>
            <p>Fantastic! Now that we have the pipeline and its requirements installed, we're ready to get our reference genome(s).</p>
        </div>
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-setup" data-offset="-50" class="scrollspy">
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-setup-1"><strong>2.1: Download a reference genome</strong></h4>
            <p>Before we analyze anything, we also need a reference genome.  <code class="language-bash">PEPATAC</code> uses <code>refgenie</code> genomes.  For the purposes of this tutorial, we'll just download pre-built genomes.  If you'd like to build your own, you can follow the instructions <a href="https://github.com/databio/refgenie">here</a>. First, let's change into our <code class="language-bash">genomes/</code> folder.</p>
            <pre><code class="language-bash">cd /path/to/pepatac_tutorial/genomes/
wget http://big.databio.org/refgenomes/hg38.tgz
wget http://cloud.databio.org.s3.amazonaws.com/refgenomes/human_repeats_170502.tgz
wget http://cloud.databio.org.s3.amazonaws.com/refgenomes/rCRSd_170502.tgz
tar xvfz hg38.tgz
tar xvfz human_repeats_170502.tgz
tar xvfz rCRSd_170502.tgz
rm hg38.tgz
rm human_repeats_170502.tgz
rm rCRSd_170502.tgz</code></pre>
            <p>Let's also create another environment variable that points to our genomes.</p>
            <pre><code class="language-bash">export GENOMES="/path/to/pepatac_tutorial/genomes/</code></pre>
            <p>(Don't forget to add this to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code> to ensure it persists).</p>
            <p>Finally, in order to calculate TSS enrichments, you will need a TSS annotation file in your reference genome directory.  Let's do that now.</p>
            <pre><code class="language-bash">wget -O hg38_TSS_full.txt.gz http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz \
zcat hg38_TSS_full.txt.gz | \
    awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}' | \
    LC_COLLATE=C sort -k1,1 -k2,2n -u > hg38_TSS.tsv</code></pre>              
            <p>Alright! Time to setup the pipeline configuration files and run our sample.</p>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-setup-2"><strong>2.2: Configure project files</strong></h4>
            <p>We're going to use <code>looper</code> to analyze our data.  For that, we need to pass looper a configuration file.  This project config file describes your project. See <a href="https://looper.readthedocs.io/en/latest/"><code>looper</code> docs</a> for details. A configuration file has been provided for you in the pipeline itself, conveniently named <code class="language-yaml">tutorial.yaml</code>.  This configuration file also points to our sample.  In this case, we've provided a sample for you with the pipeline.  You don't have to do anything else at this point and may <a href="#list-setup-3">skip right to running the sample if you'd like</a>.  Otherwise, we'll briefly touch on what those configuration files look like.</p>
            <p>You can open the configuration file in your favorite text editor if you'd like to look closer.  For the purposes of the tutorial you may safely move past this step should you choose.</p>
            <pre><code class="language-bash">nano tutorial.yaml</code></pre>
            <p>The following is what you should see in that configuration file.</p>
            <pre><code class="language-yaml">name: tutorial

metadata:
&nbsp;&nbsp;&nbsp;&nbsp;sample_annotation: tutorial.csv
&nbsp;&nbsp;&nbsp;&nbsp;output_dir: "$PROCESSED/tutorial/"
&nbsp;&nbsp;&nbsp;&nbsp;pipeline_interfaces: "$CODEBASE/pepatac/pipeline_interface.yaml"

derived_columns: [read1, read2]

data_sources:
&nbsp;&nbsp;&nbsp;&nbsp;tutorial_r1: "$CODEBASE/pepatac/examples/data/tutorial_r1.fastq.gz"
&nbsp;&nbsp;&nbsp;&nbsp;tutorial_r2: "$CODEBASE/pepatac/examples/data/tutorial_r2.fastq.gz"

implied_columns:
&nbsp;&nbsp;organism:
&nbsp;&nbsp;&nbsp;&nbsp;human:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;genome: hg38
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;macs_genome_size: hs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prealignments: rCRSd human_repeats</code></pre>
            <p>There is also an annotation file referenced in our configuration file.  The annotation file contains metadata and other information about our sample. Just like before, this file, named <code class="language-bash">tutorial.csv</code> has been provided.  You may check it out if you wish, otherwise we're all set.</p>
            <p>If you open <code class="language-bash">tutorial.csv</code>, you should see the following:</p>
            <pre><code class="language-bash">sample_name,protocol,organism,read1,read2,read_type
tutorial,ATAC,human,tutorial_r1,tutorial_r2,75,paired</code></pre>
            <p>That's it! Let's analyze that sample!</p>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-setup-3"><strong>2.3: Using <code>looper</code> to run the pipeline</strong></h4>
            <p>Looper requires a few variables and configuration files to work for the specific user. Let's get those set up now. One of those is an environment variable called <code class="language-bash">PEPENV</code> that points to the Looper environment configuration file. For more detailed information regarding this file, <a href="https://looper.readthedocs.io/en/latest/cluster-computing.html#pepenv-overview">check out the <code>looper</code>docs</a>. Let's set it up.</p>
            <pre><code class="language-bash">cd /path/to/pepatac_tutorial/
touch pepenv.yaml</code></pre>
            <p>Open that file in your favorite text editor.  We'll add in the following example for our environment.  You'll need to edit this file further for your own setup and you can learn more about that in the <a href="https://looper.readthedocs.io/en/latest/index.html"><code>looper</code> docs</a>.</p>
            <pre><code class="language-bash">nano pepenv.yaml</code></pre>
            <p>Paste the following into pepenv.yaml</p>
            <pre><code class="language-yaml">compute:
&nbsp;&nbsp;local:
&nbsp;&nbsp;&nbsp;&nbsp;submission_template: templates/localhost_template.sub
&nbsp;&nbsp;&nbsp;&nbsp;submission_command: sh</code></pre>
            <p>Now, let's close and save that file and create an environment variable pointing to our configuration file.</p>
            <pre><code class="language-bash">export PEPENV="/path/to/pepatac_tutorial/pepenv.yaml"</code></pre>
            <p>(Remember to add <code class="language-bash">PEPENV</code> to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code> to ensure it persists).</p>
            <p>The <code>Looper</code> environment configuration file points to submission template(s) in order to know how to run a sample or series of samples.  If you'd like to learn more, check out the <a href="https://github.com/pepkit/pepenv"><code class="language-bash">PEPENV</code> configuration file and submission templates</a>. We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create templates for cluster or container use as well!</p>
            <p>Let's change to our <code class="language-bash">templates/</code> directory to make our first submission template.</p>
            <pre><code class="language-bash">cd /path/to/pepatac_tutorial/templates/
touch localhost_template.sub
nano localhost_template.sub</code></pre>                
            <p>Paste the following into the localhost_template.sub:</p>
            <pre><code class="language-bash">#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE}</code></pre>
            <p>Save and close that file, and return to our main tutorial directory.</p>
            <pre><code class="language-bash">cd ../</code></pre>
            <p>Now, we'll use <code>looper</code> to run the sample locally.</p>
            <pre><code class="language-bash">looper run tutorial.yaml --compute local</code></pre>                
            <p>Congratulations! Your first sample should be running through the pipeline now.</p>
        </div>	
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-results" data-offset="-50" class="scrollspy">
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-results-1"><strong>3.1: Browse the output directory</strong></h4>
            <p>Now that our sample has finished running through the pipeline, we can look through the output directory together.  We've provided a breakdown of that directory below.</p>
              <div class="tree well" id="outFolder">
                <ul>
                    <li>
                        <span><i class="fas fa-folder-open"></i> tutorial/</span> <a href="">Parent directory for entire project</a>
                        <ul>
                            <li>
                              <span><i class="fas fa-minus-circle"></i> reports/</span> <a href="">HTML report pages</a>
                                <ul>
                                  <li>
                                      <span><i class="fas fa-file"></i> cumulative_frif.html</span> <a href="{{ "/assets/examples/tutorial/reports/cumulative_frif.html" | prepend: site.baseurl }}">Cumulative FRiF plots</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> fastq_report_r1.html</span> <a href="{{ "/assets/examples/tutorial/reports/fastqc_report_r1.html" | prepend: site.baseurl }}">FastQC reports for read 1's</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> fastq_report_r2.html</span> <a href="{{ "/assets/examples/tutorial/reports/fastqc_report_r2.html" | prepend: site.baseurl }}">FastQC reports for read 2's</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> fragment_distribution.html</span> <a href="{{ "/assets/examples/tutorial/reports/fragment_distribution.html" | prepend: site.baseurl }}">Fragment distribution plots</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> objects.html</span> <a href="{{ "/assets/examples/tutorial/reports/objects.html" | prepend: site.baseurl }}">Object page index</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> samples.html</span> <a href="{{ "/assets/examples/tutorial/reports/samples.html" | prepend: site.baseurl }}">Sample page index</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> status.html</span> <a href="{{ "/assets/examples/tutorial/reports/status.html" | prepend: site.baseurl }}">Sample status page</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> tss_enrichment.html</span> <a href="{{ "/assets/examples/tutorial/reports/tss_enrichment.html" | prepend: site.baseurl }}">TSS enrichment plots</a>
                                  </li>
                                  <li>
                                      <span><i class="fas fa-file"></i> tutorial.html</span> <a href="{{ "/assets/examples/tutorial/reports/tutorial.html" | prepend: site.baseurl }}">Tutorial sample page</a>
                                  </li>
                                </ul>
                            </li>
                            <li>
                              <span><i class="fas fa-minus-circle"></i> results_pipeline/</span> <a href="">Parent directory for individual sample results</a>
                                <ul>
                                  <li>
                                    <span><i class="fas fa-minus-circle"></i> tutorial/</span> <a href="">Directory containing tutorial pipeline results</a>
                                    <ul>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> aligned_hg38/</span> <a href="">Contains tutorial alignment and signal files</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> aligned_hg38_exact/</span> <a href="">Contains tutorial nucleotide-resolution signal files</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> fastq/</span> <a href="">Contains fastq files while the pipeline is running</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> fastqc/</span> <a href="">Contains FastQC HTML reports and data files</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> peak_calling_hg38/</span> <a href="">Contains peak caller results</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> prealignments/</span> <a href="">Contains prealignment aligned reads files and the unmapped fastq files after prealignment</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> QC_hg38/</span> <a href="">Contains tutorial quality control plots and files</a>
                                      </li>
                                      <li>
                                        <span><i class="fas fa-minus-circle"></i> raw/</span> <a href="">Contains symlinks to fastq files</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> objects.tsv</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/objects.tsv" | prepend: site.baseurl }}">File containing table of sample objects</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> PEPATAC_cleanup.sh</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/PEPATAC_cleanup.sh" | prepend: site.baseurl }}">Shell script to remove temporary files generated during the pipeline run</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> PEPATAC_commands.sh</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/PEPATAC_commands.sh" | prepend: site.baseurl }}">Shell script that contains list of the executed pipeline commands</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> PEPATAC_completed.flag</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/PEPATAC_completed.flag" | prepend: site.baseurl }}">Empty flag indicated pipeline completion</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> PEPATAC_log.md</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/PEPATAC_log.md" | prepend: site.baseurl }}">Sample log file from the pipeline run</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> PEPATAC_profile.tsv</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/PEPATAC_profile.tsv" | prepend: site.baseurl }}">File containing runtime of pipeline commands</a>
                                      </li>
                                      <li>
                                      <span><i class="fas fa-file"></i> stats.tsv</span> <a href="{{ "/assets/examples/tutorial/results_pipeline/tutorial/stats.tsv" | prepend: site.baseurl }}">Sample level summary statistics file</a>
                                      </li>
                                    </ul>
                                  </li>
                                </ul>
                            </li>
                            <li>
                              <span><i class="fas fa-minus-circle"></i> submission/</span> <a href="">Sample submission files and logs</a>
                              <ul>
                                <li>
                                    <span><i class="fas fa-file"></i> pepatac.py_tutorial.log</span> <a href="">Sample submission log</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> pepatac.py_tutorial.sub</span> <a href="">Completed sample submission template</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial.yaml</span> <a href="">Completed pipeline configuration file</a>
                                </li>
                              </ul>
                            </li>
                            <li>
                              <span><i class="fas fa-minus-circle"></i> summary/</span> <a href="">Pipeline level summary objects</a>
                              <ul>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial_alignmentPercent.pdf</span> <a href="{{ "/assets/examples/tutorial/summary/tutorial_alignmentPercent.pdf" | prepend: site.baseurl }}">Tutorial sample alignment percent plot</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial_alignmentPercent.png</span> <a href="{{ "/assets/files/examples/tutorial/summary/tutorial_alignmentPercent.png" | prepend: site.baseurl }}">Tutorial sample alignment percent plot thumbnail</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial_rawPercent.pdf</span> <a href="{{ "/assets/examples/tutorial/summary/tutorial_rawPercent.pdf" | prepend: site.baseurl }}">Tutorial sample raw alignment plot</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial_rawPercent.png</span> <a href="{{ "/assets/examples/tutorial/summary/tutorial_rawPercent.png" | prepend: site.baseurl }}">Tutorial sample raw alignment plot thumbnail</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial_TSSEnrichment.pdf</span> <a href="{{ "/assets/examples/tutorial/summary/tutorial_TSSEnrichment.pdf" | prepend: site.baseurl }}">Tutorial sample TSS enrichment plot</a>
                                </li>
                                <li>
                                    <span><i class="fas fa-file"></i> tutorial_TSSEnrichment.png</span> <a href="{{ "/assets/examples/tutorial/summary/tutorial_TSSEnrichment.png" | prepend: site.baseurl }}">Tutorial sample TSS enrichment plot</a>
                                </li>
                              </ul>
                            </li>
                            <li>
                              <span><i class="fas fa-file"></i> tutorial_stats_summary.tsv</span> <a href="{{ "/assets/examples/tutorial/tutorial_stats_summary.tsv" | prepend: site.baseurl }}">Project level summary statistics file</a>
                            </li>
                            <li>
                              <span><i class="fas fa-file"></i> tutorial_summary.html</span> <a href="{{ "/assets/examples/tutorial/tutorial_summary.html" | prepend: site.baseurl }}">Project HTML report</a>
                            </li>
                        </ul>
                    </li>
                </ul>
              </div>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-results-2"><strong>3.2: Generate an <code class="language-html">HTML</code> report using <code>looper</code></strong></h4>
            <p>Let's take full advantage of <code>looper</code> and generate a pipeline <code class="language-html">HTML</code> report that makes all our results easy to view and browse.  If you'd like to skip right to the results and see what it looks like, <a href="{{ "/assets/files/examples/tutorial/tutorial_summary.html"  | prepend: site.baseurl }}" rel="noopener noreferrer" target="_blank">check out the tutorial results</a>.  Otherwise, let's generate a report ourselves.</p>
            <p>Using our same configuration file we used to run the samples through the pipeline, we'll now employ the <code>summarize</code> function of <code>looper</code>.</p>
            <pre><code class="language-python">looper summarize tutorial.yaml --compute local</code></pre>              
            <p>That's it! Easy, right? <code>Looper</code> conveniently provides you with the location where the HTML report is produced.  You may either open the report with your preferred internet browser using the PATH provided, or we can change directories to the report's location and open it there.  Let's go ahead and change into the directory that contains the report.</p>
            <pre><code class="language-bash">cd /path/to/pepatac_tutorial/processed/tutorial/
firefox tutorial_summary.html</code></pre>              
            <p>The <code class="language-html">HTML</code> report contains a summary page that integrates the project level summary table and any project level objects including: raw aligned reads, percent aligned reads, and TSS enrichment scores.  The status page lists all the samples in this project along with their current status, a link to their log files, the time it took to run the sample and the peak memory used during the run.  The objects page provides links to separate pages for each object type.  On each object page, all the individual samples' objects are provided.  Similarly, the samples page contains links to individual pages for each sample.  The sample pages list the individual summary statistics for that sample as well as links to log files, command logs, and summary files.  The sample pages also provide links and thumbnails for any individual objects generated for that sample.  Of course, all of these files are present in the sample directory, but the report provides easy access to them all.</p>
        </div>
      </div>
    </div>
  </div>
</div>