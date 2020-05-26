#' @title The days of the week
#' 
#' @param abbr Logical. If FALSE, returns the days of the week in full form 
#' (e.g. "Friday"). If TRUE, it returns days in abbreviated form (e.g. "Fri"). 
#' The default value is FALSE.
#' 
#' @export
days_of_week <- function(abbr = FALSE) {
  
  if (isFALSE(abbr)) {
    return(weekdays(as.Date(seq(7), origin = "1950-01-01")))
    
  } else {
    
    return(weekdays(as.Date(seq(7), origin = "1950-01-01"), abbreviate = TRUE))
  }
}
