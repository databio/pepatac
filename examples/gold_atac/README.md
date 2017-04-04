
# Gold ATAC

Testing ATAC-seq pipeline on gold standard public ATAC-seq data.

## Grab data, project setup

Download raw `fastq.gz` files (use `fastq-dump` from SRA. You may also use `get_geo.py` to download raw ATAC-seq reads from SRA and metadata from GEO:

```
python get_geo.py -i ~/code/ATACseq/examples/gold_atac/metadata/gold_atac_gse.csv -r --fastq
```

I used resulting file [metadata/annocomb_gold_atac_gse.csv](metadata/annocomb_gold_atac_gse.csv) to create the looper metadata sheet, [metadata/gold_atac_annotation.csv](metadata/gold_atac_annotation.csv).

I create project config file and sampled test data. The SRA fastq files should be stored in a folder `${SRAFQ}`, and then this will run with looper with no additional changes.

## Run pipeline

```
looper run ${CODE}ATACseq/examples/gold_atac/metadata/project_config.yaml -d
```