# Prealignments

One feature of the pipeline is *prealignments*, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Ideas for common prealignment references are provided by [ref_decoy](https://github.com/databio/ref_decoy).

## Using prealignments with looper

To change the prealignments, you just need to add a `prealignment` sample attribute with a space-separated list of all genomes you want to prealign to.

For example, adding this to your PEP project config yaml file will instruct the pipeline to pre-align to `human_rDNA`, then `rCRSd`, before doing the primary alignment to `hg38`:

```
sample_modifiers:
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then:
        prealignments: human_rDNA rCRSd
```

You could accomplish the same thing in a less elegant way by adding these columns to your sample 
table so it looks something like this:

sample_name	| genome | prealignments | other columns...
-----|----|----|-----
sample1	| hg38 | human_rDNA rCRSd  | ...
sample2	| hg38 | human_rDNA rCRSd | ...
sample3	| hg38 | human_rDNA rCRSd | ...


## Using prealignments on the command-line

If you want to adjust this for a single sample run, you just pass the values on the command line:

```console
/pipelines/pepatac.py \
  --sample-name test \
  --genome hg38 \
  --prealignments human_rDNA rCRSd \
  --input examples/data/test_r1.fq.gz \
  --single-or-paired single \
  -O $HOME/example/

```