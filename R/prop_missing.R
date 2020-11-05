#' @title Calculate the proportion of missing values in each column
#' 
#' @param df The dataframe.
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
