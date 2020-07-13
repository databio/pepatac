# <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">  usage reference

`PEPATAC` command-line usage instructions:



`python pipelines/pepatac.py --help`
```{console}
usage: pepatac.py [-h] [-R] [-N] [-D] [-F] [-T] [--silent] [--verbosity V]
                  [--logdev] [-C CONFIG_FILE] -O PARENT_OUTPUT_FOLDER
                  [-M MEMORY_LIMIT] [-P NUMBER_OF_CORES] -S SAMPLE_NAME -I
                  INPUT_FILES [INPUT_FILES ...]
                  [-I2 [INPUT_FILES2 [INPUT_FILES2 ...]]] -G GENOME_ASSEMBLY
                  [-Q SINGLE_OR_PAIRED] [--peak-caller {fseq,macs2}]
                  [-gs GENOME_SIZE] [--trimmer {trimmomatic,pyadapt,skewer}]
                  [--prealignments PREALIGNMENTS [PREALIGNMENTS ...]]
                  [--deduplicator {picard,samblaster}] [--TSS-name TSS_NAME]
                  [--blacklist BLACKLIST] [--anno-name ANNO_NAME]
                  [--peak-type {fixed,variable}] [--extend EXTEND]
                  [--frip-ref-peaks FRIP_REF_PEAKS] [--motif] [--sob]
                  [--no-scale] [--prioritize] [--keep] [--noFIFO] [--lite]
                  [-V]

PEPATAC version 0.9.1

optional arguments:
  -h, --help            show this help message and exit
  -R, --recover         Overwrite locks to recover from previous failed run
  -N, --new-start       Overwrite all results to start a fresh run
  -D, --dirty           Don't auto-delete intermediate files
  -F, --force-follow    Always run 'follow' commands
  -T, --testmode        Only print commands, don't run
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
  -C CONFIG_FILE, --config CONFIG_FILE
                        Pipeline configuration file (YAML). Relative paths are
                        with respect to the pipeline script.
  -M MEMORY_LIMIT, --mem MEMORY_LIMIT
                        Memory limit for processes accepting such. Default
                        units are megabytes unless specified using the suffix
                        [K|M|G|T].
  -P NUMBER_OF_CORES, --cores NUMBER_OF_CORES
                        Number of cores for parallelized processes
  -I2 [INPUT_FILES2 [INPUT_FILES2 ...]], --input2 [INPUT_FILES2 [INPUT_FILES2 ...]]
                        Secondary input files, such as read2
  -Q SINGLE_OR_PAIRED, --single-or-paired SINGLE_OR_PAIRED
                        Single- or paired-end sequencing protocol
  --peak-caller {fseq,macs2}
                        Name of peak caller
  -gs GENOME_SIZE, --genome-size GENOME_SIZE
                        MACS2 effective genome size. It can be 1.0e+9 or
                        1000000000 or shortcuts:'hs' for human (2.7e9), 'mm'
                        for mouse (1.87e9), 'ce' for C. elegans (9e7) or 'dm'
                        for fruitfly (1.2e8), Default:hs
  --trimmer {trimmomatic,pyadapt,skewer}
                        Name of read trimming program
  --prealignments PREALIGNMENTS [PREALIGNMENTS ...]
                        Space-delimited list of reference genomes to align to
                        before primary alignment.
  --deduplicator {picard,samblaster}
                        Name of deduplicator program
  --TSS-name TSS_NAME   Path to TSS annotation file.
  --blacklist BLACKLIST
                        Path to genomic region blacklist file
  --anno-name ANNO_NAME
                        Path to reference annotation file (BED format) for
                        calculating FRiF
  --peak-type {fixed,variable}
                        Call variable or fixed width peaks. Fixed width
                        requires MACS2.
  --extend EXTEND       How far to extend fixed width peaks up and downstream.
  --frip-ref-peaks FRIP_REF_PEAKS
                        Path to reference peak set (BED format) for
                        calculating FRiP
  --motif               Perform motif enrichment analysis
  --sob                 Use seqOutBias to produce signal tracks, incorporate
                        mappability information, and account for Tn5 bias.
  --no-scale            Do not scale signal tracks: Default is to scale by
                        read count. If using seqOutBias, scales by the
                        expected/observed cut frequency.
  --prioritize          Plot cFRiF/FRiF using mutually exclusive priority
                        ranked features based on the order of feature
                        appearance in the feature annotation asset.
  --keep                Enable this flag to keep prealignment BAM files
  --noFIFO              Do NOT use named pipes during prealignments
  --lite                Only keep minimal, essential output to conserve disk
                        space.
  -V, --version         show program's version number and exit

required named arguments:
  -O PARENT_OUTPUT_FOLDER, --output-parent PARENT_OUTPUT_FOLDER
                        Parent output directory of project
  -S SAMPLE_NAME, --sample-name SAMPLE_NAME
                        Name for sample to run
  -I INPUT_FILES [INPUT_FILES ...], --input INPUT_FILES [INPUT_FILES ...]
                        One or more primary input files
  -G GENOME_ASSEMBLY, --genome GENOME_ASSEMBLY
                        Identifier for genome assembly
```
