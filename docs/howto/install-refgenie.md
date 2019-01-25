# Configure genome assemblies for use with <img src="../../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">

This guide is designed to walk you through the process of obtaining `refgenie` assemblies.
Whether using the container or native version, you will need to provide external reference genome assemblies. The pipeline requires genome assemblies produced by [`refgenie`](https://github.com/databio/refgenie).
One feature of the pipeline is prealignments, which siphons off reads by aligning to small genomes before the main alignment to the primary reference genome. Any prealignments you want to do will also require `refgenie` assemblies. When using the default configuration files, the pipeline will pre-align to the mitochondrial genome, so you if you want to use the default settings, you will need `refgenie` assemblies for the `rCRSd` genome (*for human*) or `mouse_chrM` (*for mouse*) in addition to the primary assembly you wish to use. Other [ideas for common prealignment references are provided by ref_decoy](https://github.com/databio/ref_decoy).

---

## **1: Using `refgenie` assemblies**

You have two options for using `refgenie` assemblies with `PEPATAC`. If you're using a common genome, there's a good chance there's [already a `refgenie` assembly](http://big.databio.org/refgenomes) for that.  Otherwise, you can [create your own](install-refgenie.md#12-build-custoim-refgenie-assemblies).

---

### **1.1: Download pre-indexed `refgenie` assemblies**

Pre-built genome indices exist for commonly utilized genomes including: `hg38`, `hg19`, `mm10`, and `mm9`. You may simply [download the corresponding pre-indexed references](http://big.databio.org/refgenomes) to get started immediately.

---

### **1.2: Build custom `refgenie` assemblies**

For complete and detailed information on indexing your own genomes, [see the `refgenie` instructions](https://github.com/databio/refgenie).
For a quick introduciton, a simple example is presented here.

---

#### **1.2.1: Install `refgenie`**

`Refgenie` uses `Pypiper` (which if you've installed `PEPATAC` you will have already installed it too), and, of course, you'll need `refgenie` itself.
**Install `Pypiper`:**
```
pip install --user piper
```
**Clone the `refgenie` repository:**
```
git clone https://github.com/databio/refgenie.git
```
`Refgenie` will produce indices for many alignment software tools should you have them installed.  `PEPATAC` requires `bowtie2`, so make sure you have that installed ([see bowtie2 documentation](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#obtaining-bowtie-2)) and in your `PATH`.

---

#### **1.2.2: Run `refgenie`**
Run `refgenie` with:
```
src/refgenie.py -i INPUT_FILE.fa
```
...where `INPUT_FILE.fa` is a fasta file of your reference genome, and can be either a local file or a URL.

---

## **2: Configure the pipeline to use `refgenie` assemblies**
Once you've procured assemblies for all genomes you wish to use, you must point the pipeline to where you store these. You can do this in two ways, either: 1) with an environment variable, or 2) by adjusting a configuration option.
The pipeline looks for genomes stored in a folder specified by the `resources.genomes` attribute in the [pipeline config file](https://github.com/databio/pepatac/blob/dev/pipelines/pepatac.yaml). By default, this points to the shell variable `GENOMES`, so all you have to do is set an environment variable to the location of your refgenie genomes:
```
export GENOMES="/path/to/genomes/folder/"
```
(Add this to your `.bashrc` or `.profile` to ensure it persists).
Alternatively, you can skip the `GENOMES` variable and simply change the value of that configuration option to point to the folder where you stored the assemblies. The advantage of using an environment variable is that it makes the configuration file portable, so the same pipeline can be run on any computing environment, as the location to reference assemblies is not hard-coded to a specific computing environment.

