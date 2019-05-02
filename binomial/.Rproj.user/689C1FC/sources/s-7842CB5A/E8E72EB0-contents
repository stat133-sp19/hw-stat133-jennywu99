library(testthat)

source("~/Desktop/stat133/workouts/workout03/binomial/R/main_bin_func.R")

context("test choose binomial")
test_that("choose binomial as expected", {
  n <- 5
  n2 <- -5
  k <- 2
  k2 <- 0
  k3 <- -2
  k4 <- 1:3
  k5 <- 7
  expect_length(bin_choose(n,k4),3)
  expect_error(bin_choose(n,k3),
               "k and n must be non-negative")
  expect_error(bin_choose(n2,k),
               "k and n must be non-negative")
  expect_equal(bin_choose(n,k2),1)
  expect_error(bin_choose(n,k5),
               "k cannot be greater than n")
})

context("test binomial probability")
test_that("binomial probability as expected", {
  k <- 2
  k2 <- 0:2
  k3 <- -2
  n <- 5
  n2 <- -5
  p <- 0.45
  p2 <- 2
  expect_error(bin_probability(k3,n,p),
               "number of successes cannot be negative")
  expect_error(bin_probability(k,n2,p),
               "number of trials cannot be negative")
  expect_error(bin_probability(k,n,p2),
               "probability must be between 0 and 1")
  expect_length(bin_probability(k2,n,p),3)
})

context("test binomial distribtuion")
test_that("binomial distribution as expected", {
  n <- 5
  n2 <- -5
  p <- 0.5
  p2 <- 2
  expect_is(bin_distribution(n,p), "data.frame")
  expect_is(bin_distribution(n,p), "bindis")
  expect_error(bin_distribution(n2,p),
               "number of trials cannot be negative")
  expect_error(bin_distribution(n,p2),
               "probability must be between 0 and 1")
})

context("test cumulative binomial distribution")
test_that("cumulative binomial distribution as expected", {
  n <- 5
  n2 <- -5
  p <- 0.5
  p2 <- 2
  expect_is(bin_cumulative(n,p), "data.frame")
  expect_is(bin_cumulative(n,p), "bincum")
  expect_error(bin_cumulative(n2,p),
               "number of trials cannot be negative")
  expect_error(bin_cumulative(n,p2),
               "probability must be between 0 and 1")
})
