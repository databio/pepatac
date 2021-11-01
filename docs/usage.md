# <img src="../img/pepatac_logo_black.svg" alt="PEPATAC" class="img-fluid" style="max-height:35px; margin-top:-15px; margin-bottom:-10px">  usage reference

`PEPATAC` command-line usage instructions:



`python pipelines/pepatac.py --help`
```{console}
usage: pepatac.py [-h] [-R] [-N] [-D] [-F] [-T] [--silent] [--verbosity V]
                  [--logdev] [-C CONFIG_FILE] [-O PARENT_OUTPUT_FOLDER]
                  [-M MEMORY_LIMIT] [-P NUMBER_OF_CORES] [-S SAMPLE_NAME] -I
                  INPUT_FILES [INPUT_FILES ...]
                  [-I2 [INPUT_FILES2 [INPUT_FILES2 ...]]] -G GENOME_ASSEMBLY
                  [-Q SINGLE_OR_PAIRED]
                  [--trimmer {trimmomatic,pyadapt,skewer}]
                  [--aligner {bowtie2,bwa}]
                  [--deduplicator {picard,samblaster,samtools}]
                  [--peak-caller {fseq,fseq2,genrich,hmmratac,homer,macs2}]
                  [-gs GENOME_SIZE] [--peak-type {fixed,variable}]
                  [--extend EXTEND] [--frip-ref-peaks FRIP_REF_PEAKS]
                  [--motif] [--sob] [--no-scale] [--prioritize] [--keep]
                  [--noFIFO] [--lite] [--skipqc]
                  [--prealignment-names PREALIGNMENT_NAMES [PREALIGNMENT_NAMES ...]]
                  [--prealignment-index PREALIGNMENT_INDEX [PREALIGNMENT_INDEX ...]]
                  --genome-index GENOME_INDEX --chrom-sizes CHROM_SIZES
                  [--TSS-name TSS_NAME] [--blacklist BLACKLIST]
                  [--anno-name ANNO_NAME] [--search-file SEARCH_FILE] [-V]

PEPATAC version 0.10.2

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
  -O PARENT_OUTPUT_FOLDER, --output-parent PARENT_OUTPUT_FOLDER
                        Parent output directory of project
  -M MEMORY_LIMIT, --mem MEMORY_LIMIT
                        Memory limit for processes accepting such. Default
                        units are megabytes unless specified using the suffix
                        [K|M|G|T].
  -P NUMBER_OF_CORES, --cores NUMBER_OF_CORES
                        Number of cores for parallelized processes
  -S SAMPLE_NAME, --sample-name SAMPLE_NAME
                        Name for sample to run
  -I2 [INPUT_FILES2 [INPUT_FILES2 ...]], --input2 [INPUT_FILES2 [INPUT_FILES2 ...]]
                        Secondary input files, such as read2
  -Q SINGLE_OR_PAIRED, --single-or-paired SINGLE_OR_PAIRED
                        Single- or paired-end sequencing protocol
  --trimmer {trimmomatic,pyadapt,skewer}
                        Name of read trimming program.
  --aligner {bowtie2,bwa}
                        Name of read aligner.
  --deduplicator {picard,samblaster,samtools}
                        Name of deduplicator program.
  --peak-caller {fseq,fseq2,genrich,hmmratac,homer,macs2}
                        Name of peak caller.
  -gs GENOME_SIZE, --genome-size GENOME_SIZE
                        Effective genome size. It can be 1.0e+9 or 1000000000:
                        e.g. human (2.7e9), mouse (1.87e9), C. elegans (9e7),
                        fruitfly (1.2e8). Default:2.7e9
  --peak-type {fixed,variable}
                        Call variable or fixed width peaks. Fixed width
                        requires MACS2.
  --extend EXTEND       How far to extend fixed width peaks up and downstream.
  --frip-ref-peaks FRIP_REF_PEAKS
                        Path to reference peak set (BED format) for
                        calculating FRiP.
  --motif               Perform motif enrichment analysis.
  --sob                 Use seqOutBias to produce signal tracks, incorporate
                        mappability information, and account for Tn5 bias.
  --no-scale            Do not scale signal tracks: Default is to scale by
                        read count. If using seqOutBias, scales by the
                        expected/observed cut frequency.
  --prioritize          Plot cFRiF/FRiF using mutually exclusive priority
                        ranked features based on the order of feature
                        appearance in the feature annotation asset.
  --keep                Enable this flag to keep prealignment BAM files.
  --noFIFO              Do NOT use named pipes during prealignments.
  --lite                Only keep minimal, essential output to conserve disk
                        space.
  --skipqc              Skip FastQC. Useful for bugs in FastQC that appear
                        with some sequence read files.
  --prealignment-names PREALIGNMENT_NAMES [PREALIGNMENT_NAMES ...]
                        Space-delimited list of prealignment genome names to
                        align to before primary alignment.
  --prealignment-index PREALIGNMENT_INDEX [PREALIGNMENT_INDEX ...]
                        Space-delimited list of prealignment genome name and
                        index files delimited by an equals sign to align to
                        before primary alignment. e.g.
                        rCRSd=/path/to/bowtie2_index/.
  --genome-index GENOME_INDEX
                        Path to primary genome index file. Either a bowtie2 or
                        bwa index.
  --chrom-sizes CHROM_SIZES
                        Path to primary genome chromosome sizes file.
  --TSS-name TSS_NAME   Path to TSS annotation file.
  --blacklist BLACKLIST
                        Path to genomic region blacklist file.
  --anno-name ANNO_NAME
                        Path to reference annotation file (BED format) for
                        calculating FRiF.
  --search-file SEARCH_FILE
                        Required for seqOutBias (--sob). Path to tallymer
                        index search file built with the same read length as
                        the input.
  -V, --version         show program's version number and exit

required named arguments:
  -I INPUT_FILES [INPUT_FILES ...], --input INPUT_FILES [INPUT_FILES ...]
                        One or more primary input files
  -G GENOME_ASSEMBLY, --genome GENOME_ASSEMBLY
                        Identifier for genome assembly
```
