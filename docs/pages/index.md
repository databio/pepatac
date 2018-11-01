---
layout: default
title: Home
permalink: /
tags: nav
---

<div class="container">
  <p></p>
  <h2 id="abstract"><img src="{{ "/assets/images/logo_pepatac_black.png" | prepend: site.baseurl }}" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px">
     -- A robust ATAC-seq pipeline built on a loosely coupled modular framework</h2>
  <p>As chromatin accessibility data from ATAC-seq experiments become widespread, there is increasing need for standardized analysis pipelines. <code class="language-python">PEPATAC</code> is an ATAC-seq pipeline that may be easily applied to ATAC-seq projects of any size, from one-off experiments to large-scale sequencing projects. It is optimized on unique features of ATAC-seq data to be fast and accurate and provides several unique analytical approaches. Output includes convenient quality control plots, summary statistics, and a variety of generally useful data formats to set the groundwork for subsequent project-specific data analysis. <code class="language-python">PEPATAC</code> is built using a common project definition and other modular components that make it easy to analyze pipeline output using metadata APIs in <code class="language-r">R</code> and <code class="language-python">Python</code>. <code class="language-python">PEPATAC</code> is a useful first step in universal data analysis for any ATAC-seq project.</p>
</div>
<hr>
<div class="container">
  <h1 id="contents"><strong>Contents</strong></h1>
  <p></p>
  <h3 id="getting-started">Getting started</h3>
  <ul>
    <li><a href='{{ "/intro/" | prepend: site.baseurl }}'>Introduction</a></li>
    <li><a href='{{ "/features/" | prepend: site.baseurl }}'>Features and benefits</a></li>
    <li><a href='{{ "/install/" | prepend: site.baseurl }}'>Installing and running <code class="language-python">PEPATAC</code></a></li>
    <li><a href='{{ "/tutorial/" | prepend: site.baseurl }}'>Extended tutorial</a></li>
  </ul>
  <h3 id="how-to">How-to guides</h3>
  <ul>
    {% assign sorted = site.pages | sort:"title" %}
    {% for page in sorted %}
    {% if page.tags contains 'howto' %}
    {% unless page.tags contains 'draft' %}
    <li><a href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a>.</li>
    {% endunless %}
    {% endif %}
    {% endfor %}
  </ul>
  <h3 id="example">Example <code class="language-python">PEPATAC</code> results</h3>
  <ul>
    <li><a href="{{ "/assets/files/examples/gold/summary.html" | prepend: site.baseurl }}" rel="noopener noreferrer" target="_blank"><code class="language-html">HTML</code> report demo</a></li>
  </ul>
  <h3 id="example">Links</h3>
  <ul>
    <li>Public-facing permalink: <a href="http://code.databio.org/PEPATAC/">http://code.databio.org/PEPATAC/</a></li>
    <li>Source code: <a href="http://github.com/databio/pepatac">http://github.com/databio/pepatac</a></li>
  </ul>
</div>