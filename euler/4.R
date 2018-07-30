# Largest palindrome product
# Problem 4 
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# checks if a number is a palindrome
check_palindrome <- function(num) {
  if (num < 10){
    return(FALSE)
  } else {
  string <- as.character(num)
  digits <- as.numeric(unlist(strsplit(string, "")))
  
  num_length <- length(digits)
  half_length <- floor(num_length / 2)
  
  palindrome <- TRUE
  
  for (i in 1:half_length){
    if (digits[i] != digits[(num_length-i+1)]){
      palindrome <- FALSE
    }
  }
  
  return(palindrome)
  }
}


# returns the largest palindrome smaller than N^2 which is a product of 
# integers. For the actual Euler question, this in theory could return a 
# palindrome that isn't the product of two three digit numbers.  But I 
# think this a better general function.
get_largest_palindrome <- function(N){
  best <- 1
  for (i in N:1){
    for (j in N:1){
      product <- i * j
      if (check_palindrome(product) && ((product) > best)){
        best <- product
      }
    }
  }
  return(best)
}  
  
