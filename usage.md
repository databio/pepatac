usage: ATACseq.py [-h] [-N] [-I2 INPUT_FILES2 [INPUT_FILES2 ...]]
                  [-M MEMORY_LIMIT] [-Q SINGLE_OR_PAIRED] [-S SAMPLE_NAME]
                  [-P NUMBER_OF_CORES] [-D] [-I INPUT_FILES [INPUT_FILES ...]]
                  [-F] [-R] [-C CONFIG_FILE] [-O PARENT_OUTPUT_FOLDER]
                  [-G GENOME_ASSEMBLY] [-gs GENOME_SIZE]
                  [--frip-ref-peaks FRIP_REF_PEAKS] [--pyadapt] [--skewer]
                  [--prealignments PREALIGNMENTS [PREALIGNMENTS ...]] [-V]

Pipeline

optional arguments:
  -h, --help            show this help message and exit
  -N, --new-start       Fresh start mode, overwrite all
  -I2 INPUT_FILES2 [INPUT_FILES2 ...], --input2 INPUT_FILES2 [INPUT_FILES2 ...]
                        One or more secondary input files (if they exists);
                        for example, second read in pair.
  -M MEMORY_LIMIT, --mem MEMORY_LIMIT
                        Memory string for processes that accept memory limits
                        (like java)
  -Q SINGLE_OR_PAIRED, --single-or-paired SINGLE_OR_PAIRED
                        single or paired end? default: single
  -S SAMPLE_NAME, --sample-name SAMPLE_NAME
                        unique name for output subfolder and files (required)
  -P NUMBER_OF_CORES, --cores NUMBER_OF_CORES
                        number of cores to use for parallel processes
  -D, --dirty           Make all cleanups manual
  -I INPUT_FILES [INPUT_FILES ...], --input INPUT_FILES [INPUT_FILES ...]
                        One or more primary input files (required)
  -F, --follow          Run all follow commands, even if command is not run
  -R, --recover         Recover mode, overwrite locks
  -C CONFIG_FILE, --config CONFIG_FILE
                        pipeline config file in YAML format; relative paths
                        are considered relative to the pipeline script.
                        defaults to ATACseq.yaml
  -O PARENT_OUTPUT_FOLDER, --output-parent PARENT_OUTPUT_FOLDER
                        parent output directory of the project (required).
  -G GENOME_ASSEMBLY, --genome GENOME_ASSEMBLY
                        identifier for genome assempbly (required)
  -gs GENOME_SIZE, --genome-size GENOME_SIZE
                        genome size for MACS2
  --frip-ref-peaks FRIP_REF_PEAKS
                        Reference peak set for calculating FRIP
  --pyadapt             Use pyadapter_trim for trimming? [Default: False]
  --skewer              Use skewer for trimming? [Default: False]
  --prealignments PREALIGNMENTS [PREALIGNMENTS ...]
                        Space-delimited list of reference genomes to align to
                        before primary alignment.
  -V, --version         show program's version number and exit
