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

`PEPATAC` (this branch) targets [refgenie 1.0+](https://github.com/refgenie/refgenie1) (the SQLModel-backed reimplementation), not legacy refgenie 0.12.x.

`refgenie` 1.0 splits genome registration from asset acquisition: you first `refgenie genome init` from a FASTA, then `refgenie add` each asset (which builds it locally from the registered recipes, or pulls from a subscribed source).

Install and initialize refgenie 1.0:

```console
pip install "refgenie>=1.0.0"
export REFGENIE_HOME_PATH=/path/to/your_refgenie_home
export REFGENIE_DB_CONFIG_PATH=$REFGENIE_HOME_PATH/refgenie_db_config.yaml
refgenie init
```

Add the `export REFGENIE_HOME_PATH` and `export REFGENIE_DB_CONFIG_PATH` lines to your `.bashrc` or `.profile` to ensure they persist. Note: legacy refgenie used `$REFGENIE` pointing at a YAML config; refgenie 1.0 uses `$REFGENIE_DB_CONFIG_PATH` pointing at the SQLite-backed db config. Update any inherited `.bashrc` accordingly.

Next, register a genome and add assets. Replace `hg38` if you need a different assembly:

```console
# Register a genome from a FASTA file
refgenie genome init /path/to/hg38.fa --alias hg38

# Add each asset (recipes ship in refgenie/recipes; subscribe to a source if pulling)
refgenie add hg38/fasta            --recipe fasta
refgenie add hg38/bowtie2_index    --recipe bowtie2_index
refgenie add hg38/refgene_anno     --recipe refgene_anno
refgenie add hg38/blacklist        --recipe blacklist
refgenie add hg38/feat_annotation  --recipe feat_annotation
```

`PEPATAC` also requires a `bowtie2_index` asset for any prealignment genomes:

```console
refgenie genome init /path/to/rCRSd.fa --alias rCRSd
refgenie add rCRSd/fasta         --recipe fasta
refgenie add rCRSd/bowtie2_index --recipe bowtie2_index
```

If you prefer `bwa` for alignment, you would use a `bwa_index` recipe instead. (Note: the `bwa_index` and `tallymer_index` asset classes may not yet ship in `refgenie/recipes`; check that repo or build manually.)

Furthermore, you can [learn more about using `seqOutBias` and the required `tallymer_index` here](sob.md).

### Example using `refgenie` managed assets

When using `refgenie`, you only need to provide the `--genome` and `--prealignment-names` argument to provide the pipeline with every required index and optional annotation file that exists for those genomes. This means, the TSS file, feature annotation file, and blacklist will all be used without needing to directly specify the paths to these files.

From the `pepatac/` repository directory:
```console
looper run examples/test_project/test_config_refgenie.yaml
```

## Using manually managed assets

Assets may also be managed manually and specified directly to the pipeline.  While this frees you from needing `refgenie` installed and initialized, it does require a few more arguments to be specified.

> **Note**: even when you provide every path manually, the pipeline interface (`sample_pipeline_interface.yaml`) currently runs a `refgenconf.looper_refgenie_populate` pre-submit hook that expands `$REFGENIE`. If `$REFGENIE` is unset you'll see `FileNotFoundError: [Errno 2] No such file or directory: '$REFGENIE'`. The simplest workaround is to point `$REFGENIE` at an empty refgenie config — the hook succeeds against an empty config, and your manual paths are used regardless:
>
> ```console
> refgenie init -c /tmp/empty_refgenie.yaml
> export REFGENIE=/tmp/empty_refgenie.yaml
> ```
>
> A proper "no refgenie" path is on the roadmap; until then the empty-config workaround is the supported approach.

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

### Troubleshooting: `TypeError: 'NoneType' object is not iterable`

If `looper run` fails before the pipeline starts with this trace, ending in `refgenconf/populator.py` → `refgenconf/refgenconf.py` → `for seek_key_name in get_tag_seek_keys(tag_mapping)` → `TypeError: 'NoneType' object is not iterable`, the cause is **a refgenie genome with one or more incomplete assets**. The pre-submit hook iterates every asset for every registered genome, and one of them returned `None`. This commonly happens when prealignment genomes are partially pulled (e.g. `rCRSd/bowtie2_index` is pulled but `rCRSd/fasta` is not).

To diagnose, list every asset in your refgenie config:

```console
refgenie list -g rCRSd       # list assets for one genome
refgenie list                # list all genomes
```

Then pull anything missing — the most common gap is the prealignment FASTA:

```console
refgenie pull rCRSd/fasta
refgenie pull human_repeats/fasta
```

The unhelpful error message is upstream behavior in `refgenconf`; the eventual fix lives there.

Custom blacklisted regions may be specified using the `--blacklist </path/to/your_blacklist.bed.gz>`. The blacklisted region file must simply be a `BED` formatted file to function correctly. The [`refgenie blacklist` asset](http://refgenie.databio.org/en/latest/available_assets/#blacklist) uses the [ENCODE blacklists](https://github.com/Boyle-Lab/Blacklist) by default.

The TSS annotation file may be specified using `--TSS-name </path/to/your_TSS_annotations.bed>`. This file is also a `BED` formatted file.

The `feat_annotation` asset may also be directly specified using `--anno-name </path/to/your_custom_feature_annotations.bed.gz>`.  Read [more about using custom reference data](annotation.md).

### Using a custom adapter file

`PEPATAC` defaults to the bundled Nextera adapter file (`tools/NexteraPE-PE.fa`). To use your own adapter sequences (e.g. for non-Nextera library preps), set the `adapters` resource in the pipeline configuration file at `pipelines/pepatac.yaml`:

```yaml
resources:
  genome_config: ${REFGENIE}
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
