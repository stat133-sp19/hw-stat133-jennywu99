n <- 10
p <- 0.3

context("test aux mean")
test_that("mean works as expected", {
  expect_length(aux_mean(n,p),1)
  expect_equal(aux_mean(n,p),3)
  expect_is(aux_mean(n,p), "numeric")
})

context("text aux variance")
test_that("variance works as expected", {
  expect_length(aux_variance(n,p),1)
  expect_equal(aux_variance(n,p),2.1)
  expect_is(aux_variance(n,p), "numeric")
})

context("text aux mode")
test_that("mode works as expected", {
  expect_length(aux_mode(n,p),1)
  expect_equal(aux_mode(n,p),3)
  expect_is(aux_mode(n,p), "integer")
})

context("text aux skewness")
test_that("skewness works as expected", {
  expect_length(aux_skewness(n,p),1)
  expect_lt(aux_skewness(n,p),1)
  expect_is(aux_skewness(n,p), "numeric")
})

context("text aux kurtosis")
test_that("kurtosis works as expected", {
  expect_length(aux_kurtosis(n,p),1)
  expect_lt(aux_kurtosis(n,p),0)
  expect_is(aux_kurtosis(n,p), "numeric")
})
