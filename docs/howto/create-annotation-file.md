# How to create a custom annotation file

The pipeline will calculate the fraction of reads in genomic features using one of our [provided annotation files](http://big.databio.org/pepatac/), but you can also specify this file yourself.

This annotation file is really just a `BED` file, with the chromosomal coordinates and type of feature included.  For example, the [downloadable `hg19_annotations.bed.gz` file](http://big.databio.org/pepatac/hg19_annotations.bed.gz) looks like so:

```
chr1	28400	29801	Promoter	.	*
chr1	713400	715201	Promoter	.	*
chr1	761800	764001	Promoter	.	*
chr1	839600	840601	Promoter	.	*
chr1	859200	860001	Promoter	.	*
chr1	893800	895001	Promoter	.	*
chr1	895400	896801	Promoter	.	*
chr1	902000	902601	Promoter	.	*
chr1	934200	934801	Promoter	.	*
chr1	935200	936001	Promoter	.	*
```

Just like a standard `BED` file, the first three fields are:
1. *chrom* - the name of the chromosome
2. *chromStart* - the starting position of the feature
3. *chromEnd* - the ending position of the feature

Column four is the *name* column, in our case the name of our feature of interest. The fifth column is the *score*, which would determine how darkly an item would be displayed in a genome browser if you chose to set that or if the information in your file of interest has ascribed a score to the features. The final, sixth, column is the *strand* column.

After creating your `BED` file, you can point the pipeline to it using the `--anno-name` option and providing the path to your file.  The pipeline will then use that file to determine the fractions of reads that cover those features.