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

`PEPATAC` uses [`refgenie`](https://refgenie.org) 1.0 or newer to find reference
assets. refgenie 1.0 is a rewrite: it keeps a small database instead of a YAML
config file, and it reads a different environment variable than refgenie 0.12
did. If you have used refgenie before, read the migration note at the bottom of
this section.

### Install and initialize

```console
pip install "refgenie>=1.0.0a3"
export REFGENIE_HOME_PATH=/path/to/your_refgenie_home
refgenie init
```

PEPATAC 0.15 requires refgenie 1.0 (version 1.0.0a3 or newer). It does not
work with refgenie 0.12 or 0.13; if you need those, use PEPATAC 0.14.

`refgenie init` creates the database under `$REFGENIE_HOME_PATH` and subscribes
you to the public asset server, so `refgenie listr` shows what you can download.
Add the `export REFGENIE_HOME_PATH` line to your `.bashrc` or `.profile` so it
persists.

### Download the assets you need

Replace `hg38` below if you use a different assembly:

```console
refgenie pull hg38/fasta hg38/bowtie2_index
```

`PEPATAC` also needs a `fasta` and a `bowtie2_index` for every prealignment
genome:

```console
refgenie pull rCRSd/fasta rCRSd/bowtie2_index
```

If you align with `bwa` instead of `bowtie2`, pull `hg38/bwa_index` in place of
`hg38/bowtie2_index`.

Check what you have with `refgenie list`, and see where a single asset landed
with `refgenie seek hg38/bowtie2_index`.

### Assets you have to build yourself

The public server currently serves `fasta`, `fasta_index`, `bowtie2_index`,
`bwa_index`, `hisat2_index` and `suffixerator_index`. It does **not** yet serve
the three PEPATAC annotation assets (`refgene_anno`, `blacklist`,
`feat_annotation`) or `tallymer_index`. You have two options.

Option 1, the simpler one: skip refgenie for those files and name them directly
in your PEP, as sample attributes `TSS_name`, `blacklist` and `anno_name` (see
[Configure project files](peps.md)). PEPATAC only asks refgenie for an asset
when the PEP does not already give it a path, so a missing asset is not an
error.

Option 2: register the recipe, then build. The recipes live in the
[refgenie/recipes](https://github.com/refgenie/recipes/tree/refgenie1)
repository on its `refgenie1` branch, and you add them by URL:

```console
BASE=https://raw.githubusercontent.com/refgenie/recipes/refgenie1
refgenie asset-class add --source $BASE/asset_classes/refgene_anno_asset_class.yaml
refgenie recipe add      --source $BASE/recipes/refgene_anno_asset_recipe.yaml
refgenie build hg38/refgene_anno --files refgene=/path/to/refGene.txt.gz
```

`refgene_anno` needs a RefGene table such as
[refGene.txt.gz](https://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz),
and `blacklist` needs a blacklist file such as
[the ENCODE blacklist](https://github.com/Boyle-Lab/Blacklist). `feat_annotation`
is built from the `ensembl_gtf` and `ensembl_rb` assets, so build those first.
Add `--container` to run a recipe's commands in its own container image.

You can also [learn more about using `seqOutBias` and the required
`tallymer_index` here](sob.md).

### Migrating from refgenie 0.12

| refgenie 0.12 | refgenie 1.0 |
|---|---|
| `export REFGENIE=/path/genome_config.yaml` | `export REFGENIE_HOME_PATH=/path/to/refgenie_home` |
| `refgenie init -c $REFGENIE` | `refgenie init` |
| `refgenie pull hg38/fasta` | `refgenie pull hg38/fasta` (unchanged) |
| asset directory seek key `bowtie2_index.dir` | index prefix seek key `bowtie2_index.bowtie2_index` |

PEPATAC reads `$REFGENIE_DB_CONFIG_PATH` if you set it, and otherwise uses
refgenie's own default, `$REFGENIE_HOME_PATH/refgenie_db_config.yaml`. Setting
`REFGENIE_HOME_PATH` alone is enough. The old `$REFGENIE` variable is ignored;
refgenie 1.0 prints a warning if it is still set, so remove it from your shell
startup files.

### Example using `refgenie` managed assets

When using `refgenie`, you only need to provide the `--genome` and `--prealignment-names` argument to provide the pipeline with every required index and optional annotation file that exists for those genomes. This means, the TSS file, feature annotation file, and blacklist will all be used without needing to directly specify the paths to these files.

From the `pepatac/` repository directory:
```console
looper run examples/test_project/test_config_refgenie.yaml
```

## Using manually managed assets

Assets may also be managed manually and specified directly to the pipeline.  While this frees you from needing `refgenie` installed and initialized, it does require a few more arguments to be specified.

> **Note**: the pipeline interface (`sample_pipeline_interface.yaml`) always runs
> the `refgenie.integrations.looper.populate` pre-submit hook, but you do not
> need a populated refgenie database to use manual paths. If
> `$REFGENIE_DB_CONFIG_PATH` is unset or empty, the hook falls back to
> refgenie's default database, and your manual paths are used regardless. The
> empty-config workaround that refgenie 0.12 required is no longer needed.
>
> If you do set the variable, point it somewhere refgenie can actually create:
> a path that does not exist yet is fine, as long as its parent directory is
> writable. Otherwise refgenie fails before the pipeline starts, raising
> `PermissionError` if the parent is not writable or `FileNotFoundError` if the
> parent does not exist.

### Running a non-refgenie genome through `looper`

If your samples use a genome that isn't in your refgenie config (e.g. `galGal6`, `bosTau9`, an unaligned custom assembly), the pipeline interface jinja template will only succeed if every required asset path is provided at the sample level — otherwise the `refgenie[sample.genome].<asset>` lookup falls through to a missing-key error. Set these in your PEP `sample_modifiers` block (alongside `genome`):

```yaml
sample_modifiers:
  imply:
    - if:
        organism: ["chicken"]
      then:
        genome: galGal6
        chrom_sizes: /path/to/galGal6.chrom.sizes
        genome_index: /path/to/galGal6_bowtie2_index/galGal6
        # Optional, only if you have them:
        TSS_name: /path/to/galGal6_TSS.bed
        blacklist: /path/to/galGal6_blacklist.bed
        anno_name: /path/to/galGal6_feat_annotation.bed.gz
        genome_size: "1.05e9"
```

Each `sample.X` attribute short-circuits the corresponding `refgenie[sample.genome].X` lookup in `sample_pipeline_interface.yaml`, so refgenie is never queried for that genome. Samples using a refgenie-managed genome (e.g. `hg38`, `mm10`) and samples using a manually-managed genome can be processed in the same project.

### Troubleshooting: `looper` fails before the pipeline starts

If `looper run` fails with an error like

```
UndefinedError: 'refgenie.core.paths.GenomePaths object' has no attribute 'bowtie2_index'
```

the cause is **a prealignment genome that refgenie knows about but has no
aligner index for**. Every genome you list in `prealignment_names` needs both a
`fasta` and the index for the aligner you are using, and the pipeline interface
asks for that index without checking first.

To see what you actually have:

```console
refgenie list -g rCRSd       # list assets for one genome
refgenie list                # list all genomes
```

Then pull whatever is missing:

```console
refgenie pull rCRSd/fasta rCRSd/bowtie2_index
refgenie pull human_repeats/fasta human_repeats/bowtie2_index
```

A genome that refgenie does not know about at all is handled gracefully: the
interface guards every lookup with `sample.genome in refgenie`, so the sample's
own attributes are used instead. See [Running a non-refgenie genome through
`looper`](#running-a-non-refgenie-genome-through-looper) above.

Under refgenie 0.12 the same situation produced `TypeError: 'NoneType' object is
not iterable` from `refgenconf`. That code path is gone in refgenie 1.0.

Custom blacklisted regions may be specified using the `--blacklist </path/to/your_blacklist.bed.gz>`. The blacklisted region file must simply be a `BED` formatted file to function correctly. The [`refgenie blacklist` asset](http://refgenie.databio.org/en/latest/available_assets/#blacklist) uses the [ENCODE blacklists](https://github.com/Boyle-Lab/Blacklist) by default.

The TSS annotation file may be specified using `--TSS-name </path/to/your_TSS_annotations.bed>`. This file is also a `BED` formatted file.

The `feat_annotation` asset may also be directly specified using `--anno-name </path/to/your_custom_feature_annotations.bed.gz>`.  Read [more about using custom reference data](annotation.md).

### Using a custom adapter file

`PEPATAC` defaults to the bundled Nextera adapter file (`tools/NexteraPE-PE.fa`). To use your own adapter sequences (e.g. for non-Nextera library preps), set the `adapters` resource in the pipeline configuration file at `pipelines/pepatac.yaml`:

```yaml
resources:
  genome_config: ${REFGENIE_DB_CONFIG_PATH}
  adapters: /path/to/your/adapters.fa
```

The file must be in FASTA format (the same format consumed by `trimmomatic`'s `ILLUMINACLIP` and `skewer`'s `-x` option). Set `adapters: null` to fall back to the bundled default.

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
