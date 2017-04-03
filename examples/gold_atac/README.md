# Gold ATAC

Testing ATAC-seq pipeline on gold standard public ATAC-seq data.

## Grab data, project setup

Use `get_geo.py` to download raw ATAC-seq reads from SRA and metadata from GEO:

```
python get_geo.py -i ~/code/ATACseq/examples/gold_atac/metadata/gold_atac_gse.csv -r --fastq
```

Use resulting file [metadata/annocomb_gold_atac_gse.csv](metadata/annocomb_gold_atac_gse.csv) to create the looper metadata sheet, [metadata/gold_atac_annotation.csv](metadata/gold_atac_annotation.csv).

Create project config file.

## Run pipeline

```
looper run ${CODE}ATACseq/examples/gold_atac/metadata/project_config.yaml -d
```