#' dissem.in search
#'
#' @export
#' @param query (character) query terms. required
#' @param ... curl options passed on to [crul::HttpClient()]
#' @examples \dontrun{
#' diss_search(query = "cellular biology")
#' }
diss_search <- function(query, ...) {
  assert(query, "character")
  res <- diss_GET("search", list(q = query), FALSE)
  res$papers <- lapply(res$papers, function(z) {
    structure(jsonlite::fromJSON(jsonlite::toJSON(z, auto_unbox=TRUE)), class = "dissem_single")
  })
  res$stats <- lapply(res$stats, function(z) jsonlite::fromJSON(jsonlite::toJSON(z, auto_unbox=TRUE)))
  structure(res, class = "dissem_search")
}

#' @export
print.dissem_search <- function(x, ...) {
  cat("<dissemin records>", sep = "\n")
  cat(paste0("  Papers found: ", stract(x$nb_results, "[0-9]+")), sep = "\n")
  cat(paste0("  Papers returned: ", length(x$papers)), sep = "\n")
  cat("  (see `x$papers` for results)", sep = "\n")
  cat("  Stats: ", sep = "\n")
  print(x$stats$detailed)
}

#' @export
print.dissem_single <- function(x, ...) {
  cat("<dissemin record>", sep = "\n")
  cat(paste0("  No. records: ", NROW(x$records)), sep = "\n")
  cat(paste0("  Title: ", x$title), sep = "\n")
  cat(paste0("  Type: ", x$type), sep = "\n")
}
