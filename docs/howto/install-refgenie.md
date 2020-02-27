# Configure genome assemblies for use with <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

This guide shows you how to download reference genome assemblies for `PEPATAC`. Whether using the container or native version of `PEPATAC`, you will need to provide reference genome assemblies produced by [`refgenie`](https://github.com/databio/refgenie).
One feature of the pipeline is prealignments, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to do will also require `refgenie` assemblies. When using the default configuration files, the pipeline will pre-align to the mitochondrial genome, so by default you will need `refgenie` assemblies for the `rCRSd` genome (*for human*) or `mouse_chrM` (*for mouse*) in addition to the primary assembly you wish to use. Other common prealignment references are provided by [ref_decoy](https://github.com/databio/ref_decoy).

## 1: Using `refgenie` assemblies

You have two options for using `refgenie` assemblies with `PEPATAC`. If you're using a common genome, you can probably download an existing [`refgenie` assembly](http://refgenomes.databio.org/).  Alternatively, you can create your own ([see `refgenie` for detailed instructions](http://refgenie.databio.org/en/latest/build/)).

*Reminder, if you followed the [install directions](../install.md), `refgenie` is already included!*

### Download pre-indexed `refgenie` assemblies

Pre-built genome indices exist for common genomes including: `hg38`, `hg19`, `mm10`, and `mm9`. You may [download the corresponding pre-indexed references](http://refgenie.databio.org/en/latest/download/) directly from the web or using `refgenie` on the command line.

For example, get the `hg38` bowtie2 index:
```console
refgenie pull -g hg38 -a bowtie2_index
```

### Build custom `refgenie` assemblies

For complete and detailed information on indexing your own genomes and building additional assets, [see the `refgenie` instructions](http://refgenie.databio.org/en/latest/build/).

## 2: Configure the pipeline to use `refgenie` assemblies

Once you've procured assemblies for all genomes you wish to use, you must point the pipeline to where you store these. You can do this in two ways, either: 1) with an environment variable, or 2) by adjusting a configuration option.
The pipeline looks for genomes stored in a folder specified by the `resources.genome_config` attribute in the [pipeline config file](https://github.com/databio/pepatac/blob/dev/pipelines/pepatac.yaml). By default, this points to the shell variable `REFGENIE`, so all you have to do is set an environment variable to the location of your `refgenie` configuration file:
```
export REFGENIE="/path/to/genome_config.yaml"
```
(Add this to your `.bashrc` or `.profile` to ensure it persists).
Alternatively, you can skip the `REFGENIE` variable and simply change the value of that configuration option to point to the configuration file for `refgenie`. The advantage of using an environment variable is that it makes the configuration file portable, so the same pipeline can be run on any computing environment, as the location to reference assemblies is not hard-coded to a specific computing environment.

