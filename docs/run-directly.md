# Run the pipeline script directly

The pipeline at its core is just a python script, and you can run it on the command line for a single sample (see [command-line usage](usage.md)), which you can also get on the command line by running `pipelines/pepatac.py --help`. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. Here's the [basic command to run a small test example through the pipeline](run-bulker.md#run-the-pipeline-at-the-command-line):

From the `pepatac/` repository folder (using the manually downloaded genome assets):
```console
pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd=default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4 \
  --genome hg38 \
  --genome-index default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4 \
  --chrom-sizes default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.chrom.sizes \
  --sample-name test1 \
  --input examples/data/test1_r1.fastq.gz \
  --input2 examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

This example should take about 20-30 minutes to complete.  
