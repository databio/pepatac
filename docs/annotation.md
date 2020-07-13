# Custom reference data

The pipeline uses reference data at various stages. If you're using a common genome assembly, these resources are pre-built and can be easily downloaded using `refgenie pull`, as described in the setup instructions. If the resources are not available, you'll have to build them. Read [how to build `refgenie` assets](http://refgenie.databio.org/en/latest/build/) in the `refgenie` docs.  You may also [learn about the current buildable assets](http://refgenie.databio.org/en/latest/available_assets/) to which `refgenie` knows the recipe.

## Use a custom `feat_annotation` asset

The pipeline will calculate the fraction of reads in genomic features using the `refgenie` `feat_annotation` asset, but you can also specify this file yourself at the command line (`--anno-name`).

This annotation file is really just a modified `BED` file, with the chromosomal coordinates and type of feature included.  For example, the `hg38/feat_annotation` asset looks like so:

```console
chr1  70008   71585   3' UTR  . +
chr1  450702  450739  3' UTR  . -
chr1  685678  685715  3' UTR  . -
chr1  942695  943058  3' UTR  . +
chr1  942855  943058  3' UTR  . +
chr1  943252  943377  3' UTR  . +
chr1  943697  943808  3' UTR  . +
chr1  943907  944581  3' UTR  . +
chr1  944153  944574  3' UTR  . +
chr1  944202  944693  3' UTR  . -
```

Just like a standard `BED` file, the first three fields are:  
1. **chrom** - the name of the chromosome  
2. **chromStart** - the starting position of the feature  
3. **chromEnd** - the ending position of the feature

Column four is the **name** column, in our case the name of our feature of interest. The fifth column is the **score**, which would determine how darkly an item would be displayed in a genome browser if you chose to set that or if the information in your file of interest has ascribed a score to the features. The final, sixth, column is the **strand** column.

After creating your `BED` file, you can point the pipeline to it using the `--anno-name` option followed with the path to your file.  The pipeline will then use that file to determine the fractions of reads that cover those features. You could also [tag this as an alternative `refgenie` managed asset](http://refgenie.databio.org/en/latest/tag/).  

