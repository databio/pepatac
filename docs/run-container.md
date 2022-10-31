# Run <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> in a container.

A popular approach is installing all dependencies in a container and just use that single container. This container can be used with either `docker` or `singularity`. You can run `PEPATAC` as an individual pipeline on a single sample using these containers by directly calling `docker run` or `singularity exec`. Or, you can rely on `looper`, which is already set up to run any pipeline in existing containers using the `divvy` templating system. 

## Running `PEPATAC` using a single, monolithic container.

### 1: Clone the `PEPATAC` pipeline

```console
git clone https://github.com/databio/pepatac.git
```

### 2: Get genome assets

We [recommend `refgenie` to manage all required and optional genome assets](run-bulker.md#2a-initialize-refgenie-and-download-assets). However, [`PEPATAC` can also accept file paths to any of the assets](run-bulker.md#2b-download-assets).

#### 2a: Initialize `refgenie` and download assets

`PEPATAC` can use [`refgenie`](http://refgenie.databio.org/) assets for alignment and annotation. Because assets are user-dependent, these files must still exist outside of a container system. We need to [install and initialize a refgenie config file.](http://refgenie.databio.org/en/latest/install/). For example:

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

If you prefer not to use `refgenie`, you can also download and construct assets manually.  Again, because these are user-defined assets, they must exist outside of any container system. The minimum required assets for a genome includes:  
- a chromosome sizes file: a text file containing "chr" and "size" columns.  
- a [`bowtie2` genome index](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer).

Optional assets include: 
 
- a TSS annotation file: a BED file containing "chr", "start", "end", "gene name", "score", and "strand" columns.
- a region blacklist: e.g. [the ENCODE blacklist](https://github.com/Boyle-Lab/Blacklist)
- a [genomic feature annotation file](annotation.md)

You can obtain the minimally required pre-constructed `--chrom-sizes` and `--genome-index` files from the `refgenie` servers. `Refgenie` uses algorithmically derived genome digests under-the-hood to unambiguously define genomes. That's what you'll see being used in the example below when we manually download these assets. Therefore, `2230c535660fb4774114bfa966a62f823fdb6d21acf138d4` is the digest for the human readable alias, "hg38", and `94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4` is the digest for "rCRSd."
```console
cd pepatac/
wget -O hg38.fasta.tgz http://rg.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/fasta?tag=default
wget  -O hg38.bowtie2_index.tgz http://rg.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/bowtie2_index?tag=default
wget -O hg38.refgene_anno.tgz http://refgenomes.databio.org/v3/assets/archive/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4/refgene_anno?tag=default
wget -O rCRSd.fasta.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/fasta?tag=default
wget  -O rCRSd.bowtie2_index.tgz http://refgenomes.databio.org/v3/assets/archive/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4/bowtie2_index?tag=default
```

Then, extract these files:
```console
tar xvf hg38.fasta.tgz
tar xvf hg38.bowtie2_index.tgz 
tar xvf hg38.refgene_anno.tgz 
tar xvf rCRSd.fasta.tgz 
tar xvf rCRSd.bowtie2_index.tgz

cd default/
wget http://big.databio.org/pepatac/hg38_annotations.bed.gz
wget http://big.databio.org/pepatac/hg38.blacklist.bed
cd ../
```

### 3. Pull the container image.

**Docker**: You can pull the docker [databio/pepatac image](https://hub.docker.com/r/databio/pepatac/) from `dockerhub` like this:

```console
docker pull databio/pepatac
```

Or build the image using the included `Dockerfile` (you can use a recipe in the included `Makefile` in the `pepatac/` repository):
```console
make docker
```

**Singularity**: You can [download the `singularity` image](http://big.databio.org/simages/pepatac) or build it from the docker image using the `Makefile`:
```console
make singularity
```

Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called `$SIMAGES` that points to the folder where your image is stored, or you can tweak the `pipeline_interface.yaml` file so that the `compute.singularity_image` attribute is pointing to the right location on disk.

### 6. Confirm installation 

After setting up your environment to run `PEPATAC` using containers, you can confirm the pipeline is now executable with your container system using the included `checkinstall` script.  This can either be run directly from the `pepatac/` repository...

```console
./checkinstall
```

or from the web:
```console
curl -sSL https://raw.githubusercontent.com/databio/pepatac/checkinstall | bash
```

### 4. Run individual samples in a container

Individual jobs can be run in a container by simply running the `pepatac.py` command through `docker run` or `singularity exec`. You can run containers either on your local computer, or in an HPC environment, as long as you have `docker` or `singularity` installed. You will need to include any volumes that contain data required by the pipeline. For example, to utilize `refgenie` assets you'll need to ensure the volume containing those files is available. In the following example, we are including an environment variable (`$GENOMES`) which points to such a directory.

For example, run it locally in `singularity` like this:
```console
singularity exec --bind $GENOMES $SIMAGES/pepatac pipelines/pepatac.py --help
```

With `docker`, you can use:
```console
docker run --rm -it databio/pepatac pipelines/pepatac.py --help
```
Be sure to mount the volumes you need with `--volume`. If you're utilizing any environment variables (e.g. `$REFGENIE`), don't forget to include those in your docker command with the `-e` option.

### 5. Running multiple samples in a container with looper

To run multiple samples in a container, you simply need to configure `looper` to use a container-compatible template. The looper documentation has instructions for [running jobs in containers](http://looper.databio.org/en/latest/containers/).

### Container details 

#### Using `docker`
The pipeline has been successfully run in both a `Linux` and `MacOS` environment. With `docker` you need to bind mount your volume that contains the pipeline and your genome assets locations, as well as provide the container the same environment variables your host environment is using.

In the first example, we're mounting our home user directory (`/home/jps3ag/`) which contains the parent directories to our genome assets and to the pipeline itself. We'll also provide the pipeline environment variables, such as `$HOME`.

Here's that example command in a Linux environment to run the test example through the pipeline (using the manually downloaded genome assets):
```console
docker run --rm -it --volume /home/jps3ag/:/home/jps3ag/ \
  -e HOME='/home/jps3ag/' \
  databio/pepatac \
  /home/jps3ag/src/pepatac/pipelines/pepatac.py --single-or-paired paired \
  --genome hg38 \
  --genome-index /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4 \
  --chrom-sizes /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.chrom.sizes \
  --fasta /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.fa \
  --prealignment-index "rCRSd=/home/jps3ag/src/pepatac/default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4" \
  --prealignment-names "rCRSd" \
  --TSS-name /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4_TSS.bed \
  --blacklist /home/jps3ag/src/pepatac/default/hg38.blacklist.bed \
  --anno-name /home/jps3ag/src/pepatac/default/hg38_annotations.bed.gz \
  --sample-name test1 \
  --input /home/jps3ag/src/pepatac/examples/data/test1_r1.fastq.gz \
  --input2 /home/jps3ag/src/pepatac/examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

In this second example, we'll perform the same command in a `MacOS` environment using [`Docker` for `Mac`](https://docs.docker.com/v17.12/docker-for-mac/install/). 

This necessitates a few minor changes to run that same example:

- replace `/home/` with `/Users/` format
- e.g. `--volume /Users/jps3ag/:/Users/jps3ag/`

Remember to [allocate sufficient memory](https://docs.docker.com/docker-for-mac/#advanced) (6-8GB should generally be adequate) in Docker for Mac.

```console
docker run --rm -it --volume /Users/jps3ag/:/Users/jps3ag/ \
  -e HOME="/Users/jps3ag/" \
  databio/pepatac \
  /Users/jps3ag/src/pepatac/pipelines/pepatac.py --single-or-paired paired \
  --genome hg38 \
  --genome-index /Users/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4 \
  --chrom-sizes /Users/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.chrom.sizes \
  --fasta /Users/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.fa \
  --prealignment-index "rCRSd=/Users/jps3ag/src/pepatac/default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4" \
  --prealignment-names "rCRSd" \
  --TSS-name /Users/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4_TSS.bed \
  --blacklist /Users/jps3ag/src/pepatac/default/hg38.blacklist.bed \
  --anno-name /Users/jps3ag/src/pepatac/default/hg38_annotations.bed.gz \
  --sample-name test1 \
  --input /Users/jps3ag/src/pepatac/examples/data/test1_r1.fastq.gz \
  --input2 /Users/jps3ag/src/pepatac/examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

#### Using `singularity`

First, build a singularity container from the docker image and create a running instance:
```console
singularity build pepatac docker://databio/pepatac:latest
singularity instance start -B /home/jps3ag/:/home/jps3aq/ pepatac pepatac_instance
```

Second, run your command.
```console
singularity exec instance://pepatac_instance \
  /home/jps3ag/src/pepatac/pipelines/pepatac.py --single-or-paired paired \
  --genome hg38 \
  --genome-index /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4 \
  --chrom-sizes /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.chrom.sizes \
  --fasta /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4.fa \
  --prealignment-index "rCRSd=/home/jps3ag/src/pepatac/default/94e0d21feb576e6af61cd2a798ad30682ef2428bb7eabbb4" \
  --prealignment-names "rCRSd" \
  --TSS-name /home/jps3ag/src/pepatac/default/2230c535660fb4774114bfa966a62f823fdb6d21acf138d4_TSS.bed \
  --blacklist /home/jps3ag/src/pepatac/default/hg38.blacklist.bed \
  --anno-name /home/jps3ag/src/pepatac/default/hg38_annotations.bed.gz \
  --sample-name test1 \
  --input /home/jps3ag/src/pepatac/examples/data/test1_r1.fastq.gz \
  --input2 /home/jps3ag/src/pepatac/examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

Third, close your instance when finished.
```
singularity instance stop pepatac_instance
```

