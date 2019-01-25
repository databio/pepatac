# Download raw data from SRA for use in <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

This guide is designed to walk you through obtaining SRA data files that can go directly into `PEPATAC`.

---

## **1: Install `geofetch`**

To download data from the Sequence Read Archive (SRA), we'll use some convenient companion software to assist in the download process called [`geofetch`](https://github.com/pepkit/geofetch)

Clone the `geofetch` repository:
```
git clone https://github.com/pepkit/geofetch.git
```

---

## **2: Install `NCBI SRA Toolkit`**

To use `geofetch` you'll need to have the `NCBI SRA Toolkit` installed as well ([see complete SRA Toolkit documentation](https://github.com/ncbi/sra-tools/wiki/Building-and-Installing-from-Source)).

The following will perform a basic installation of the toolkit.  For users without root access and for custom installation procedures [check out the NCBI SRA toolkit wiki](https://github.com/ncbi/sra-tools/wiki/).
```
mkdir ncbi
cd ncbi/
git clone git@github.com:ncbi/sra-tools.git
git clone https://github.com/ncbi/ngs.git
git clone https://github.com/ncbi/ncbi-vdb.git
cd ngs/
./configure
make -C ngs-sdk
make -C ngs-java
make -C ngs-python
cd ../ncbi-vdb/
./configure
make
make install
cd ../ngs/		
make -C ngs-sdk install
make -C ngs-java install
make -C ngs-python install
cd ../sra-tools/
./configure
make
make install
cd ../../
```

Make sure you place `sra-tools` in your `PATH`.
```
export PATH="$PATH:/path/to/sra-tools/bin/"
```

So you only have to do this the first time through, add the updates to `PATH` to your `.bashrc` or `.profile`.

---

## **3: Download data**

Now that all our requirements for downloading data are set.  Let's actually get some ATAC-seq reads.

---

### **3.1: Get metadata, configuration files, and `.sra` files**

To automatically download sample metadata and generate configuration files that will allow us to convert the `.sra` files into `.bam` files, use the following:
```
python geofetch.py -i GSE### -m /path/to/metadata/folder -n PROJECT_NAME
```

---

### **3.2: Convert `.sra` files to `.bam`**

Next we're going to convert those downloaded `.sra` files using `looper`. If you haven't installed `looper`, do that now before moving forward ([see `looper` docs](https://looper.readthedocs.io/en/latest/)).

`Looper` requires a few variables and configuration files to work for a specific user. One of those is an environment variable called `PEPENV` that points to the `looper` environment configuration file. For more detailed information regarding this file, check out the [`looper` docs](https://looper.readthedocs.io/en/latest/cluster-computing.html#pepenv-overview).

Create a `pepenv.yaml` file and edit this file for your own setup (see [`looper` docs for more information](https://looper.readthedocs.io/en/latest/index.html)).

Paste the following into `pepenv.yaml` and save your changes:
```
compute:
  local:
    submission_template: templates/localhost_template.sub
    submission_command: sh
```
Create an environment variable that points to this file:
```
export PEPENV="/path/to/pepatac_tutorial/pepenv.yaml"
```
(Remember to add `PEPENV` to your `.bashrc` or `.profile` to ensure it persists).

The `looper` environment configuration file points to submission template(s) in order to know how to run a sample or series of samples.  You can [read more about the `PEPENV` configuration file and submission templates here](https://github.com/pepkit/pepenv). We're going to simply setup a local template for the purposes of this tutorial.  You can also easily create templates for cluster or container use as well!
```
nano localhost_template.sub
```
Paste the following into the localhost_template.sub:
```
#!/bin/bash

echo 'Compute node:' `hostname`
echo 'Start time:' `date +'%Y-%m-%d %T'`

{
{CODE}
} | tee {LOGFILE}
```
We also need to create additional environment variables to help point `looper` to where we want to download and convert our `.sra` files.  These variables are part of the configuration file that `geofetch` produced earlier in the `metadata/` folder. You may either set the environment variables or you simply hard code the necessary locations in the configuration file.

Create a `PROCESSED` variable that represents the location where we want to save output:
```
export PROCESSED="/path/to/pepatac_tutorial/processed/"
```
Create a variable representing the location all our tools are stored named `CODEBASE`:
```
export CODEBASE="/path/to/pepatac_tutorial/tools/"
```
Create a variable representing the location we want to save our `.sra` files called `SRARAW`:
```
export SRARAW="/path/to/pepatac_tutorial/data/sra/"
```
(Add these environment variables to your `.bashrc` or `.profile` so you don't have to always do this step).
Finally, convert the `.sra` files!
```
looper run /path/to/metadata/PROJECT_NAME/PROJECT_NAME_config.yaml \
  --sp sra_convert \
  --lump 10 \
  --compute local
```
Fantastic! Now we downloaded and converted a SRA file into `.bam`, which can go directly into `PEPATAC`.
