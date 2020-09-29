### Author: WeilianMuchen
### 3 Quantiles, Percentiles, and Boxplots

## Definition of quantiles
## Using the quantile function

# Quartiles
quantile(data,q)

# Percentiles
p <- seq(0.01, 0.99, 0.01)
quantile(data, p)

# Quartiles
# Quartiles divide a dataset into 4 parts each with 25% probability.

# Examples, Load the heights dataset from the dslabs package:
library(dslabs)
data(heights)

# Use summary() on the heights$height variable to find the quartiles:
summary(heights$height)

# Find the percentiles of heights$height:
p <- seq(0.01, 0.99, 0.01)
percentiles <- quantile(heights$height, p)

# Confirm that the 25th and 75th percentiles match the 1st and 3rd quartiles. Note that quantile() returns a named vector. You can access the 25th and 75th percentiles like this (adapt the code for other percentile values):
percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]

## Finding quantiles with qnorm

# Definition of qnorm
# The qnorm() function gives the theoretical value of a quantile with probability p of observing a value equal to or less than that quantile value given a normal distribution with mean mu and standard deviation sigma:
qnorm(p, mu, sigma)
qnorm(p)

# Relation to pnorm
# The pnorm() function gives the probability that a value from a standard normal distribution will be less than or equal to a z-score value z.

# Theoretical quantiles
p <- seq(0.01, 0.99, 0.01)
theoretical_quantiles <- qnorm(p, 69, 3)

## Quantile-Quantile Plots
# define x and z
library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights$height[index]
z <- scale(x)

# proportion of data below 69.5
mean(x <= 69.5)

# calculate observed and theoretical quantiles
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x, p)
theoretical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))

# make QQ-plot
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)

# make QQ-plot with scaled values
observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)

## Assessment: Quantiles, percentiles, and boxplots

# Exercise 1. Vector lengths
# Define a variable male that contains the male heights.
# Define a variable female that contains the female heights.
# Report the length of each variable.
library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

length(male)
length(female)

# Exercise 2. Percentiles
# Create two five row vectors showing the 10th, 30th, 50th, 70th, and 90th percentiles for the heights of each sex called these vectors female_percentiles and male_percentiles.
# Then create a data frame called df with these two vectors as columns. The column names should be female and male and should appear in that order. As an example consider that if you want a data frame to have column names names and grades, in that order, you do it like this:
# df <- data.frame(names = c("Jose", "Mary"), grades = c("B", "A"))
# Take a look at the df by printing it. This will provide some information on how male and female heights differ.
library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

female_percentiles <- quantile(female, seq(0.1, 0.9, 0.2))
male_percentiles <- quantile(male, seq(0.1, 0.9, 0.2))

df <- data.frame(female = female_percentiles, male = male_percentiles)
df