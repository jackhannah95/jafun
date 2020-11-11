context("prop_missing")

x <- prop_missing(airquality)
y <- prop_missing(attenu)

test_that("Returns a value for every column in original dataset", {
  expect_equal(sort(unique(x$variable)),
               sort(colnames(airquality)))
  expect_equal(sort(unique(y$variable)),
               sort(colnames(attenu)))
})

test_that("Returns columns of the correct type", {
  expect_type(c(x$variable, y$variable), "character")
  expect_type(c(x$prop_missing, y$prop_missing), "double")
})

test_that("Returns proportions between 0 and 1", {
  expect_true(unique(dplyr::between(c(x$prop_missing, y$prop_missing), 0, 1)))
})

test_that("Returns proportions in descending order", {
  expect_equal(x$prop_missing, sort(x$prop_missing, decreasing = TRUE))
  expect_equal(y$prop_missing, sort(y$prop_missing, decreasing = TRUE))
})

test_that("Errors if not supplied with data frame", {
  expect_error(prop_missing(c(1, NA, 4, NA, NA, 10)))
})