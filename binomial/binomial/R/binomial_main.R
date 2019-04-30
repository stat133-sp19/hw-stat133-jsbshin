
#' @title bin_choose
#' @description calculates the number of combinations in which k success can occur in n trials
#' @param n number of trials
#' @param k number of success out of the number of trials
#' @return the number of combinantions in which k success can occur in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n, k) {
  if(any( k > n)) {
    stop("k cannot be greater than n")
  }
  else{
    bin_choose <- factorial(n) / (factorial(k) * factorial(n - k))
    return(bin_choose)
  }
}



#' @title bin_probability
#' @description caculates the binomial probability of k success in n trials given p probability
#' @param success number of trialsnumber of success out of the number of trials
#' @param trials number of trials
#' @param prob probability of success
#' @return probability of k success in n trials given p probability
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_probability <- bin_choose(trials, success) * (prob^success) *
    (1 - prob)^(trials - success)
  return(bin_probability)
}



#' @title bin_distribution
#' @description list the probabality of each successe with probability p in n trials
#' @param trials number of trials
#' @param prob probability of success
#' @return return a data frame with the probability distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(0:trials, trials, prob)
  data <- data.frame(success, probability)
  class(data) <- c('bindis', 'data.frame')
  return(data)
}



#' @export
  plot.bindis <- function(x, ...){
     b <-  barplot(x$probability, xlab = "success",
                   ylab ="probability",names.arg = x$success,
                   border = NA, las = 1)
     return(b)
    }





#' @title bin_cumulative
#' @description list the cumulative probabality of each successe with probability p in n trials
#' @param trials number of trials
#' @param prob probability of success
#' @return return a data frame with both the probability distribution and the cumulative probabilities
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)

  bin_cumulative <- function(trials, prob) {
    success <- 0:trials
    probability <- bin_probability(0:trials, trials, prob)
    cumualtive <- cumsum(probability)
    data <- data.frame(success, probability, cumualtive)
    class(data) <- c("bincum", "data.frame")
    return(data)
  }


#' @export
  plot.bincum <- function(x, ...){
    g <-plot(x$success, x$cumualtive, type = 'o',
             xlab = "success", ylab = "probability", las = 1)
    return(g)
  }



#' @title bin_variable
#' @description list the class binomial random variable with the named of trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return return a list
#' @export
#' @examples
#' bin_variable(trials = 5, prob = 0.5)

  bin_variable <- function(trials, prob) {

    check_trials(trials)
    check_prob(prob)
    variable <- list(trials = trials,prob = prob)
    class(variable) <- "binvar"

    return(variable)
  }


#' @export
 print.binvar <- function(x, ...) {
   cat('"Binomail variable"\n\n')
   cat('Parameters\n')
   cat('- number of trials:', x$trials, '\n')
   cat('- prob of success :', x$prob)
 }


 #' @export
 summary.binvar <- function(bin_var, ...) {
   lst <- list(
     trials = bin_var$trials,
     prob = bin_var$prob,
     mean = aux_mean(bin_var$trials, bin_var$prob),
     variance = aux_variance(bin_var$trials, bin_var$prob),
     mode = aux_mode(bin_var$trials, bin_var$prob),
     skewness = aux_skewness(bin_var$trials, bin_var$prob),
     kurtosis = aux_kurtosis(bin_var$trials, bin_var$prob)
   )
   class(lst) <- "summary.binvar"
   return(lst)
 }


 #' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial" \n\n')
  cat('Parameters \n')
  cat('- number of trials:', x$trials, '\n')
  cat('- prob of success :', x$prob, '\n\n')
  cat('Measures \n')
  cat('- mean    :', x$mean, '\n')
  cat('- variance:', x$variance, '\n')
  cat('- mode    :', x$mode, '\n')
  cat('- skewness:', x$skewness, '\n')
  cat('- kurtosis:', x$kurtosis)
}


#' @title bin_mean
#' @description calculate the mean of a binomal distribution
#' @param trials the number of trials
#' @param prob probability of success
#' @return compute the mean of a binomal distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)

bin_mean <- function(trials, prob) {
   check_trials(trials)
   check_prob(prob)

   bin_mean <- aux_mean(trials, prob)
   return(bin_mean)
}


#' @title bin_variance
#' @description calculate the variance of a binomal distribution
#' @param trials the number of trials
#' @param prob probability of success
#' @return compute the variance of a binomal distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)

bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  bin_variance <- aux_variance(trials, prob)
  return(bin_variance)

}


#' @title bin_mode
#' @description calculate the mode of a binomal distribution
#' @param trials the number of trials
#' @param prob probability of success
#' @return compute the mode of a binomal distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)

bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  bin_mode <- aux_mode(trials, prob)
  return(bin_mode)
}


#' @title bin_skewness
#' @description calculate the skewness of a binomal distribution
#' @param trials the number of trials
#' @param prob probability of success
#' @return compute the skewness of a binomal distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)

bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  bin_skewness <- aux_skewness(trials, prob)
  return(bin_skewness)
}



#' @title bin_kurtosis
#' @description calculate the kurtosis of a binomal distribution
#' @param trials the number of trials
#' @param prob probability of success
#' @return compute the kurtosis of a binomal distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)

bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  bin_kurtosis <- aux_kurtosis(trials, prob)
  return(bin_kurtosis)
}
