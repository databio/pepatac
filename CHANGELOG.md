# Change log
All notable changes to this project will be documented in this file.

## [0.3.0 Unreleased]

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

## [0.2.0]
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