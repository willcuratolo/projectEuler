# Smallest multiple
# Problem 5 
# 2520 is the smallest number that can be divided by each of the numbers from
# 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

# What we really need is it the product of all the primes between 1 and 20.

# this function returns all primes less than n.  It might break if n is
# too large (tens of millions?)
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

smallest_multiple <- function(N) {
  return(prod(prime(N)))
}
