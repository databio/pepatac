# Gold ATAC

Testing ATAC-seq pipeline on gold standard public ATAC-seq data.

## Grab the data

To download data from the Sequence Read Archive (SRA), we'll use some convenient companion software called [`geofetch`](https://geofetch.databio.org), which can be installed from PyPI:

```console
pip install --user --upgrade geofetch
```

This does require having the [`NCBI SRA Toolkit`](https://trace.ncbi.nlm.nih.gov/Traces/sra/?view=toolkit_doc&f=std) installed as well. Now let's get the data:
```
geofetch -i GSE94182 
```

## Run the pipeline

To make our software and code more portable, we create environment variables to point to software parent directories, data directories, and output directories.  The [`gold_config.yaml`](https://github.com/databio/pepatac/tree/master/examples/gold_atac/metadata/gold_config.yaml) configuration file expects a few of these to already be configured. You could also overwrite these in the `gold_config.yaml` itself to be full paths should you prefer.

Pipeline output parent directory: `export PROCESSED="/your/project/output/parent/dir"
Software and code parent directory: `export CODE="/your/path/to/code"`
Sample data directory: `export SRAFQ=/your/path/to/fastq/files"`

### Run with default settings

```
looper run ${CODE}/pepatac/examples/gold_atac/metadata/.looper_gold.yaml
```

### Run with alternative settings

The configuration file contains numerous [amendments](http://peppy.databio.org/en/latest/feature5_amend/) to illustrate how you could run the pipeline using a different peak caller, deduplication tool, or alignment tool to name a few.

For example, say you want to align the gold samples using `bwa` instead of `bowtie2`. First, you will of course need to have `bwa` installed or available with bulker, and second, you'll need to have [`refgenie` assets for `bwa`](http://refgenie.databio.org/en/latest/available_assets/#bwa_index).

```
looper run ${CODE}pepatac/examples/gold_atac/metadata/.looper_gold.yaml --amend bwa
```

Or, say you want to use `picard MarkDuplicates` instead of `samblaster` for deduplication:

```
looper run ${CODE}pepatac/examples/gold_atac/metadata/.looper_gold.yaml --amend picard
```

All of the `project_modifiers:` subheaders in the `gold_pep_config.yaml` file illustrate how you could, using the same base configuration file, call the pipeline on the gold samples with different settings. 