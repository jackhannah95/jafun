#' @title Convert the days of the week to numeric
#' 
#' @param x A character string containing days of the week in full (e.g. 
#' "Friday") or abbreviated (e.g. "Fri") form.
#' 
#' @export
day_to_num <- function(x) {
  
  if(any(!x %in% c(days_of_week(), days_of_week(abbr = TRUE)))) {
    warning(paste("Entries which do not correspond to a day of the week will", 
                  "return an NA"))
  }
  
  x <- dplyr::if_else(x %in% c(days_of_week(), days_of_week(abbr = TRUE)),
                      substr(x, 1, 3),
                      NA_character_)
  
  x <- tibble::enframe(x, name = NULL, value = "day")
  
  y <- tibble::tibble(num = c(1:6, 0),
                      day = days_of_week(abbr = TRUE))
  
  x %>%
    dplyr::left_join(y, by = "day") %>%
    dplyr::pull(.data$num)
  
}
