# Run <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px"> in a container

Whether you are using `docker` or `singularity`, we have a solution to run the pipeline using containers that dramatically reduces the installation burden.

In addition to cloning the `PEPATAC` repository, this requires the installation and configuration of a single python package, our [multi-container environment manager `bulker`](https://bulker.databio.org/en/latest/). 

## Running `PEPATAC` using `bulker`

### 1. Install and configure `bulker`

Check out [the `bulker` setup guide to install bulker](https://bulker.databio.org/en/latest/install/) on your system. It is a straightforward python package with a few configuration steps required prior to use with `PEPATAC`.

### 2. Load the `PEPATAC` crate

We've already produced a `bulker` crate for `PEPATAC` that requires all software needed to run the pipeline.  We can load this crate directly from the [`bulker registry`](http://hub.bulker.io/):
```
bulker load databio/pepatac -r
```

### 3. Activate the `PEPATAC` crate

Now that we've loaded the `PEPATAC` crate, we need to activate that specific crate so its included tools are available.
```
bulker activate databio/pepatac
```
Now, you can run any of the commands in the crate as if they were natively installed, **but they're actually running in containers**!

### 4. Run the pipeline

Now we simply run the pipeline like normal, but we wouldn't have needed to install any additional tools!

#### Run the pipeline at the command line
```
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
```
looper run examples/test_project/test_config.yaml
```


