# Lattice paths
# Problem 15 
# Starting in the top left corner of a 2×2 grid, and only being able to move
# to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

# This is just combinatorics.  You must make 20 moves to the right, and 20 moves down.  
# So 40 moves total.  You must choose 20 of them to designate as "right,"
# and the rest are "down."

# So the solution to the specific problem is :

solution <- factorial(40) / (factorial(20) * factorial(20))

# The general solution to an X by y rectangle is

general_solution <- factorial((x + y)) / (factorial(x) * factorial(y))
