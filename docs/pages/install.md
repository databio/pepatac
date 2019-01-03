---
layout: toc_page
title: Install PEPATAC
permalink: /install/
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
          <h2>Getting started with <img src="{{ "/assets/images/logo_pepatac_black.png" | prepend: site.baseurl }}" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"></h2>
          <p>This guide is designed to quickly get you up and running with <code class="language-python">PEPATAC</code>. An <a href="tutorial.html">extended tutorial is available</a> should you find yourself stuck or would prefer more information along the way.</p>
        </div><!-- /.intro -->
      </div>
      <hr>
        <div class="container">
          <div data-spy="scroll" data-target="#list-install" data-offset="0" class="scrollspy">
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-install-1"><strong>1.1: Clone the <code class="language-python">PEPATAC</code> pipeline</strong></h4>
              <p>To begin, we need to <a href="https://github.com/databio/pepatac">get the <code class="language-python">PEPATAC</code> pipeline</a> itself. To obtain the pipeline, you can use one of the following methods:</p>
              <ul>
                <li>using SSH:<pre><code class="language-git"> git clone git@github.com:databio/pepatac.git</code></pre></li>
                <li>using HTTPS:<pre><code class="language-git"> git clone https://github.com/databio/pepatac.git</code></pre></li>
              </ul>
            <hr>
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-install-2"><strong>1.2: Install required software</strong></h4>
              <p>You have two options for installing the software prerequisites: 1) use a container, in which case you need only either <code>docker</code> or <code>singularity</code>; or 2) install all prerequisites natively. If you want to install it natively, skip to the <a href="#list-install-2.2">native installation instructions</a>.</p>
              <hr>
              <h5 style="padding-top: 80px; margin-top: -80px;" id="list-install-2.1"><strong>1.2.1: Use containers!</strong></h5>
                <p>If you have experience using containers, you may simply run <code class="language-python">PEPATAC</code> directly in a provided container.  First, make sure your environment is set up to run either docker or singularity containers. Then, pull the container image:</p>
                <p><b>Docker</b>: You can <a href="https://hub.docker.com/r/databio/pepatac/">pull the docker image</a> from dockerhub like this:
                <pre><code class="language-bash">docker pull databio/pepatac</code></pre>
                </p>
                <p>Or build the image using the included Dockerfile (you can use a recipe in the included Makefile):
                <pre><code class="language-bash">cd pepatac/
make docker</code></pre>
                </p>
                <p><b>Singularity</b>: You can <a href="http://big.databio.org/simages/pepatac">download the singularity image</a> or build it from the docker image following the recipe in the Makefile:
                <pre><code class="language-bash">cd pepatac/
make singularity</code></pre>
                </p>
                <p>Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called <code class="language-bash">$SIMAGES</code> that points to the folder where your image is stored, or you can tweak the <code class="language-yaml">pipeline_interface.yaml</code> file so that the <code class="language-yaml">compute.singularity_image</code> attribute is pointing to the right location on disk.</p>
                <p>If using containers, jump to <a href="#list-run-1">obtaining <code>refgenie</code> assemblies</a> prior to running.</p>
              <hr>
              <h5 style="padding-top: 80px; margin-top: -80px;" id="list-install-2.2"><strong>1.2.2: Install software requirements natively</strong></h5>
                <p>To use <code class="language-python">PEPATAC</code>, we need the following software:</p>
                <p><b>Python packages</b>. The pipeline uses <a href="http://pypiper.readthedocs.io/en/latest/">pypiper</a> to run a single sample, <a href="http://looper.readthedocs.io/en/latest/">looper</a> to handle multi-sample projects (for either local or cluster computation), and <a href="https://github.com/databio/pararead">pararead</a> for parallel processing sequence reads. For peak calling, the pipeline uses <a href="http://liulab.dfci.harvard.edu/MACS/">MACS2</a> as the default. You can do a user-specific install of these like this:
                <pre><code class="language-python">pip install --user numpy \
    pandas \
    piper \
    https://github.com/pepkit/looper/zipball/master \
    pararead \
    MACS2</code></pre>
                </p>
                <p><b>Required executables</b>. We will need some common bioinformatics tools installed. The complete list (including optional tools) is specified in the pipeline configuration file (<a href="https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml">pipelines/pepatac.yaml</a>) tools section.
                The following tools are used by the pipeline:       
                  <ul>
                    <li><a href="http://bedtools.readthedocs.io/en/latest/">bedtools (v2.25.0+)</a></li>
                    <li><a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">bowtie2 (v2.2.9+)</a></li>
                    <li><a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">fastqc (v0.11.5+)</a></li>
                    <li><a href="https://github.com/GregoryFaust/samblaster">samblaster (v0.1.24+)</a></li>
                    <li><a href="http://www.htslib.org/">samtools (v1.7+)</a></li>
                    <li><a href="https://github.com/relipmoc/skewer">skewer (v0.1.126+)</a></li>
                    <li><A href="http://hgdownload.soe.ucsc.edu/admin/exe/">UCSC tools</a></li>
                      <ul>
                        <li>bedGraphToBigWig</li>
                        <li>wigToBigWig</li>
                        <li>bigWigCat</li>
                        <li>bedToBigBed</li>
                      </ul>
                  </ul>
                </p>      
                <p>That should do it for required packages!  To obtain the full benefit of PEPATAC's QC and annotation features, install the following R packages as well.</p>
              <hr>
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-install-3"><strong>1.3: Install optional software</strong></h4>
              <p><code class="language-python">PEPATAC</code> uses <code class="language-r">R</code> to generate quality control and read/peak annotation plots.  These are <b>optional</b> and the pipeline will run without them, but you would not get any QC or annotation plots. The following packages are necessary:</p>
              <ul>
                <li><a href="https://cran.r-project.org/package=argparser">argparser (v0.4)</a></li>
                <li><a href="https://cran.r-project.org/package=data.table">data.table (v1.11.2)</a></li>
                <li><a href="https://cran.r-project.org/package=devtools">devtools (v1.13.6)</a></li>
                <li><a href="https://bioconductor.org/packages/GenomicRanges/">GenomicRanges (v1.30.3)</a></li>
                <li><a href="http://code.databio.org/GenomicDistributions/index.html">GenomicDistributions (v0.5)</a></li>
                <li><a href="https://cran.r-project.org/package=ggplot2">ggplot2 (v2.2.1)</a></li>
                <li><a href="https://cran.r-project.org/package=ggrepel">ggrepel (v0.8.0)</a></li>
                <li><a href="https://cran.r-project.org/package=gplots">gplots (v3.0.1)</a></li>
                <li><a href="https://cran.r-project.org/package=gtable">gtable (v0.2.0)</a></li>
                <li><a href="http://code.databio.org/pepr/">pepr (v0.0.2)</a></li>
                <li><a href="https://cran.r-project.org/package=scales">scales (v0.5.0)</a></li>
              </ul>
              <p>To install the needed packages, run the following at the command prompt:
              <pre><code class="language-bash">Rscript -e "install.packages(c('argparser','devtools', 'data.table', 'ggrepel', 'ggplot2', 'gplots', 'gtable', 'scales'), \
    repos='http://cran.us.r-project.org/'); \
    source('https://bioconductor.org/biocLite.R'); biocLite('GenomicRanges'); \
    devtools::install_github(c('pepkit/pepr', 'databio/GenomicDistributions'))"</code></pre>
              </p>
              <p>To extract files quicker, <code class="language-python">PEPATAC</code> can use <code class="language-bash">pigz</code> in place of <code class="language-bash">gzip</code> if you have it installed.  It's not required, but it can help speed everything up when you have many samples to process and the ability to leverage multiple processors.</p>
              <ul>
                <li><a href="https://zlib.net/pigz/">pigz (v2.3.4+)</a></li>
              </ul>
              <p>Don't forget to add this to your <code class="language-bash">PATH</code> too!</p>
              <p>That's it! Everything we need to run <code class="language-python">PEPATAC</code> to its full potential should be installed.</p>
          </div>
        </div>
        <hr>
        <div class="container">
          <div data-spy="scroll" data-target="#list-run" data-offset="-50" class="scrollspy">
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-run-1"><strong>2.1: Download <code>refgenie</code> assemblies</strong></h4>
              <p>Whether using the container or native version, you will need to provide external reference genome assemblies. The pipeline requires genome assemblies produced by <a href="https://github.com/databio/refgenie">refgenie</a>.</p>
              <p>One feature of the pipeline is <em>prealignments</em>, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to use will also require <a href="https://github.com/databio/refgenie">refgenie assemblies</a>. Ideas for common prealignment references are provided by <a href="https://github.com/databio/ref_decoy">ref_decoy</a></p> 
              <p>You may <a href="http://big.databio.org/refgenomes">download pre-indexed references</a> or you may index your own (<a href="https://github.com/databio/refgenie">see refgenie instructions</a>). The pre-indexed references are compressed files, so you need to untar/unzip them after download.  For the purposes of this guide, we can download pre-built genomes.</p>
              <p>Grab the <code>hg38</code>, <code>human_repeats</code>, and <code>rCRSd</code> (Revised Cambridge Reference Sequence for human mtDNA) genomes.
              <pre><code class="language-bash">wget http://big.databio.org/refgenomes/hg38.tgz
wget http://big.databio.org/refgenomes/human_repeats_170502.tgz
wget http://big.databio.org/refgenomes/rCRSd_170502.tgz</code></pre>
              </p>
              <p>In order to calculate TSS enrichments, you will need a TSS annotation file in your reference genome directory too.  You may generate that using the following commands:
              <pre><code class="language-bash">wget -O hg38_TSS_full.txt.gz http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz
zcat hg38_TSS_full.txt.gz | \
    awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}' | \
    LC_COLLATE=C sort -k1,1 -k2,2n -u > hg38_TSS.tsv</code></pre>
              </p>
            <hr>
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-run-2"><strong>2.2: Configure the pipeline</strong></h4>
              <p>Once you've obtained assemblies for all genomes you wish to use, you must point the pipeline to where you store these. You can do this in two ways, either: 1) with an environment variable, or 2) by adjusting a configuration option.</p>
              <p>The pipeline looks for genomes stored in a folder specified by the <code>resources.genomes</code> attribute in the <a href="https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml">pipeline config file</a>. By default, this points to the shell variable <code>GENOMES</code>, so all you have to do is set an environment variable to the location of your <a href="https://github.com/databio/refgenie">refgenie genomes</a>:
              <pre><code class="language-bash">export GENOMES="/path/to/genomes/"</code></pre>
              </p>
              <p>Alternatively, you can skip the <code class="language-bash">GENOMES</code> variable and simply change the value of that configuration option to point to the folder where you stored the assemblies. The advantage of using an environment variable is that it makes the configuration file portable, so the same pipeline can be run on any computing environment, as the location to reference assemblies is not hard-coded to a specific computing environment.</p>
            <hr>
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-run-3"><strong>2.3: Running the pipeline</strong></h4>
              <p>The pipeline can be run directly from the command line for a single sample. If you need to run it on many samples, you could write your own sample handling code, but we have pre-configured everything to work nicely with <a href="http://looper.readthedocs.io">looper, our sample handling engine</a>. The extended tutorial includes a more <a href="tutorial.html#list-setup-2">detailed explanation for how to use looper</a> to analyze some provided example data.</p>
              <hr>
              <h5><strong>2.3.1: Running the pipeline script directly (without <code>looper</code>)</strong></h5>
                <p>The pipeline is at its core just a python script, and you can run it on the command line for a single sample. To see the command-line options for usage, see <a href="https://github.com/databio/pepatac/blob/master/usage.txt">usage.txt</a>, which you can get on the command line by running <code class="language-python">pipelines/pepatac.py --help</code>. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. See <a href="https://github.com/databio/pepatac/blob/master/example_cmd.txt">example commands</a> that use test data.</p>
                <p>Here's the basic command to run a small test example through the pipeline:
                <pre><code class="language-python">pipelines/pepatac.py --single-or-paired paired \
    --prealignments rCRSd human_repeats \
    --genome hg38 \
    --sample-name test1 \
    --input examples/data/test1_r1.fastq.gz \
    --input2 examples/data/test1_r2.fastq.gz \
    --genome-size hs \
    -O $HOME/pepatac_test</code></pre>
                </p>
                <p>This example should take about 15 minutes to complete.</p>
              <hr>
              <h5><strong>2.3.2: Running the pipeline directly in a container</strong></h5>
                <p>A full tutorial on using containers is outside the scope of this guide, but here are the basics. Individual jobs can be run in a container by simply running the <code class="language-python">pepatac.py</code> command through <code>docker run</code> or <code>singularity exec</code>. You can run containers either on your local computer, or in an HPC environment, as long as you have <code>docker</code> or <code>singularity</code> installed. For example, run it locally in singularity like this:
                <pre><code class="language-bash">singularity exec --bind $GENOMES $SIMAGES/pepatac pipelines/pepatac.py --help</code></pre>
                </p>
                <p>With <code>docker</code>, you can use:
                <pre><code class="language-bash">docker run --rm -it databio/pepatac pipelines/pepatac.py --help</code></pre>
                Be sure to mount the volumes you need with `--volume`.
                </p>
              <p>To run on multiple samples, you can just write a loop to process each sample independently with the pipeline, or you can use...<a href="https://github.com/pepkit/looper"><code>looper</code>!</a>  Learn more about using <code>looper</code> with <code class="language-python">PEPATAC</code> in the <a href="{{ "/howto/" | prepend: site.baseurl }}" >how-to guides</a> or in the <a href="{{ "/tutorial/" | prepend: site.baseurl }}">extended tutorial</a>.</p>
              <p>Any questions? Feel free to <a href="{{ "/contact/" | prepend: site.baseurl }}">reach out to us</a>. Otherwise, go analyze some ATAC-seq!</p>
          </div>	
        </div>
    </div>
  </div>
</div>