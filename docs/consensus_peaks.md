# Generate consensus peaks

When a `PEP` project contains more than one sample, the `PEPATAC` project processing pipeline can produce a consensus peak set. You can run the project level pipeline with `looper` using the `runp` command.

For example: `looper runp -c examples/test_project/.looper_test.yaml`

By default the project pipeline uses the Python summarizer with the `reproducible` method. It performs these steps:

1. Overlapping peaks are identified among all the project samples.
2. For each peak, the highest-scoring peak that overlaps it is kept, with its original fixed-width coordinates. Peaks are never merged.
3. A kept peak is retained if it was called in at least 2 samples (`--cutoff`) and in at least 60% of the samples (`--repro-cutoff 0.6`), whatever its score. There is no score floor unless you set `--min-score`.
4. **Recentering (on by default).** A peak whose coverage summit sits more than a quarter of the way from its center to its edge is shifted so the window centers on the summit. A shift is skipped if it would overlap a neighboring peak. Recentering reads each sample's coverage track (`aligned_<genome>_exact/<sample>_exact_shift.bw`, or `aligned_<genome>/<sample>_smooth_shift.bw`) with `pyBigWig`. If `pyBigWig` is not installed or the tracks are missing, recentering is skipped with a message in the log and peaks keep their called coordinates. Turn it off with `--no-recenter`.
5. **Overlap removal (`--distinct drop` by default).** Where two consensus peaks still overlap, the one called in fewer samples (then the lower-scoring one) is dropped, so every peak keeps its fixed width and no read is counted twice. `--distinct trim` trims overlaps to their midpoint instead, and `--distinct none` leaves them.

Alongside `<project>_<genome>_consensusPeaks.narrowPeak` the pipeline writes `<project>_<genome>_consensusPeaks_confidence.tsv`, with the number and fraction of samples that called each peak. When the coverage tracks are available it also has `signal_offset`, `bimodality` and `high_confidence` columns.

The `legacy` method (`--consensus-method legacy`) reproduces consensus peak sets from earlier PEPATAC releases: steps 1 and 2 above, then peaks present in >= 2 samples (`--cutoff`) with scores >= 5 (`--min-score`) are retained. It does no recentering and no overlap removal.

## Change the consensus options

The project pipeline passes these options on to the summarizer: `--cutoff`, `--min-score`, `--min-olap`, `--consensus-method`, `--repro-cutoff`, `--no-recenter` and `--distinct`. Add them to `looper runp` with `-x` (`--command-extra`). For example, to turn off recentering and trim overlaps instead of dropping peaks:

```console
looper runp -c examples/test_project/.looper_test.yaml -x "--no-recenter --distinct trim"
```

## Run the consensus peak generation manually

The R summarizer (`--summarizer R`) uses the older `legacy`-style method from the `PEPATACr` library included in the `PEPATAC` repository. Below is an example of how you could run this yourself in `R`, using the example project included in the repository. Because there's only a single sample in this case, it won't produce anything, but these commands illustrate how you could do this with your own project.

From the `PEPATAC` repository after you've run the test sample:
```
R
library(PEPATACr)
pep <- "examples/test_project/test_config.yaml"

# Load the project metadata
prj <- pepr::Project(pep)
project_name    <- pepr::config(prj)$name
project_samples <- pepr::sampleTable(prj)$sample_name
sample_table    <- data.table::data.table(
    sample_name=pepr::sampleTable(prj)$sample_name,
    genome=pepr::sampleTable(prj)$genome)

# Specify file locations
output_dir  <- "pepatac_test/"
results_dir <- file.path(output_dir, "results_pipeline")
summary_dir <- file.path(output_dir, "summary")
# Produce output directory (if needed)
dir.create(summary_dir, showWarnings = FALSE)

# Identify which chrom_sizes file was used from the project assets
assets <- createAssetsSummary(project_samples, results_dir)

# Generate consensus peaks and write to project output directory
min_samples <- 2
min_score   <- 5
peak_filepath <- consensusPeaks(sample_table, summary_dir, results_dir, assets,
                                min_samples, min_score)
# Load the peak file into R
peaks         <- data.table::fread(peak_filepath[[1]])
```
