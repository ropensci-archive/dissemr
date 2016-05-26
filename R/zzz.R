cp <- function(x) Filter(Negate(is.null), x)

diss_base <- function() "http://beta.dissem.in/api"

diss_GET <- function(path = "", args = list(), ...) {
  x <- httr::GET(file.path(diss_base(), path), query = args, ...)
  httr::stop_for_status(x)
  jsonlite::fromJSON(httr::content(x, "text", "UTF-8"))
}

diss_POST <- function(path = "", body, ...) {
  x <- httr::POST(file.path(diss_base(), path), body = body, encode = "json", ...)
  httr::stop_for_status(x)
  jsonlite::fromJSON(httr::content(x, "text", "UTF-8"))
}
