test_that("sampleName extracts name from path", {
  result <- sampleName("/path/to/sample_R1.fastq.gz")
  expect_type(result, "character")
  expect_true(nchar(result) > 0)
})

test_that("splitDataTable splits by column", {
  dt <- data.table::data.table(
    name = c("a", "b", "c"), group = c("x", "x", "y"), val = 1:3
  )
  result <- splitDataTable(dt, "group")
  expect_type(result, "list")
  expect_equal(length(result), 2)
})

test_that("roundUpNice rounds to nice numbers", {
  expect_equal(roundUpNice(13), 20)
  expect_equal(roundUpNice(0.7), 0.7)
})

test_that("is.empty detects empty data.frames", {
  is.empty <- PEPATACr:::is.empty
  expect_true(is.empty(NULL))
  expect_true(is.empty(data.frame()))
  expect_false(is.empty(data.frame(x = 1)))
})

test_that("getAbbr returns correct abbreviations", {
  getAbbr <- PEPATACr:::getAbbr
  expect_equal(getAbbr(1500), "K")
  expect_equal(getAbbr(2000000), "M")
})

test_that("getFactor returns correct divisors", {
  getFactor <- PEPATACr:::getFactor
  expect_equal(getFactor(1500), 1000)
  expect_equal(getFactor(2000000), 1000000)
})
