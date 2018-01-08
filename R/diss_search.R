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

  diss_GET("search", list(q = query), ...)
}

# print.dissem <- function(x, ...) {
#   cat("<dissemin record>", sep = "\n")
#   cat(paste0("  No. records: ", NROW(x$paper$records)), sep = "\n")
#   cat(paste0("  Title: ", x$paper$title), sep = "\n")
#   cat(paste0("  Type: ", x$paper$type), sep = "\n")
# }
