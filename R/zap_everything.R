#'
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

