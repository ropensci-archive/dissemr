context("diss_dois")

test_that("diss_dois works well - by doi", {
  skip_on_cran()

  aa <- diss_dois("10.1016/j.paid.2009.02.013")

  expect_is(aa, "list")
  expect_is(aa[[1]], "dissem")
  expect_named(aa[[1]], c("status", "paper"))
  expect_is(aa[[1]]$status, "character")
  expect_is(aa[[1]]$paper, "list")
  expect_is(aa[[1]]$paper$authors, "data.frame")
})

test_that("diss_dois works well - many dois", {
  skip_on_cran()

  aa <- diss_dois(c("10.1016/j.paid.2009.02.013", "10.1186/s40687-015-0044-7"))

  expect_is(aa, "list")
  expect_is(aa[[1]], "dissem")
  expect_is(aa[[2]], "dissem")
  expect_named(aa[[2]], c("status", "paper"))
  expect_is(aa[[2]]$status, "character")
  expect_is(aa[[2]]$paper, "list")
  expect_named(aa[[2]]$paper, c("classification", "title", "pdf_url", "records",
                           "authors", "date", "type"))
  expect_is(aa[[2]]$paper$authors, "data.frame")
})

test_that("diss_dois fails well", {
  skip_on_cran()

  expect_error(diss_dois(), "argument \"doi\" is missing")
  expect_error(diss_dois(doi = 5), "doi must be of class character")
  expect_error(diss_dois(doi = mtcars), "doi must be of class character")
})
