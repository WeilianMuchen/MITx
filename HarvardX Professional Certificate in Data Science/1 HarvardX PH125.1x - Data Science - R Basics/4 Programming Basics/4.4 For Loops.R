### Author: WeilianMuchen
### Assessment 11 - 4.4 For Loops

## ifelse
## Use the ifelse function to write one line of code that assigns to the object new_names the state abbreviation when the state name is longer than 8 characters and assigns the state name when the name is not longer than 8 characters.

# Assign the state abbreviation when the state name is longer than 8 characters 
new_names <- ifelse(nchar(murders$state)>8, murders$abb, murders$state)



## Defining functions
## Create a function sum_n that for any given value, say n, creates the vector 1:n, and then computes the sum of the integers from 1 to n.
## Use the function you just defined to determine the sum of integers from 1 to 5,000.

# Create function called `sum_n`
sum_n <- function(n){
  x <- 1:n
  sum(x)
}

# Determine the sum of integers from 1 to 5000
sum_n(5000)



## Defining functions
## Create a function sum_n that for any given value, say n, creates the vector 1:n, and then computes the sum of the integers from 1 to n.
## Use the function you just defined to determine the sum of integers from 1 to 5,000.

# Create function called `sum_n`
sum_n <- function(n){
  x <- 1:n
  sum(x)
}

# Determine the sum of integers from 1 to 5000
sum_n(5000)



## Defining functions continued...
## Create a function altman_plot that takes two arguments x and y and plots y-x (on the y-axis) against x+y (on the x-axis).
## Note: don't use parentheses around the arguments in the plot function because you will confuse R.

# Create `altman_plot` 
altman_plot <- function(x, y){
  plot(x + y, y - x)
}



## Lexical scope
# Run this code 
x <- 3
my_func <- function(y){
  x <- 5
  y+5
}

# Print the value of x 
print(x)



## For loops
## Write a function compute_s_n that for any given n computes the sum Sn=1^2+2^2+3^2+⋯+n^2.
##Report the value of the sum when n=10.

# Here is a function that adds numbers from 1 to n
example_func <- function(n){
  x <- 1:n
  sum(x)
}

# Here is the sum of the first 100 numbers
example_func(100)

# Write a function compute_s_n with argument n that for any given n computes the sum of 1 + 2^2 + ...+ n^2
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Report the value of the sum when n=10
compute_s_n(10)



## For loops continued...
## Define an empty numeric vector s_n of size 25 using s_n <- vector("numeric", 25).
## Compute the the sum when n is equal to each integer from 1 to 25 using the function we defined in the previous exercise: compute_s_n
## Save the results in s_n

# Define a function and store it in `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)

# Assign values to `n` and `s_n`
for(i in 1:25){
  s_n[i] <- compute_s_n(i)
}



## Checking our math
## Define n <- 1:25. Note that with this we can use for(i in n)
## Use a for loop to save the sums into a vector s_n <- vector("numeric", 25)
## Plot s_n (on the y-axis) against n (on the x-axis).

# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

#  Create the plot 
plot(n, s_n)



## Checking our math continued
## Confirm that s_n and n(n+1)(2n+1)/6 are the same using the identical command.

# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

# Check that s_n is identical to the formula given in the instructions.
identical(s_n, n*(n+1)*(2*n+1)/6)