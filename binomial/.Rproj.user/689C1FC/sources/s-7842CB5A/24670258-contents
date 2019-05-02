#' @title binomial mean
#' @description computes expected value or mean of a binomial distribution
#' @param trials some integer
#' @param prob some real number
#' @return expected number of successes in n trials
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title binomial variance
#' @description computes variance of a binomial distribution
#' @param trials some integer
#' @param prob some real number
#' @return variance of the expected value of a binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title binomial mode
#' @description computes most likely number of successes
#' @param trials some integer
#' @param prob some real number
#' @return most probable number of successes
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title binomial skewness
#' @description measures degree of asymmetry of probability distribution around mean
#' @param trials some integer
#' @param prob some real number
#' @return skewness of binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title binomial kurtosis
#' @description measures tailedness of probability distribution
#' @param trials some integer
#' @param prob some real number
#' @return kurtosis of binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}
