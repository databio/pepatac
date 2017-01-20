# ATACseq pipeline

This repository contains a pipeline to process ATAC-seq data. It does adapter trimming, mapping, peak calling, bigwig, TSS enrichments.

## Installing

**Prerequisites**. This repo uses [pypiper](https://github.com/epigen/pypiper) to run a pipeline for a single sample, and [looper](https://github.com/epigen/looper) to handle multi-sample project (for either local or cluster computationa). You can do a user-specific install of both like this:

```
pip install --user https://github.com/epigen/pypiper/zipball/master
pip install --user https://github.com/epigen/looper/zipball/master
```

Then, clone this repository.

## Using in your project

The best way to use this pipeline is to through Looper. Example project data are in the [test_project](test_project) folder. Run the pipeline across all samples in the [sample annotation sheet](test_project/test_annotation.csv) with this command:

```
looper run test_project/test_config.yaml
```

Now, adapt for your project. Here's a quick start: You need to build two files for your project (follow examples in the [test_project](test_project/) folder):

- [project config file](test_project/test_config.yaml)
- [sample annotation file](test_project/test_annotation.yaml)

Your annotation file must specify these columns:
- sample_name
- library (must be 'ATAC')
- organism (may be 'human' or 'mouse')
- read1
- read2



More detailed instructions for how to define your project are in the [Looper documentation on defining a project](http://looper.readthedocs.io/en/latest/define-your-project.html).

## Running on a single sample:

See example command in [cmd.sh](cmd.sh).

## Contributing

Active development should occur in a development or feature branch.

## Contributors

Jin Xu, jinxu9@stanford.edu
Nathan Sheffield
Others... (add your name)
