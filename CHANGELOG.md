# Change log
All notable changes to this project will be documented in this file.

## [0.4.0] -- Unreleased

### Added
- Peak calling may now be done with the [fseq](https://github.com/aboyle/F-seq) from the [Furey Lab](http://fureylab.web.unc.edu/software/fseq/).
- Count of called peaks is now reported as a pipeline result.

### Changed
- Changed TSS plotting
- Changed `Read_type` to `read_type` to prevent duplicate columns
- Choice of read trimmer (and now also peak caller since there's a second option) is specified in option + argument style rather than as a flag.

## [0.3.0] -- 2017-06-22

### Added
- Added exact cuts calculation
- Adds command-line version display
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
