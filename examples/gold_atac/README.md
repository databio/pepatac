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

## Run pipeline

```
looper run ${CODE}pepatac/examples/gold_atac/metadata/project_config.yaml
```

