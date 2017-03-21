cp <- function(x) Filter(Negate(is.null), x)

diss_base <- function() "http://dissem.in"

diss_GET <- function(path = "", args = list(), ...) {
  cli <- crul::HttpClient$new(url = diss_base())
  x <- cli$get(path = file.path("api", path), query = args, ...)
  x$raise_for_status()
  jsonlite::fromJSON(x$parse("UTF-8"))
}

diss_POST <- function(path = "", body, ...) {
  cli <- crul::HttpClient$new(url = diss_base())
  x <- cli$post(path = file.path("api", path), body = body,
                encode = "json", ...)
  x$raise_for_status()
  jsonlite::fromJSON(x$parse("UTF-8"))
}
