---
layout: toc_page
title: How to configure project files
description: How to configure project files
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
          <h2 data-toc-skip><strong>Configure project files for <img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"></strong></h2>
          <p>This guide is designed to walk you through the process of customizing configuration files for your own project.</p>
          <p>Running the pipeline on many samples is made simple by employing <code>looper</code>, our pipeline submission engine.  To set up <code>looper</code>, you can check out <a href="run-looper.html">how to run the pipeline through looper</a> or <a href="https://looper.readthedocs.io/en/latest/">read the <code>looper</code> docs</a>.</p>
        </div>
      </div>
      <hr>
      <div class="container">
        <h3 style="padding-top: 80px; margin-top: -80px;" id="list-config-1">Adapting the example config files for your own project</h3>
          <p>The configuration files use a project format called the standard Portable Encapsulated Project (PEP) format, which is <a href="https://pepkit.github.io/">outlined in more detail in the pepkit docs</a>.</p>
          <p>There are multiple examples you can adapt in the <code class="language-bash">examples/</code> folder. You need two files for your project:</p>
          <ul>
            <li>project config file -- describes output locations, pointers to data, etc.</li>
            <li>sample annotation file -- comma-separated value (CSV) list of your samples.</li>
          </ul>
          <p>The sample annotation file must specify these columns:</p>
          <pre><code class="language-yaml">sample_name
library ('ATAC' or 'ATACSEQ' or 'ATAC-seq')
organism (may be 'human' or 'mouse')
read1
read2
whatever else you want</code></pre>
          <p>Run your project by passing your updated project config file to <code>looper</code> with <code class="language-bash">looper run project_config.yaml</code>.</p>
          <p><code>Looper</code> can also summarize your results, monitor your runs, clean intermediate files to save disk space, and more. You can find additional details on what you can do with this in the <a href="https://looper.readthedocs.io/en/latest/">looper docs</a>.</p>
      </div>
    </div>
  </div>
</div>