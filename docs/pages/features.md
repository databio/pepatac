---
layout: default
title: Features & Benefits
permalink: /features/
tags: nav
---

<div class="container">
  <div id="features">
    <p></p>
    <h2><img src="{{ "/assets/images/logo_pepatac_black.png" | prepend: site.baseurl }}" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"> features at-a-glance</h2>
      <p>Here are a few of the highlights that make <code class="language-python">PEPATAC</code> valuable.</p>
      <ul>
        <li><b>Scalability.</b> Run the pipeline easily on a project with a single sample or a thousand. This pipeline is compatible with <a href="https://github.com/pepkit/looper"><code>looper</code></a>, so it can run locally, in a cloud container engine, or with any cluster resource manager (e.g. SLURM, SGE, or LFS).</li>
        <li><b>Restartability.</b> The pipeline is built using <a href="https://github.com/databio/pypiper">pypiper</a>, so it automatically picks up where it left off in case of preemption or crash.</li>
        <li><b>Copious logging.</b> The pipeline produces a detailed log file recording all output from every command run, and also records the time and memory use of every process, the version of the pipeline and other software, and other useful run information.</li>
        <li><b>Flexibility.</b> The pipeline provides options for multiple peak callers, multiple adapter trimmers, and fully configurable parameterization for many underlying tools.</li>
        <li><b>Portability.</b> Run it using <code>docker</code> or <code>singularity</code> with no other prerequisites, or it can be run natively without containers. The choice is yours.</li>
        <li><b>Standardized user interface.</b> The pipeline reads sample metadata formatted in <a href="http://pepkit.github.io/">standard PEP format</a>, so you can use the same sample annotation sheets for your downstream R or python analysis using tools from <a href="http://pepkit.github.io/">pepkit</a>.</li>
        <li><b>Standardized reference genome assembly.</b> The pipeline uses standard reference genome assemblies produced by <a href="http://github.com/databio/refgenie">refgenie</a>, which provides a scripted way to produce a compatible reference assembly for any custom genome. For common genomes, you can either download pre-indexed assemblies or build your own.</li>
        <li><b>Prealignments.</b> The pipeline can (optionally) first align to any number of reference assemblies separately before the primary genome alignment. This increases both speed and accuracy and can be used, for example, to align sequentially to mtDNA, repeats, or spike-ins.</li>
        <li><b>Fraction of reads in peaks <i>or</i> features (FRiP/FRiF).</b> By default, the pipeline will calculate the FRiP using the peaks it identifies. Optionally, it can also calculate a FRiP using a reference set of peaks (for example, from another experiment).  The pipeline will also calculate the fraction of reads in known annotated features if using a common reference genome and may be customized to use any feature set.</li>
        <li><b>TSS enrichments, Fragment length distributions and more.</b> The pipeline produces various nice QC plots.</li>
        <li><b>Beautiful <code class="language-html">HTML</code> reports.</b> Your results include an easy-to-navigate <code class="language-html">HTML</code> report with a sample table, job status, summary statistics, and QC plots at your fingertips when run using our <a href="https://looper.readthedocs.io/en/latest/index.html">pipeline submission engine, <code>Looper</code></a>.</li>
      </ul>
  </div>
</div>