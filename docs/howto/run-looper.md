## Run <img src="../../img/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> using `looper`

The pipeline can be run directly from the command line for a single sample ([see Install and run](../install.md)). If you need to run it on many samples, you could write your own sample handling code, but we have pre-configured everything to work nicely with `looper`, our sample handling engine. This section explains how to use `looper`.

---

#### **1: Install `looper`**

This pipeline is pre-configured to work with `looper`. [Looper](http://looper.readthedocs.io/) is a pipeline submission engine that makes it easy to deploy any pipeline across samples. It will let you run the jobs locally, in containers, using any cluster resource manager, or in containers on a cluster.
If you've already gone through the installation process for `PEPATAC`, you will already have `looper` installed.  If that's the case, [skip right to the example](run-looper.md#2-run-the-pipeline-through-looper).
Otherwise, install `looper` using `pip`:
```
pip install --user https://github.com/pepkit/looper/zipball/master
```

#### **2: Run the pipeline through `looper`**

Start by running the example project in the [`examples/test_project/`](https://github.com/databio/pepatac/tree/master/examples/test_project) folder. Let's use the `-d` argument to do a *dry run*, which will create job scripts for every sample in the project, but will not execute them:
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
There are lots of other cool things you can do with looper, like dry runs, summarize results, check on pipeline run status, clean intermediate files, lump multiple samples into one job, and more. For details, consult the [looper docs](http://looper.readthedocs.io/).

---

- [:fa-envelope: Contact Us](../contact.md)
- [Learn more about the Databio team!](http://databio.org/)
