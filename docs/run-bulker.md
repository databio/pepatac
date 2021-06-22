# Run <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> with a multiple container manager.

Whether you are using `docker` or `singularity`, we have a solution to run the pipeline using containers that reduces the installation burden.

In addition to cloning the `PEPATAC` repository, this requires the installation and configuration of a single python package, our [multi-container environment manager `bulker`](https://bulker.databio.org/en/latest/). We support using `bulker` for a few reasons: 

1. It simplifies container use by wrapping the complexities of `docker` or `singularity` calls so that you can use a containerized program without even realizing you're using a container. You can call a program at the command line the same as your would *without* using bulker.
2. Similar to a dockerfile, you can distribute sets of tools *but* as a separate set of containers, not a single, unwieldy, and monolithic container.
3. Since `bulker` commands behave like native commands, a workflow becomes automatically containerized with bulker.
4. Finally, this makes bulker environments very portable, since the only requirement for native-like command use is `docker` or `singularity`.

If you would still prefer using a single container, we do provide a [PEPATAC dockerfile](https://github.com/databio/pepatac/blob/master/containers/pepatac.Dockerfile) and support for [running the pipeline using a single, monolithic container.](run-container.md). 

## Running `PEPATAC` using `bulker`

### 1: Clone the `PEPATAC` pipeline

```console
git clone https://github.com/databio/pepatac.git
```

### 2: Initialize `refgenie` and download assets

`PEPATAC` uses [`refgenie`](http://refgenie.databio.org/) assets for alignment. Because assets are user-dependent, these files must still exist outside of a container system. We need to [install and initialize a refgenie config file.](http://refgenie.databio.org/en/latest/install/). For example:

```console
pip install refgenie
export REFGENIE=/path/to/your_genome_folder/genome_config.yaml
refgenie init -c $REFGENIE
```

Add the `export REFGENIE` line to your `.bashrc` or `.profile` to ensure it persists. 

Next, pull the assets you need. Replace `hg38` in the example below if you need to use a different genome assembly. If these assets are not available automatically for your genome of interest, then you'll need to [build them](annotation.md).

```console
refgenie pull hg38/fasta hg38/bowtie2_index hg38/refgene_anno hg38/ensembl_gtf hg38/ensembl_rb
refgenie build hg38/feat_annotation
```

`PEPATAC` also requires a `bowtie2_index` asset for any pre-alignment genomes:

```console
refgenie pull rCRSd/bowtie2_index
refgenie pull human_repeats/bowtie2_index
```

### 3. Install and configure `bulker`

Check out [the `bulker` setup guide to install bulker](https://bulker.databio.org/en/latest/install/) on your system. It is a straightforward python package with a few configuration steps required prior to use with `PEPATAC`.

### 4. Load the `PEPATAC` crate

We've already produced a `bulker` crate for `PEPATAC` that requires all software needed to run the pipeline.  We can load this crate directly from the [`bulker registry`](http://hub.bulker.io/):
```console
bulker load databio/pepatac:1.0.7 -r
```

### 5. Activate the `PEPATAC` crate

Now that we've loaded the `PEPATAC` crate, we need to activate that specific crate so its included tools are available.
```console
bulker activate databio/pepatac:1.0.7
```
Now, you can run any of the commands in the crate as if they were natively installed, **but they're actually running in containers**!

### 6. Run the pipeline

Now we simply run the pipeline like you would with a native installation, but we wouldn't have needed to install any additional tools!

#### Run the pipeline at the command line

From the `pepatac/` repository folder:
```console
pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input examples/data/test1_r1.fastq.gz \
  --input2 examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```
#### Run the pipeline using looper

Since `bulker` automatically direct any calls to required software to instead be executed in containers, we can just run our project the exact same way we would when we installed everything natively!
```console
looper run examples/test_project/test_config.yaml
```