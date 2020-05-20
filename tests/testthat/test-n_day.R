context("test-n_day")

test_that("Returns correct output", {
  expect_equal(n_day(lubridate::dmy(01012018), lubridate::dmy(31012018), 2), 5)
  expect_equal(n_day(lubridate::dmy(01012019), lubridate::dmy(31032019), 3), 13)
  expect_equal(n_day(lubridate::dmy(01012020), lubridate::dmy(31122020), 4), 53)
})

test_that("Errors if supplied with invalid input", {
  expect_error(n_day("2018-01-01", "2018-01-31", 2))
  expect_error(n_day(lubridate::dmy(01012019), lubridate::dmy(31032019), "two"))
  expect_error(n_day(lubridate::dmy(01012020), lubridate::dmy(31122020), 7))
})

test_that("Produces at least 52 instances of every day in 2020", {
  instances <- purrr::map_dbl(0:6, ~ n_day(lubridate::dmy(01012020), 
                                           lubridate::dmy(31122020), 
                                           .x))
  expect_true(all(instances >= 52))
})