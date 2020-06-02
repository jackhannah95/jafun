#' @title Calculate number of occurrences of a day of the week in a set time 
#' period
#' 
#' @description \code{n_day} takes a start date, an end date and a day of the 
#' week. It calculates the number of times said day of the week occurs within 
#' the given time period.
#' 
#' @details The \code{Date} and \code{POSIXt} classes within R treat Sunday as 
#' day 0 in a week, and Saturday as day 6. \code{n_day} also treats Sunday as 
#' day 0 (as opposed to day 7) for the sake of consistency.
#' 
#' @param start The beginning of the time period. Must be a date of \code{Date} 
#' or \code{POSIXt} class.
#' @param end The end of the time period. Must be a date of \code{Date} or 
#' \code{POSIXt} class.
#' @param day The day of the week, entered as a \code{numeric} between 0 
#' (Sunday) and 6 (Saturday). It won't accept literal string entries of the day 
#' of the week. See \code{\link{day_to_num}} for converting string entries into 
#' the required numeric format.
#' 
#' @examples
#' 
#' # Number of Tuesdays in January 2018
#' n_day(lubridate::dmy(01012018), lubridate::dmy(31012018), 2)
#' 
#' # Number of Thursdays in 2019
#' n_day(lubridate::dmy(01012019), lubridate::dmy(31122019), day_to_num("Thu"))
#' 
#' # Number of weekdays (Monday-Friday) in 2020
#' library(magrittr)
#' purrr::map_dbl(1:5, ~ n_day(lubridate::dmy(01012020), 
#'                             lubridate::dmy(31122020), 
#'                             .x)) %>% sum()
#' 
#' @seealso
#' \code{\link{days_of_week}} for returning a vector of the days of the week.
#' 
#' \code{\link{day_to_num}} for turning the output from 
#' \code{\link{days_of_week}} into numeric form for use within \code{n_day}.
#' 
#' @export
n_day <- function(start, end, day) {
  
  if (!inherits(start, c("Date", "POSIXt")) |
      !inherits(end, c("Date", "POSIXt"))) {
    stop("The start and end dates must have Date or POSIXt class")
  }
  
  # Note that Sunday is considered to be day 0; not day 7
  if (!day %in% 0:6) {
    stop(paste("The day of the week must be a number between 0 (Sunday) and 6",
               "(Saturday)"))
  }
  
  sum(format(seq(start, end, by = "day"), "%w") == day)
}
