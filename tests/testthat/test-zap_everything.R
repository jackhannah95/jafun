context("test-zap_everything")

# Modify dplyr's starwars dataset to mimic common features of an SPSS data file
starwars_spss <- dplyr::starwars %>%
  labelled::set_variable_labels(hair_color = "Hair Colour",
                                skin_color = "Skin Colour",
                                eye_color = "Eye Colour") %>%
  dplyr::mutate(sex = haven::labelled(sex, c("1" = "male",
                                             "2" = "female",
                                             "3" = "none")),
                mass = magrittr::set_attr(mass, 
                                          which = "display_width", 
                                          value = as.integer(50)),
                gender = magrittr::set_attr(gender,
                                            which = "format.spss",
                                            value = "A10")) %>%
  dplyr::mutate(
    dplyr::across(
      tidyselect::vars_select_helpers$where(is.character), 
      ~tidyr::replace_na(.x, "")))

test_that("Strips data frame of all SPSS-related information", {
  expect_equal(dplyr::starwars, zap_everything(starwars_spss))
})

test_that("Errors if not supplied with data frame", {
  expect_error(zap_everything(starwars_spss$hair_color,
                              "The input must be a data frame"))
})
