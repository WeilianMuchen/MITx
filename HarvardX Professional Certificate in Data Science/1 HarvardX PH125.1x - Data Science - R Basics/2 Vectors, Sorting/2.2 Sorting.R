### Author: WeilianMuchen
### Assessment 5 - 2.2 Sorting

## sort:
## Use the $ operator to access the population size data and store it in the object pop.
## Then use the sort function to redefine pop so that it is sorted.
## Finally use the [ operator to report the smallest population size.

# Access the state variable and store it in an object 
states <- murders$state 

# Sort the object alphabetically and redefine the object 
states <- sort(states) 

# Report the first alphabetical value  
states[1]

# Access population values from the dataset and store it in pop
pop <- murders$population

# Sort the object and save it in the same object
pop <- sort(pop)

# Report the smallest population size 
pop[1]



## order:
## Now instead of the smallest population size, let's find out the row number, in the data frame murders, of the state with the smallest population size.
## This time we need to use order() instead of sort().
## Remember that the entries in the vector murders$population follow the order of the rows of murders.

# Access population from the dataset and store it in pop
pop <- murders$population

# Use the command order to find the vector of indexes that orders pop and store in object ord
ord <- order(pop)

# Find the index number of the entry with the smallest population size
ord[1]



## New Codes:
## Write one line of code that gives the index of the lowest population entry. Use the which.min command.

# Find the index of the smallest value for variable total 
which.min(murders$total)

# Find the index of the smallest value for population
which.min(murders$population)



## Using the output of order:
## Find the index of the smallest state using which.min(murders$population).
## Define a variable states to hold the state names from the murders data frame.
## Combine these to find the state name for the smallest state.

# Define the variable i to be the index of the smallest state
i <- which.min(murders$population)

# Define variable states to hold the states
states <- murders$state

# Use the index you just defined to find the state with the smallest population
states[i]



## Ranks:
## Define a variable states to be the state names from murders
## Use rank(murders$population) to determine the population size rank (from smallest to biggest) of each state.
## Save these ranks in an object called ranks.
## Create a data frame with state names and their respective ranks. Call the data frame my_df.

# Store temperatures in an object 
temp <- c(35, 88, 42, 84, 81, 30)

# Store city names in an object 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Create data frame with city names and temperature 
city_temps <- data.frame(name = city, temperature = temp)

# Define a variable states to be the state names 
states <- murders$state

# Define a variable ranks to determine the population size ranks 
ranks <- rank(rank(murders$population))

# Create a data frame my_df with the state name and its rank
my_df <- data.frame(states = states, ranks = ranks)



## Data Frames, Ranks and Orders:
## Create variables states and ranks to store the state names and ranks by population size respectively.
## Create an object ind that stores the indexes needed to order the population values, using the order command. For example we could define o <- order(murders$population)
## Create a data frame with both variables following the correct order. Use the bracket operator [ to re-order each column in the data frame. For example, states[o] orders the abbreviations based by population size.
## The columns of the data frame must be in the specific order and have the specific names: states, ranks.

# Define a variable states to be the state names from the murders data frame
states <- murders$state

# Define a variable ranks to determine the population size ranks 
ranks <- rank(murders$population)

# Define a variable ind to store the indexes needed to order the population values
ind <- order(murders$population)

# Create a data frame my_df with the state name and its rank and ordered from least populous to most 
my_df <- data.frame(states = states[ind], ranks = ranks[ind])



## NA:
## The is.na returns a logical vector that tells us which entries are NA. Assign the logical vector that is returned by is.na(na_example) to an object called ind.
## Determine how many NAs na_example has, using the sum command.

# Using new dataset 
library(dslabs)
data(na_example)

# Checking the structure 
str(na_example)

# Find out the mean of the entire dataset 
mean(na_example)

# Use is.na to create a logical index ind that tells which entries are NA
ind <- is.na(na_example)

# Determine how many NA ind has using the sum function
sum(ind)



## Removing NAs:
## Write one line of code to compute the average, but only for the entries that are not NA making use of the ! operator before ind. (Remember that you can use help("!") to find out more about what ! does.)

# Note what we can do with the ! operator
x <- c(1, 2, 3)
ind <- c(FALSE, TRUE, FALSE)
x[!ind]

# Create the ind vector
library(dslabs)
data(na_example)
ind <- is.na(na_example)

# We saw that this gives an NA
mean(na_example)

# Compute the average, for entries of na_example that are not NA 
mean(na_example[!ind])