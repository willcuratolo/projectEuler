# Sum square difference
# Problem 6 
# The sum of the squares of the first ten natural numbers is,

# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

sum_of_squares <- function(N) {
  squares <- (1:N)^2
  return(sum(squares))
}

square_of_sum <- function(N) {
  sum = (N*(N+1)) / 2
  return(sum^2)
}

sum_square_difference <- function(N) {
  return(square_of_sum(N)-sum_of_squares(N))
}