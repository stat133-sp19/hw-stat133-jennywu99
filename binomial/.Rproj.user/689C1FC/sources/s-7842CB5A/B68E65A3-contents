# title: check probability
# description: tests if input is a valid probability value
# param: prob (some real number)
# return: true if valid, error if not
check_prob <- function(prob) {
  if (0 <= prob & prob <= 1) {
    return(TRUE)
  } else {
    stop("probability must be between 0 and 1")
  }
}

# title: check trials
# description: test if input is valid number of trials
# param: trials (some integer)
# return: true if valid, error if not
check_trials <- function(trials) {
  if (trials >= 0) {
    return(TRUE)
  } else {
    stop("number of trials cannot be negative")
  }
}

# title: check success
# description: test if input is valid number of successes
# param: success (some integer)
# param: trials (some integer)
# return: true if valid, error if not
check_success <- function(success, trials) {
  k <- success
  if (k[which.min(k)] < 0) {
    stop("number of successes cannot be negative")
  } else if (0 <= k[which.max(k)] & k[which.max(k)] <= trials) {
    return(TRUE)
  } else if (trials < 0) {
    stop("number of trials cannot be negative")
  } else {
    stop("number of successes cannot be greater than trials")
  }
}


