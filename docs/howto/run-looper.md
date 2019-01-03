---
layout: toc_page
title: How to run the pipeline with looper
description: How to run the pipeline with looper
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
          <h2 data-toc-skip><strong>Run <img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"></strong> using <code>looper</code></h2>
          <p>The pipeline can be run directly from the command line for a single sample (<a href="pages/install.html">see Install and run</a>). If you need to run it on many samples, you could write your own sample handling code, but we have pre-configured everything to work nicely with <code>looper</code>, our sample handling engine. This section explains how to use <code>looper</code>.</p>
        </div>
      </div>
      <hr>
      <div class="container">
        <p></p>
        <div data-spy="scroll" data-target="#list-running" data-offset="60" class="scrollspy">
          <p></p>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-running-1">1: Install <code>looper</code></h4>
            <p>This pipeline is pre-configured to work with <code>looper</code>. <a href="http://looper.readthedocs.io/">Looper</a> is a pipeline submission engine that makes it easy to deploy any pipeline across samples. It will let you run the jobs locally, in containers, using any cluster resource manager, or in containers on a cluster.</p>
            <p>If you've already gone through the installation process for <code class="language-python">PEPATAC</code>, you will already have <code>looper</code> installed.  If that's the case, <a href="#list-running-2">skip right to the example</a>.</p>
            <p>Otherwise, install <code>looper</code> using <code class="language-python">pip</code>:</p>
            <pre><code class="language-python">pip install --user https://github.com/pepkit/looper/zipball/master</code></pre>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-running-2">2: Run the pipeline through <code>looper</code></h4>
            <p>Start by running the example project in the <a href="https://github.com/databio/pepatac/tree/master/examples/test_project"><code class="language-bash">examples/test_project/</code></a> folder. Let's use the <code class="language-python">-d</code> argument to do a <i>dry run</i>, which will create job scripts for every sample in the project, but will not execute them:</p>
            <pre><code class="language-python">looper run -d examples/test_project/test_config.yaml</code></pre>
            <p>If the looper executable is not in your <code class="language-bash">$PATH</code>, add the following line to your <code class="language-bash">.bashrc</code> or <code class="language-bash">.profile</code>:</p>
            <pre><code class="language-bash">export PATH=$PATH:~/.local/bin</code></pre>
            <p>If that worked, let's actually run the example by taking out the <code class="language-python">-d</code> flag:</p>
            <pre><code class="language-python">looper run examples/test_project/test_config.yaml</code></pre>
            <p>There are lots of other cool things you can do with looper, like dry runs, summarize results, check on pipeline run status, clean intermediate files, lump multiple samples into one job, and more. For details, consult the <a href="http://looper.readthedocs.io/">looper docs</a>.</p>
          </div>
        </div>
    </div>
  </div>
</div>