#' @title Calculate the proportion of missing values in each column
#' 
#' @param df The dataframe.
#' 
#' @export
prop_missing <- function(df) {
  
  df %>%
    purrr::map_dfr(~naniar::prop_miss(.x)) %>%
    tidyr::pivot_longer(dplyr::everything(),
                        names_to = "variable",
                        values_to = "prop_missing") %>%
    dplyr::mutate(prop_missing = scales::percent(.data$prop_missing))
  
}
