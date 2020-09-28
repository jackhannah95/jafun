#' \code{jafun} package
#'
#' Jack Hannah's personal R package.
#'
#' See the README on
#' \href{https://github.com/jackhannah95/jafun#readme}{GitHub}.
#'
#' @docType package
#' @name jafun
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @importFrom rlang .data
NULL

# Stops notes from appearing in R CMD check because of undefined global
# variable '.'
if(getRversion() >= "2.15.1") utils::globalVariables(".")
