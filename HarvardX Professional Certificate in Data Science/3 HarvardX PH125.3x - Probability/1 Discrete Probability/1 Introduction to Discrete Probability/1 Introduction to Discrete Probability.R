### Author: WeilianMuchen
### 1 Introduction to Discrete Probability

## Monte Carlo Simulations
beads <- rep(c("red", "blue"), times = c(2,3))    # create an urn with 2 red, 3 blue
beads    # view beads object
sample(beads, 1)    # sample 1 bead at random

B <- 10000    # number of times to draw 1 bead
events <- replicate(B, sample(beads, 1))    # draw 1 bead, B times
tab <- table(events)    # make a table of outcome counts
tab    # view count table
prop.table(tab)    # view table of outcome proportions

events <- sample(beads, B, replace = TRUE)
prop.table(table(events))

## Setting the Random Seed
## If you are running R 3.6, you can revert to the original seed setting behavior by adding the argument sample.kind="Rounding". For example:
set.seed(1)
set.seed(1, sample.kind="Rounding")    # will make R 3.6 generate a seed as in R 3.5

## Using the mean Function for Probability
mean(beads == "blue")

## DataCamp Assessment: Introduction to Discrete Probability
# Exercise 1. Probability of cyan - generalized
cyan <- 3
magenta <- 5
yellow <- 7

# Assign a variable `p` as the probability of choosing a cyan ball from the box
p <- cyan / (cyan + magenta + yellow)

# Print the variable `p` to the console
p

## Exercise 2. Probability of not cyan - generalized
# Using the probability of choosing a cyan ball, p, calculate the probability of choosing any other ball.
# `p` is defined as the probability of choosing a cyan ball from a box containing: 3 cyan balls, 5 magenta balls, and 7 yellow balls.
# Using variable `p`, calculate the probability of choosing any ball that is not cyan from the box
1 - p

## Exercise 3. Sampling without replacement - generalized
# Calculate the conditional probability p_2 of choosing a ball that is not cyan after one cyan ball has been removed from the box.
# Calculate the joint probability of both choosing a cyan ball on the first draw and a ball that is not cyan on the second draw using p_1 and p_2.
cyan <- 3
magenta <- 5
yellow <- 7

# The variable `p_1` is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable `p_2` as the probability of not choosing a cyan ball on the second draw without replacement.
p_2 <- 1 - (cyan - 1) / (cyan + magenta + yellow - 1)

# Calculate the probability that the first draw is cyan and the second draw is not cyan.
p_1 * p_2

## Exercise 4. Sampling with replacement - generalized
# Calculate the probability p_2 of choosing a ball that is not cyan on the second draw, with replacement.
# Next, use p_1 and p_2 to calculate the probability of choosing a cyan ball on the first draw and a ball that is not cyan on the second draw (after replacing the first ball).
cyan <- 3
magenta <- 5
yellow <- 7

# The variable 'p_1' is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable 'p_2' as the probability of not choosing a cyan ball on the second draw with replacement.
p_2 <- 1 - (cyan) / (cyan + magenta + yellow)

# Calculate the probability that the first draw is cyan and the second draw is not cyan using `p_1` and `p_2`.
p_1 * p_2