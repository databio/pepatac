---
layout: default
title: Introduction
permalink: /intro/
tags: nav
---

<div class="container">
  <div id="intro">
    <p></p>
    <h2><img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"> introduction</h2>
    <p><code class="language-python">PEPATAC</code> is an ATAC-seq pipeline that may be easily applied to ATAC-seq projects of any size, from one-off experiments to large-scale sequencing projects. It is optimized on unique features of ATAC-seq data to be fast and accurate and provides several unique analytical approaches. It performs adapter trimming, mapping, peak calling, and creates bigwig tracks, TSS enrichment files, and other outputs. You can download the latest version from the <a href="https://github.com/databio/pepatac/releases">releases</a> page, or find changes listed in the <a href="https://github.com/databio/pepatac/blob/master/CHANGELOG.md">CHANGELOG</a>.</p>
    <p><code class="language-python">PEPATAC</code> produces convenient quality control plots, summary statistics, and a variety of generally useful data formats to set the groundwork for subsequent project-specific data analysis.
    Example output includes the following:</p>
    <ul>
      <li><a href="/assets/files/examples/gold/results_pipeline/gold5/stats.tsv">Easily parsable summary statistics file</a></li>
      <li>Called peaks (in both <code>narrowPeak</code> and <code>bigBed</code> format)</li>
      <li>BigWig signal tracks:</li>
        <ul>
          <li>nucleotide-resolution ("exact cut") signal</li>
          <li>smoothed signal</li>
        </ul>
      <li>Plots:</li>
      <ul>                  
        <li><a href="/assets/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_TssEnrichment.pdf">TSS enrichment plot</a></li>
        <li><a href="/assets/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_TSS_dist.pdf">TSS distance distribution</a></li>
        <li><a href="/assets/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_fragLenDistribution.pdf">Fragment length distribution</a></li>
        <li><a href="/assets/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_chr_dist.pdf">Peak chromosomal distribution</a></li>
        <li><a href="/assets/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_peaks_partition_dist.pdf">Peak genomic partition distribution</a></li>
        <li><a href="/assets/files/examples/gold/results_pipeline/gold5/QC_hg19/gold5_frif.pdf"> Fraction of reads <i>and/or</i> peaks in features (FRiF)</a></li>
      </ul>
    </ul>
    <p><code class="language-python">PEPATAC</code> is built using a common project definition, the <a href="https://pepkit.github.io/">Portable Encapsulated Projects (PEP) format</a>. This means that projects that are using <code class="language-python">PEPATAC</code> would also be easily compatible with any other PEP-compatible tool. The pipeline itself is also easily customizable, enabling a user to adjust individual command settings or even swap out specific software by editing a few lines of human readable configuration files. The pipeline is constructed with modular components that make it easy to analyze pipeline output using <a href="http://code.databio.org/pepr/">metadata APIs in <code class="langugage-r">R</code></a> and <a href="https://peppy.readthedocs.io/en/latest/"><code class="language-python">Python</code></a>. <code class="language-python">PEPATAC</code> is a useful first step in universal data analysis for any ATAC-seq project.</p>
  </div>
</div>
<hr>
<div class="container">
  <p>Any questions? Feel free to <a href="{{ "/contact/" | prepend: site.baseurl }}">reach out to us</a>. Otherwise, go analyze some ATAC-seq!</p>
</div>