# Regression tests for #232:
# plotAnno()'s empty-input fallback was constructing a placeholder path
# with file.path(output, ...), treating `output` (a .pdf target file) as
# a directory, then calling system2("touch", out_file) and quit(). The
# touch silently failed because the parent ".pdf" was not a real directory,
# and quit() killed the R session before the caller could write the real
# plot. Fix returns ggplot() so the caller's pdf()/png() chain writes a
# valid blank placeholder at the expected target path.

test_that("plotAnno returns a ggplot for a missing input file (no quit, no spurious touch)", {
    # Pick a path that definitely doesn't exist on disk and isn't the
    # name of any object in the test environment (so exists() returns
    # FALSE and we land in the file-info branch).
    missing_input <- file.path(tempdir(),
                               "definitely_not_a_real_path_zzz9876.bed")
    stopifnot(!file.exists(missing_input))
    stopifnot(!exists(missing_input))

    # A fake "output" file path. The pre-fix code would try to touch a
    # bogus path INSIDE this (file.path(output, ...)) — assert that path
    # is NOT created.
    output_pdf <- tempfile(fileext = ".pdf")
    bogus_touch_target <- file.path(
        output_pdf,
        paste0(basename(tools::file_path_sans_ext(missing_input)),
               "_peaks_partition_dist.pdf")
    )

    result <- plotAnno(plot   = "chromosome",
                       input  = missing_input,
                       type   = "np",
                       feat   = "/this/is/not/read/in/empty/branch.bed",
                       genome = "hg38",
                       output = output_pdf)

    # Returns a ggplot object (caller will wrap it with pdf()/dev.off())
    expect_s3_class(result, "ggplot")

    # No spurious file gets touched inside `output_pdf`-as-directory
    expect_false(file.exists(bogus_touch_target))
    # And no orphan directory was created where output_pdf was supposed
    # to be the eventual file
    expect_false(dir.exists(output_pdf))
})

test_that("plotAnno returns a ggplot for an empty input file", {
    # File exists but has size 0 — exercises the `info$size != 0` branch.
    empty_input <- tempfile(fileext = ".bed")
    file.create(empty_input)
    on.exit(unlink(empty_input), add = TRUE)
    stopifnot(file.exists(empty_input))
    stopifnot(file.info(empty_input)$size == 0)

    output_pdf <- tempfile(fileext = ".pdf")

    result <- plotAnno(plot   = "tss",
                       input  = empty_input,
                       type   = "bed",
                       feat   = "/not/read.bed",
                       genome = "hg38",
                       output = output_pdf)

    expect_s3_class(result, "ggplot")
    expect_false(dir.exists(output_pdf))
})

test_that("plotAnno's empty-input ggplot wraps cleanly with pdf()/print()/dev.off()", {
    # This mirrors what tools/PEPATAC.R does after calling plotAnno:
    # the caller drives pdf()/png() around the return value. Verify the
    # full sequence produces a non-empty file at the expected target.
    missing_input <- file.path(tempdir(),
                               "another_missing_input_xyz.bed")
    stopifnot(!file.exists(missing_input))
    out_pdf <- tempfile(fileext = ".pdf")
    on.exit(unlink(out_pdf), add = TRUE)

    p <- plotAnno(plot   = "genomic",
                  input  = missing_input,
                  type   = "np",
                  feat   = "/not/read.bed",
                  output = out_pdf)

    pdf(file = out_pdf, width = 7, height = 7)
    suppressMessages(suppressWarnings(print(p)))
    invisible(dev.off())

    expect_true(file.exists(out_pdf))
    expect_gt(file.info(out_pdf)$size, 0)
})
