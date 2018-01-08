context("diss_search")

test_that("diss_search works well", {
  skip_on_cran()

  aa <- diss_search(query = "cellular biology")

  expect_is(aa, "dissem_search")
  expect_named(aa, c("stats", "messages", "nb_results", "papers"))
  expect_is(aa$stats, "list")
  expect_named(aa$stats, c("detailed", "aggregated"))
  expect_is(aa$papers, "list")
  expect_is(aa$papers[[1]], "dissem_single")
  expect_is(aa$papers[[1]]$authors, "data.frame")
})

test_that("diss_search fails well", {
  skip_on_cran()

  expect_error(diss_search(), "argument \"query\" is missing")
  expect_error(diss_search(query = 5), "query must be of class character")
  expect_error(diss_search(query = mtcars), "query must be of class character")
})
