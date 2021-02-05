# Run the pipeline script directly

The pipeline at its core is just a python script, and you can run it on the command line for a single sample (see [command-line usage](usage.md)), which you can also get on the command line by running `pipelines/pepatac.py --help`. You just need to pass a few command-line parameters to specify sample name, reference genome, input files, etc. Here's the basic command to run a small test example through the pipeline:

```console
pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input examples/data/test1_r1.fastq.gz \
  --input2 examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

This example should take about 15 minutes to complete.  See [other example commands](https://github.com/databio/pepatac/blob/master/example_cmd.txt) that use test data.
