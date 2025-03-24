# Change log
All notable changes to this project will be documented in this file.

## [0.12.4] -- 2025-03-24
- fix for issue [310](https://github.com/databio/pepatac/issues/310)

## [0.12.3] -- 2025-03-05
- Bump rust-gtars to v0.2.4, looper to 2.0.1, ubiquerg to 0.8.1

## [0.12.2] -- 2025-02-13
- Bump rust-gtars to v0.2.1: https://anaconda.org/bioconda/rust-gtars

## [0.12.1] -- 2025-02-10
- Bump pipestat version to fix this issue: https://github.com/pepkit/pipestat/issues/215

## [0.12.0] -- 2025-01-16
- Remove containers from build and docs (docker and singularity)
- update native install and bulker install docs
- update to the newest versions of Looper (2.0.0), Pipestat (0.12.0), Pypiper (piper == 0.14.3)
- update bowtie2, bedtools, fastqc, pigz versions.
- replace `bamSitesToWig` step with [`gtars uniwig`](https://crates.io/crates/gtars). 

## [0.11.3] -- 2024-06-05

### Changed
 - Pin Pipestat (pipestat==0.6.0), Looper (looper==1.6.0), and Pypiper (piper==0.14.0) versions to ensure compatibility

## [0.11.2] -- 2024-01-22

### Fixed
 - fix fastqc path Issue #268

## [0.11.1] -- 2024-01-17

### Fixed
 - changed PEPATACr.R to use lapply instead of sapply when converting yaml to data.table object

## [0.11.0] -- 2023-12-22

### Fixed
 - adjusted requirements and docs for Looper 1.6.0, Pipestat v0.6.0, and Pypiper 0.14.0

### Changed
- pipeline uses MACS3 instead of MACS2
- output schema is now a pipestat compatible JSON Schema
- collator now outputs with record_identifier name `summary`

## [0.10.5] -- 2023-07-31

### Fixed
 - adjusted requirements for Looper 1.4.2

## [0.10.4] -- 2023-07-14

### Fixed
 - adjusted requirements for Looper (1.4.1 and above) and Eido (0.2.0 and above)
   
## [0.10.3] -- 2021-11-23

### Added
 - Customize java settings in the configuration file

### Changed
 - Change handling of prealignment arguments
 - Update handling of blacklist when using HMMRATAC

## [0.10.2] -- 2021-11-01

### Changed
 - Update conda environment file
 - Update conda docs

## [0.10.1] -- 2021-10-25

### Changed
 - Update dockerfile for changes to R package installations
 - Update bulker crate for new rpipe container
 - Update tutorial docs

## [0.10.0] -- 2021-07-20

### Changed
 - Make refgenie optional
 - Use looper refgenie populate plugin to integrate refgenie
 - Update docs to reflect changes to refgenie requirement and installation
 - Fix file.path in reducePeaks() and take sample name argument
 - Update blacklist reduce peaks step
 - Rework CLI arguments to be fully explicit
 - Update <guides> settings in R
 - Update dockerfile to most recent refgenie usage and R package changes 
 - Reduce smaller file resource requests
 
### Added
 - Add assets descriptions and how to obtain to docs
 - Add script to check native, conda, and container-based installs

## [0.9.16] -- 2021-05-18

### Changed
 - Updated consensus peak documentation
 - Reintroduced single container images and corresponding documentation
 - Added minimum score and minimum overlap parameters to consensus peak generation
 - Restore use of original F-seq as optional peak caller
 - Updated peak calling using F-seq, HOMER, and HMMRATAC
 - Updated PEPATACr package to rely less on PEPs within functions
 - Move stats summary generation to R and outside of looper table

## [0.9.15] -- 2021-03-03

### Added
 - Add PEP, count table, consensus peak generation documentation
 - Add license

### Changed
 - Fix documentation page links
 - Updated argument types case
 - Added ability to adjust minimum sample count when creating consensus peaks

## [0.9.14] -- 2021-02-05

### Changed
 - Update F-Seq to F-Seq2
 - Add the option to install using conda
 - Add script for easing installation of seqOutBias
 - Use https for PEP schema; list alternative local PEP schema approach
 
## [0.9.13] -- 2020-12-02

### Changed
 - Fix recovery mode for modified fastq repairing checks

## [0.9.12] -- 2020-12-01

### Changed
 - Update bulker crate and version

## [0.9.11] -- 2021-03-04

### Changed
 - Fixed error in order of argument terms for _remove_adapters() 
 
### Added
 - Added documentation for using custom adapters

## [0.9.10] -- 2020-09-28

### Changed
 - Changed looper pypi term
 - Updated documentation to reflect companion software updates

## [0.9.9] -- 2020-08-28

### Changed
 - Improve clarity of trimmed reads reporting

## [0.9.8] -- 2020-06-16

### Changed
 - Fix summarizer file path construction
 - Add minimum version requirements to required software
 - Update uninformative adapter read calculation
 - Update example output
 - Update pause index calculation to be inflexible to depth
 - Fix cFRiF y-axis
 - Update cutadapt calculations to newer versions of cutadapt
 - Update resource defaults
 - Update requirement base versions
 - Update schema

## [0.9.7] -- 2020-05-26

### Added
 - Create assets summary for samples and project
 - Add optional scaling of signal tracks

### Changed
 - Update to PEP 2.0 standard
 - Update docs and examples

## [0.9.6] -- 2020-03-31

### Changed
 - Fixed refgenie bowtie2 index assignment

## [0.9.5] -- 2020-03-26

### Changed
 - Updated FRiF calculation to only account for the `count` column
 - Updated FRiF calculation to check if results are empty

## [0.9.4] -- 2020-03-25

### Changed
 - Updated bowtie2 index checks to be in line with refgenie updates

## [0.9.3] -- 2020-03-25

### Changed
 - Added checks for correct value return on cutadapt report checks

## [0.9.2] -- 2020-03-25

### Changed
 - Updated refgenconf use from get_asset() to seek()
 - Added check for bowtie2_index asset naming

## [0.9.1] -- 2020-02-27

### Added
 - Report project counts table as a summary object
 - Clean up additional uncommonly used downstream files

### Changed
 - Use bulker for container usage
 - Update R install process
 - Correct FastQC object reporting
 - Updated logic for recover mode
 - Default max length trimming is now none
 - Change nomenclature regarding FRiF/PRiF plots
 - Change TSS score nomenclature

## [0.9.0] -- 2020-02-20

### Added
- Add a how-to guide for configuring UMI settings

### Changed
- Update mRNA contamination plots display properties to be more readable
- Update pause index plots to default to log10 histograms and update their display properties
- Use paper samples as the default output examples in the docs

## [0.8.9] -- 2020-02-11

### Changed
- Corrected Pct_reads_too_short calculation
- Updated mRNA and PI plots to plot on same axis across sample
- Updated minimum acceptable read length
- Produce both signal track types

## [0.8.8] -- 2020-02-04

### Changed
- Updated degradation ratio calculation for PE data
- Corrected Pct_reads_too_short to be percent not fraction

## [0.8.7] -- 2020-02-04

### Changed
- Updated degradation ratio calculation for SE data
- Fixed report_fastq to properly handle SE, non UMI data

## [0.8.6] -- 2020-01-28

### Changed
- Update FRiF calculation to optionally follow a priority ranked method
- Update how adapter insertion distributions are plotted to be the same for SE or PE data
- Make cutadapt the default for adapter removal
- Streamline the use of Refgenie assets
    - Refgenie manages pause indicies
    - Refgenie manages feature annotations
    - Refgenie manages assets for mRNA contamination
    - Refgenie manages seqOutBias required suffixerator indicies
- Change pause index and mRNA contamination plots to histograms

### Added
- Add PRiF plot
- Require FLASH tool
- Produce sample level gene counts file as output
- Generate project level counts table including all samples X gene counts
- Report degradation metric for library quality
- Add BiocProject integration

## [0.8.1] -- 2019-07-15

### Changed
- Fix fraction in feature calculation
- Fix library complexity calculation for PE data
- Require fastq_pair tool
- Require cutadapt for SE processing

### Added
- Add QC plot for adapter insertion distribution

## [0.8.0] -- 2019-07-10

### Changed
- Update pause index calculation and required annotation files
- Update mRNA contamination required annotation files
- Move fastq processing to separate function
- Change handling of PE data
- Update TSS profiling

### Added
- Add modified fastq_pair tool to handle PE data properly
- Add pause index plotting
- Add mRNA contamination calculation and plotting
- Add fragment length distribution plotting for PE data

## [0.7.3] -- 2019-06-13

### Changed
- Fix missing gt in container
- Fix mappability bug with new refgenie

## [0.7.2] -- 2019-06-13

### Changed
- Fix --new-start bug
- Fix container libgsl library
- Adjust seqOutBias usage and flexibility

## [0.7.1] -- 2019-06-12

### Changed
- Update to new refgenie usage
- Update container

## [0.7.0] -- 2019-06-11

### Changed
- Fix multiple input file handling
- Update preseq calculation and plotting and handle small samples
- Fix TSS plotting and score calculation
- Include bedtools in required software

### Added
- Add project level library complexity summarizer
- Add docs
- Add container
- Add small test example

## [0.6.0] -- 2019-06-04

### Changed
- Use PEPPRO R package for QC plotting and analysis
- Default uses intermediate read files to produce a deduplicated and non-deduplicated aligned BAM file
- Check for cutadapt version for multicore processing
- Update bigWig production to be variable step formatted wig

### Added
- Handle GRO-seq data as input
- Created and included a PEPPRO R package for standard functions
- Add preseq requirement and plot library complexity curve
- Calculate and report read depth
- Calculate and report the percent of adapter contamination
- Produce fraction of reads in features plot

## [0.5.1] -- 2019-05-09

### Changed
- Simplify and clarify prealignment steps

### Added
- Perform a pre-check that all required tools are callable
