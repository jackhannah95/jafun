#' @title Convert the days of the week to numeric
#' 
#' @description \code{day_to_num} converts the days of the week from 
#' \code{character} format into numeric format for use in \code{\link{n_day}}.
#' 
#' @details The \code{Date} and \code{POSIXt} classes within R treat Sunday as 
#' day 0 in a week, and Saturday as day 6. \code{day_to_num} also treats Sunday 
#' as day 0 (as opposed to day 7) for the sake of consistency.
#' 
#' @param x A character string containing days of the week in full (e.g. 
#' "Friday") or abbreviated (e.g. "Fri") form.
#' @param ignore_case Logical. If TRUE, the case of \code{x} is ignored. If 
#' FALSE, the case of \code{x} is preserved. If FALSE, days must be provided in 
#' full (e.g. "Friday") or three-character abbreviated (e.g. "Fri") form with 
#' only the first letter capitalised to be recognised as valid days of the week. 
#' Defaults to TRUE.
#' 
#' @examples
#' day_to_num(c("Monday", "Tuesday", "Wed"))
#' day_to_num(days_of_week())
#' day_to_num(weekdays(lubridate::dmy(01012020)))
#' 
#' @seealso
#' \code{\link{days_of_week}} for returning a vector of the days of the week.
#' 
#' \code{\link[base]{weekdays}} for converting a date into the day of the week.
#' 
#' \code{\link{n_day}} for calculating the number of occurrences of a day of 
#' the week in a set time period.
#' 
#' @export
day_to_num <- function(x, ignore_case = TRUE) {
  
  if (isTRUE(ignore_case)) {
    x %<>%
      janitor::make_clean_names("sentence") %>%
      gsub(" ", "", .)
  }
  
  if(any(!x %in% c(jafun::days_of_week(), jafun::days_of_week(abbr = TRUE)))) {
    warning("Entries which do not correspond to a day of the week will return ", 
            "an NA")
  }
  
  x <- ifelse(x %in% c(jafun::days_of_week(), jafun::days_of_week(abbr = TRUE)),
              substr(x, 1, 3),
              NA_character_)
  
  x <- tibble::enframe(x, name = NULL, value = "day")
  
  y <- tibble::tibble(num = c(1:6, 0),
                      day = jafun::days_of_week(abbr = TRUE))
  
  x %>%
    dplyr::left_join(y, by = "day") %>%
    dplyr::pull(.data$num)
  
}
