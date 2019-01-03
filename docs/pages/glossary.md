---
layout: toc_page
title: Glossary
permalink: /glossary/
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
          <h2><img src="{{ "/assets/images/logo_pepatac_black.png" | prepend: site.baseurl }}" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"> glossary</h2>
          <p>Information regarding universal ATAC-seq <a href="https://www.encodeproject.org/data-standards/terms/">terms and definitions</a> are available from the ENCODE consortium.</p>
          <p>Additional information relevant to <code class="language-python">PEPATAC</code> output and interpretation includes:</p>
        </div><!-- /.intro -->
      </div>
      <hr>
      <div class="container">
        <div data-spy="scroll" data-target="#list-glosary" data-offset="0" class="scrollspy">
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-glossary-1"><strong>Peak calling output</strong></h4>
          <p>The pipeline's default peak caller is <code class="language-python">MACS2</code>.  More <a href="https://github.com/taoliu/MACS">detailed descriptions regarding <code class="language-python">MACS2</code> output </a> may be discovered in the <code class="language-python">MACS2</code> repository.</p>
          <p>The following files are included in default <code class="language-python">PEPATAC</code> analyses:</p>
          <ul>
            <li><p><b>&lt;sample_name&gt;_peaks.xls</b>: An XLS formatted file containing call peak information with 1-based coordinates</p></li>
            <li><p><b>&lt;sample_name&gt;_peaks.narrowPeak</b>: A BED6+4 format file containing peak locations, peak summits, p-values, and q-values.</p></li>
            <li><p><b>&lt;sample_name&gt;_summits.bed</b>: A BED format file containing the peak summit locations for each peak. Useful for finding motifs at these sites.</p></li>
            <li><p><b>&lt;sample_name&gt;_peaks_coverage.bed</b>: A BED format file containing the number of overlapping reads in each peak.</p>Column format:</li>
            <ol>
              <li>chromosome name</li>
              <li>start position of peak</li>
              <li>end position of peak</li>
              <li>read count</li>
              <br>
            </ol>
            <li><p><b>&lt;sample_name&gt;_peaks.bigBed</b>: A bigNarrowPeak (bigBed) formatted version of the narrowPeak file produced by <code class="language-python">MACS2</code>. Check out the <a href="https://genome.ucsc.edu/goldenpath/help/bigNarrowPeak.html">bigNarrowPeak track format</a> page for more information.</p></li>
          </ul>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-glossary-2"><strong>QC output</strong></h4>
          <ul>
            <li><p><b>&lt;sample_name&gt;_bamQC.tsv</b>: A tabular file containing alignment statistics and library complexity measures.</p>Includes:</li>
            <ul>
              <li><b>total read pairs</b>: The total number of reads (singular or paired).</li>
              <li><b>distinct read pairs</b>: The number of genomic locations to which some read maps uniquely.</li>
              <li><b>one read pairs</b>: The number of genomic locations with exactly <i>one</i> read mapped uniquely.</li>
              <li><b>two read pairs</b>: The number of genomic locations where <i>two</i> reads map uniquely.</li>
              <li><b>duplicate rate</b>: The rate of duplicate reads. Will only be &gt;0 if this script used outside of the pipeline on a BAM file with duplicates marked.(</li>
              <li><b>mitochondrial reads</b>: The number of mitochondrial reads. If mitochondrial prealignments are used, this should be zero or close to zero. These reads are removed prior to downstream analysis.</li>
              <li><b>mitochondrial rate</b>: The rate of mitochondrial aligning reads</li>
              <li><b>NRF (non-redundant fraction)</b>: The fraction of non-redundant mapped reads (i.e. one read pairs / total read pairs)</li>
              <li><b>PBC1 (PCR Bottleneck Coefficient 1)</b>: one read pairs / distinct read pairs</li>
              <li><b>PBC2 (PCR Bottleneck Coefficient 2)</b>: one read pairs / two read pairs</li>
              <br>
            </ul>
            <li><p><b>&lt;sample_name&gt;_peaks_chr_dist.[png/pdf]</b>: Plot(s) of the chromosomal distribution of called peaks.</p></li>
            <li><p><b>&lt;sample_name&gt;_&lt;feature&gt;_coverage.bed</b>: A BED format file containing the number of overlapping reads in each &lt;feature&gt;</p></li>
            <li><p><b>&lt;sample_name&gt;_frif.[png/pdf]</b>: Plot(s) of the fractions of reads in each &lt;feature&gt;. The cumulative sum of reads in a feature is plotted against the log of the number of bases covered by that feature.  Therefore, it takes fewer total bases covered to visualize an enriched feature compared to others.  Because peaks are called specifically on the data (i.e. enriched specifically for the data), the cumulative fraction of reads in peaks should generally be the first (left-most) curve. The number following the feature name is the fraction of reads in that feature. <a href="{{ "/howto/custom-features.html" | prepend: site.baseurl }}">Features may be customized</a> by specifying the <code class="language-python">--anno_name</code> argument to the pipeline along with the corresponding BED file containing defined features.</p></li>
            <li><p><b>&lt;sample_name&gt;_fragLen.txt</b>: A text file containing a single column of all fragment lengths.</p></li>
            <li><p><b>&lt;sample_name&gt;_fragCount.txt</b>: A tabular file containing the number of read fragments at each fragment length.</p></li>
            <li><p><b>&lt;sample_name&gt;_fragLenDistribution.txt</b>: A tabular file containing fragment length distribution summary statistics.</p></li>
            <li><p><b>&lt;sample_name&gt;_fragLenDistribution.[png/pdf]</b>: Fragment length distribution plot(s). Normally, you should observe a well-defined peak somewhere &lt;100-bp representing nucleosome-free regions, a second peak around 200-bp representing mono-nucleosomes, then sequentially smaller peaks representing multiple nucleosomes.</p></li>
            <li><p><b>&lt;sample_name&gt;_peaks_partition_dist.[png/pdf]</b>: Plot(s) of the number of peaks present in each defined genomic partition. Defined partitions include: 3' UTR, 5' UTR, Exonic, Intronic, Intergenic, Promoter, and Promoter Flanking Regions.</p></li>
            <li><p><b>&lt;sample_name&gt;_peaks_TSS_dist.[png/pdf]</b>: Plot(s) of the distribution of reads relative to TSS's.</p></li>
            <li><p><b>&lt;sample_name&gt;_TssEnrichment.txt</b>: A text file containing a single column of read counts at each position flanking transcription start sites (-2000 - TSS - +2000).</p></li>
            <li><p><b>&lt;sample_name&gt;_TssEnrichment.[png/pdf]</b>: Global TSS enrichment plot(s). Illustrates the aggregate enrichment around <i>all</i> transcription start sites.</p></li>
          </ul>
          <hr>
          <h4 style="padding-top: 80px; margin-top: -80px;" id="list-glossary-3"><strong>Signal tracks</strong></h4>
          <p>The tool to produce these tracks, <code class="language-python">bamSitesToWig.py</code>, is included in the <code class="language-python">PEPATAC</code> repository and may be called indpendently with parameters like the <code class="language-python">--smooth-length</code> further customized.</p>
          <ul>
            <li><p><b>nucleotide-resolution ("exact cut") signal</b>: The nucleotide-resolution (or "exact cut") signal is a signal track (bigWig) marking exact locations where the transposition event occurred. The Tn5 transpoase acts on and duplicates a 9-bp region, and the event location is defined as the center of this 9-bp window.  To produce this signal, read positions on positive strands are shifted +4 with minus strand positions shifted -5. </p></li>
            <li><p><b>smooth signal</b>: The smooth signal track is produced alongside the nucleotide-resolution track.  Instead of marking exact bases, the smooth track marks reads positioned +/- 25-bp around the "exact cut" location, to yield a 50-bp window centered on this position.</p></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<hr>
<div class="container">
  <p>Any questions? Feel free to <a href="{{ "/contact/" | prepend: site.baseurl }}">reach out to us</a>. Otherwise, go analyze some ATAC-seq!</p>
</div>