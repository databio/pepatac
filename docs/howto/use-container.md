# Run <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> in a container

We have produced both docker and singularity containers that hold all the necessary software for `PEPATAC`. You can run `PEPATAC` as an individual pipeline on a single sample using these containers by directly calling `docker run` or `singularity exec`. Or, you can rely on `looper`, which is already set up to run any pipeline in existing containers using the `divvy` templating system. Instructions for both follow: 

First, make sure your environment is set up to run either docker or singularity containers. Then, pull the container image:

**Docker**: You can pull the docker [databio/pepatac image](https://hub.docker.com/r/databio/pepatac/) from dockerhub like this:

```
docker pull databio/pepatac
```

Or build the image using the included Dockerfile (you can use a recipe in the included Makefile):
```
cd pepatac/
make docker
```

**Singularity**: You can [download the singularity image](http://big.databio.org/simages/pepatac) or build it from the docker image using the Makefile:
```
cd pepatac/
make singularity
```

Now you'll need to tell the pipeline where you saved the singularity image. You can either create an environment variable called `$SIMAGES` that points to the folder where your image is stored, or you can tweak the `pipeline_interface.yaml` file so that the `compute.singularity_image` attribute is pointing to the right location on disk.

If your containers are set up correctly, then won't need to install any additional software. 

## Running individual samples in a container

Individual jobs can be run in a container by simply running the `pepatac.py` command through `docker run` or `singularity exec`. You can run containers either on your local computer, or in an HPC environment, as long as you have `docker` or `singularity` installed. For example, run it locally in singularity like this:
```
singularity exec --bind $GENOMES $SIMAGES/pepatac pipelines/pepatac.py --help
```

With `docker`, you can use:
```
docker run --rm -it databio/pepatac pipelines/pepatac.py --help
```
Be sure to mount the volumes you need with `--volume`. If you're utilizing any environment variables (e.g. `$GENOMES`), don't forget to include those in your docker command with the `-e` option. For a more detailed example, check out our guide to learn [how to run pepatac in a container](howto/use-container.md).

### Container details 

#### Using `docker`
The pipeline has been successfully run in both a Linux and MacOS environment. With `docker` you need to bind mount your volume that contains the pipeline and your `$GENOMES` location, as well as provide the container the same environment variables your host environment is using.

In the first example, we're mounting our home user directory (`/home/jps3ag/`) which contains the parent directories to our `$GENOMES` folder and to the pipeline itself. We'll also provide the pipeline two environment variables, `$GENOMES` and `$HOME`.

Here's that example command in a Linux environment to run the test example through the pipeline:
```
docker run --rm -it --volume /home/jps3ag/:/home/jps3ag/ \
  -e GENOMES='/home/jps3ag/genomes/' \
  -e HOME='/home/jps3ag/' \
  databio/pepatac \
  /home/jps3ag/src/pepatac/pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input /home/jps3ag/src/pepatac/examples/data/test1_r1.fastq.gz \
  --input2 /home/jps3ag/src/pepatac/examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

In this second example, we'll perform the same command in a Mac environment using [Docker for Mac](https://docs.docker.com/v17.12/docker-for-mac/install/). 

This necessitates a few minor changes to run that same example:

- replace `/home/` with `/Users/` format
- e.g. `--volume /Users/jps3ag/:/Users/jps3ag/`

Remember to [allocate sufficient memory](https://docs.docker.com/docker-for-mac/#advanced) (6-8GB should generally be more than adequate) in Docker for Mac.

```
docker run --rm -it --volume /Users/jps3ag/:/Users/jps3ag/ \
  -e GENOMES="/Users/jps3ag/genomes" \
  -e HOME="/Users/jps3ag/" \
  databio/pepatac \
  /Users/jps3ag/src/pepatac/pipelines/pepatac.py --single-or-paired paired \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input /Users/jps3ag/src/pepatac/examples/data/test1_r1.fastq.gz \
  --input2 /Users/jps3ag/src/pepatac/examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

#### Using `singularity`

First, build a singularity container from the docker image and create a running instance (be sure to mount your directories containing your `$GENOMES` folder and pipeline.
```
singularity build pepatac docker://databio/pepatac:latest
singularity instance.start -B /home/jps3ag/:/home/jps3aq/ pepatac pepatac_instance
```

Second, run your command.
```
singularity exec instance://pepatac_instance \
  /home/jps3ag/src/pepatac/pipelines/pepatac.py --single-or-paired single \
  --prealignments rCRSd human_repeats \
  --genome hg38 \
  --sample-name test1 \
  --input /home/jps3ag/src/pepatac/examples/data/test1_r1.fastq.gz \
  --input2 /home/jps3ag/src/pepatac/examples/data/test1_r2.fastq.gz \
  --genome-size hs \
  -O $HOME/pepatac_test
```

Third, close your instance when finished.
```
singularity instance.stop pepatac_instance
```

## Running multiple samples in a container with looper

To run multiple samples in a container, you simply need to configure `looper` to use a container-compatible template. The looper documentation has detailed instructions for [how to run pipelines in containers](http://code.databio.org/looper/containers/).

