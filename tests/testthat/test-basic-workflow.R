context("test-basic-workflow")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

data("XenaData", package = "UCSCXenaTools")
head(XenaData)

test_that("Load XenaData works", {
  expect_is(XenaData, "data.frame")
})

xe <- XenaGenerate(subset = XenaHostNames == "tcgaHub")

test_that("XenaGenerate works", {
  expect_is(xe, "XenaHub")
})

xe2 <- XenaFilter(xe, filterDatasets = "clinical")
xe2 <- XenaFilter(xe2, filterDatasets = "LUAD|LUSC|LUNG")

test_that("XenaFilter works", {
  expect_is(xe2, "XenaHub")
})

xe2_query <- XenaQuery(xe2)

test_that("XenaQuery works", {
  expect_is(xe2_query, "data.frame")
})

xe2_download <- XenaDownload(xe2_query, download_probeMap = TRUE)

dt <- XenaPrepare(xe2_download)

getTCGAdata(c("UVM", "LUAD"))

availTCGA()

showTCGA()

downloadTCGA(
  project = "UVM",
  data_type = "Phenotype",
  file_type = "Clinical Information"
)

# clean all
rm(list = ls())
