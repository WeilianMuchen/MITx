### Author: WeilianMuchen
### 2 The Central Limit Theorem Continued

## DataCamp Assessment: The Central Limit Theorem
# Exercise 1. American Roulette probability of winning money
# Execute the sample code to determine the expected value avg and standard error se as you have done in previous exercises.
# Use the pnorm function to determine the probability of winning money.
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)

# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times. 
1 - pnorm(0, avg,se)

# Exercise 2. American Roulette Monte Carlo simulation
# Use the replicate function to replicate the sample code for B <- 10000 simulations.
# Within replicate, use the sample function to simulate n <- 100 outcomes of either a win (17) or a loss (-1) for the bet. Use the order c(17, -1) and corresponding probabilities. Then, use the sum function to add up the winnings over all iterations of the model. Make sure to include sum or DataCamp may crash with a "Session Expired" error.
# Use the mean function to compute the average winnings.
# Use the sd function to compute the standard deviation of the winnings.
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.
S <- replicate(B,{  
  X <- sample(c(17,-1), size = n, replace = TRUE, prob = c(p_green, p_not_green))
  sum(X)
})

# Compute the average value for 'S'
mean(S)

# Calculate the standard deviation of 'S'
sd(S)

# Exercise 3. American Roulette Monte Carlo vs CLT
# Use the mean function to calculate the probability of winning money from the Monte Carlo simulation, S.
# Calculate the proportion of outcomes in the vector `S` that exceed $0
mean(S>0)

# Exercise 5. American Roulette average winnings per bet
# Run a single Monte Carlo simulation of 10,000 bets using the following steps. (You do not need to replicate the sample code.)
# Specify n as the number of times you want to sample from the possible outcomes.
# Use the sample function to return n values from a vector of possible values: winning $17 or losing $1. Be sure to assign a probability to each outcome and indicate that you are sampling with replacement.
# Calculate the average result per bet placed using the mean function.
# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Define the number of bets using the variable 'n'
n <- 10000

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green

# Create a vector called `X` that contains the outcomes of `n` bets
X <- sample(c(17,-1), size = n, replace = TRUE, prob = c(p_green, p_not_green))

# Define a variable `Y` that contains the mean outcome per bet. Print this mean to the console.
Y <- mean(X)
Y

# Exercise 6. American Roulette per bet expected value
# Using the chances of winning $17 (p_green) and the chances of losing $1 (p_not_green), calculate the expected outcome of a bet that the ball will land in a green pocket.
# Use the expected value formula rather than a Monte Carlo simulation.
# Print this value to the console (do not assign it to a variable).
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green

# Use the expected value formula to calculate the expected outcome of `Y`, the mean outcome per bet in 10,000 bets
17*p_green + -1*p_not_green

# Exercise 7. American Roulette per bet standard error
# Compute the standard error of Y, the average result of 10,000 independent spins.
# Define the number of bets using the variable 'n'
n <- 10000

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green

# Compute the standard error of 'Y', the mean outcome per bet from 10,000 bets.
abs((17 - -1))*sqrt(p_green*p_not_green) / sqrt(n)

# Exercise 8. American Roulette winnings per game are positive
# Execute the code that we wrote in previous exercises to determine the average and standard error.
# Use the pnorm function to determine the probability of winning more than $0.
# We defined the average using the following code
avg <- 17*p_green + -1*p_not_green

# We defined standard error using this equation
se <- 1/sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
1 - pnorm(0, avg, se)

# Exercise 9. American Roulette Monte Carlo again
# Use the replicate function to model 10,000 iterations of a series of 10,000 bets.
# Each iteration inside replicate should simulate 10,000 bets and determine the average outcome of those 10,000 bets. If you forget to take the mean, DataCamp will crash with a "Session Expired" error.
# Find the average of the 10,000 average outcomes. Print this value to the console.
# Compute the standard deviation of the 10,000 simulations. Print this value to the console.
## Make sure you fully follow instructions, including printing values to the console and correctly running the `replicate` loop. If not, you may encounter "Session Expired" errors.

# The variable `n` specifies the number of independent bets on green
n <- 10000

# The variable `B` specifies the number of times we want the simulation to run
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation
set.seed(1)

# Generate a vector `S` that contains the the average outcomes of 10,000 bets modeled 10,000 times
S <- replicate(B,{  
  X <- sample(c(17,-1), size = n, replace = TRUE, prob = c(p_green, p_not_green))
  mean(X)
})

# Compute the average of `S`. Print this value to the console.
mean(S)

# Compute the standard deviation of `S`. Print this value to the console.
sd(S)

# Exercise 10. American Roulette comparison
# Compute the proportion of outcomes in the vector 'S' where you won more than $0
mean(S>0)