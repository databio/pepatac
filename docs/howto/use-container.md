# Run <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> in a container

We have produced both docker and singularity containers that hold all the necessary software for `PEPATAC`. You can run `PEPATAC` as an individual pipeline on a single sample using these containers by directly calling `docker run` or `singularity exec`. Or, you can rely on `looper`, which is already set up to run any pipeline in existing containers using the `divvy` templating system. Instructions for both follow: 

## Running individual samples in a container

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

## Running multiple samples in a container with looper

