#' @title Calculate the proportion of missing values in each column of a data 
#' frame
#' 
#' @description \code{prop_missing} takes a \code{data.frame} and calculates the
#' proportion of NA values within each column. 
#' 
#' @return A \code{\link[tibble]{tibble}} with two columns: one (named 
#' `variable`) containing the column names of the input \code{data.frame}, and 
#' the other (named `prop_missing`) containing the proportion of missing values 
#' within the corresponding column in the input \code{data.frame}.
#' 
#' @param df A \code{data.frame} or an extension of \code{data.frame} such as
#' a \code{\link[tibble]{tibble}}.
#' 
#' @examples
#' prop_missing(airquality)
#' 
#' @export
prop_missing <- function(df) {
  
  if (!inherits(df, "data.frame")) {
    stop("The input must be a data frame")
  }
  
  df %>%
    purrr::map_dfr(~naniar::prop_miss(.x)) %>%
    tidyr::pivot_longer(dplyr::everything(),
                        names_to = "variable",
                        values_to = "prop_missing") %>%
    dplyr::arrange(dplyr::desc(.data$prop_missing), .data$variable)
}
