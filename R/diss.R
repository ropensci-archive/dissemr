#' dissem.in fetch data by DOIs
#'
#' @export
#' @param doi (character) one or more DOI's. If you pass more than one DOI,
#' we do a separate request for each DOI. required.
#' @param ... curl options passed on to [crul::HttpClient()]
#' @examples \dontrun{
#' diss_dois("10.1016/j.paid.2009.02.013")
#' diss_dois("10.1186/s40687-015-0044-7")
#' res <- diss_dois(c("10.1016/j.paid.2009.02.013", "10.1186/s40687-015-0044-7"))
#' res
#' res[[1]]
#' res[[2]]
#' res[[2]]$paper
#' res[[2]]$paper$records
#' }
diss_dois <- function(doi, ...) {
  assert(doi, "character")
  if (length(doi) == 1) doi <- list(doi)
  lapply(doi, function(z) structure(diss_GET(z, ...), class = "dissem"))
}

#' @export
print.dissem <- function(x, ...) {
  cat("<dissemin record>", sep = "\n")
  cat(paste0("  No. records: ", NROW(x$paper$records)), sep = "\n")
  cat(paste0("  Title: ", x$paper$title), sep = "\n")
  cat(paste0("  Type: ", x$paper$type), sep = "\n")
}
