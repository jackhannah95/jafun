#' @title Delete files from one directory which don't exist in another
#' 
#' @param dir_one The first directory.
#' @param dir_two The second directory.
#' 
#' @export
del_dir <- function(dir_one, dir_two) {
  
  x <- list.files(dir_one, full.names = TRUE) %>% 
    tibble::enframe(name = NULL)
  
  y <- list.files(dir_two) %>% 
    tibble::enframe(name = NULL)
  
  x %>%
    fuzzyjoin::fuzzy_anti_join(y,
                               by = "value",
                               match_fun = ~basename(.x) == .y) %>%
    dplyr::pull() %>%
    purrr::walk(~fs::file_delete(.x))
  
}
