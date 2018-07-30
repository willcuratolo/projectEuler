# Longest Collatz sequence
# Problem 14 
# The following iterative sequence is defined for the set of positive integers:
  
#  n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following 
#sequence:
  
#  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) 
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
  
#  NOTE: Once the chain starts the terms are allowed to go above one million.

# returns all pairs of (number, path length) that are newly encountered
count_steps <- function(number) {
  original <- number
  
  steps <-  1
  chain <- data.frame("Number" = c(number), "Position" = c(steps))

  while ((number != 1) && !(number %in% master_chain$Number))  {
  
      if (number %% 2 == 0){
        number <- number / 2
      
      } else {
        number <- (3 * number) + 1
      }
      steps <- steps + 1
      new <- data.frame("Number" = c(number), "Position" = c(steps))
      chain <- rbind(chain, new)
      }  
  
  chain$length_of_chain <- steps - chain$Position + 1
  chain$Position <- NULL
  
  if (number %in% master_chain$Number) {
    new_steps <- master_chain[master_chain$Number == number,][1,2]
    diff_in_steps <- new_steps - chain[chain$Number == number,][1,2] 
    chain$length_of_chain <- chain$length_of_chain + diff_in_steps
  }
  
  return(chain)
}

# specific solution (CAUTION: this takes like an hour to run)
# I will be coming back to fix this soon
master_chain <- data.frame()

for (i in 1000000:1){
  new <- count_steps(i)
  master_chain <- rbind(master_chain, new)
}

master_chain <- unique(master_chain)

master_chain <- master_chain[master_chain$Number < 1000000,]

solution <- max(master_chain$length_of_chain)
