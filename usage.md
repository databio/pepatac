Skipping undefined pypiper argument: 'start'
Skipping undefined pypiper argument: 'sample_name'
usage: ATACseq.py [-h] [-N] [-I2 [INPUT_FILES2 [INPUT_FILES2 ...]]]
                  [-M MEMORY_LIMIT] [--stop-after STOP_AFTER]
                  [-Q SINGLE_OR_PAIRED] [-P NUMBER_OF_CORES] [-F] [-R]
                  [--stop-before STOP_BEFORE] [-S SAMPLE_NAME] [-D]
                  [-I INPUT_FILES [INPUT_FILES ...]] [-C CONFIG_FILE]
                  [-O PARENT_OUTPUT_FOLDER] [-G GENOME_ASSEMBLY]
                  [-gs GENOME_SIZE] [--frip-ref-peaks FRIP_REF_PEAKS]
                  [--peak-caller {fseq,macs2}]
                  [--trimmer {trimmomatic,pyadapt,skewer}]
                  [--prealignments PREALIGNMENTS [PREALIGNMENTS ...]] [-V]
                  [-c IMAGE_NAME]

Pipeline

optional arguments:
  -h, --help            show this help message and exit
  -N, --new-start       Fresh start mode, overwrite all
  -I2 [INPUT_FILES2 [INPUT_FILES2 ...]], --input2 [INPUT_FILES2 [INPUT_FILES2 ...]]
                        Secondary input file(s), e.g. read2 for a paired-end
                        protocol
  -M MEMORY_LIMIT, --mem MEMORY_LIMIT
                        Amount of memory (Mb) use to allow for processes for
                        which that can be specified
  --stop-after STOP_AFTER
                        Name of pipeline stage at which to stop (inclusive,
                        i.e. run)
  -Q SINGLE_OR_PAIRED, --single-or-paired SINGLE_OR_PAIRED
                        Single- or paired-end sequencing protocol
  -P NUMBER_OF_CORES, --cores NUMBER_OF_CORES
                        Number of cores for parallelized processes
  -F, --follow          Run all 'follow' commands, even if the primary command
                        is not run
  -R, --recover         Recover mode, overwrite locks
  --stop-before STOP_BEFORE
                        Name of pipeline stage at which to stop (exclusive,
                        i.e. not run)
  -S SAMPLE_NAME, --sample-name SAMPLE_NAME
                        Name for sample to run
  -D, --dirty           Make all cleanups manual
  -I INPUT_FILES [INPUT_FILES ...], --input INPUT_FILES [INPUT_FILES ...]
                        One or more primary input files (required)
  -C CONFIG_FILE, --config CONFIG_FILE
                        Pipeline configuration file (YAML). Relative paths are
                        with respect to the pipeline script.
  -O PARENT_OUTPUT_FOLDER, --output-parent PARENT_OUTPUT_FOLDER
                        Parent output directory of project
  -G GENOME_ASSEMBLY, --genome GENOME_ASSEMBLY
                        Identifier for genome assembly
  -gs GENOME_SIZE, --genome-size GENOME_SIZE
                        genome size for MACS2
  --frip-ref-peaks FRIP_REF_PEAKS
                        Reference peak set for calculating FRIP
  --peak-caller {fseq,macs2}
                        Name of peak caller; if 'fseq' fails to create a peaks
                        file and the log file indicates an
                        ArrayIndexOutOfBoundsException, this is likely due to
                        a low read count and can probably be overcome by
                        specifying fragment size with fseq's -f option.
  --trimmer {trimmomatic,pyadapt,skewer}
                        Name of read trimming program
  --prealignments PREALIGNMENTS [PREALIGNMENTS ...]
                        Space-delimited list of reference genomes to align to
                        before primary alignment.
  -V, --version         show program's version number and exit
  -c IMAGE_NAME, --image IMAGE_NAME
                        Run the pipeline commands in a container built from a
                        pipeline image, eliminating the need to install
                        dependencies. Can be either a docker or singularity
                        image.
