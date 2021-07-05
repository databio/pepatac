# Running on a cluster

## Default computing options

When you run your `PEPATAC` project using `looper run`, by default it will simply run each sample locally. You can change that using `looper run --package COMPUTE_PACKAGE`, where `COMPUTE_PACKAGE` is an option described below. This enables you to adjust your computing preferences on-the-fly. You have several built-in packages, which you can view by typing `divvy list`. Default packages include:

- `--package slurm`. Submit the jobs to a `SLURM` cluster using `sbatch`.
- `--package sge`. Submit the jobs to a `SGE` cluster using `qsub`.

To show how this works, let's run the example project using the `slurm` compute package. Used `-d` for a dry run to create the submits scripts but not run them.

Using the manually downloaded assets (from the `pepatac/` repository):
```console
looper run examples/test_project/test_config.yaml -d \
  --package slurm
```

This will produce a job script:

```console
cat pepatac_test/submission/PEPATAC_test1.sub
```

If all looks well, run looper without `-d` to actually submit the jobs. Read more to [learn how to run `PEPATAC` in containers](run-container.md). 

Using `refgenie` managed assets (from the `pepatac/` repository):
```console
looper run examples/test_project/test_config_refgenie.yaml -d \
  --package slurm
```

This will produce a job script:

```console
cat pepatac_test/submission/PEPATAC_test1.sub
```

## Customizing compute options

These default computing options may not fit your needs exactly. `PEPATAC` allows you to very easily change templates or add your own, so you can run `PEPATAC` in any possible computing environment. `PEPATAC` uses a standardized computing configuration called [`divvy`](https://divvy.databio.org). The instructions for changing these computing configuration options are universal for any software that relies on `divvy`. 

To customize your compute packages, you first create a `divvy` computing configuration file and point an environment variable (`DIVCFG`) to that file:

```console
export DIVCFG="divvy_config.yaml"
divvy init $DIVCFG
```

Next, you edit that config file to add in any compute packages you need. `PEPATAC` will then give you access to any of your custom packages with `looper --package <compute_package>`. For complete instructions on how to create a custom compute package, read [how to configure divvy](https://divvy.databio.org/en/latest/configuration/). 
