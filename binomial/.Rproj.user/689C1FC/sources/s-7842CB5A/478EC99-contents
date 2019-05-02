library(graphics)

#' @export
plot.bindis <- function(x, ...) {
  barplot(x$probability,
          names.arg = x$success,
          main = "binomial distribution",
          xlab = "successes",
          ylab = "probability")
}

#' @export
plot.bincum <- function(x, ...) {
  plot(x$success,
       x$cumulative,
       type = "o",
       main = "cumulative binomial distribution",
       xlab = "successes",
       ylab = "probability")
}

#' @export
print.binvar <- function(x, ...) {
  cat('"binomial variable"\n\n')
  cat('parameters\n')
  cat(sprintf('- number of trials: %s',
              x$`number of trials`), "\n")
  cat(sprintf('- prob of success: %s',
              x$`probability of success`))
}

#' @export
summary.binvar <- function(object, ...) {
  n <- object$`number of trials`
  p <- object$`probability of success`
  mean <- aux_mean(n,p)
  vari <- aux_variance(n,p)
  mode <- aux_mode(n,p)
  skew <- aux_skewness(n,p)
  kurt <- aux_kurtosis(n,p)
  obj <- list("number of trials"=n,
              "probability of success"=p,
              "mean or expected value"=mean,
              "variance"=vari,
              "mode"=mode,
              "skewness"=skew,
              "kurtosis"=kurt)
  class(obj) <- "summary.binvar"
  return(obj)
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"binomial variable"\n\n')
  cat('parameters\n')
  cat(sprintf('- number of trials: %s',
              x$`number of trials`), "\n")
  cat(sprintf('- prob of success: %s',
              x$`probability of success`), "\n\n")
  cat('measures\n')
  cat(sprintf('- mean: %s',
              x$`mean or expected value`), "\n")
  cat(sprintf('- variance: %s',
              x$`variance`), "\n")
  cat(sprintf('- mode: %s',
              x$`mode`), "\n")
  cat(sprintf('- skewness: %s',
              x$`skewness`), "\n")
  cat(sprintf('- kurtosis: %s',
              x$`kurtosis`))
}
