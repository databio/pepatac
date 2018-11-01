---
layout: toc_page
title: How to download data from the Sequence Read Archive (SRA) for use with PEPATAC
description: How to download data from the Sequence Read Archive (SRA) for use with PEPATAC
date: 2018-09-28
tags: howto
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
          <h3 style="padding-top: 80px; margin-top: -80px;"><strong>Download raw data from SRA for use in <img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"></strong></h3>
          <p>This guide is designed to walk you through obtaining SRA data files that can go directly into <code class="language-python">PEPATAC</code>.</p>
        </div><!-- /.intro -->
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-sra" data-offset="0" class="scrollspy">
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-sra-1"><strong>1: Install <code>geofetch</code></strong></h4>
            <p>To download data from the Sequence Read Archive (SRA), we'll use some convenient companion software to assist in the download process called <a href="https://github.com/pepkit/geofetch"><code>geofetch</code></a></p>
            <p>Clone the <code>geofetch</code> repository:</p>
            <pre><code class="language-git">git clone https://github.com/pepkit/geofetch.git</code></pre>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-sra-2"><strong>2: Install <code>NCBI SRA Toolkit</code></strong></h4>
            <p>To use <code>geofetch</code> you'll need to have the <code>NCBI SRA Toolkit</code> installed as well (<a href="https://github.com/ncbi/sra-tools/wiki/Building-and-Installing-from-Source">see complete SRA Toolkit documentation</a>).</p>
            <p>The following will perform a basic installation of the toolkit.  For users without root access and for custom installation procedures <a href="https://github.com/ncbi/sra-tools/wiki/">check out the NCBI SRA toolkit wiki</a>.</p>
            <pre><code class="language-bash">mkdir ncbi
cd ncbi/
git clone git@github.com:ncbi/sra-tools.git
git clone https://github.com/ncbi/ngs.git
git clone https://github.com/ncbi/ncbi-vdb.git
cd ngs/
./configure
make -C ngs-sdk
make -C ngs-java
make -C ngs-python
cd ../ncbi-vdb/
./configure
make
make install
cd ../ngs/		
make -C ngs-sdk install
make -C ngs-java install
make -C ngs-python install
cd ../sra-tools/
./configure
make
make install
cd ../../</code></pre>
            <p>Make sure you place <code>sra-tools</code> in your <code class="language-bash">PATH</code>.</p>
            <pre><code class="language-bash">export PATH="$PATH:/path/to/sra-tools/bin/"</code></pre>
            <p>So you only have to do this the first time through, add the updates to <code class="language-bash">PATH</code> to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code>.</p>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-sra-3"><strong>3: Download data</strong></h4>
            <p>Now that all our requirements for downloading data are set.  Let's actually get some ATAC-seq reads.</p>
          <hr>
            <h5 style="padding-top: 80px; margin-top: -80px;" id="list-sra-3.1"><strong>3.1: Get metadata, configuration files, and <code>.sra</code> files</strong></h5>
              <p>To automatically download sample metadata and generate configuration files that will allow us to convert the <code>.sra</code> files into <code>.bam</code> files, use the following:</p>
              <pre><code class="language-python">python geofetch.py -i GSE#####</code><code class="language-python"> -m /path/to/metadata/folder -n PROJECT_NAME </code></pre>
            <hr>
            <h5 style="padding-top: 80px; margin-top: -80px;" id="list-sra-3.2"><strong>3.2: Convert <code>.sra</code> files to <code>.bam</code></strong></h5>
              <p>Next we're going to convert those downloaded <code>.sra</code> files using <code>looper</code>. If you haven't installed <code>looper</code>, do that now before moving forward (<a href="https://looper.readthedocs.io/en/latest/">see <code>looper</code> docs</a>).</p>
              <p><code>Looper</code> requires a few variables and configuration files to work for a specific user. One of those is an environment variable called <code class="language-bash">PEPENV</code> that points to the <code>looper</code> environment configuration file. For more detailed information regarding this file, check out the <a href="https://looper.readthedocs.io/en/latest/cluster-computing.html#pepenv-overview"><code>looper</code> docs</a>.</p>
              <p>Create a <code class="language-yaml">pepenv.yaml</code> file and edit this file for your own setup (see <a href="https://looper.readthedocs.io/en/latest/index.html"><code>looper</code> docs for more information</a>).
              <p>Paste the following into <code class="language-yaml">pepenv.yaml</code> and save your changes:</p>
              <pre><code class="language-yaml">compute:
&nbsp;&nbsp;local:
&nbsp;&nbsp;&nbsp;&nbsp;submission_template: templates/localhost_template.sub
&nbsp;&nbsp;&nbsp;&nbsp;submission_command: sh</code></pre>
              <p>Create an environment variable that points to this file:</p>
              <pre><code class="language-bash">export PEPENV="/path/to/pepatac_tutorial/pepenv.yaml"</code></pre>
              <p>(Remember to add <code class="language-bash">PEPENV</code> to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code> to ensure it persists).</p>
              <p>The <code>looper</code> environment configuration file points to submission template(s) in order to know how to run a sample or series of samples.  You can <a href="https://github.com/pepkit/pepenv">read more about the <code class="language-bash">PEPENV</code> configuration file and submission templates here</a>. We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create templates for cluster or container use as well!</p>
              <pre><code class="language-bash">nano localhost_template.sub</code></pre>
              <p>Paste the following into the localhost_template.sub:</p>
              <pre><code class="language-bash">#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE}</code></pre>
            <p>We also need to create additional environment variables to help point <code>looper</code> to where we want to download and convert our <code>.sra</code> files.  These variables are part of the configuration file that <code>geofetch</code> produced earlier in the <code class="language-bash">metadata/</code> folder. You may either set the environment variables or you simply hard code the necessary locations in the configuration file.</p>
            <p>Create a <code class="language-bash">PROCESSED</code> variable that represents the location where we want to save output:</p>
            <pre><code class="language-bash">export PROCESSED="/path/to/pepatac_tutorial/processed/"</code></pre>
            <p>Create a variable representing the location all our tools are stored named <code class="language-bash">CODEBASE</code>:</p>
            <pre><code class="language-bash">export CODEBASE="/path/to/pepatac_tutorial/tools/"</code></pre>
            <p>Create a variable representing the location we want to save our <code>.sra</code> files called <code class="language-bash">SRARAW</code>:</p>
            <pre><code class="language-bash">export SRARAW="/path/to/pepatac_tutorial/data/sra/"</code></pre>
            <p>(Add these environment variables to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code> so you don't have to always do this step).</p>
            <p>Finally, convert the <code>.sra</code> files!</p>
            <pre><code class="language-bash">looper run /path/to/metadata/PROJECT_NAME/PROJECT_NAME_config.yaml \
--sp sra_convert \
--lump 10 \
--compute local</code></pre>
            <p> Fantastic! Now we downloaded and converted a SRA file into <code>.bam</code>, which can go directly into <code class="language-bash">PEPATAC</code>.
        </div>
      </div>
    </div>
  </div>
</div>