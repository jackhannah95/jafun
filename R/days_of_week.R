#' @title The days of the week
#' 
#' @description \code{days_of_week} returns a vector of the days of the week in 
#' full (e.g. "Friday") or abbreviated (e.g. "Fri") form. It exists because I'm 
#' lazy and don't like typing them all out.
#' 
#' @details The \code{Date} and \code{POSIXt} classes within R treat Sunday as 
#' day 0 in a week, and Saturday as day 6. As a vector cannot have an element 
#' at position zero, \code{days_of_week} returns Sunday as its seventh element. 
#' The positions of the rest of the days within \code{days_of_week} are 
#' consistent with the order of the days of the week within the \code{Date} and 
#' \code{POSIXt} classes.
#' 
#' @param abbr Logical. If FALSE, returns the days of the week in full form 
#' (e.g. "Friday"). If TRUE, it returns days in abbreviated form (e.g. "Fri"). 
#' The default value is FALSE.
#' 
#' @examples
#' days_of_week()
#' days_of_week(abbr = TRUE)[3]
#' 
#' @seealso 
#' \code{\link{day_to_num}} for converting the output of \code{days_of_week} 
#' into numeric values.
#' 
#' \code{\link{n_day}} for calculating the number of occurrences of a day of 
#' the week in a set time period.
#' 
#' @export
days_of_week <- function(abbr = FALSE) {
  
  days <- weekdays(as.Date(seq(7), origin = "1950-01-01"))
  
  if (isFALSE(abbr)) {
    return(days)
    
  } else {
    
    return(substr(days, 1, 3))
  }
}
