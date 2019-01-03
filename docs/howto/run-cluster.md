---
layout: toc_page
title: How to run the pipeline on a cluster
description: How to run the pipeline on a cluster
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
          <h2 data-toc-skip><strong>Run <img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"> on a cluster or in a container using <code>looper</code></strong></h2>
          <p>The pipeline itself does not specify any container or cluster resources, so you could just roll your own and submit individual jobs to a cluster however you choose. The easier way is to use <code>looper's</code> built-in template system, which <code>looper</code> uses to build flexible shell scripts for job submission. These templates can be used to run jobs in a container, to submit to a cluster resource manager, or both.</p>
        </div>
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-ref" data-offset="0" class="scrollspy">
          <h3 style="padding-top: 80px; margin-top: -80px;" id="list-ref-1"><strong>Create a computing environment configuration file</strong></h3>
            <p>To use <code>looper</code> templates, we must create a <i>computing environment configuration file</i> called <code class="language-bash">PEPENV</code>. In short, you will need to:</p>
            <ol>
              <li>Set up a compute configuration file that includes a containerized or cluster compute template (or both).</li>
              <li>Point the environment variable <code class="language-bash">PEPENV</code> to the location of this file.</li>
              <li>Run the pipeline with <code class="language-python">looper run --compute PACKAGE</code> (where <code class="language-bash">PACKAGE</code> is specified in your <code class="language-bash">PEPENV</code> file).</li>
            </ol>
            <p>This enables you to adjust your computing preferences on-the-fly when you run a project.</p>
            <p>The complete description of setting up <code>looper</code> to use <code class="language-bash">PEPENV</code> is generic to any pipeline, and therefore omitted from this readme. If you want to use looper with containers or clusters, you should consult the complete docs in the <a href="https://github.com/pepkit/pepenv">pepenv readme</a>. Further instructions can also be found in the documentation on <a href="http://looper.readthedocs.io/en/latest/cluster-computing.html">configuring looper to use a cluster</a> and <a href="https://looper.readthedocs.io/en/dev/containers.html">configuring looper to use linux containers</a>.</p>
        </div>
      </div>
    </div>
  </div>
</div>
