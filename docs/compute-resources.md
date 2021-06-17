# How to configure computing resources

`PEPATAC` comes packaged with default compute settings (memory, cores, and time) for both the sample and project-level pipeline.  These values will automatically be populated by `looper` based on the input file size. In that way, smaller samples (e.g. fewer reads) will request less resources and vice-versa for large samples. You can also specify these values on the command-line.

## Configure computing resource requests at the command-line

You can specify the the memory (`-M`) and number of cores (`-P`) directly on the command-line.
```console
pipelines/pepatac.py -O /path/to/processed/data/ -S "compute_example" -I /path/to/fastq.fq -G "hg38" -P 16 -M 16000
```

## Configure computing resource requests with `looper`

Default computing resource requests are defined in the [resources-sample.tsv](https://github.com/databio/pepatac/blob/master/resources-sample.tsv) and [resources-project.tsv](https://github.com/databio/pepatac/blob/master/resources-project.tsv) for sample and project-level pipeline calls, respectively. `Looper` checks these files based on the `size_dependent_variables` section in the `sample` and `project` `pipeline_interface.yaml` files.  For default pipeline settings, these resources should be more than sufficient, but for different pipeline settings you may desire to request different resources.  This could be accomplished two ways:  
1. You can [override universal compute settings when you call `looper` by specifying the resources using the `--compute` variable](https://looper.readthedocs.io/en/latest/variable-namespaces/#5-compute):
```console
looper run <project_config.yaml> --compute mem=24000 time=00-12:00:00 --cpus-per-task=36 --ntasks=1
```
2. You could modify the `resources-sample.tsv` or `resources-project.tsv` manually and `looper` will use these updated values.
`resources-sample.tsv` default:
| max_file_size | cores | mem   | time        |
|---------------|-------|-------|-------------|
| 0.05          | 4     | 10000 | 00-03:00:00 |
| 0.5           | 8     | 12000 | 00-08:00:00 |
| 1             | 16    | 16000 | 00-12:00:00 |
| 10            | 32    | 24000 | 01-00:00:00 |
| NaN           | 32    | 32000 | 02-00:00:00 |

`resources-project.tsv` default:
| max_file_size | cores | mem   | time        |
|---------------|-------|-------|-------------|
| 0.05          | 1     | 16000 | 00-01:00:00 |
| 0.5           | 1     | 32000 | 00-01:00:00 |
| 1             | 1     | 56000 | 00-01:00:00 |
| 10            | 1     | 64000 | 00-01:00:00 |
| NaN           | 1     | 64000 | 00-02:00:00 |