# Run multiple samples through <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">


This guide walks you through extending `PEPATAC` to run on multiple samples using `looper`. The pipeline can be run directly from the command line for a single sample ([see Install and run](../install.md)). If you need to run it on many samples, you could write your own sample handling code, but we have pre-configured everything to work nicely with `looper`, our sample handling engine.

## 1: Install `looper`

This pipeline is pre-configured to work with `looper`. [Looper](http://looper.readthedocs.io/) is a pipeline submission engine that makes it easy to deploy any pipeline across samples. It will let you run the jobs locally, in containers, using any cluster resource manager, or in containers on a cluster.

You can install `looper` using `pip`:

```{bash}
pip install --user https://github.com/pepkit/looper/zipball/master
```

## 2: Configure project files

To configure your project to use `looper`, you must use a project format called **PEP format**. There are multiple examples you can adapt in the `examples/` folder (*e.g.* [example test PEP](https://github.com/databio/pepatac/tree/master/examples/test_project)). The details for how to construct this are universal to all pipelines that read PEPs, including PEPATAC, and you should follow the detailed instructions on [how to create a PEP](https://pepkit.github.io/docs/home/). In short, you need two files for your project:

  1. project config file -- describes output locations, pointers to data, etc.
  2. sample annotation file -- comma-separated value (CSV) list of your samples.

The sample annotation file must specify these columns:

- sample_name
- library ('ATAC' or 'ATACSEQ' or 'ATAC-seq')
- organism (may be 'human' or 'mouse')
- read1
- read2
- whatever else you want

## 3: Run the pipeline through `looper`

Start by running the example project in the [`examples/test_project/`](https://github.com/databio/pepatac/tree/master/examples/test_project) folder. Let's use the looper's `-d` argument to do a *dry run*, which will create job scripts for every sample in the project, but will not execute them:
```
looper run -d examples/test_project/test_config.yaml
```
If the looper executable is not in your `$PATH`, add the following line to your `.bashrc` or `.profile`:
```
export PATH=$PATH:~/.local/bin
```
If that worked, let's actually run the example by taking out the `-d` flag:

```
looper run examples/test_project/test_config.yaml
```

There are lots of other cool things you can do with looper, like dry runs, summarize results, check on pipeline run status, clean intermediate files to save disk space, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.readthedocs.io/).
