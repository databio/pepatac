# ATACseq pipeline

This repository contains a pipeline to process ATAC-seq data. It does adapter trimming, mapping, peak calling, bigwig, TSS enrichments.

## Installing

**Prerequisites**. This pipeline uses [pypiper](https://github.com/epigen/pypiper) to run a pipeline for a single sample, and [looper](https://github.com/epigen/looper) to handle multi-sample projects (for either local or cluster computation). You can do a user-specific install of both like this:

```
pip install --user https://github.com/epigen/pypiper/zipball/master
pip install --user https://github.com/epigen/looper/zipball/master
```
To have the looper executable in your $PATH, add the following line to your .bashrc file:

```
export PATH=$PATH:~/.local/bin
```

Then, clone this repository using one of these methods:
- using SSH: `git clone git@github.com:ChangLab/ATACseq.git`
- using HTTPS: `git clone https://github.com/ChangLab/ATACseq.git`


## Running the pipeline

The best way to use this pipeline is to run it through looper. You will need to tell looper about your project. Example project data are in the [test_project](test_project) folder. Run the pipeline across all samples in the test project with this command:

```
looper run test_project/test_config.yaml
```

Now, adapt for your project. Here's a quick start: You need to build two files for your project (follow examples in the [test_project](test_project/) folder):

- [project config file](test_project/test_config.yaml) -- describes output locations, pointers to data, etc.
- [sample annotation file](test_project/test_annotation.csv) -- comma-separated value (CSV) list of your samples.

Your annotation file must specify these columns:
- sample_name
- library (must be 'ATAC')
- organism (may be 'human' or 'mouse')
- read1
- read2
- whatever else you want

Run your project as above, by passing your project config file to `looper run`. More detailed instructions and advanced options for how to define your project are in the [Looper documentation on defining a project](http://looper.readthedocs.io/en/latest/define-your-project.html).

## Running on a single sample:

You never need to interface with the pipeline directly, but you can if you want. Just run `python pipelines/ATACseq.py -h` to see usage. See example command in [cmd.sh](cmd.sh).

## Contributing

Active development should occur in a development or feature branch.

## Contributors

* Jin Xu, jinxu9@stanford.edu
* Nathan Sheffield
* Others... (add your name)
