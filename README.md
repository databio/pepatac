# ATACseq pipeline

Version: 1

Description: Basic data analysis of ATACseq data, including adaptor trimming, mapping, peak calling, bigwig, Enrichment score

Date: 2016-06-28

Updated by : jinxu9@stanford.edu

## Installing

This repo uses [pypiper](https://github.com/epigen/pypiper) to run a pipeline for a single sample, and [looper](https://github.com/epigen/looper) to handle multi-samples job submission for a project. You can do a user-specific install of both like this:

```
pip install --user https://github.com/epigen/pypiper/zipball/master
pip install --user https://github.com/epigen/looper/zipball/master
```

## Running

See example command in [cmd.sh](cmd.sh) or run it with:

```
./cmd.sh
```