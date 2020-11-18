# Genome assets

`PEPATAC` relies on `refgenie` managed assets to streamline sample processing, where once these assets are built by refgenie there is no need to specify them in calls to `PEPATAC`. These managed assets include the following: 
- [`bowtie2_index`](http://refgenie.databio.org/en/latest/available_assets/#bowtie2_index)
- [`blacklist`](http://refgenie.databio.org/en/latest/available_assets/#blacklist)
- `chrom_sizes` - built by default when you build/pull the `fasta` asset
- [`fasta`](http://refgenie.databio.org/en/latest/available_assets/#fasta)
- [`feat_annotation`](http://refgenie.databio.org/en/latest/available_assets/#feat_annotation)
- [`refgene_anno`](http://refgenie.databio.org/en/latest/available_assets/#refgene_anno) - builds the TSS annotation file concurrently

Additionally, should you prefer `bwa` for alignment, you would use the [`refgenie bwa_index`](http://refgenie.databio.org/en/latest/available_assets/#bwa_index) as well.

## Using local copies instead of `refgenie` managed assets

For additionally flexibility, several of the `refgenie` managed assets may be manually specified. Why is this helpful? Maybe you want to compare custom TSS annotations for a one-off project. Or, perhaps you want to identify the fraction of your reads in a set of custom features relevant only to a specific sample. If these are resources you're not planning on reusing over and over again, maybe you simply don't want to have `refgenie` track them long term. 

Custom blacklisted regions may be specified using the `--blacklist </path/to/your_blacklist.bed.gz>`. The blacklisted region file must simply be a `BED` formatted file to function correctly. The [`refgenie blacklist` asset](http://refgenie.databio.org/en/latest/available_assets/#blacklist) is intended to utilize the [ENCODE blacklists](https://github.com/Boyle-Lab/Blacklist) by default.

The TSS annotation file may be specified using `--TSS-name </path/to/your_TSS_annotations.bed>`. This file is also a `BED` formatted file.

The `feat_annotation` asset may also be directly specified using `--anno-name </path/to/your_custom_feature_annotations.bed.gz>`.  Read [more about using custom reference data](annotation.md).


