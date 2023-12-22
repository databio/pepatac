# How to specify a set of reference peaks

PEPATAC automatically calls peaks and will report the fraction of reads in peaks (FRiP) for that set of peaks. The project processing pipeline will also produce a count table with the individual sample peaks.  

You may also specify a set of reference peaks and report the fraction of reads in those *reference* peaks **and** produce a count table using this reference peak set.  To do so, simply point the pipeline to your set of reference peaks, either at the command line using `--frip-ref-peaks /path/to/your_reference_peaks.bed`, or in a PEP configuration file like so:
```
name: PEPATAC_tutorial

pep_version: 2.0.0
sample_table: tutorial.csv

looper:
  output_dir: "${TUTORIAL}/processed/"
  pipeline_interfaces: ["${TUTORIAL}/tools/pepatac/project_pipeline_interface.yaml"]

sample_modifiers:
  append:
    pipeline_interfaces: ["${TUTORIAL}/tools/pepatac/sample_pipeline_interface.yaml"]
  derive:
    attributes: [read1, read2]
    sources:
      # Obtain tutorial data from http://big.databio.org/pepatac/ then set
      # path to your local saved files
      R1: "${TUTORIAL}/tools/pepatac/examples/data/{sample_name}_r1.fastq.gz"
      R2: "${TUTORIAL}/tools/pepatac/examples/data/{sample_name}_r2.fastq.gz"
  imply:
    - if: 
        organism: ["human", "Homo sapiens", "Human", "Homo_sapiens"]
      then: 
        genome: hg38
        genome_size: hs
        prealignments: rCRSd human_repeats
        deduplicator: samblaster # Default. [options: picard]
        trimmer: skewer          # Default. [options: pyadapt, trimmomatic]
        peak_type: fixed         # Default. [options: variable]
        extend: "250"            # Default. For fixed-width peaks, extend this distance up- and down-stream.
        frip_ref_peaks: /path/to/your_reference_peaks.bed     
```
