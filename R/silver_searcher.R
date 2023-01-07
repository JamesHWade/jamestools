#' Search for a pattern in a project using `ag`
#'
#' `ag` - The Silver Searcher is a great tool for searching within files.
#'
#' @param search The pattern to search for
#' @param filetype The type of file to search in. One of "R", "python", or
#'   "markdown".
#' @return Search results returned by `ag` system call
#' @export
#' @examples
#' ag("my_pattern")
#' ag("my_pattern", filetype = "python")
ag <- function(search, filetype = "R") {
  if ("windows" %in% tolower(Sys.info()[["sysname"]])) {
    cli::cli_abort("Not performing search because on Windows.")
  }
  cli::cli_inform("Starting search...")
  flags <- switch(filetype,
    "R" = "--r",
    "python" = "--python",
    "markdown" = "--md"
  )
  system(glue("ag {flags} {search}"), wait = FALSE)
}
