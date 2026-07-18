# Configure genome assemblies for use with <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

This guide shows you how to download reference genome assemblies for `PEPATAC`. Whether using the container or native version of `PEPATAC`, you will need to provide reference genome assemblies produced by [`refgenie`](https://github.com/databio/refgenie).
One feature of the pipeline is prealignments, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to do will also require `refgenie` assemblies. When using the default configuration files, the pipeline will pre-align to the mitochondrial genome, so by default you will need `refgenie` assemblies for the `rCRSd` genome (*for human*) or `mouse_chrM` (*for mouse*) in addition to the primary assembly you wish to use. Other common prealignment references are provided by [ref_decoy](https://github.com/databio/ref_decoy).

## 1: Using `refgenie` assemblies

You have two options for using `refgenie` assemblies with `PEPATAC`. If you're using a common genome, you can probably download an existing [`refgenie` assembly](http://refgenomes.databio.org/).  Alternatively, you can create your own ([see `refgenie` for detailed instructions](http://refgenie.databio.org/en/latest/build/)).

*Reminder, if you followed the [install directions](../install.md), `refgenie` is already included!*

### Download pre-indexed `refgenie` assemblies

Pre-built genome indices exist for common genomes including: `hg38`, `hg19`, `mm10`, and `mm9`. You may [download the corresponding pre-indexed references](http://refgenie.databio.org/en/latest/download/) directly from the web or using `refgenie` on the command line.

For example, build the `hg38` bowtie2 index (refgenie 1.0):
```console
refgenie genome init /path/to/hg38.fa --alias hg38
refgenie add hg38/bowtie2_index --recipe bowtie2_index
```

### Build custom `refgenie` assemblies

For complete and detailed information on indexing your own genomes and building additional assets, [see the `refgenie` instructions](http://refgenie.databio.org/en/latest/build/).

## 2: Configure the pipeline to use `refgenie` assemblies

Once you've registered assemblies and assets for all genomes you wish to use, the pipeline locates them via the refgenie 1.0 db config path:

```
export REFGENIE_HOME_PATH="/path/to/your_refgenie_home"
export REFGENIE_DB_CONFIG_PATH="$REFGENIE_HOME_PATH/refgenie_db_config.yaml"
```

(Add these to your `.bashrc` or `.profile` to ensure they persist.)

The pipeline interface's `pre_submit` hook (`refgenie.looper_refgenie_populate_local`) reads `$REFGENIE_DB_CONFIG_PATH` from the environment and resolves all asset paths automatically.

> **NOTE (refgenie1 branch):** The legacy `$REFGENIE` env var (pointing at a YAML config) is replaced by `$REFGENIE_DB_CONFIG_PATH` (pointing at refgenie 1.0's db config YAML). Update any inherited `.bashrc` accordingly.

