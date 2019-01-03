---
layout: toc_page
title: How to configure reference genome assemblies
description: How to configure reference genome assemblies
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
        <div id="welcome">
          <p></p>
          <h2><strong>Configure genome assemblies for use with <img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"></strong></h2>
          <p>This guide is designed to walk you through the process of obtaining <code>refgenie</code> assemblies.</p>
          <p>Whether using the container or native version, you will need to provide external reference genome assemblies. The pipeline requires genome assemblies produced by <A href="https://github.com/databio/refgenie"><code>refgenie</code></a>.</p>
          <p>One feature of the pipeline is prealignments, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to do will also require <code>refgenie</code> assemblies. When using the default configuration files, the pipeline will pre-align to the mitochondrial genome, so you if you want to use the default settings, you will need <code>refgenie</code> assemblies for the <samp>rCRSd</samp> genome (<i>for human</i>) or <samp>mouse_chrM</samp> (<i>for mouse</i>) in addition to the primary assembly you wish to use. Other <a href="https://github.com/databio/ref_decoy">ideas for common prealignment references are provided by ref_decoy</a>.</p>
        </div>
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-ref" data-offset="0" class="scrollspy">
          <h3 style="padding-top: 80px; margin-top: -80px;" id="list-ref-1"><strong>1: Using <code>refgenie</code> assemblies</strong></h3>
            <p>You have two options for using <code>refgenie</code> assemblies with <code class="language-python">PEPATAC</code>. If you're using a common genome, there's a good chance there's <a href="http://big.databio.org/refgenomes">already a <code>refgenie</code> assembly</a> for that.  Otherwise, you can <a href="#list-ref-1.2">create your own</a>.</p>
            <hr>
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-ref-1.1"><strong>1.1: Download pre-indexed <code>refgenie</code> assemblies</strong></h4>
              <p>Pre-built genome indices exist for commonly utilized genomes including: <samp>hg38</samp>, <samp>hg19</samp>, <samp>mm10</samp>, and <samp>mm9</samp>. You may simply <a href="http://big.databio.org/refgenomes">download the corresponding pre-indexed references</a> to get started immediately.</p>
            <hr>
            <h4 style="padding-top: 80px; margin-top: -80px;" id="list-ref-1.2"><strong>1.2: Build custom <code>refgenie</code> assemblies</strong></h4>
              <p> For complete and detailed information on indexing your own genomes, <a href="https://github.com/databio/refgenie">see the <code>refgenie</code> instructions</a>.</p>
              <p> For a quick introduciton, a simple example is presented here.</p>
              <hr>
              <h5 style="padding-top: 80px; margin-top: -80px;" id="list-ref-1.2.1"><strong>1.2.1: Install <code>refgenie</code></strong></h5>
                <p><code>Refgenie</code> uses <code class="language-python">Pypiper</code> (which if you've installed <code class="language-python">PEPATAC</code> you will have already installed it too), and, of course, you'll need <code>refgenie</code> itself.</p>
                <p><b>Install <code class="language-python">Pypiper</code>:</b></p>
                <pre><code class="language-python">pip install --user piper</code></pre>
                <p><b>Clone the <code class="language-python">refgenie</code> repository:</b></p>
                <pre><code class="language-git">git clone https://github.com/databio/refgenie.git</code></pre>
                <p><code>Refgenie</code> will produce indices for many alignment software tools should you have them installed.  <code class="language-python">PEPATAC</code> requires <code>bowtie2</code>, so make sure you have that installed (<a href="http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#obtaining-bowtie-2">see bowtie2 documentation</a>) and in your <code class="language-bash">PATH</code>.
              <hr>
              <h5 style="padding-top: 80px; margin-top: -80px;" id="list-ref-1.2.2"><strong>1.2.2: Run <code>refgenie</code></strong></h5>
                <p>Run <code>refgenie</code> with:</p>
                <pre><code class="language-python">src/refgenie.py -i INPUT_FILE.fa</code></pre>
                <p>...where <code class="language-bash">INPUT_FILE.fa</code> is a fasta file of your reference genome, and can be either a local file or a URL.</p>
          <hr>
          <h3 style="padding-top: 80px; margin-top: -80px;" id="list-ref-2"><strong>2: Configure the pipeline to use <code>refgenie</code> assemblies</strong></h3>
            <p>Once you've procured assemblies for all genomes you wish to use, you must point the pipeline to where you store these. You can do this in two ways, either: 1) with an environment variable, or 2) by adjusting a configuration option.</p>
            <p>The pipeline looks for genomes stored in a folder specified by the <code class="language-yaml">resources.genomes</code> attribute in the <a href="https://github.com/databio/pepatac/blob/dev/pipelines/pepatac.yaml">pipeline config file</a>. By default, this points to the shell variable <code class="language-bash">GENOMES</code>, so all you have to do is set an environment variable to the location of your refgenie genomes:</p>
            <pre><code class="language-bash">export GENOMES="/path/to/genomes/folder/"</code></pre>
            <p>(Add this to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code> to ensure it persists).</p>
            <p>Alternatively, you can skip the <code class="language-bash">GENOMES</code> variable and simply change the value of that configuration option to point to the folder where you stored the assemblies. The advantage of using an environment variable is that it makes the configuration file portable, so the same pipeline can be run on any computing environment, as the location to reference assemblies is not hard-coded to a specific computing environment.</p>
        </div>
      </div>
    </div>
  </div>
</div>
