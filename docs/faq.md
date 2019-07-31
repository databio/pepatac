# <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> FAQ

## How does PEPATAC handle technical or biological replicates?

Currently, PEPATAC intentionally does not incorporate replicate information because there is no universally accepted approach to dealing with replicates, which depends on the biology of the particular samples. Instead, we recommend a two-stage approach: First, individually run each replicate through the pipeline, and evaluate each replicate separately to ensure quality-control. Then, either merge scores of replicates at the peak level, or merge raw fastq files for replicates you wish to keep and re-run the pipeline on the merged sample. For an example of this, see [Corces, et al. The chromatin accessibility landscape of primary human cancers. Science. 2018;362, (Supplemental methods under "Constructing a counts matrix and normalization.")](http://science.sciencemag.org/content/362/6413/eaav1898). 

When deciding whether or not to merge technical replicates, you should first follow basic QC procedures you would perform on any sample (see FAQ question below). But in addition, you can use a cross-replicate comparison to make sure the replicates correspond to one another. There are several ways to do this. For example, calculate the ATAC-seq log2(CPM\*) correlation between each replicate.  

\*CPM = counts + (scaled prior count using edgeR) per million mapped reads ([see Corces et al. (2018) Supplemental methods](http://www.sciencemag.org/content/362/6413/eaav1898/suppl/DC1?_ga=2.156350267.1411041936.1548169732-467771734.1542656281))

## How do I know if my samples or replicates are high quality?

- Look over the sample [fragment length distribution](glossary.md#qc-output) plot(s). For a good quality sample you should observe a well-defined peak &lt; 100-bp representing nucleosome-free regions, a second peak around 200-bp representing mono-nucleosomes, then sequentially weaker peaks representing multiple nucleosomes.
- Observe the individual [TSS enrichment](glossary.md#qc-output) scores for each sample, which is a representation of signal to noise.  A score below 6 is a general cutoff for a sample to be "concerning."  This is an empirical metric and may vary based on the individual data set, but represents a comfortable starting point.
- Library complexity metrics (for complete explanations, see [terms and definitions from ENCODE](https://www.encodeproject.org/data-standards/terms/)):
    - [Non-redundant fraction (NRF)](glossary.md#qc-output): values &lt; 0.7 are considered concerning; values &gt; 0.9 are ideal
    - [PCR Bottleneck Coefficient 1 (PBC1)](glossary.md#qc-output): values &lt; 0.7 are considered concerning; values &gt; 0.9 are ideal
    - [PCR Bottleneck Coefficient 2 (PBC2)](glossary.md#qc-output): values &lt; 1.0 represent severe bottlenecking; values &gt; 3.0 are acceptable

## What is the $GENOME variable?

The `$GENOME` environment variable represents the `PATH` to where you have stored [`refgenie`](https://github.com/databio/refgenie) compatible genome builds. For example, if I have placed the [hg38 genome build](http://big.databio.org/refgenomes/hg38.tgz) in a `genomes/` directory in my `HOME` directory, I would execute the following command:

```
export GENOME="$HOME/genomes"
```

## How do I calculate TSS enrichments?

By default, the pipeline is designed to calculate TSS enrichments. However, you will still need to provide a TSS annotation file in your reference genome directory. You may generate that using the following commands:

```
wget -O hg38_TSS_full.txt.gz http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz
zcat hg38_TSS_full.txt.gz | \
  awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}' | \
  LC_COLLATE=C sort -k1,1 -k2,2n -u > hg38_TSS.tsv
```

Alternatively, you can directly download the TSS annotation files for [hg19](http://big.databio.org/refgenomes/hg19_TSS.tgz) and [hg38](http://big.databio.org/refgenomes/hg38_TSS.tgz).  Remember to put the TSS annotation file in the corresponding `refgenie` genome directory.

## How do I annotate the aligned reads and peak calls?

You must provide the pipeline an annotation file to produce the following files: `*_peaks_chr_dist.pdf`, `*_peaks_partition_dist.pdf`, `*_peaks_TSS_dist.pdf`, `*_frif.pdf`.

A default annotation file that annotates the 5' UTR, 3' UTR, exons, introns, promoters, and promoter flanking regions can be directly downloaded for [hg19](http://big.databio.org/pepatac/hg19_annotations.bed.gz), [hg38](http://big.databio.org/pepatac/hg38_annotations.bed.gz), [mm10](http://big.databio.org/pepatac/mm10_annotations.bed.gz), and [mm9](http://big.databio.org/pepatac/mm9_annotations.bed.gz).

Simply place the downloaded annotation file in the the `pepatac/anno` folder and you're all set. You can also point the pipeline directly to your annotation file with the `--anno-name` option.

You can [learn how to create a custom annotation file](annotation.md) to investigate your own favorite features too!