# Generate consensus peaks

When a `PEP` project contains more than one sample, the `PEPATAC` project processing pipeline can produce a consensus peak set. You can run the project level pipeline with `looper` using the `runp` command.

For example: `looper runp examples/test_project/test_config.yaml`

For the consensus peak generation, the pipeline performs the following steps:
1. Overlapping peaks are identified among all the project samples. 
2. For each set of overlapping peaks, the consensus peak's coordinates are defined as the coordinates of the peak with the maximum score among the set of overlapping peaks. 
3. Any peaks that extend beyond chromosomes are trimmed.
4. Finally, peaks present in >= 2 samples (`min_samples` parameter) with scores >= 5 (`min_score` parameter) are retained.

## Run the consensus peak generation manually

The calculation of the consensus peak set occurs in `R` and uses the `PEPATACr` library included in the `PEPATAC` repository. Below is an example of how you could run this yourself in `R`, using the example project included in the repository. Because there's only a single sample in this case, it won't produce anything, but these commands illustrate how you could do this with your own project.

From the `PEPATAC` repository after you've run the test sample:
```
R
library(PEPATACr)
pep <- "examples/test_project/test_config.yaml"
# Load the project metadata
prj <- pepr::Project(pep)
project_name  <- config(prj)$name
output_dir    <- "pepatac_test/"
results_dir   <- "pepatac_test/results_pipeline/"
# Identify which chrom_sizes file to use
assets        <- createAssetsSummary(prj, output_dir, results_dir)
# Generate consensus peaks and write to project output directory
peak_filepath <- consensusPeaks(prj, output_dir, results_dir, assets)
# Load the peak file into R
peaks         <- fread(peak_filepath[[1]])
```
