test_that("yamlToDT handles scalar-only YAML without warnings", {
  yaml <- make_scalar_only_yaml()
  expect_no_warning(
    dt <- yamlToDT("sample1", yaml)
  )
  expect_s3_class(dt, "data.table")
  expect_equal(nrow(dt), 1)
  expect_equal(dt$sample_name, "sample1")
  expect_equal(dt$Raw_reads, 25000)
})

test_that("yamlToDT produces no recycling warning with object-type fields", {
  # THIS IS THE BUG TEST -- currently fails with:
  # "Item N has 3 rows but longest item has 4; recycled with remainder."
  yaml <- make_bug_trigger_yaml()
  expect_no_warning(
    dt <- yamlToDT("sample1", yaml)
  )
  expect_s3_class(dt, "data.table")
  expect_equal(nrow(dt), 1)
})

test_that("yamlToDT excludes ALL object-type columns", {
  yaml <- make_bug_trigger_yaml()
  dt <- suppressWarnings(yamlToDT("sample1", yaml))
  # None of these object-type fields should appear as columns
  object_fields <- c("Fragment distribution", "Library complexity",
                     "TSS enrichment", "Motif analysis",
                     "Peak chromosome distribution", "Peak partition distribution",
                     "cFRiF", "FRiF", "FastQC report r1", "FastQC report r2",
                     "TSS distance distribution", "meta")
  for (field in object_fields) {
    expect_false(field %in% names(dt),
      info = paste0("Object field '", field, "' should not be in output"))
  }
})

test_that("yamlToDT preserves all scalar fields", {
  yaml <- make_bug_trigger_yaml()
  dt <- suppressWarnings(yamlToDT("sample1", yaml))
  expect_true("Raw_reads" %in% names(dt))
  expect_true("Aligned_reads" %in% names(dt))
  expect_true("Alignment_rate" %in% names(dt))
  expect_true("Peak_count" %in% names(dt))
  expect_true("FRiP" %in% names(dt))
  expect_true("Genome" %in% names(dt))
})

test_that("yamlToDT returns exactly one row per sample", {
  yaml <- make_bug_trigger_yaml()
  dt <- suppressWarnings(yamlToDT("sample1", yaml))
  # The old code used unique() to collapse recycled rows.
  # The fix should produce exactly 1 row without needing unique().
  expect_equal(nrow(dt), 1)
})

test_that("yamlToDT returns NULL for missing sample", {
  yaml <- make_scalar_only_yaml()
  result <- suppressWarnings(tryCatch(
    yamlToDT("nonexistent_sample", yaml),
    error = function(e) NULL
  ))
  expect_null(result)
})

test_that("yamlToDT handles sample with only meta (no scalar results)", {
  yaml <- list(PEPATAC = list(sample = list(
    empty_sample = list(
      meta = list(pipestat_modified_time = "2026-02-13")
    )
  )))
  result <- suppressWarnings(tryCatch(
    yamlToDT("empty_sample", yaml),
    error = function(e) NULL
  ))
  # Should return NULL or empty since no scalar data exists after removing meta
  expect_true(is.null(result) || nrow(result) == 0)
})
