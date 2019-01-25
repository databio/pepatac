# Configure project files for <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

## Description of guide

This guide walks you through customizing configuration files for your own project.

Running the pipeline on many samples is made simple by employing `looper`, our pipeline submission engine.  To set up `looper`, you can check out [how to run the pipeline through looper](run-looper.md) or [read the `looper` docs](https://looper.readthedocs.io/).


## Instructions

The configuration files use a [project format called the standard Portable Encapsulated Project (PEP)](https://pepkit.github.io/) format, which is outlined in more detail in the pepkit documentation.

There are multiple examples you can adapt in the `examples/` folder. You need two files for your project:

  1. project config file -- describes output locations, pointers to data, etc.
  2. sample annotation file -- comma-separated value (CSV) list of your samples.

The sample annotation file must specify these columns:
```
sample_name
library ('ATAC' or 'ATACSEQ' or 'ATAC-seq')
organism (may be 'human' or 'mouse')
read1
read2
whatever else you want
```
Run your project by passing your updated project config file to `looper` with `looper run project_config.yaml`.

`Looper` can also summarize your results, monitor your runs, clean intermediate files to save disk space, and more. You can find additional details on what you can do with this in the [looper docs](https://looper.readthedocs.io/en/latest/).

