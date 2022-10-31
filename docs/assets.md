# Genome assets

`PEPATAC` can use either manually constructed or `refgenie` managed assets. `Refgenie` streamlines sample processing, where once assets are built by `refgenie` there is minimal argument calls to `PEPATAC` to use all assets. Pipeline assets include:  

**Required**  

| `PEPATAC` argument | `refgenie` asset name                                                                                                                                      | Description                                                                                           |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| `--genome-index`   | [`bowtie2_index`](http://refgenie.databio.org/en/latest/available_assets/#bowtie2_index)                                                                   | A genome index file constructed from `bowtie2-build`                                                  |
|                    | [`bwa_index`](https://refgenie.databio.org/en/latest/available_assets/#bwa_index)                                                                          | A genome index file constructed from `bwa index`. Required when using `bwa` (optional) for alignment. |
| `--chrom-sizes`    | With `refgenie`, this asset is built automatically when you build/pull the [`fasta`](http://refgenie.databio.org/en/latest/available_assets/#fasta) asset. | A text file containing "chr" and "size" columns.                                                      |

**Optional**  

| `PEPATAC` argument     | `refgenie` asset name                                                                                                                                    | Description                                                                                                                                                                             |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--prealignment-names` | Human readable genome alias(es) for `refgenie` managed `bowtie2_index` asset(s).                                                                         | A space-delimited list of genome names. *e.g.* ["rCRSd", "human_repeats"]                                                                                                               |
| `--prealignment-index` | [`bowtie2_index`](http://refgenie.databio.org/en/latest/available_assets/#bowtie2_index)                                                                 | A genome index file constructed from `bowtie2-build`. Used for manually pointing to prealignment genome indices when using `bowtie2` (default) for alignment.                           |
|                        | [`bwa_index`](https://refgenie.databio.org/en/latest/available_assets/#bwa_index)                                                                        | A genome index file constructed from `bwa index`. Used for manually pointing to prealignment genome indices when using `bwa` for alignment.                                             |
| `--TSS-name`           | [`refgene_anno`](http://refgenie.databio.org/en/latest/available_assets/#refgene_anno). `refgenie` `build/pull` the TSS annotation file with this asset. | Transcription start site (TSS) annotations. *e.g.* [refGene.txt.gz](https://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz)                                            |
| `--blacklist`          | [`blacklist`](http://refgenie.databio.org/en/latest/available_assets/#blacklist)                                                                         | A region blacklist. *e.g.* [the ENCODE blacklist](https://github.com/Boyle-Lab/Blacklist)                                                                                               |
| `--anno-name`          | [`feat_annotation`](annotation.md)                                                                                                                       | A BED-style file with "chr", "start", "end", "genomic feature name", "score" and "strand" columns.                                                                                      |
| `--search-file`        | [`tallymer_index`](https://refgenie.databio.org/en/latest/available_assets/#tallymer_index) The `search_file` is built from this `refgenie` asset.       | File used to search an index of k-mers in the genome of the same size as input read lengths. Only required for `--sob` argument (*i.e.* using `seqOutBias` for enzyme bias correction). |

## Using `refgenie` managed assets

`PEPATAC` can utilize [`refgenie`](http://refgenie.databio.org/) assets. Because assets are user-dependent, these files must be available natively. Therefore, you need to [install and initialize a refgenie config file.](http://refgenie.databio.org/en/latest/install/). For example:

```console
pip install refgenie
export REFGENIE=/path/to/your_genome_folder/genome_config.yaml
refgenie init -c $REFGENIE
```

Add the `export REFGENIE` line to your `.bashrc` or `.profile` to ensure it persists. 

Next, pull the assets you need. Replace `hg38` in the example below if you need to use a different genome assembly. If these assets are not available automatically for your genome of interest, then you'll need to [build them](annotation.md). Download all standard assets for `hg38` like so:

```console
refgenie pull hg38/fasta hg38/bowtie2_index hg38/refgene_anno hg38/ensembl_gtf hg38/ensembl_rb hg38/blacklist
refgenie build hg38/feat_annotation
```

`PEPATAC` also requires a `bowtie2_index` asset for any prealignment genomes:

```console
refgenie pull rCRSd/fasta rCRSd/bowtie2_index human_repeats/fasta human_repeats/bowtie2_index
```

If you prefer `bwa` for alignment, you would use the [`refgenie bwa_index`](http://refgenie.databio.org/en/latest/available_assets/#bwa_index) instead.

Furthermore, you can [learn more about using `seqOutBias` and the required `tallymer_index` here](sob.md).

### Example using `refgenie` managed assets

When using `refgenie`, you only need to provide the `--genome` and `--prealignment-names` argument to provide the pipeline with every required index and optional annotation file that exists for those genomes. This means, the TSS file, feature annotation file, and blacklist will all be used without needing to directly specify the paths to these files.

From the `pepatac/` repository directory:
```console
looper run examples/test_project/test_config_refgenie.yaml
```

## Using manually managed assets

Assets may also be managed manually and specified directly to the pipeline.  While this frees you from needing `refgenie` installed and initialized, it does require a few more arguments to be specified.

Custom blacklisted regions may be specified using the `--blacklist </path/to/your_blacklist.bed.gz>`. The blacklisted region file must simply be a `BED` formatted file to function correctly. The [`refgenie blacklist` asset](http://refgenie.databio.org/en/latest/available_assets/#blacklist) uses the [ENCODE blacklists](https://github.com/Boyle-Lab/Blacklist) by default.

The TSS annotation file may be specified using `--TSS-name </path/to/your_TSS_annotations.bed>`. This file is also a `BED` formatted file.

The `feat_annotation` asset may also be directly specified using `--anno-name </path/to/your_custom_feature_annotations.bed.gz>`.  Read [more about using custom reference data](annotation.md).

### Example using manually managed assets

Even when *not* using `refgenie`, you can still grab premade `--chrom-sizes` and `--genome-index` files from the `refgenie` servers. `Refgenie` uses algorithmically derived genome digests under-the-hood to unambiguously define genomes. That's what you'll see being used in the example below when we manually download these assets. Therefore, `2230c535660fb4774114bfa966a62f823fdb6d21acf138d4` is the digest for the human readable alias, "hg38", and `94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4` is the digest for "rCRSd."
```console
wget -O hg38.fasta.tgz http://refgenomes.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/fasta?tag=default
wget  -O hg38.bowtie2_index.tgz http://refgenomes.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/bowtie2_index?tag=default

wget -O rCRSd.fasta.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/fasta?tag=default
wget  -O rCRSd.bowtie2_index.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/bowtie2_index?tag=default
```

Then, extract these files:
```console
tar xvf hg38.fasta.tgz
tar xvf hg38.bowtie2_index.tgz
tar xvf rCRSd.fasta.tgz
tar xvf rCRSd.bowtie2_index.tgz
```

From the `pepatac/` repository folder (using the manually downloaded genome assets):
```console
looper run examples/test_project/test_config.yaml
```
