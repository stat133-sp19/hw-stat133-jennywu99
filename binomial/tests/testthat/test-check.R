library(testthat)

source("~/Desktop/stat133/git/hw-stat133/binomial/R/priv_check_func.R")

context("test prob input")
test_that("function reacts to prob as expected", {
  x <- 0.4
  y <- 12
  expect_true(check_prob(x))
  expect_length(x,1)
  expect_error(check_prob(y),
               "probability must be between 0 and 1")
})

context("test trials input")
test_that("function reacts to trials as expected", {
  x <- 7
  y <- -5
  expect_true(check_trials(x))
  expect_length(x,1)
  expect_error(check_trials(y),
               "number of trials cannot be negative")
})

context("test success input")
test_that("function reacts to success and trials as expected", {
  k1 <- 1:3
  k2 <- 3:6
  k3 <- -2:4
  n1 <- 5
  n2 <- -3
  expect_true(check_success(k1,n1))
  expect_error(check_success(k2,n1),
               "number of successes cannot be greater than trials")
  expect_error(check_success(k3,n1),
               "number of successes cannot be negative")
  expect_error(check_success(k1,n2),
               "number of trials cannot be negative")
})
