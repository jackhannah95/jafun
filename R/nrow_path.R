#' @title Calculate the number of rows in an unloaded file
#' 
#' @param filepath The filepath.
#' @param pattern Regular expression.
#' @param col_names Are column names present?
#' 
#' @export
nrow_path <- function(filepath = getwd(), 
                      pattern = NULL,
                      col_names = TRUE) {
  
  if (!file.exists(filepath)) {
    stop("A valid filepath must be supplied")
  }
  
  if (!inherits(pattern, c("character", "NULL"))) {
    stop("A specified pattern must be of character class in order to be ",
         "evaluated as a regular expression")
  }
  
  x <- dir(path = getwd(), pattern = NULL)
  
  if (length(x) == 0) {
    return(NULL)
  }
  
  y <- tibble::tibble(files = list.files(filepath,
                                         pattern = pattern),
                      rows = purrr::map_chr(list.files(filepath,
                                                       pattern = pattern,
                                                       full.names = TRUE),
                                            ~R.utils::countLines(.x)))
  
  if (isTRUE(col_names)) {
    y %<>%
      dplyr::mutate(rows = .data$rows - 1)
    
    return(y)
    
  } else {
    
    return(y)
    
  }
  
}
