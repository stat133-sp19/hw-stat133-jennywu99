#' @title choose binomial
#' @description calculates number of combinations of successes in a given number of trials
#' @param n some integer
#' @param k some integer
#' @return number of combinations of successes
#' @export
#' @examples
#' bin_choose(n=5, k=2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  if (k[which.min(k)] < 0 | n < 0) {
    stop("k and n must be non-negative")
  } else if (k[which.max(k)] > n) {
    stop("k cannot be greater than n")
  } else {
    num <- factorial(n)
    denom <- factorial(k)*factorial(n-k)
    return(num/denom)
  }
}

#' @title binomial probability
#' @description computes probability of k successes in n trials
#' @param success some integer
#' @param trials some integer
#' @param prob some real number
#' @return probability of k success in n trials
#' @export
#' @examples
#' bin_probability(success=2, trials=5, prob=0.5)
#' bin_probability(0:2, 5, 0.5)
#' bin_probability(55, 100, 0.45)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  k <- success
  n <- trials
  p <- prob
  c <- bin_choose(n, k)
  p <- c*(p^k)*(1-p)^(n-k)
  return(p)
}

#' @title binomial distribution
#' @description computes binomial probability distribution
#' @param trials some integer
#' @param prob some real number
#' @return data frame with binomial probability distribution
#' @export
#' @examples
#' bin_distribution(trials=5, prob=0.5)
#' bin_distribution(7, 0.4)
bin_distribution <- function(trials, prob) {
  bin_probability(trials, trials, prob)
  p <- rep(0, trials+1)
  for (k in 0:trials) {
    p[k+1] <- bin_probability(k, trials, prob)
  }
  k <- c(0:trials)
  dis <- as.data.frame(matrix(c(k,p), nrow = trials+1, ncol = 2))
  colnames(dis) <- c("success", "probability")
  class(dis) <- c("bindis", "data.frame")
  return(dis)
}

#' @title cumulative binomial
#' @description computes cumulative probabilities of binomial distribution
#' @param trials some integer
#' @param prob some real number
#' @return data frame with cumulative probabilities
#' @export
#' @examples
#' bin_cumulative(trials=5, prob=0.5)
#' bin_cumulative(7, 0.4)
bin_cumulative <- function(trials, prob) {
  bin_probability(trials, trials, prob)
  p <- rep(0, trials+1)
  q <- rep(0, trials+1)
  for (k in 0:trials) {
    p[k+1] <- bin_probability(k, trials, prob)
    q <- cumsum(p)
  }
  k <- c(0:trials)
  dis <- as.data.frame(matrix(c(k,p,q), nrow = trials+1, ncol = 3))
  colnames(dis) <- c("success", "probability", "cumulative")
  class(dis) <- c("bincum", "data.frame")
  return(dis)
}

#' @title binomial variable
#' @description gives the parameters of the inputs
#' @param trials some integer
#' @param prob some real number
#' @return a list with named elements, trials and prob
#' @export
#' @examples
#' bin_variable(trials=5, prob=0.5)
#' bin_variable(7, 0.4)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  trials <- trials
  prob <- prob
  ret <- list("number of trials" = trials,
              "probability of success" = prob)
  class(ret) <- "binvar"
  return(ret)
}
