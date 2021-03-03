# Generate peak count table

When a `PEP` project contains more than one sample, the `PEPATAC` project processing pipeline can produce a count table for all the samples in the project. You can run the project level pipeline with `looper` using the `runp` command.

For example: `looper runp examples/test_project/test_config.yaml`

## Count table *without* a reference peak set

For any run without a (reference peak set)[reference_peaks.md] included, the project processing pipeline *will* produce a counts table, but this will be on a simplified consensus peak set.  This simplified approach is utilized for its speed and low memory use, and is helpful if users do not want nor need a count table for their downstream analysis or they choose to implement their own approach. For this simplified consensus peak set, the reduce method from the `R` package `GenomicRanges` aligns and merges overlapping ranges to produce the simplified/reduced set. With this reduced peak set, sample's individual peak files are overlapped and the counts are calculated in one of four ways:
1) (`poverlap = FALSE, norm = FALSE`): total read count from the sample peak if it overlaps the reduced peak by >= 1 bp,
2) (`poverlap = TRUE, norm = FALSE`): fractional read count adjusted by the percent overlap by which the sample peak overlaps the reduced peak,
3) (`poverlap = FALSE, norm = TRUE`): normalized (RPM) read count from the sample peak if it overlaps the reduced peak by >= 1 bp,
4) (`poverlap = TRUE, norm = TRUE`): normalized, fractional read count adjusted by the percent overlap by which the sample peak overlaps the reduced peak.

The **default** setting is to report the total, unnormalized read count to allow downstream tools to implement their own normalization procedures and which often expect integer counts for input.

## Count table *with* a reference peak set

For a run with a (reference peak set)[reference_peaks.md] the project processing pipeline will produce the counts table from all the samples reference peak coverage files. Because these files all share the same peaks, it simply aggregates each samples' counts into a single count table.

## Count table *with* a PEPATAC produced consensus peak set

To produce a count table using the project derived consensus peak set *requires* an iterative approach. After generating the initial consensus peak set for a project, you will need to use that as your reference peak set in your `PEP` (with the `frip_ref_peaks:` parameter) and run the sample processing pipeline again to produce peak counts for each of the samples. Because the pipeline *knows* what files have been produced already, it will only perform this step and skip the rest of the pipeline. Then, simply run the project level pipeline again and the count table will be derived from the consensus peak set! 

## Run the count table generation manually

The calculation of the consensus peak set occurs in `R` and uses the `PEPATACr` library included in the `PEPATAC` repository. Below is an example of how you could run this yourself in `R`, using the example project included in the repository. Because there's only a single sample in this case, it won't produce anything, but these commands illustrate how you could do this with your own project.

From the `PEPATAC` repository after you've run the test sample:
```
R
library(PEPATACr)
pep <- "examples/test_project/test_config.yaml"
prj <- pepr::Project(pep)
project_name <- config(prj)$name
output_dir   <- "pepatac_test/"
results_dir  <- "pepatac_test/results_pipeline/"
# Identify which chrom_sizes file to use
assets       <- createAssetsSummary(prj, output_dir, results_dir)
# Do not calculate the percentage overlap of reads in peaks
poverlap   <- FALSE
# Do not use normalized read counts
normalized <- FALSE
# Only keep peaks present in this minimum number of samples
cutoff     <- 2
# Create and write the count table to the output directory
counts_filepath <- peakCounts(prj, output_dir, results_dir, assets,
                              poverlap, normalized, cutoff)
# Load the count table into R
counts <- fread(counts_filepath[[1]])
```