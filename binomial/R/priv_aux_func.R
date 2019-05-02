# title: auxiliary mean
# description: computes expected value or mean of a binomial distribution
# param: trials (integer)
# param: prob (real number)
# return: expected number of successes in n trials
aux_mean <- function(trials, prob) {
  n <- trials
  p <- prob
  return(n*p)
}

# title: auxiliary variance
# description: computes variance of a binomial distribution
# param: trials (integer)
# param: prob (real number)
# return: variance of the expected value of a binomial distribution
aux_variance <- function(trials, prob) {
  n <- trials
  p <- prob
  return(n*p*(1-p))
}

# title: auxiliary mode
# description: computes most likely number of successes
# param: trials (integer)
# param: prob (real number)
# return: most probable number of successes
aux_mode <- function(trials, prob) {
  n <- trials
  p <- prob
  return(as.integer(n*p + p))
}

# title: auxiliary skewness
# description: measures degree of asymmetry of probability distribution around mean
# param: trials (integer)
# param: prob (real number)
# return: skewness of binomial distribution
aux_skewness <- function(trials, prob) {
  n <- trials
  p <- prob
  var <- n*p*(1-p)
  sd <- sqrt(var)
  skew <- (1-2*p)/sd
  return(skew)
}

# title: auxiliary kurtosis
# description: measures tailedness of probability distribution
# param: trials (integer)
# param: prob (real number)
# return: kurtosis of binomial distribution
aux_kurtosis <- function(trials, prob) {
  n <- trials
  p <- prob
  var <- n*p*(1-p)
  kurt <- (1-6*p*(1-p))/var
  return(kurt)
}
