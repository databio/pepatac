test_that("rbindlist of yamlToDT across samples produces correct table", {
  yaml <- make_multi_sample_yaml()
  sample_names <- names(yaml$PEPATAC$sample)
  stats <- data.table::rbindlist(
    lapply(sample_names, FUN = yamlToDT, yaml_file = yaml),
    fill = TRUE
  )
  expect_s3_class(stats, "data.table")
  expect_equal(nrow(stats), 3)
  expect_true(all(c("sample1", "sample2", "sample3") %in% stats$sample_name))
  # sample3 is missing Peak_count -- should be NA (filled by rbindlist)
  expect_true(is.na(stats[sample_name == "sample3"]$Peak_count))
})

test_that("rbindlist with no recycling warnings across heterogeneous samples", {
  yaml <- make_multi_sample_yaml()
  sample_names <- names(yaml$PEPATAC$sample)
  expect_no_warning(
    stats <- data.table::rbindlist(
      lapply(sample_names, FUN = yamlToDT, yaml_file = yaml),
      fill = TRUE
    )
  )
})
