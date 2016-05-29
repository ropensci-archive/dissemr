#' dissem.in query
#'
#' @export
#' @param doi (character) one or more doi's
#' @param title (character) title, a work title
#' @param date (character) date, a ISO date
#' @param authors (character) authors
#' @param ... curl options passed on to \code{\link[httr]{GET}}
#' or \code{\link[httr]{POST}}
#' @examples \dontrun{
#' diss("10.1016/j.paid.2009.02.013")
#' diss("10.1186/s40687-015-0044-7")
#' diss(c("10.1016/j.paid.2009.02.013", "10.1186/s40687-015-0044-7"))
#'
#' diss(title = "Strange resonances measured in Al+Al collisions at sqrt",
#'    date = "2015", authors = list(plain = "Lopez, X."))
#'
#' diss("10.1007/s002200050490")
#' }
diss <- function(doi = NULL, title = NULL, date = NULL, authors = NULL, ...) {
  # if (length(doi) == 1) {
  #   diss_GET(doi, body = NULL, ...)
  # } else {
  if (length(doi) > 1) {
    lapply(doi, function(z) {
      structure(diss_POST(path = "query", body = list(doi = z), ...), class = "dissem")
    })
  } else {
    structure(
      diss_POST("query", body = cp(list(doi = doi, title = title, authors = list(authors), date = date)), ...),
      class = "dissem"
    )
  }
  # }
}

#' @export
print.dissem <- function(x, ...) {
  cat("<dissemin record>", sep = "\n")
  cat(paste0("  No. records: ", NROW(x$paper$records)), sep = "\n")
  cat(paste0("  Title: ", x$paper$title), sep = "\n")
  cat(paste0("  Type: ", x$paper$type), sep = "\n")
}
