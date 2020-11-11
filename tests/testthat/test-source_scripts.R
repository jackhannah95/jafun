context("test-source_scripts")

source_scripts(test_path("helpers"))

test_that("Sources multiple R scripts", {
  expect_equal(x, 1)
  expect_equal(y, 2)
})

test_that("Errors when supplied with an invalid filepath", {
  expect_error(source_scripts("invalid/filepath"))
  expect_error(source_scripts(2))
})

test_that("Errors when supplied with a filepath containing no R scripts", {
  expect_error(source_scripts("man"))
})
