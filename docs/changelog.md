# Change log
All notable changes to this project will be documented in this file.

## [0.9.8] -- 2020-10-22

### Added
 - Add Q1 FRiP for improved cross protocol QC comparisons
 - Determine the nucleosome-free, mono-, di-, tri-, and poly-nucleosome read fractions

### Changed
 - Update peak coverage table calculation to handle compressed files
 - Keep the non-normalized peak coverage table for some downstream analyses
 - Enable the peak counts table to adjust the minimum number of samples a peak must be present in to be kept (`--cutoff`)
 - Enable the peak count table to use raw read counts (default), weight the read count by the percentage overlap of the read in a peak (`--poverlap`), use the normalized read count (`--normalized`), or weight the normalized read count by the percentage overlap (`--poverlap --normalized`)

## [0.9.7] -- 2020-10-16

### Added
 - Add samtools as alternate, optional tool for deduplication
 - Add HOMER, HMMRATAC, and Genrich as optional tools for peak calling

### Changed
 - Restore bedtools merge command for shifted bed files

## [0.9.6] -- 2020-10-05

### Changed
 - Improve messaging for missing tool environment variables
 - Update tutorial to show multiple sample handling
 - Update example output to match updated tutorial
 - Fix recovery mode after compressing the shifted_bed output
 - Update gold example
 - Update requirements for looper pypi name
 - Update docs

## [0.9.5] -- 2020-09-08

### Changed
 - Corrected and unified duplicate read calculation and reporting

## [0.9.4] -- 2020-08-31

### Added
 - Enable skipping of steps in project pipeline and summarizer

### Changed
 - Compress bed and peak coverage file output by default
 - Fix `peakCounts` function reference peak set checks
 - Fix `reduce` and `reducePeaks` to properly accept output file name/path
 - Make input schema more explicit
 - Catch and resolve issue with incomplete bed files in FRiF plotting
 - Do not attempt to convert an empty peak file to a bigBed file

## [0.9.3] -- 2020-08-11

### Added
 - Add bwa mem as alternative read aligner

### Changed
 - Update pyadapt_trim.py to python3
 - Fix trimmomatic for SE and PE
 - Fix preseq grep error where search term exists in additional column

## [0.9.2] -- 2020-08-04

### Changed
 - Reduce memory requirements of consensus peak generation
 - Enable multiple genome projects for peak count tables

## [0.9.1] -- 2020-07-13

### Changed
 - Fixed logic for no prealignments on first run

## [0.9.0] -- 2020-05-26

### Added
 - Calculate and plot library complexity with preseq
 - Optionally correct for bias with seqOutBias
 - Optionally run `homer` to perform motif analysis
 - Add option to calculate FRiF using prioritized list of features
 - Custom R package to handle plots and corresponding calculations

### Changed
 - Move to python3 *only*
 - Enable scaled bigWig files by default
 - Split project level analyses into separate incl. project pipeline
 - Use PEP 2.0 standard
 - Updated handling of genome assets to use current `refgenie` mechanics
 - Changed handling of command line asset use
 - Update requirements
 - Update docs

## Unreleased
- Improve interaction with `BiocProject` auto-loading results in R.

## [0.8.7] -- 2019-06-18
### Fixed
- Bug with python2 unicode strings.

## [0.8.6] -- 2019-03-26

### Changed
- Use ngtsk ziptool option universally 
- Change how tools are parameterized and include bowtie2
- Simply and clarify prealignment steps
- Improve argument order for better readability

### Added
- Perform a pre-check that all required tools are callable
- Add multiple targets and a pre-check for FIFO usage

## [0.8.5] -- 2019-03-19

### Changed
- Convert and update documentation
- Fixed a bug with feature naming
- Improve bamSitesToWig modularity
- Move large files to separate host site

## [0.8.4] -- 2019-01-03

### Changed
- Switched to samblaster for default deduplication
- Improved readability of reported results
- Improved help messages
- Fix mitochondrial counting and remaining removal
- Use gunzip instead of zcat for MacOS compatibility

### Added
- Report total mapped and unmapped reads
- Add website docs
- Zip unmapped files
- Add `--lite` option to minimize size of output directory

## [0.8.3] -- 2018-10-04

### Changed
- Fixed a bug the provided annotation file not passing the full path when called
- Fixed a bug with a call to a non-initialized variable when missing an annotation file
- Fixed a bug with mm9/mm10 annotation files not matching refgenie naming conventions
- Changed how FRiF is plotted and displayed

## [0.8.2] -- 2018-09-20

### Changed
- Fixed a bug with bamQC.py not employing updated pararead logger use
- Fixed a bug with container not having all required components
- Fixed a bug where output parent directory was not required

## [0.8.1] -- 2018-09-19

### Changed
- Fixed a bug with prealignments' named pipe conflict

## [0.8.0] -- 2018-09-18

### Added
- Report NRF, PBC1, and PBC2
- Produce bigBed formatted narrowPeak file
- Add plotting of fractions of reads in *any* annotated feature
- Add peak annotation plotting
- Add buffered fastq repair tool

### Changed
- Fixed a bug with alignment rate reporting to prealignments
- Speed up prealignments by leveraging SE alignment
- Fix plotting of unaligned reads
- Fix SE incompatibility
- Rename output files for improved readability

## [0.7.0] -- 2018-06-25

### Added
- Added containerization feature
    - Run with either [docker](https://www.docker.com/) or [singularity](https://singularity.lbl.gov/)
- Added early bowtie2 index check

### Changed
- Renamed pipeline
- Improved summary figure reporting
- Integrated summary results into pipeline interface


## [0.6.1] -- 2017-12-15

### Changed
- Fixed a bug with paired-end reads that were not in proper pairs
- Fixed a bug with paired-end commands

## [0.6.0] -- 2017-12-14

### Added
- Single-end reads are now allowed
- Pipeline can now accommodate `.bam` input files
- Added a single-base bed file output in addition to the smoothed version

### Changed
- Fixed a bug with peak counting for fseq
- Fixed a bug with reporting estimated library sizes
- Fixed issues with TSS enrichment calculation that could lead to stalled jobs or excess CPU use
- Reduced verbosity of error messages for some tools
- Reduced amount of resources requested by default
- Introduced requirement on pypiper v0.7

## [0.5.0] -- 2017-09-13

### Added
- Added rudimentary figure reporting

### Changed
- Changed default trimmer from trimmomatic to skewer
- Made output from several tasks less verbose to make logs cleaner
- Fixed an issue that left behind temporary samtools files if the job was killed

## [0.4.0] -- 2017-07-21

### Added
- Added [fseq](https://github.com/aboyle/F-seq) as a peak caller option
- Peak caller is now specified by a command line argument (defaults to macs2)
- Count of called peaks is now reported as a pipeline result
- Add R and ggplot2 as requirements

### Changed
- Changed TSS plotting to use R instead of python
- TSS plot failures no longer fail the pipeline.
- Changed `Read_type` to `read_type` to prevent duplicate columns
- Read trimmer is now specified in option + argument style rather than as a flag.

## [0.3.0] -- 2017-06-22

### Added
- Added exact cuts calculation
- Added command-line version display
- Added skewer as a trimmer option 
- Uses looper 'implied columns' (from looper v0.6) to derive multiple variables from organism value

### Changed
- Generalizes decoy alignments to pre-alignments, with a new `--prealignment` option
- Simplified unmapped read processing to be output by bowtie directly, improving efficiency
- Fixed bug that hard-coded mouse genome size in for macs, and fixed pipeline interface
- Updated to new looper pipeline interface format
- Pipeline now requires looper v0.6 or greater
- Improved README

## [0.2.0] -- 2017-04-17
### Added
- FRiP can now be calculated based on reference peaks
- Pipeline now reports Picard estimated library size statistic
- Added option for pyadapt trimming
- Added example project using 'gold standard' data
- Added new resource package grades
- Added preliminary 'exact cuts' scripts, but they are not yet used

### Changed
- Improved README
- Changed filename of the TSS file
- Reorganized structure of alignment code

## [0.1.0]
### Added
- First release of ATAC-seq pypiper pipeline

