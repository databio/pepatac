<p style="font-size:30px"><img src="../img/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> glossary</p>

Information regarding universal ATAC-seq <a href="https://www.encodeproject.org/data-standards/terms/">terms and definitions</a> are available from the ENCODE consortium.

Additional information relevant to `PEPATAC` output and interpretation includes:

---

#### **Peak calling output**

The pipeline's default peak caller is `MACS2`.  More [detailed descriptions regarding `MACS2` output](https://github.com/taoliu/MACS) may be discovered in the `MACS2` repository.

The following files are included in default `PEPATAC` analyses:

- **&lt;sample_name&gt;_peaks.xls**: An XLS formatted file containing call peak information with 1-based coordinates.
- **&lt;sample_name&gt;_peaks.narrowPeak**: A BED6+4 format file containing peak locations, peak summits, p-values, and q-values.
- **&lt;sample_name&gt;_summits.bed**: A BED format file containing the peak summit locations for each peak. Useful for finding motifs at these sites.
- **&lt;sample_name&gt;_peaks_coverage.bed**: A BED format file containing the number of overlapping reads in each peak.  
  Column format:
    1. chromosome name
    2. start position of peak
    3. end position of peak
    4. read count
- **&lt;sample_name&gt;_peaks.bigBed**: A bigNarrowPeak (bigBed) formatted version of the narrowPeak file produced by `MACS2`. Check out the [bigNarrowPeak track format](https://genome.ucsc.edu/goldenpath/help/bigNarrowPeak.html) page for more information.

---

#### **QC output**

- **&lt;sample_name&gt;_bamQC.tsv**: A tabular file containing alignment statistics and library complexity measures.  
  Includes:
    - **total read pairs**: The total number of reads (singular or paired).
    - **distinct read pairs**: The number of genomic locations to which some read maps uniquely.
    - **one read pairs**: The number of genomic locations with exactly *one* read mapped uniquely.
    - **two read pairs**: The number of genomic locations where *two* reads map uniquely.
    - **duplicate rate**: The rate of duplicate reads. Will only be >0 if this script used outside of the pipeline on a BAM file with duplicates marked.
    - **mitochondrial reads**: The number of mitochondrial reads. If mitochondrial prealignments are used, this should be zero or close to zero. These reads are removed prior to downstream analysis.
    - **mitochondrial rate**: The rate of mitochondrial aligning reads.
    - **NRF (non-redundant fraction)**: The fraction of non-redundant mapped reads (i.e. one read pairs / total read pairs).
    - **PBC1 (PCR Bottleneck Coefficient 1)**: one read pairs / distinct read pairs.
    - **PBC2 (PCR Bottleneck Coefficient 2)**: one read pairs / two read pairs.
- **&lt;sample_name&gt;_peaks_chr_dist.[png/pdf]**: Plot(s) of the chromosomal distribution of called peaks.
- **&lt;sample_name&gt;_&lt;feature&gt;_coverage.bed**: A BED format file containing the number of overlapping reads in each &lt;feature&gt;.
- **&lt;sample_name&gt;_frif.[png/pdf]**: Plot(s) of the fractions of reads in each &lt;feature&gt;. The cumulative sum of reads in a feature is plotted against the log of the number of bases covered by that feature.  Therefore, it takes fewer total bases covered to visualize an enriched feature compared to others.  Because peaks are called specifically on the data (i.e. enriched specifically for the data), the cumulative fraction of reads in peaks should generally be the first (left-most) curve. The number following the feature name is the fraction of reads in that feature. [Features may be customized](/howto/custom-features.md) by specifying the `--anno_name` argument to the pipeline along with the corresponding BED file containing defined features.
- **&lt;sample_name&gt;_fragLen.txt**: A text file containing a single column of all fragment lengths.
- **&lt;sample_name&gt;_fragCount.txt**: A tabular file containing the number of read fragments at each fragment length.
- **&lt;sample_name&gt;_fragLenDistribution.txt**: A tabular file containing fragment length distribution summary statistics.
- **&lt;sample_name&gt;_fragLenDistribution.[png/pdf]**: Fragment length distribution plot(s). Normally, you should observe a well-defined peak somewhere <100-bp representing nucleosome-free regions, a second peak around 200-bp representing mono-nucleosomes, then sequentially smaller peaks representing multiple nucleosomes.
- **&lt;sample_name&gt;_peaks_partition_dist.[png/pdf]**: Plot(s) of the number of peaks present in each defined genomic partition. Defined partitions include: 3' UTR, 5' UTR, Exonic, Intronic, Intergenic, Promoter, and Promoter Flanking Regions.
- **&lt;sample_name&gt;_peaks_TSS_dist.[png/pdf]**: Plot(s) of the distribution of reads relative to TSS's.
- **&lt;sample_name&gt;_TssEnrichment.txt**: A text file containing a single column of read counts at each position flanking transcription start sites (-2000 - TSS - +2000).
- **&lt;sample_name&gt;_TssEnrichment.[png/pdf]**: Global TSS enrichment plot(s). Illustrates the aggregate enrichment around *all* transcription start sites.

---

#### **Signal tracks**

The tool to produce these tracks, `bamSitesToWig.py`, is included in the `PEPATAC` repository and may be called indpendently with parameters like the `--smooth-length` further customized.

- **nucleotide-resolution ("exact cut") signal**: The nucleotide-resolution (or "exact cut") signal is a signal track (bigWig) marking exact locations where the transposition event occurred. The Tn5 transpoase acts on and duplicates a 9-bp region, and the event location is defined as the center of this 9-bp window.  To produce this signal, read positions on positive strands are shifted +4 with minus strand positions shifted -5.
- **smooth signal**: The smooth signal track is produced alongside the nucleotide-resolution track.  Instead of marking exact bases, the smooth track marks reads positioned +/- 25-bp around the "exact cut" location, to yield a 50-bp window centered on this position.

---

- [:fa-envelope: Contact Us](contact.md)
- [Learn more about the Databio team!](http://databio.org/)
