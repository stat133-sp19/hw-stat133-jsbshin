# private checker function check_prob() to test if an input prob is a valid probability
check_prob <- function(prob) {
  if( prob < 0 | prob >1) {
    stop('invalid prob value')
  }else {
    return(TRUE)
  }
}


# private checker function check_trials() to test if an input trial is a valid number
check_trials = function(trials){
  if(trials%%1 == 0 & trials >= 0){
    return(TRUE)
  }else{
    stop('invalid trials value')
  }
}


# private checker function check_success() to test if an input success is a valid number
check_success <- function(success, trials) {
  check_trials(trials)
  if (any(success != floor(success) | success < 0)){
    stop('invalid success value')
  } else if(any(trials < success)) {
    stop('success can not be greater than trials')
  } else {
    return(TRUE)
  }
}
