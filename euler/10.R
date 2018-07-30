# Summation of primes
# Problem 10 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# this returns all primes less than n.  It gets slow around 100 million
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

sum_of_primes <- function(n) {
  sum <- sum(prime(n))
  return(sum)
}

# specific solution
print(sum_of_primes(2000000))
