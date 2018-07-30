# Multiples of 3 and 5
# Problem 1 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

# The title says 3 and 5, but I follow the description which says 3 or 5.

# First solution: brute force

output <- 0
for (i in 1:999){
  if (i %% 3 == 0 | i %% 5 == 0){
    output <- output + i
  }
}
print(output)


# Second solution: use sequences

sequence <- unique(c(seq(3, 999, 3), seq(5, 999, 5)))
print(sum(sequence))

# Third solution: use vectors

sum((1:999)[((1:999)%%3 == 0) | ((1:999)%%5 == 0)])



# general solution

N <- 10000
sum((1:(N-1))[((1:(N-1))%%3 == 0) | ((1:(N-1))%%5 == 0)])
