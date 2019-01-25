## <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> features at-a-glance

Here are a few of the highlights that make `PEPATAC` valuable.

- **Scalability.** Run the pipeline easily on a project with a single sample or a thousand. This pipeline is compatible with [`looper`](https://github.com/pepkit/looper), so it can run locally, in a cloud container engine, or with any cluster resource manager (e.g. SLURM, SGE, or LFS).
- **Restartability.** The pipeline is built using [pypiper](https://github.com/databio/pypiper), so it automatically picks up where it left off in case of preemption or crash.
- **Copious logging.** The pipeline produces a detailed log file recording all output from every command run, and also records the time and memory use of every process, the version of the pipeline and other software, and other useful run information.
- **Flexibility.** The pipeline provides options for multiple peak callers, multiple adapter trimmers, and fully configurable parameterization for many underlying tools.
- **Portability.** Run it using `docker` or `singularity` with no other prerequisites, or it can be run natively without containers. The choice is yours.
- **Standardized user interface.** The pipeline reads sample metadata formatted in [standard PEP format](http://pepkit.github.io/), so you can use the same sample annotation sheets for your downstream R or python analysis using tools from [pepkit](http://pepkit.github.io/).
- **Standardized reference genome assembly.** The pipeline uses standard reference genome assemblies produced by [refgenie](http://github.com/databio/refgenie)], which provides a scripted way to produce a compatible reference assembly for any custom genome. For common genomes, you can either download pre-indexed assemblies or build your own.
- **Prealignments.** The pipeline can (optionally) first align to any number of reference assemblies separately before the primary genome alignment. This increases both speed and accuracy and can be used, for example, to align sequentially to mtDNA, repeats, or spike-ins.
- **Fraction of reads in peaks <i>or</i> features (FRiP/FRiF).** By default, the pipeline will calculate the FRiP using the peaks it identifies. Optionally, it can also calculate a FRiP using a reference set of peaks (for example, from another experiment).  The pipeline will also calculate the fraction of reads in known annotated features if using a common reference genome and may be customized to use any feature set.
- **TSS enrichments, Fragment length distributions and more.** The pipeline produces various nice QC plots.
- **Beautiful `HTML` reports.** Your results include an easy-to-navigate `HTML` report with a sample table, job status, summary statistics, and QC plots at your fingertips when run using our [pipeline submission engine, `Looper`]https://looper.readthedocs.io/en/latest/index.html).

