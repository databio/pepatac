# Running on a cluster

## Default computing options

When you run your PEPATAC project using `looper run`, by default it will simply run each sample locally. You can change that using `looper run --compute PACKAGE`, where PACKAGE is an option described below. This enables you to adjust your computing preferences on-the-fly. You have several built-in packages, which you can view by typing `divvy list`. Default packages include:

- `--compute slurm`. Submit the jobs to a SLURM cluster using `sbatch`.
- `--compute sge`. Submit the jobs to a SGE cluster using `qsub`.
- `--compute docker`. Submit the jobs locally using the `databio/PEPATAC` docker image.
- `--compute singularity`. Submit the jobs locally using the singularity image.
- `--compute singularity_slurm`. Submit jobs using `sbatch`, but run them using the singularity image.

To show how this works, let's run the example project using the `slurm` compute package. Used `-d` for a dry run to create the submits scripts but not run them:

```console
cd pepatac
looper run examples/test_project/test_config.yaml -d \
  --compute slurm
```

This will produce a job script:

```console
cat $HOME/atac_out/submission/pepatac.py_test1.sub
```

If all looks well, run looper without `-d` to actually submit the jobs. To use the docker or singularity options, see [running PEPATAC in containers](container.md). 

## Customizing compute options

These default computing options may not fit your needs exactly. PEPATAC allows you to very easily change templates or add your own, so you can run PEPATAC in any possible computing environment. PEPATAC uses a standardized computing configuration called [divvy](https://divvy.databio.org). The instructions for changing these computing configuration options are universal for any software that relies on `divvy`. 

To customize your compute packages, you first create a `divvy` computing configuration file and point an environment variable (`DIVCFG`) to that file:

```console
export DIVCFG="divvy_config.yaml"
divvy init -c $DIVCFG
```

Next, you edit that config file to add in any compute packages you need. PEPATAC will then give you  access to any of your custom packages with `looper --compute <package>`. For complete instructions on how to create a custom compute package, read [how to configure divvy](https://divvy.databio.org/en/latest/configuration/). 
