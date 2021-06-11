context("test-days_of_week")

test_that("Returns correct output", {
  expect_equal(days_of_week(), 
               c("Monday", 
                 "Tuesday", 
                 "Wednesday", 
                 "Thursday", 
                 "Friday", 
                 "Saturday", 
                 "Sunday"))
  expect_equal(days_of_week(abbr = TRUE),
               c("Mon",
                 "Tue",
                 "Wed",
                 "Thu",
                 "Fri",
                 "Sat",
                 "Sun"))
})

test_that("Errors when supplied with invalid argument type", {
  expect_error(days_of_week(abbr = 1))
  expect_error(days_of_week(abbr = "x"))
  expect_error(days_of_week(abbr = as.Date("2021-06-10")))
})
