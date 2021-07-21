# Configure peak callers

`PEPATAC` has the ability to use five different peak callers out of the box. If you're running the pipeline via containers, you should already have this capability, but if you installed requirements natively, you may still need to install additional peak callers should you wish to use them.

## Default peak caller 

`PEPATAC` uses `MACS2` as the default peak caller. You do not need to specify any additional parameters to use `MACS2`.  The default approach is to define fixed width peaks, to [facilitate the generation of consensus peaks, which you can read more about here](consensus_peaks.md).  

For a single sample, you may wish to enable variable width peak calling to achieve a more nuanced and specific peak call for a particular sample. Or maybe you don't wish to generate consensus peaks at all, and you want this for all your samples. You can still use `MACS2` and specify `PEPATAC` to use `--peak-type variable` to call peaks in this manner.  
Here's an example with the included test sample:
```yaml
# This project config file describes your project. See looper docs for details.
name: test_project # The name that summary files will be prefaced with

pep_version: 2.0.0
sample_table: test_annotation.csv  # sheet listing all samples in the project

looper:  # relative paths are relative to this config file
  output_dir: pepatac_test 
  pipeline_interfaces: ../../project_pipeline_interface.yaml  # PATH to the directory where looper will find the pipeline repository. 

sample_modifiers:
  append:
    pipeline_interfaces: ../../sample_pipeline_interface.yaml
  derive:
    attributes: [read1, read2]
    sources:
      test_data_R1: "examples/data/{sample_name}_r1.fastq.gz"
      test_data_R2: "examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        macs_genome_size: hs
        prealignments: rCRSd
        aligner: bowtie2         # [options: bowtie2(default), bwa]
        deduplicator: samblaster # [options: samblaster(default), picard, samtools]
        trimmer: skewer          # [options: skewer (default), pyadapt, trimmomatic]
        peak_caller: macs2       # [options: macs2 (default), fseq, genrich, hmmratac, homer]
        peak_type: variable      # [options: fixed(default), variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```
Furthermore, you can customize the settings for variable width peak calling in the [pipeline configuration file, pepatac.yaml](https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml).
For example, you can change the 'params:' line for macs2_variable settings:
```yaml
macs2_variable:
    params: '-f BED -q 0.01 --shift 0 --nomodel'
```

## Specifying a different peak caller

For each of the alternative peak callers, you can specify them on the command line with the `--peak-caller <peak_caller> --peak-type variable` variables, or you can specify them in your PEP project configuration file. You must tell `PEPATAC` to use `--peak-type variable` when specifying alternative peak callers.

Here are examples with the included test sample:

### F-Seq
```yaml
# This project config file describes your project. See looper docs for details.
name: test_project # The name that summary files will be prefaced with

pep_version: 2.0.0
sample_table: test_annotation.csv  # sheet listing all samples in the project

looper:  # relative paths are relative to this config file
  output_dir: pepatac_test 
  pipeline_interfaces: ../../project_pipeline_interface.yaml  # PATH to the directory where looper will find the pipeline repository. 

sample_modifiers:
  append:
    pipeline_interfaces: ../../sample_pipeline_interface.yaml
  derive:
    attributes: [read1, read2]
    sources:
      test_data_R1: "examples/data/{sample_name}_r1.fastq.gz"
      test_data_R2: "examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        macs_genome_size: hs
        prealignments: rCRSd
        aligner: bowtie2         # [options: bowtie2(default), bwa]
        deduplicator: samblaster # [options: samblaster(default), picard, samtools]
        trimmer: skewer          # [options: skewer (default), pyadapt, trimmomatic]
        peak_caller: fseq        # [options: macs2 (default), fseq, genrich, hmmratac, homer]
        peak_type: variable      # [options: fixed(default), variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```

### HMMRATAC
```yaml
# This project config file describes your project. See looper docs for details.
name: test_project # The name that summary files will be prefaced with

pep_version: 2.0.0
sample_table: test_annotation.csv  # sheet listing all samples in the project

looper:  # relative paths are relative to this config file
  output_dir: pepatac_test 
  pipeline_interfaces: ../../project_pipeline_interface.yaml  # PATH to the directory where looper will find the pipeline repository. 

sample_modifiers:
  append:
    pipeline_interfaces: ../../sample_pipeline_interface.yaml
  derive:
    attributes: [read1, read2]
    sources:
      test_data_R1: "examples/data/{sample_name}_r1.fastq.gz"
      test_data_R2: "examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        macs_genome_size: hs
        prealignments: rCRSd
        aligner: bowtie2         # [options: bowtie2(default), bwa]
        deduplicator: samblaster # [options: samblaster(default), picard, samtools]
        trimmer: skewer          # [options: skewer (default), pyadapt, trimmomatic]
        peak_caller: hmmratac    # [options: macs2 (default), fseq, genrich, hmmratac, homer]
        peak_type: variable      # [options: fixed(default), variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```

### HOMER
```yaml
# This project config file describes your project. See looper docs for details.
name: test_project # The name that summary files will be prefaced with

pep_version: 2.0.0
sample_table: test_annotation.csv  # sheet listing all samples in the project

looper:  # relative paths are relative to this config file
  output_dir: pepatac_test 
  pipeline_interfaces: ../../project_pipeline_interface.yaml  # PATH to the directory where looper will find the pipeline repository. 

sample_modifiers:
  append:
    pipeline_interfaces: ../../sample_pipeline_interface.yaml
  derive:
    attributes: [read1, read2]
    sources:
      test_data_R1: "examples/data/{sample_name}_r1.fastq.gz"
      test_data_R2: "examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        macs_genome_size: hs
        prealignments: rCRSd
        aligner: bowtie2         # [options: bowtie2(default), bwa]
        deduplicator: samblaster # [options: samblaster(default), picard, samtools]
        trimmer: skewer          # [options: skewer (default), pyadapt, trimmomatic]
        peak_caller: homer       # [options: macs2 (default), fseq, genrich, hmmratac, homer]
        peak_type: variable      # [options: fixed(default), variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```

### Genrich
```yaml
# This project config file describes your project. See looper docs for details.
name: test_project # The name that summary files will be prefaced with

pep_version: 2.0.0
sample_table: test_annotation.csv  # sheet listing all samples in the project

looper:  # relative paths are relative to this config file
  output_dir: pepatac_test 
  pipeline_interfaces: ../../project_pipeline_interface.yaml  # PATH to the directory where looper will find the pipeline repository. 

sample_modifiers:
  append:
    pipeline_interfaces: ../../sample_pipeline_interface.yaml
  derive:
    attributes: [read1, read2]
    sources:
      test_data_R1: "examples/data/{sample_name}_r1.fastq.gz"
      test_data_R2: "examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        macs_genome_size: hs
        prealignments: rCRSd
        aligner: bowtie2         # [options: bowtie2(default), bwa]
        deduplicator: samblaster # [options: samblaster(default), picard, samtools]
        trimmer: skewer          # [options: skewer (default), pyadapt, trimmomatic]
        peak_caller: genrich     # [options: macs2 (default), fseq, genrich, hmmratac, homer]
        peak_type: variable      # [options: fixed(default), variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: None     # Default. Use an external reference set of peaks instead of the peaks called from this run
```

Each peak caller also has a separate parameterization option in the [pipeline configuration file, pepatac.yaml](https://github.com/databio/pepatac/blob/master/pipelines/pepatac.yaml). 

For example:
```yaml
  fseq:
    params: '-of npf -l 600 -t 4.0 -s 1'
  genrich:
    params: ''
    # -j: ATAC-seq mode on by default in the main pipeline, pepatac.py
  hmmratac:
    params: '--fragmem True --upper 10 --lower 5 --peaks True --window 500000'
  homer_findpeaks:
    params: '-minDist 150 -region'
```
