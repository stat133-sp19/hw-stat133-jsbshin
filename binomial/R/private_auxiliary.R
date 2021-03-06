# private auxiliary function aux_mean() to compute the mean value
aux_mean <- function(trials, prob) {
  aux_mean <- trials * prob
  return(aux_mean)
}

# private auxiliary function aux_variance() to compute the variance value
aux_variance <- function(trials, prob) {
  aux_variance <- trials * prob * (1 - prob)
  return(aux_variance)
}


# private auxiliary function aux_mode() to measure the most likely number of success
aux_mode <- function(trials, prob) {
  m <- trials * prob  + prob
  if (m %% 1 == 0) {
    aux_mode <- c(m, m-1)
    return(aux_mode)
  }else {
    aux_mode <- as.integer(m)
    return(aux_mode)
  }
}


# private auxiliary function aux_skewness() to compute the measure of the asymmetry of the probability distribution of a random variable about its mean
aux_skewness <- function(trials, prob) {
  aux_skewness <- (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
  return(aux_skewness)
}



# private auxiliary function aux_kurtosis() to compute the  measure of the "tailedness" of the probability distribution of a random variable
aux_kurtosis <- function(trials, prob) {
  aux_kurtosis <- (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(aux_kurtosis)
}

