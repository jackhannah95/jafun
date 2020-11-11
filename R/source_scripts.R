#' @title Source all R scripts in a directory
#' 
#' @description \code{source_scripts} sources all R scripts within a given 
#' directory in a single function call.
#' 
#' @param filepath A character string denoting a filepath. Defaults to the
#' working directory, \code{getwd()}. \code{source_scripts} errors if supplied 
#' with an invalid directory name or with a directory containing no R scripts.
#'  
#' @examples 
#' \dontrun{
#' source_scripts()
#' }
#' 
#' @seealso \code{\link[base]{source}} for sourcing a single R script.
#' 
#' @export

source_scripts <- function(filepath = getwd()){
  
  if (!dir.exists(filepath)) {
    stop("A valid filepath must be supplied")
  }
  
  if (length(list.files(filepath, pattern = "\\.R$")) == 0) {
    stop("There are no R scripts in the supplied directory")
  }
  
  purrr::walk(list.files(filepath,
                         pattern = "\\.R$",
                         full.names = TRUE),
              ~source(.x))
  
}

