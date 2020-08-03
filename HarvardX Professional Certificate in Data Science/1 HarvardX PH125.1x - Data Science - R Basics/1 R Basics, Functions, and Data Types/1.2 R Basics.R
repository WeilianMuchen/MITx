### Author: WeilianMuchen
### Assessment 1 - 1.2 R Basics

## Using variables 1:
## Define n<-100
## Then use R to compute the sum of 1 through 100 using the formula n(n+1)/2. What is the sum?
## Make sure you do not erase or change the sample code on DataCamp exercises.

# Here is how you compute the sum for the first 20 integers
20*(20+1)/2 

# However, we can define a variable to use the formula for other values of n
n <- 20
n*(n+1)/2

n <- 25
n*(n+1)/2

# Below, write code to calculate the sum of the first 100 integers
n <- 100
n*(n+1)/2



## Using variables 2:
## Use the same formula as the last exercise but change the value of n. Make sure you use the variable name n to store the value 1000.
## Instead of typing the result, use the formula and defined variable.

# Below, write code to calculate the sum of the first 1000 integers 
n <- 1000
n*(n+1)/2



## Nested function calls 1:
## Use one line of code to compute the log, to the base 10, of the square root of 100.
## Make sure your code includes the log10 and sqrt functions.

# log to the base 2 
log2(16)

# sqrt of the log to the base 2 of 16:
sqrt(log2(16))

# Compute log to the base 10 (log10) of the sqrt of 100. Do not use variables.
sqrt(log10(100))