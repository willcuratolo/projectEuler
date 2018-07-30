# 10001st prime
# Problem 7 
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# What is the 10,001st prime number?

# My solution to this is not very elegant, but I could see an easy solution
# that reuses some code I've just written.

# This lists all primes less than a certain number
prime <-  function(n) {
  n = as.integer(n)
  primes = rep(TRUE, n)
  primes[1] = FALSE
  last.prime = 2
  fsqr = floor(sqrt(n))
  while (last.prime <= fsqr)
  {
    primes[seq.int(2*last.prime, n, last.prime)] = FALSE
    sel = which(primes[(last.prime+1):(fsqr+1)])
    if (any(sel)) {
      last.prime = last.prime + min(sel)
    } else last.prime = fsqr+1
  }
  which(primes)
}

# general solver
get_nth_prime <- function(N) {
  upper_limit <- 100000
  primes <- prime(upper_limit)
  
  while (length(primes) < N){
    upper_limit <-  (upper_limit * 10)
    primes <-  prime(upper_limit)
  }
  
  return(primes[N])
  
}

# specific solution: the 10,001st prime number
print(get_nth_prime(10001))
