### Author: WeilianMuchen
### 3 Addition Rule and Monty Hall

## The Monty Hall Problem
# Code: Monte Carlo simulation of stick strategy
B <- 10000
stick <- replicate(B, {
  doors <- as.character(1:3)
  prize <- sample(c("car","goat","goat"))    # puts prizes in random order
  prize_door <- doors[prize == "car"]    # note which door has prize
  my_pick  <- sample(doors, 1)    # note which door is chosen
  show <- sample(doors[!doors %in% c(my_pick, prize_door)],1)    # open door with no prize that isn't chosen
  stick <- my_pick    # stick with original door
  stick == prize_door    # test whether the original door has the prize
})
mean(stick)    # probability of choosing prize door when sticking

# Code: Monte Carlo simulation of switch strategy
switch <- replicate(B, {
  doors <- as.character(1:3)
  prize <- sample(c("car","goat","goat"))    # puts prizes in random order
  prize_door <- doors[prize == "car"]    # note which door has prize
  my_pick  <- sample(doors, 1)    # note which door is chosen first
  show <- sample(doors[!doors %in% c(my_pick, prize_door)], 1)    # open door with no prize that isn't chosen
  switch <- doors[!doors%in%c(my_pick, show)]    # switch to the door that wasn't chosen first or opened
  switch == prize_door    # test whether the switched door has the prize
})
mean(switch)    # probability of choosing prize door when switching

## DataCamp Assessment: The Addition Rule and Monty Hall
# Exercise 1. The Cavs and the Warriors
# Assign the number of remaining games to the variable n.
# Assign a variable outcomes as a vector of possible outcomes in a single game, where 0 indicates a loss and 1 indicates a win for the Cavs.
# Assign a variable l to a list of all possible outcomes in all remaining games. Use the rep function to create a list of n games, where each game consists of list(outcomes).
# Use the expand.grid function to create a data frame containing all the combinations of possible outcomes of the remaining games.
# Use the rowSums function to identify which combinations of game outcomes result in the Cavs winning the number of games necessary to win the series.
# Use the mean function to calculate the proportion of outcomes that result in the Cavs winning the series and print your answer to the console.

# Assign a variable 'n' as the number of remaining games.
n <- 6

# Assign a variable `outcomes` as a vector of possible game outcomes, where 0 indicates a loss and 1 indicates a win for the Cavs.
outcomes <- c(0,1)

# Assign a variable `l` to a list of all possible outcomes in all remaining games. Use the `rep` function on `list(outcomes)` to create list of length `n`. 
l <- rep(list(outcomes), n)

# Create a data frame named 'possibilities' that contains all combinations of possible outcomes for the remaining games.
possibilities <- expand.grid(l)

# Create a vector named 'results' that indicates whether each row in the data frame 'possibilities' contains enough wins for the Cavs to win the series.
results <- rowSums(possibilities)>=4

# Calculate the proportion of 'results' in which the Cavs win the series. Print the outcome to the console.
mean(results)

# Exercise 2. The Cavs and the Warriors - Monte Carlo
# Use the replicate function to replicate the sample code for B <- 10000 simulations.
# Use the sample function to simulate a series of 6 games with random, independent outcomes of either a loss for the Cavs (0) or a win for the Cavs (1) in that order. Use the default probabilities to sample.
# Use the sum function to determine whether a simulated series contained at least 4 wins for the Cavs.
# Use the mean function to find the proportion of simulations in which the Cavs win at least 4 of the remaining games. Print your answer to the console.

# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `results` that replicates for `B` iterations a simulated series and determines whether that series contains at least four wins for the Cavs.
results <- replicate(B, {
  cavs_wins <- sample(c(0,1), 6, replace = TRUE)
  sum(cavs_wins)>=4 
})

# Calculate the frequency out of `B` iterations that the Cavs won at least four games in the remainder of the series. Print your answer to the console. 
mean(results)

# Exercise 3. A and B play a series - part 1
# Use the function sapply to compute the probability, call it Pr of winning for p <- seq(0.5, 0.95, 0.025).
# Then plot the result plot(p, Pr).

# Let's assign the variable 'p' as the vector of probabilities that team A will win.
p <- seq(0.5, 0.95, 0.025)

# Given a value 'p', the probability of winning the series for the underdog team B can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(p){
  B <- 10000
  result <- replicate(B, {
    b_win <- sample(c(1,0), 7, replace = TRUE, prob = c(1-p, p))
    sum(b_win)>=4
  })
  mean(result)
}

# Apply the 'prob_win' function across the vector of probabilities that team A will win to determine the probability that team B will win. Call this object 'Pr'.
Pr <- sapply(p, prob_win)

# Plot the probability 'p' on the x-axis and 'Pr' on the y-axis.
plot(p, Pr)

# Exercise 4. A and B play a series - part 2
# Use the seq function to generate a list of odd numbers ranging from 1 to 25.
# Use the function sapply to compute the probability, call it Pr, of winning during series of different lengths.
# Then plot the result plot(N, Pr).

# Given a value 'p', the probability of winning the series for the underdog team $B$ can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(N, p=0.75){
  B <- 10000
  result <- replicate(B, {
    b_win <- sample(c(1,0), N, replace = TRUE, prob = c(1-p, p))
    sum(b_win)>=(N+1)/2
  })
  mean(result)
}

# Assign the variable 'N' as the vector of series lengths. Use only odd numbers ranging from 1 to 25 games.
N <- seq(1, 25, 2)

# Apply the 'prob_win' function across the vector of series lengths to determine the probability that team B will win. Call this object `Pr`.
Pr<- sapply(N, prob_win)

# Plot the number of games in the series 'N' on the x-axis and 'Pr' on the y-axis.
plot(N, Pr)