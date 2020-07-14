context("test-days_of_week")

test_that("Produces correct output", {
  expect_equal(day_to_num("Monday"), 1)
  expect_equal(day_to_num(c("Tue", "Friday", "Sun")), c(2, 5, 0))
  expect_equal(day_to_num(days_of_week()), c(1:6, 0))
})

test_that("Correctly ignores case when specified", {
  expect_equal(day_to_num("monday"), 1)
  expect_equal(day_to_num(c("TUESDAY", "wED", "tHuRsDaY", "fri", "sAt")), 2:6)
  expect_equal(day_to_num(c(tolower(days_of_week(abbr = TRUE)),
                            toupper(days_of_week()))),
               rep(c(1:6, 0), 2))
})

test_that("Produces warning message if supplied with invalid day", {
  expect_warning(day_to_num("Tuesdayy"),
                 paste("Entries which do not correspond to a day of the week", 
                       "will return an NA"))
})

test_that("Returns NA if supplied with invalid day", {
  expect_true(is.na(suppressWarnings(day_to_num("monday", 
                                                ignore_case = FALSE))))
  expect_equal(suppressWarnings(day_to_num(c("Monday", 
                                             "tuesday",
                                             "Wed",
                                             "thu",
                                             "Frid",
                                             "satu",
                                             "Sun"),
                                           ignore_case = FALSE)),
               c(1, NA, 3, NA, NA, NA, 0))
})