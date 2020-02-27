# Custom reference data

The pipeline uses reference data at various stages, such as for alignment, calculating TSS enrichments, and other QC scores. If you're using a common genome assembly, these resources are pre-built and can be easily downloaded using `refgenie pull`, as described in the setup instructions. If the resources are not available, you'll have to build them. This document outlines how we created the reference data, so you can recreate it if you need to. The easiest way to do this is use `refgenie build`. All you need to do is:

## 1: Build the fasta asset

You need a FASTA file for your genome. You can insert this file into refgenie like this:

```console
refgenie build -g GENOME -a fasta --fasta path/to/file.fa
```

## 2: Build the refgene_anno asset

You will need a refGene annotation, which produces the TSS annotation asset. For hg38, we obtain this from [ucsc](http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz). Build it for a custom genome like this:

```console
refgenie build -g GENOME -a refgene_anno --refgene path/to/file.txt.gz
```


## 4: Build the feat_annotation and bowtie2_index assets
The `feat_annotation` asset includes feature annotations used to calculate various QC metrics. The `bowtie2_index` is used for alignment. `Refgenie` can automatically build these after you have the above assets installed:

```console
refgenie build -g GENOME -a feat_annotation bowtie2_index
```


That's it! These assets will be automatically detected if you build them like this with refgenie. If you want to know what we're doing, or customize these, more details follow:


## TSS

To calculate [TSS enrichments](../glossary.md), you will need a [TSS annotation file](http://big.databio.org/refgenomes/) in your reference genome directory.  If a pre-built version for your genome of interest isn't present, you can quickly create that file yourself. In the reference genome directory, you can perform the following commands for in this example, `hg38`:
```console
wget -O hg38_TSS_full.txt.gz http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz \
zcat hg38_TSS_full.txt.gz | \
  awk  '{if($4=="+"){print $3"\t"$5"\t"$5"\t"$4"\t"$13}else{print $3"\t"$6"\t"$6"\t"$4"\t"$13}}' | \
  LC_COLLATE=C sort -k1,1 -k2,2n -u > hg38_TSS.tsv
```
This asset (`tss_annotation`) needs to be [included in your `$REFGENIE` configuration file](create-annotation-file.md#example-pepatac-refgenie-configuration-file) for the pipeline to detect it automatically.  Alternatively, you can use the `--TSS-name` pipeline option to provide a path directly to this file.

## Features

We also have [downloadable genome feature annotation files](http://big.databio.org/pepatac/) for `hg38`, `hg19`, `mm10`, and `mm9`.  These files annotate 3' and 5' UTR, Exons, Introns, Promoters, and Promoter Flanking Regions.  If present in the corresponding reference genome folder and included as an asset (named `feat_annotation`) in your `$REFGENIE` configuration file you don't need to do anything else as the pipeline will look there automatically.   Alternatively, you can use the `--anno-name` pipeline option to just directly point to this file.

### Create a custom feature annotation file

The pipeline will calculate the fraction of reads in genomic features using one of our [provided annotation files](http://big.databio.org/pepatac/), but you can also specify this file yourself.

This annotation file is really just a modified `BED` file, with the chromosomal coordinates and type of feature included.  For example, the [downloadable `hg38_annotations.bed.gz` file](http://big.databio.org/pepatac/hg38_annotations.bed.gz) looks like so:

```
chr1	28200	30001	Promoter	.	*
chr1	198800	200201	Promoter	.	*
chr1	778000	780001	Promoter	.	*
chr1	817400	817601	Promoter	.	*
chr1	826200	828801	Promoter	.	*
chr1	904200	905201	Promoter	.	*
chr1	923800	924601	Promoter	.	*
chr1	925000	925601	Promoter	.	*
chr1	941800	942201	Promoter	.	*
chr1	958400	961401	Promoter	.	*
```

Just like a standard `BED` file, the first three fields are:  
1. **chrom** - the name of the chromosome  
2. **chromStart** - the starting position of the feature  
3. **chromEnd** - the ending position of the feature

Column four is the **name** column, in our case the name of our feature of interest. The fifth column is the **score**, which would determine how darkly an item would be displayed in a genome browser if you chose to set that or if the information in your file of interest has ascribed a score to the features. The final, sixth, column is the **strand** column.

After creating your `BED` file, you can point the pipeline to it using the `--anno-name` option followed with the path to your file.  The pipeline will then use that file to determine the fractions of reads that cover those features.

## Example `PEPATAC` `refgenie` configuration file

As mentioned above, you can point the pipeline directly to your annotation files using the matching arguments.

Alternatively, if they are all present in the corresponding reference genome folders, you can direct `refgenie` to detect them automatically. Here's an example of what a `refgenie` configuration file would look like for `hg38`:
```yaml
genome_folder: $GENOMES
genome_server: http://refgenomes.databio.org
genomes:
  hg38:
    bowtie2:
      path: indexed_bowtie2
    chrom_sizes:
      path: hg38.chrom.sizes
    tss_annotation:
      path: hg38_TSS.tsv
    feat_annotation:
      path: hg38_annotations.bed.gz
```