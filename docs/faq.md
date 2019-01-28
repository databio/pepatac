# <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> FAQ

## How does PEPATAC handle technical or biological replicates?

Currently, PEPATAC intentionally does not incorporate replicate information because there is no universally accepted approach to dealing with replicates, which depends on the biology of the particular samples. Instead, we recommend a two-stage approach: First, individually run each replicate through the pipeline, and evaluate each replicate separately to ensure quality-control. Then, either merge scores of replicates at the peak level, or merge raw fastq files for replicates you wish to keep and re-run the pipeline on the merged sample. For an example of this, see [Corces, et al. The chromatin accessibility landscape of primary human cancers. Science. 2018;362, (Supplemental methods under "Constructing a counts matrix and normalization.")](http://science.sciencemag.org/content/362/6413/eaav1898). 

When deciding whether or not to merge technical replicates, you should first follow basic QC procedures you would perform on any sample (see FAQ question below). But in addition, you can use a cross-replicate comparison to make sure the replicates correspond to one another. There are several ways to do this. For example, calculate the ATAC-seq log2(CPM\*) correlation between each replicate.  

\*CPM = counts + (scaled prior count using edgeR) per million mapped reads ([see Corces et al. (2018) Supplemental methods](http://www.sciencemag.org/content/362/6413/eaav1898/suppl/DC1?_ga=2.156350267.1411041936.1548169732-467771734.1542656281))

## How do I know if my samples or replicates are high quality?

- Look over the sample [fragment length distribution](http://code.databio.org/PEPATAC/glossary/#qc-output) plot(s). For a good quality sample you should observe a well-defined peak &lt; 100-bp representing nucleosome-free regions, a second peak around 200-bp representing mono-nucleosomes, then sequentially weaker peaks representing multiple nucleosomes.
- Observe the individual [TSS enrichment](http://code.databio.org/PEPATAC/glossary/#qc-output) scores for each sample, which is a representation of signal to noise.  A score below 6 is a general cutoff for a sample to be "concerning."  This is an empirical metric and may vary based on the individual data set, but represents a comfortable starting point.
- Library complexity metrics (for complete explanations, see [terms and definitions from ENCODE](https://www.encodeproject.org/data-standards/terms/)):
    - [Non-redundant fraction (NRF)](http://code.databio.org/PEPATAC/glossary/#qc-output): values &lt; 0.7 are considered concerning; values &gt; 0.9 are ideal
    - [PCR Bottleneck Coefficient 1 (PBC1)](http://code.databio.org/PEPATAC/glossary/#qc-output): values &lt; 0.7 are considered concerning; values &gt; 0.9 are ideal
    - [PCR Bottleneck Coefficient 2 (PBC2)](http://code.databio.org/PEPATAC/glossary/#qc-output): values &lt; 1.0 represent severe bottlenecking; values &gt; 3.0 are acceptable

## What is the $GENOME variable?

The `$GENOME` environment variable represents the `PATH` to where you have stored [`refgenie`](https://github.com/databio/refgenie) compatible genome builds. For example, if I have placed the [hg38 genome build](http://big.databio.org/refgenomes/hg38.tgz) in a `genomes/` directory in my `HOME` directory, I would execute the following command:

```
export GENOME="$HOME/genomes"
```
