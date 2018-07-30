# Largest prime factor
# Problem 3 
# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

get_prime_factors <- function(N) {
  
  factors <- vector(mode = "integer", length = 0)
  
  # divide by two once to add it to vector of prime factors
  if (N%%2 == 0) {
    factors <- c(factors, 2)
  }
  
  current <- N
  
  while (current%%2 == 0) {
    current <- current / 2
  }
  
  
  # divide by odds
  upper_limit <- floor(N / 2)
  i <-  3
  while (i <= upper_limit) {
    if (current%%i == 0) {
      factors <- c(factors, i)
     # print(c("adding ", i))
    }
    while (current%%i == 0){
      current <- current / i
      #print(c("dividing by ", i))
    }
    i <- i + 2
    #print(c("new i = ", i))
  }
  
  return(factors)
}

get_largest_prime_factor <- function(N) {
  primes <- get_prime_factors(N)
  
  if (length(primes) == 0){
    return(c(N, " is prime"))
  } else {
    return(max(primes))
  }
}
