cp <- function(x) Filter(Negate(is.null), x)

diss_base <- function() "https://dissem.in"

diss_GET <- function(path = "", args = list(), parse = TRUE, ...) {
  cli <- crul::HttpClient$new(url = diss_base())
  x <- cli$get(path = file.path("api", path), query = args, ...)
  x$raise_for_status()
  jsonlite::fromJSON(x$parse("UTF-8"), parse)
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

stract <- function(str, pattern) regmatches(str, regexpr(pattern, str))
