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

### 2: Get genome assets

We [recommend `refgenie` to manage all required and optional genome assets](run-bulker.md#2a-initialize-refgenie-and-download-assets). However, [`PEPATAC` can also accept file paths to any of the assets](run-bulker.md#2b-download-assets).

#### 2a: Initialize `refgenie` and download assets

`PEPATAC` can utilize [`refgenie`](http://refgenie.databio.org/) assets. Because assets are user-dependent, these files must still exist outside of a container system. Therefore, we need to [install and initialize a refgenie config file.](http://refgenie.databio.org/en/latest/install/). For example:

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
refgenie pull rCRSd/fasta rCRSd/bowtie2_index
```

#### 2b: Download assets manually

If you prefer not to use `refgenie`, you can also download and construct assets manually.  The minimum required assets for a genome includes: 
 
- a chromosome sizes file: a text file containing "chr" and "size" columns.
- a [`bowtie2` genome index](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer).

Optional assets include:  

- a TSS annotation file: a BED file containing "chr", "start", "end", "gene name", "score", and "strand" columns.
- a region blacklist: e.g. [the ENCODE blacklist](https://github.com/Boyle-Lab/Blacklist)
- a [genomic feature annotation file](annotation.md)

### 3. Install and configure `bulker`

Check out [the `bulker` setup guide to install bulker](https://bulker.databio.org/en/latest/install/) on your system. It is a straightforward python package with a few configuration steps required prior to use with `PEPATAC`.

### 4. Confirm installation 

After setting up your environment to run `PEPATAC` with `bulker`, you can confirm the pipeline is now executable with `bulker` using the included `checkinstall` script.  This can either be run directly from the `pepatac/` repository...

```console
./checkinstall
```

or from the web:
```console
curl -sSL https://raw.githubusercontent.com/databio/pepatac/checkinstall | bash
```

### 5. Load the `PEPATAC` crate

We've already produced a `bulker` crate for `PEPATAC` that requires all software needed to run the pipeline.  We can load this crate directly from the [`bulker registry`](http://hub.bulker.io/):
```console
bulker load databio/pepatac:1.0.7 -r
```

### 6. Activate the `PEPATAC` crate

Now that we've loaded the `PEPATAC` crate, we need to activate that specific crate so its included tools are available.
```console
bulker activate databio/pepatac:1.0.7
```
Now, you can run any of the commands in the crate as if they were natively installed, **but they're actually running in containers**!

### 7. Run the sample-level pipeline

Now we simply run the pipeline like you would with a native installation, but we wouldn't have needed to install any additional tools!

#### Run the pipeline at the command line

If you are using `refgenie`, you can grab the path to the `--chrom-sizes` and `--genome-index` files as follows:
```console
refgenie seek hg38/fasta.chrom_sizes
refgenie seek hg38/bowtie2_index.dir
refgenie seek rCRSd/bowtie2_index.dir
```

Alternatively, if you are *not* using `refgenie`, you can still grab premade `--chrom-sizes` and `--genome-index` files from the `refgenie` servers. `Refgenie` uses algorithmically derived genome digests under-the-hood to unambiguously define genomes. That's what you'll see being used in the example below when we manually download these assets. Therefore, `2230c535660fb4774114bfa966a62f823fdb6d21acf138d4` is the digest for the human readable alias, "hg38", and `94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4` is the digest for "rCRSd."
```console
cd pepatac/

wget -O hg38.fasta.tgz http://refgenomes.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/fasta?tag=default

wget -O hg38.bowtie2.tgz http://refgenomes.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/bowtie2_index?tag=default

wget -O hg38.refgene_anno.tgz http://refgenomes.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/refgene_anno?tag=default

wget -O rCRSd.fasta.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/fasta?tag=default

wget -O rCRSd.bowtie2.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/bowtie2_index?tag=default

cd default/
wget http://big.databio.org/pepatac/hg38_annotations.bed.gz
wget http://big.databio.org/pepatac/hg38.blacklist.bed

cd ../
```

Then, extract these files:
```console
tar xvfz hg38.fasta.tgz
tar xvfz hg38.bowtie2.tgz 
tar xvfz hg38.refgene_anno.tgz 
tar xvfz rCRSd.fasta.tgz 
tar xvfz rCRSd.bowtie2.tgz
```

From the `pepatac/` repository folder (using the manually downloaded genome assets):
```console
pipelines/pepatac.py --single-or-paired paired \
  --prealignment-index rCRSd=default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4 \
  --genome hg38 \
  --genome-index default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4 \
  --chrom-sizes default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.chrom.sizes \
  --fasta default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.fa \
  --prealignment-index default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4 \
  --TSS-name default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4_TSS.bed
  --blacklist default/hg38.blacklist.bed \
  --anno-name default/hg38_annotations.bed.gz \
  --sample-name test1 \
  --input examples/data/test1_r1.fastq.gz \
  --input2 examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

With a single processor, this will take ~30 minutes to complete. 

#### Run the pipeline using looper

Since `bulker` automatically directs any calls to required software to instead be executed in containers, we can just run our project the exact same way we would when we installed everything natively!

**Run the pipeline with looper and manual asset specifications**
```console
looper run examples/test_project/test_config.yaml
```

**Run the pipeline with looper and refgenie**
```console
looper run examples/test_project/test_config_refgenie.yaml
```

### 8: Run the project level pipeline

`PEPATAC` also includes a project-level processing pipeline to do things like:

 - [Plot alignment statistics](files/examples/gold/summary/gold_alignmentPercent.pdf) for all samples in the project together for easy visualization
 - [Plot TSS enrichment scores](files/examples/gold/summary/gold_TSSEnrichment.pdf) for all the samples in the project in a single figure
 - [Produce a consensus peak set](consensus_peaks.md) for the project
 - [Produce a count table](count_table.md) using the consensus peak set for all the samples in a project

From the `pepatac/` repository folder (using the manually downloaded genome assets):
```console
looper runp examples/test_project/test_config.yaml
```

This should take < a minute on the test sample and will generate a `summary/` directory containing project level output in the parent project directory. In this small example, there won't be a consensus peak set or count table because it is only a single sample. To see more, you can [run through the extended tutorial](tutorial.md) to see this in action.
