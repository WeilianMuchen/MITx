### Author: WeilianMuchen
### 2 Introduction to Distributions

## Describe Heights to ET
# load the dataset
library(dslabs)
data(heights)

# make a table of category proportions
prop.table(table(heights$sex))



## Cumulative Distribution Function
a <- seq(min(my_data), max(my_data), length = 100)    # define range of values spanning the dataset
cdf_function <- function(x) {    # computes prob. for a single value
  mean(my_data <= x)
}
cdf_values <- sapply(a, cdf_function)
plot(a, cdf_values)




### Normal Distribution
# define x as vector of male heights
library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights$height[index]

# calculate the mean and standard deviation manually
average <- sum(x)/length(x)
SD <- sqrt(sum((x - average)^2)/length(x))

# built-in mean and sd functions - note that the audio and printed values disagree
average <- mean(x)
SD <- sd(x)
c(average = average, SD = SD)

# calculate standard units
z <- scale(x)

# calculate proportion of values within 2 SD of mean
mean(abs(z) < 2)



## The Normal CDF and pnorm
# Code: Using pnorm to calculate probabilities
# Given male heights x:
  library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# We can estimate the probability that a male is taller than 70.5 inches with:
1 - pnorm(70.5, mean(x), sd(x))


# Code: Discretization and the normal approximation
# plot distribution of exact heights in data
plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(x = a)")
  
# probabilities in actual data over length 1 ranges containing an integer
mean(x <= 68.5) - mean(x <= 67.5)
mean(x <= 69.5) - mean(x <= 68.5)
mean(x <= 70.5) - mean(x <= 69.5)
  
# probabilities in normal approximation match well
pnorm(68.5, mean(x), sd(x)) - pnorm(67.5, mean(x), sd(x))
pnorm(69.5, mean(x), sd(x)) - pnorm(68.5, mean(x), sd(x))
pnorm(70.5, mean(x), sd(x)) - pnorm(69.5, mean(x), sd(x))
  
# probabilities in actual data over other ranges don't match normal approx as well
mean(x <= 70.9) - mean(x <= 70.1)
pnorm(70.9, mean(x), sd(x)) - pnorm(70.1, mean(x), sd(x))



### Assessment: Normal Distribution
## Exercise 1. Proportions
## What proportion of the data is between 69 and 72 inches (taller than 69 but shorter or equal to 72)? A proportion is between 0 and 1.
## Use the mean function in your code. Remember that you can use mean to compute the proportion of entries of a logical vector that are TRUE.

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x > 69 & x <= 72)

## Exercise 2. Averages and Standard Deviation
## Use the normal approximation to estimate the proportion the proportion of the data that is between 69 and 72 inches.
## Note that you can't use x in your code, only avg and stdev. Also note that R has a function that may prove very helpful here - check out the pnorm function (and remember that you can get help by using ?pnorm).

library(dslabs)
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
pnorm(72, avg, stdev) - pnorm(69, avg, stdev)

## Exercise 3. Approximations
## Use normal approximation to estimate the proportion of heights between 79 and 81 inches and save it in an object called approx.
## Report how many times bigger the actual proportion is compared to the approximation.

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
avg <- mean(x)
stdev <- sd(x)
exact <- mean(x>79 & x<=81)
approx <- pnorm(81, avg, stdev) - pnorm(79, avg, stdev)
exact/approx

## Exercise 4. Seven footers and the NBA
## Using the normal approximation, estimate the proportion of adult men that are taller than 7 feet, referred to as seven footers. Remember that 1 foot equals 12 inches.
## Use the pnorm function. Note that pnorm finds the proportion less than or equal to a given value, but you are asked to find the proportion greater than that value.
## Print out your estimate; don't store it in an object.

# use pnorm to calculate the proportion over 7 feet (7*12 inches)
1 - pnorm(7*12, 69, 3)

## Exercise 5. Estimating the number seven footers
## Use your answer to the previous exercise to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
## Then multiply this value by 1 billion (10^9) round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer with round. (Do not store this value in an object.)

p <- 1 - pnorm(7*12, 69, 3)
round(p * 10^9)

## Exercise 6. How many seven footers are in the NBA?
## Use your answer to exercise 4 to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
## Use your answer to the previous exercise (exercise 5) to round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer and store that value as N.
## Then calculate the proportion of the world's 18 to 40 year old seven footers that are in the NBA. (Do not store this value in an object.)

p <- 1 - pnorm(7*12, 69, 3)
N <- round(p * 10^9)
10/N

## Exercise 7. Lebron James' height
## Report the estimated proportion of people at least Lebron's height that are in the NBA.

p <- 1 - pnorm(6*12 + 8, 69, 3)
N <- round(p * 10^9)
150/N