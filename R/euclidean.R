#' Euclidean Algorithm
#'
#' @name euclidean
#'
#' @param a Numeric Number
#' @param b Numeric Number
#'
#' @return The Greatest Common Divisor of two numbers.
#'
#' @description
#' Find Greatest Common Divisor(GCD) of Two Given Parameters
#'
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)
#'
#' @references https://en.wikipedia.org/wiki/Euclidean_algorithm
#'
#' @export


euclidean <- function(a, b){
  stopifnot(is.numeric(a) & is.numeric(b))
  a <- abs(a)
  b <- abs(b)
  if(b == 0){
    b <- a
  }
  else{
    c <- 1
    while(c != 0){
      if(a%%b == a){
        x <- a
        a <- b
        b <- x
      }
      c <- a%%b
      if(c != 0){
        a <- b
        b <- c
      }
    }
  }
  return(b)
}
