#' @title Remove all SPSS-related information from data frame
#' 
#' @description \code{.sav} or \code{.zsav} files can be loaded into R using 
#' \code{\link[haven:read_sav]{haven::read_sav}. This preserves SPSS-related 
#' information such as labels and attributes, which can be removed individually 
#' using 
#' \href{https://haven.tidyverse.org/reference/index.html#remove-attributes}{haven's \code{zap_*} functions}.
#' \code{zap_everything} combines the majority of these functions into a single
#' step.
#' 
#' @details \code{zap_everything} combines the following \code{haven::zap_*} 
#' functions:
#' 
#' \itemize{
#' \item \code{\link[haven]{zap_label}} - to remove variable labels;
#' \item \code{\link[haven]{zap_labels}} - to remove value labels;
#' \item \code{\link[haven]{zap_formats}} - to remove format attributes;
#' \item \code{\link[haven]{zap_widths}} - to remove display width attributes;
#' \item \code{\link[haven]{zap_empty}} - to convert empty strings within 
#' \code{character} columns into missing values.
#' }
#' 
#' @param df A \code{data.frame}.
#' 
#' @examples
#' x <- haven::read_sav(system.file("examples", "iris.sav", package = "haven"))
#' zap_everything(x)
#' 
#' @export
zap_everything <- function(df) {
  
  df %>%
    haven::zap_label() %>%
    haven::zap_labels() %>%
    haven::zap_formats() %>%
    haven::zap_widths() %>%
    dplyr::mutate(
      dplyr::across(
        tidyselect::vars_select_helpers$where(
          is.character,
          haven::zap_empty
        )
      )
    )
}

