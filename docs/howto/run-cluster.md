# Run <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> on a cluster

`PEPATAC` by itself does not specify any cluster resources, so you could just roll your own and submit individual jobs to a cluster however you choose. But because `PEPATAC` is already `looper`-compatible, the easier way is to use `looper's` built-in template system, which `looper` uses to build flexible shell scripts for job submission. These templates can be used to run jobs in a container, to submit to a cluster resource manager, or both.

To use `looper` templates, we must create a *computing environment configuration file* called `PEPENV`. In short, you will need to:

- Set up a compute configuration file that includes a containerized or cluster compute template (or both).
- Point the environment variable `PEPENV` to the location of this file.
- Run the pipeline with `looper run --compute PACKAGE` (where `PACKAGE` is specified in your `PEPENV` file).

This enables you to adjust your computing preferences on-the-fly when you run a project.

The complete description of setting up `looper` to use `PEPENV` is generic to any pipeline. If you want to use looper with containers or clusters, you should consult the complete docs in the looper documentation on [configuring looper to use a cluster](http://code.databio.org/looper/cluster-computing/).
