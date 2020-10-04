### Author: WeilianMuchen
### 1 Continuous Probability

## Continuous Probability
# Code: Cumulative distribution function
# Define x as male heights from the dslabs heights dataset:
  library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# Given a vector x, we can define a function for computing the CDF of x using:
F <- function(a) mean(x <= a)
1 - F(70)    # probability of male taller than 70 inches

## Theoretical Distribution
# Code: Using pnorm() to calculate probabilities
# Given male heights x:
  library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)
# We can estimate the probability that a male is taller than 70.5 inches using:
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

## Plotting the Probability Density
library(tidyverse)
x <- seq(-4, 4, length = 100)
data.frame(x, f = dnorm(x)) %>%
  ggplot(aes(x, f)) +
  geom_line()

dnorm(z, mu, sigma)

## Monte Carlo Simulations
# Code: Generating normally distributed random numbers
# define x as male heights from dslabs data
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# generate simulated height data using normal distribution - both datasets should have n observations
n <- length(x)
avg <- mean(x)
s <- sd(x)
simulated_heights <- rnorm(n, avg, s)

# plot distribution of simulated_heights
data.frame(simulated_heights = simulated_heights) %>%
  ggplot(aes(simulated_heights)) +
  geom_histogram(color="black", binwidth = 2)

# Code: Monte Carlo simulation of tallest person over 7 feet
B <- 10000
tallest <- replicate(B, {
  simulated_data <- rnorm(800, avg, s)    # generate 800 normally distributed random heights
  max(simulated_data)    # determine the tallest height
})
mean(tallest >= 7*12)    # proportion of times that tallest person exceeded 7 feet (84 inches)

## Other Continuous Distributions
# Code: Plotting the normal distribution with dnorm
# Use d to plot the density function of a continuous distribution. Here is the density function for the normal distribution (abbreviation norm()):
  x <- seq(-4, 4, length.out = 100)
data.frame(x, f = dnorm(x)) %>%
  ggplot(aes(x,f)) +
  geom_line()

## DataCamp Assessment: Continuous Probability
# Exercise 1. Distribution of female heights - 1
# Use pnorm to define the probability that a height will take a value less than 5 feet given the stated distribution.

# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is shorter than 5 feet. Print this value to the console - do not save it to a variable.
pnorm(5*12, female_avg, female_sd)

# Exercise 2. Distribution of female heights - 2
# Use pnorm to define the probability that a height will take a value of 6 feet or taller.
# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is 6 feet or taller. Print this value to the console.
1 - pnorm(6*12, female_avg, female_sd)

# Exercise 3. Distribution of female heights - 3
# Use pnorm to define the probability that a randomly chosen woman will be shorter than 67 inches.
# Subtract the probability that a randomly chosen will be shorter than 61 inches.
# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.
pnorm(67, female_avg, female_sd) - pnorm(61, female_avg, female_sd)

# Exercise 4. Distribution of female heights - 4
# Convert the average height and standard deviation to centimeters by multiplying each value by 2.54.
# Repeat the previous calculation using pnorm to define the probability that a randomly chosen woman will have a height between 61 and 67 inches, converted to centimeters by multiplying each value by 2.54.
# Assign a variable 'female_avg' as the average female height. Convert this value to centimeters.
female_avg <- 64*2.54

# Assign a variable 'female_sd' as the standard deviation for female heights. Convert this value to centimeters.
female_sd <- 3*2.54

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.
pnorm(67*2.54, female_avg, female_sd) - pnorm(61*2.54, female_avg, female_sd)

# Exercise 5. Probability of 1 SD from average
# Calculate the values for heights one standard deviation taller and shorter than the average.
# Calculate the probability that a randomly chosen woman will be within 1 SD from the average height.
# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# To a variable named 'taller', assign the value of a height that is one SD taller than average.
taller <- female_avg+female_sd

# To a variable named 'shorter', assign the value of a height that is one SD shorter than average.
shorter <- female_avg-female_sd

# Calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.
pnorm(taller, female_avg, female_sd) - pnorm(shorter, female_avg, female_sd)

# Exercise 6. Distribution of male heights
# Determine the height of a man in the 99th percentile, given an average height of 69 inches and a standard deviation of 3 inches.
# Assign a variable 'male_avg' as the average male height.
male_avg <- 69

# Assign a variable 'male_sd' as the standard deviation for male heights.
male_sd <- 3

# Determine the height of a man in the 99th percentile of the distribution.
qnorm(0.99, male_avg, male_sd)

# Exercise 7. Distribution of IQ scores
# Use the function rnorm to generate a random distribution of 10,000 values with a given average and standard deviation.
# Use the function max to return the largest value from a supplied vector.
# Repeat the previous steps a total of 1,000 times. Store the vector of the top 1,000 IQ scores as highestIQ.
# Plot the histogram of values using the function hist.
# The variable `B` specifies the number of times we want the simulation to run.
B <- 1000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation.
set.seed(1)

# Create an object called `highestIQ` that contains the highest IQ score from each random distribution of 10,000 people.
highestIQ <- replicate(B, {
  simulated_data <- rnorm(10000, 100, 15)
  max(simulated_data)
})

# Make a histogram of the highest IQ scores.
hist(highestIQ)