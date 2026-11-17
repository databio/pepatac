# Regression tests for #218 / #219:
# peakCounts() was ignoring *_ref_peaks_coverage.bed files when an older
# run had left *_peaks_coverage.bed.gz around. The single shared `ext`
# variable preferred .bed.gz, then looked for *_ref_peaks_coverage.bed.gz
# (which doesn't exist), and fell through to the "not derived from a
# singular reference peak set" warning path.
#
# The fix detects extensions independently for the ref vs. fallback peak
# coverage files via .detectPeakCoverageExt(). These tests exercise the
# helper directly because reconstructing the full peakCounts() pipeline
# in a unit test would require valid peak data and chrom sizes.

detect <- PEPATACr:::.detectPeakCoverageExt

# Helper: build the expected peak_calling directory tree under a tempdir
# and create one or more named coverage files in it.
make_results_subdir <- function(sample_names, genomes, files_per_sample) {
    root <- tempfile("results_")
    dir.create(root)
    for (i in seq_along(sample_names)) {
        pc_dir <- file.path(root, sample_names[i],
                            paste0("peak_calling_", genomes[i]))
        dir.create(pc_dir, recursive = TRUE)
        for (fname in files_per_sample) {
            file.create(file.path(pc_dir, paste0(sample_names[i], fname)))
        }
    }
    root
}

test_that(".detectPeakCoverageExt picks .bed.gz when a gz coverage file exists", {
    root <- make_results_subdir(
        sample_names    = c("s1", "s2"),
        genomes         = c("hg38", "hg38"),
        files_per_sample = c("_peaks_coverage.bed.gz")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)
    expect_equal(
        detect("_peaks_coverage", root, c("s1", "s2"), c("hg38", "hg38")),
        ".bed.gz"
    )
})

test_that(".detectPeakCoverageExt picks .bed when only uncompressed files exist", {
    root <- make_results_subdir(
        sample_names    = c("s1"),
        genomes         = c("hg38"),
        files_per_sample = c("_peaks_coverage.bed")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)
    expect_equal(
        detect("_peaks_coverage", root, "s1", "hg38"),
        ".bed"
    )
})

test_that(".detectPeakCoverageExt returns NA when no matching file exists", {
    root <- make_results_subdir(
        sample_names     = c("s1"),
        genomes          = c("hg38"),
        files_per_sample = c("_peaks_coverage.bed")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)
    # Looking for _ref_peaks_coverage but only _peaks_coverage exists
    expect_true(is.na(
        detect("_ref_peaks_coverage", root, "s1", "hg38")
    ))
})

test_that("ref and fallback extensions are detected independently in mixed state (#218/#219)", {
    # The exact failure mode from the bug report:
    # - first sample-pipeline run left _peaks_coverage.bed.gz
    # - second run with --frip-ref-peaks produced uncompressed _ref_peaks_coverage.bed
    # Old code shared a single `ext` derived from the first match, so it
    # preferred .bed.gz and never found the uncompressed ref file.
    root <- make_results_subdir(
        sample_names     = c("s1", "s2"),
        genomes          = c("hg38", "hg38"),
        files_per_sample = c("_peaks_coverage.bed.gz",
                             "_ref_peaks_coverage.bed")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)

    ref_ext      <- detect("_ref_peaks_coverage", root,
                           c("s1", "s2"), c("hg38", "hg38"))
    fallback_ext <- detect("_peaks_coverage", root,
                           c("s1", "s2"), c("hg38", "hg38"))

    # The whole point: ref takes uncompressed, fallback keeps gz
    expect_equal(ref_ext, ".bed")
    expect_equal(fallback_ext, ".bed.gz")
})

test_that("ref and fallback are detected independently in inverse mixed state", {
    # Inverse: uncompressed regular + gzipped ref
    root <- make_results_subdir(
        sample_names     = c("s1", "s2"),
        genomes          = c("hg38", "hg38"),
        files_per_sample = c("_peaks_coverage.bed",
                             "_ref_peaks_coverage.bed.gz")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)

    expect_equal(detect("_ref_peaks_coverage", root,
                        c("s1", "s2"), c("hg38", "hg38")),
                 ".bed.gz")
    expect_equal(detect("_peaks_coverage", root,
                        c("s1", "s2"), c("hg38", "hg38")),
                 ".bed")
})

test_that(".detectPeakCoverageExt handles multi-genome sample tables", {
    # peakCounts can be called with samples spanning multiple genomes;
    # confirm the helper accepts parallel sample_names / genomes vectors
    # and finds a file in any sample's peak_calling dir.
    root <- make_results_subdir(
        sample_names     = c("h1", "m1"),
        genomes          = c("hg38", "mm10"),
        files_per_sample = c("_ref_peaks_coverage.bed.gz")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)
    expect_equal(
        detect("_ref_peaks_coverage", root,
               c("h1", "m1"), c("hg38", "mm10")),
        ".bed.gz"
    )
})

test_that(".detectPeakCoverageExt prefers .bed.gz when both compressed and uncompressed exist for the same suffix", {
    # If both .bed.gz and .bed exist (unusual but possible after partial
    # cleanup), the search order is .bed.gz first.
    root <- make_results_subdir(
        sample_names     = c("s1"),
        genomes          = c("hg38"),
        files_per_sample = c("_ref_peaks_coverage.bed",
                             "_ref_peaks_coverage.bed.gz")
    )
    on.exit(unlink(root, recursive = TRUE), add = TRUE)
    expect_equal(
        detect("_ref_peaks_coverage", root, "s1", "hg38"),
        ".bed.gz"
    )
})
