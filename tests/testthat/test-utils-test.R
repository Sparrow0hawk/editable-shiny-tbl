source("R/utils.R")

test_that("file extension extraction works - filename", {
  expect_equal(extract_ext("test.csv"),"csv")
})

test_that("file extension extraction works - file with path", {
  expect_equal(extract_ext("foo/bar/test.xlsx"),"xlsx")
})

test_that("file extension extraction works - file with multiple periods", {
  expect_equal(extract_ext("magic/foo.bar/test.xlsx"),"xlsx")
})