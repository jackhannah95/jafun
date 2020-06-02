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
