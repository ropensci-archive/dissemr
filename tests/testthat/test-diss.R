context("diss")

test_that("diss works well - by doi", {
  skip_on_cran()

  aa <- diss("10.1016/j.paid.2009.02.013")

  expect_is(aa, "dissem")
  expect_named(aa, c("status", "paper"))
  expect_is(aa$status, "character")
  expect_is(aa$paper, "list")
  expect_named(aa$paper, c("classification", "title", "records",
                           "authors", "date", "type"))
  expect_is(aa$paper$authors, "data.frame")
})

test_that("diss works well - many dois", {
  skip_on_cran()

  aa <- diss(c("10.1016/j.paid.2009.02.013", "10.1186/s40687-015-0044-7"))

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

test_that("diss works well - by title/date/author", {
  skip_on_cran()

  aa <- diss(title = "Strange resonances measured in Al+Al collisions at sqrt",
             date = "2015", authors = list(plain = "Lopez, X."))

  expect_is(aa, "dissem")
  expect_named(aa, c("status", "paper"))
  expect_is(aa$status, "character")
  expect_is(aa$paper, "list")
  expect_named(aa$paper, c("date", "records", "authors", "title"))
  expect_is(aa$paper$authors, "data.frame")
})

test_that("diss fails well", {
  skip_on_cran()

  expect_error(diss(), "Bad Request")
  expect_error(diss(doi = 5), "doi must be of class character")
  expect_error(diss(doi = mtcars), "doi must be of class character")
  expect_error(diss(title = 5), "title must be of class character")
  expect_error(diss(date = 5), "date must be of class character, Date")
  expect_error(diss(authors = 5), "authors must be of class list")
})
