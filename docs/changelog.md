# Change log
All notable changes to this project will be documented in this file.

## [Unreleased]

## [0.14.0] -- 2026-11-17

### Added
- `--qc-backend` flag to select between gtars (Python/Rust) and R backends for QC plots; defaults to `r` for backward compatibility.
- `--qc-backend gtars` also computes the library-complexity metrics (NRF, PBC1, PBC2) with `gtars uniwig bamqc` instead of `tools/bamQC.py`. gtars follows the ENCODE method and counts only read pairs with MAPQ >= 30, so its total and distinct pair counts, M1 and PBC2 (and NRF and PBC1 when a library has duplicates) can differ from the `r` backend's numbers. The default `r` backend is unchanged.
- New Python `pepatac_summarizer` package replacing the R-based project summarizer.
- Reproducibility-gated consensus peaks in `pepatac_summarizer`: `--consensus-method {legacy,reproducible}` (default `reproducible`), `--repro-cutoff`, `--no-recenter`, and `--distinct {none,drop,trim}`. The `reproducible` method rescues weak-but-reproducible peaks (recovering ~2.7× more ENCODE-cCRE overlaps at ~96% precision vs. the score-floor method), recenters off-center peaks on the combined-signal max (on by default; needs `pyBigWig` and the per-sample coverage tracks, and is skipped with a log message without them), and drops lower-confidence overlaps to a distinct fixed-width set. `legacy` exactly reproduces the previous `collapsePeaks` output for backward compatibility. Emits a per-peak confidence sidecar (`*_consensusPeaks_confidence.tsv`: reproducibility, signal-centeredness, bimodality).
- `pipelines/pepatac_collator.py` passes `--consensus-method`, `--repro-cutoff`, `--no-recenter` and `--distinct` on to the Python summarizer, so `looper runp -x "..."` can set them. `--min-score` is passed only when set, so the summarizer's method-aware default (0 for `reproducible`, 5 for `legacy`) applies.
- Report per-sample output files to pipestat as file links (`aligned_bam`, `exact_bw`, `smooth_bw`, `peak_file`, `summits_bed`, `coverage_file`) plus `Picard_est_lib_size`, and the project `consensus_peaks_file` and `counts_table`, with matching `pepatac_output_schema.yaml` entries.
- `--skip-dedup` flag for protocols where duplicates are biologically meaningful (e.g. CUT&Tag, CUT&RUN). [#249](https://github.com/databio/pepatac/issues/249)
- Configurable mitochondrial contig names via `parameters: mito_names` in `pepatac.yaml` (previously hardcoded), so custom assemblies (e.g. Ensembl `MT`, RefSeq accessions) can be supported without editing pipeline code; falls back to the prior default list when the key is absent.
- `pipelines/pepatac_collator.py`: `--summarizer {python,R}` picks the project summarizer (default `python`).
- `--gtf` gives a GTF gene annotation for the partition plot under `--qc-backend gtars`.
- Expanded integration test suite under `tests/integration/`: `test_failure_detection`, `test_pipeline`, `test_looper_run`, `test_end_to_end`, which exercise the full pipeline against `databio/pepatac:1.1.4`, including regression coverage for the manual-paths-with-empty-`$REFGENIE` workflow ([#251](https://github.com/databio/pepatac/issues/251)).
- PEPATACr regression tests for `peakCounts` extension-detection ([#218](https://github.com/databio/pepatac/issues/218), [#219](https://github.com/databio/pepatac/issues/219)) and `plotAnno` empty-input fallback ([#232](https://github.com/databio/pepatac/issues/232)).
- Documentation: TSSE cutoff guidance with `refgene_anno` asset reference ([#235](https://github.com/databio/pepatac/issues/235)); custom adapter file usage ([#252](https://github.com/databio/pepatac/issues/252)); `$REFGENIE`-required workaround when using manual paths ([#251](https://github.com/databio/pepatac/issues/251)); `PEPATAC_completed.flag` handling in the count-table workflow ([#215](https://github.com/databio/pepatac/issues/215)); `TypeError: 'NoneType' object is not iterable` troubleshooting ([#216](https://github.com/databio/pepatac/issues/216)); `_peaks_coverage.bed` and `_ref_peaks_coverage.bed` column formats ([#233](https://github.com/databio/pepatac/issues/233)); "Running a non-refgenie genome through looper" subsection ([#231](https://github.com/databio/pepatac/issues/231)).

### Changed
- Bump bulker crate to `databio/pepatac:1.1.4` (`rust-gtars` 0.6.0 → 0.9.0; `bowtie2` → 2.5.5).
- `tools/pepatac_summarizer/consensus.py`: replace the gtars `reduce()`-based consensus (which merged overlapping peaks into bloated regions, contrary to the fixed-width design intent) with a pure-Python boundary-preserving method (no gtars dependency). See the new `--consensus-method` above.
- Pin the `gtars>=0.9.1` Python binding (used by the `--qc-backend gtars` plots) in `requirements.txt` and `requirements-conda.yml`, and the `rust-gtars=0.9.0` command-line tool in `requirements-conda.yml`, aligning every gtars reference with the 1.1.4 crate. The `rust-gtars` conda package has no Python module, so the conda env needs both.
- Add `pyBigWig` to `requirements.txt` and `requirements-conda.yml` (reads per-sample coverage tracks for the reproducible-consensus confidence annotations and recentering).
- `calculate_consensus_peaks()` now defaults to `recenter=True`, matching the summarizer CLI (the library previously defaulted to `False`).
- Declare `matplotlib` in `requirements.txt` and `requirements-conda.yml`. The summarizer and the gtars QC backend import it; without it a clean environment could not even collect the test suite.
- Raise `piper` to `>=0.15.2` in `requirements.txt` and `==0.15.2` in `requirements-conda.yml`, and `ubiquerg` to 0.9.3 in `requirements-conda.yml`. The old conda pins could not be installed together (`pipestat` 0.13.1 needs `ubiquerg>=0.9.1`), and `piper` 0.14.3 fails to import under `yacman` 1.0 (`No module named 'attmap'`). `piper` 0.15.0 and 0.15.1 crash at the first reported result when the looper config uses the per-sample `results_pipeline/{record_identifier}/stats.yaml` layout (`TypeError: 'NoneType' object is not subscriptable`); 0.15.2 fixes this.
- Replace `refgenie==0.12.1` with `refgenie>=0.13.0,<1.0.0` in `requirements-conda.yml`. The refgenie 0.12.1 command-line tool cannot run with `refgenconf` 0.13.1 (every command raises `TypeError`). PEPATAC 0.14 supports the legacy refgenie 0.12/0.13 line only; refgenie 1.0 support comes in 0.15. The install docs now pin `refgenie>=0.13.0,<1.0.0` and say so.
- Pin `refgenconf>=0.13.1` so installs land on the yacman-1.0-compatible refgenconf release; older `refgenconf` paired with current `yacman` raised `AttributeError: module 'yacman' has no attribute 'YacAttMap'` at pipeline import.
- Pin `looper>=2.1.1` and `yacman>=1.0.0` (and align the `requirements-conda.yml` strict pins to match). `looper==2.0.1` paired with yacman 1.0+ raised `TypeError: YAMLConfigManager.__init__() takes from 1 to 4 positional arguments but 6 were given` from `looper/divvy.py:52`'s `ComputingConfiguration.__init__` because the yacman 1.0 constructor reduced its positional arg count; looper 2.1.1 handles the new signature.
- Bump `requirements-conda.yml` strict pins for `pipestat==0.13.1` and `refgenconf==0.13.1` to match `requirements.txt`.
- Pin `GenomicDistributions (>= 1.4.6)` and `GenomicDistributionsData (>= 1.0.0)` in `PEPATACr/DESCRIPTION` to avoid the `chromSizes_hg38` / `TSS_hg38` namespace mismatch when one side is upgraded without the other. [#230](https://github.com/databio/pepatac/issues/230)
- Add `r-argparser` to `requirements-conda.yml` for `tools/PEPATAC_summarizer.R`. [#228](https://github.com/databio/pepatac/issues/228)
- Add `r-r.utils` to `requirements-conda.yml` and `R.utils` to `PEPATACr/DESCRIPTION` Imports (required by `data.table::fread` for `.bed.gz`). [#229](https://github.com/databio/pepatac/issues/229)
- Relax pinned `ucsc-bedgraphtobigwig`, `ucsc-bedtobigbed`, `ucsc-bigwigmerge`, `ucsc-stringify` builds in `requirements-conda.yml` (the `377` builds required openssl 1.1.1 and conflicted with the env's openssl 3.x). [#321](https://github.com/databio/pepatac/issues/321)
- Test scripts: switch from `bulker activate --echo` PATH-extraction to `bulker exec`; force local compute package; block host R-lib / Python user-site leak through the apptainer container boundary.
- `tools/PEPATAC.R`: required-library load failure now exits non-zero and surfaces the underlying `conditionMessage(e)` so callers can distinguish a missing package from a load-time failure (ABI mismatch, missing system library, etc.).
- Docs (`docs/install.md`): drop dead `run-container.md` link; refresh intro now that containers were removed in 0.12.0 and the path is `bulker` / conda / native.
- Docs (`tests/README.md`): note that bulker can dispatch to Docker *or* Singularity / Apptainer.
- `tools/pepatac_summarizer/counts.py`: compute the project peak-counts table with `gtars fscoring` over each sample's Tn5-shifted `*_shift.bed`, the same signal the peaks were called from. It is about 75x faster than `bedtools multicov` on the BAMs and matches it at r ~ 0.999. This replaces the earlier `gtars.models.RegionSet.from_bam`/`count_overlaps` call, which no released `gtars` provided (the table was silently empty).
- `tools/pepatac_summarizer/assets.py`: build the project assets summary from each sample's `assets.tsv` (the reference assets the run actually used), matching the R summarizer, instead of globbing output folders. Samples without one are skipped with a warning.
- `pipelines/pepatac_collator.py`: put the pipeline's `tools/` on `PYTHONPATH` so the default Python `pepatac_summarizer` (a path-based package with no `setup.py`) resolves during `looper runp`.
- `PEPATACr`: migrate deprecated ggplot2 `size` → `linewidth` in `theme_PEPATAC()` (deprecated as of ggplot2 3.4.0); declare `reshape2` in `DESCRIPTION` Imports (used by `reshape2::melt`).
- `requirements-conda.yml`: explicitly pin `samtools` and `pigz` (previously present only as transitive dependencies).
- `checkinstall`: use current Rust-bulker syntax (`bulker crate install` and `bulker exec <crate> -- …` in place of the removed `bulker load` / `bulker run`) and verify a crate tool rather than `pepatac.py --help`; evaluate the native-install check against a conda-stripped `PATH` so an active conda env can't report as a native install; add `PEPATAC_ENV` to target a conda env built at a custom prefix; skip blank lines when parsing `requirements.txt`.
- Docs: install `GenomicDistributions` and `GenomicDistributionsData` via `BiocManager` in `run-conda.md` and `detailed-install.md` (both are on Bioconductor now; the `install_github` / `big.databio.org` tarball route is deprecated), noting `XML` as a transitive dependency of `getChromSizes()`; clarify in `run-conda.md` §2 that `conda env create -f requirements-conda.yml` installs all required tools; update `run-bulker.md` crate setup to `bulker crate install`.
- Docs: rewrite `consensus_peaks.md` for the Python summarizer's default `reproducible` method, recentering and overlap removal, and how to pass options through `looper runp -x`; `run-bulker.md` installs crate 1.1.4; regenerate `usage.txt` and `docs/usage.md`.
- `pipelines/pepatac_collator.py`: version now matches the pipeline (0.14.0; was 0.12.4).
- Test scripts and test docs default to crate `databio/pepatac:1.1.4`.
- Bump `pytest` to 9.0.3 in `requirements-test.txt`; anchor the pytest rootdir at the project root via `pytest.ini`.
- `requirements.txt` no longer installs MACS3. Install `macs3` separately.

### Fixed
- `pipelines/pepatac.py` `_align()`: single-end + bwa branch referenced an undefined `cmd`; mirror the paired chain (minus `filter_pair`) for both `--keep` and no-keep paths. [#299](https://github.com/databio/pepatac/issues/299)
- `pipelines/pepatac.py` post-prealignment handle check: `unmap_fq1` branch set an error string but never called `pm.fail_pipeline`, so a stuck filter on R1 wouldn't surface; both branches now fail consistently and the error message points at the `psutil` introspection cause and recommends both `--keep` and `--noFIFO` as workarounds. [#234](https://github.com/databio/pepatac/issues/234)
- `pipelines/pepatac.py` `--lite` cleanup: variables that may be `None` when QC paths are skipped (e.g. `frag_len`, `Tss_enrich` under `--skipqc`) were unconditionally `pm.clean_add`-ed, slipping `None` into pypiper's cleanup list and crashing `_cleanup()` at the very end of an otherwise successful run. Guard with `if path:`. Also fix the inverted condition in the trailing `to_compress` loop.
- `pepatac_output_schema.yaml`: FastQC report objects (`object_type: file`) had `thumbnail_path` declared as required `string`, but pipestat synthesizes the field as `None` for non-image reports. Allow `null` and drop from `required` so pipestat ≥0.12 doesn't raise `SchemaValidationErrorDuringReport` in `check_trim`.
- `pepatac_output_schema.yaml`: Restore `Time` and `Success` entries so `pm.stop_pipeline()`'s `report_result("Time", ...)` doesn't raise `ColumnNotFoundError`. pipestat 0.13.0+ permits keys in both `samples:` and `project:`. [#322](https://github.com/databio/pepatac/issues/322) [#305](https://github.com/databio/pepatac/issues/305)
- `PEPATACr::peakCounts()`: extension-detection now runs independently for `_ref_peaks_coverage` and `_peaks_coverage`, so a mixed-state setup (one compressed, one uncompressed) no longer falls through to the "not derived from a singular reference peak set" warning. [#218](https://github.com/databio/pepatac/issues/218) [#219](https://github.com/databio/pepatac/issues/219)
- `PEPATACr::plotAnno()`: empty-input fallback was constructing `file.path(<output_pdf>, ...)` (treating an output `.pdf` as a directory) and `quit()`ing the R session; replace with `return(ggplot())` so the caller's `pdf()`/`png()` produces a clean blank placeholder. [#232](https://github.com/databio/pepatac/issues/232)
- `sample_pipeline_interface.yaml`: guard every `refgenie[sample.genome]` lookup with `sample.genome in refgenie`; non-refgenie genomes now fall through to per-sample paths instead of crashing with an `attmap.AttMap` `AttributeError`. [#231](https://github.com/databio/pepatac/issues/231)
- `tools/bamQC.py`, `tools/bamSitesToWig.py`: define `_LOGGER` at module level so `pararead` workers re-importing under multiprocessing `spawn` don't hit `NameError`. [#266](https://github.com/databio/pepatac/issues/266)
- `checkinstall`: three `curl`-into-variable bugs that stored file contents in a variable used as a path downstream; switch to `mktemp` + `curl -fsSL -o`. [#226](https://github.com/databio/pepatac/issues/226)
- `pipelines/pepatac.py`: use raw strings in two `re.sub` patterns to silence Python 3.12 `SyntaxWarning: invalid escape sequence '\w'`.
- Docs (`docs/faq.md`): expanded TSSE entry with `refgene_anno` source asset, hg38-tuned threshold caveat, and pointer at ENCODE ATAC-seq data standards. [#235](https://github.com/databio/pepatac/issues/235)
- TSS enrichment no longer stops the run on an unusable TSS annotation: a missing annotation is skipped, a `pyTssEnrichment.py` run that writes no output skips the TSS score and plot with a warning, and `pyTssEnrichment.py` no longer raises `ValueError` when there are fewer TSSs than cores.
- `--qc-backend gtars`: the TSS distance plot is skipped with guidance when no TSS annotation is available, and skipped with a warning when the TSS file cannot be parsed, instead of failing the run.
- `pipelines/pepatac.py`: put the project root on `sys.path` so `tools.pepatac_qc_gtars` imports when `pepatac.py` runs as a script.
- `tests/test_summarizer*.py`: update the `collapse_peaks` tests for its `(lines, confidence_rows)` return value.
- `tools/pepatac_summarizer/utils.py`: silence the pandas `fillna`/`replace` silent-downcasting `FutureWarning` (opt into `future.no_silent_downcasting` and downcast explicitly via `infer_objects`).
- `tools/pepatac_summarizer`: `--frip-ref-peaks` builds the counts table on the reference peaks again, also with `--skip-consensus`. `--poverlap` is not supported and now logs a warning. [#324](https://github.com/databio/pepatac/issues/324)
- `requirements.txt`: raise the `pipestat` floor to `>=0.13.1`; older versions fail on the 0.14 output schema. [#322](https://github.com/databio/pepatac/issues/322)

### Removed
- Old R-based `PEPATACr/tests/testthat/{testthat.R,helper-fixtures.R,test-summarizer.R,test-utilities.R,test-yamlToDT.R}` — superseded by the Python summarizer package and its test suite at `tests/test_summarizer.py` / `tests/test_summarizer_integration.py`.

## [0.13.1] -- 2026-03-25
- Update bulker crate to `databio/pepatac:1.1.1` (fix broken openjdk image).
- Update test scripts for the Rust bulker CLI.
- `pepatac_collator.py` / `PEPATACr`: pass the reference peak set (`--frip-ref-peaks`) through to the R summarizer's count table.
- `PEPATACr`: read the newer object-style pipestat reports in sample `stats.yaml` files; add R summarizer tests.

## [0.13.0] -- 2026-03-06
- Extract peak cleaning into separate script (`tools/clean_peaks.py`). Fix [#295](https://github.com/databio/pepatac/issues/295)
- Update to latest pipestat; add integration and regression tests
- Fix clip chrom end bug in PEPATACr
- smoothWig.pl: Fix off-by-one errors in smoothing window calculation and boundary handling
- Update bulker crate to databio/pepatac:1.1.0
- Both pipeline interfaces pass `--pipestat-config {pipestat.config_file}` to the pipeline.
- Picard `MarkDuplicates` uses `ASSUME_SORT_ORDER=coordinate` instead of `ASSUME_SORTED=true`.

## [0.12.5] -- 2025-09-23
- Fix tutorial typos.

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
