### Author: WeilianMuchen
### Assessment 8 - 3.1 Indexing

## Logical Vectors
## Compute the per 100,000 murder rate for each state and store it in an object called murder_rate.
## Then use the logical operators to create a logical vector, name it low, that tells us which entries of murder_rate are lower than 1, and which are not, in one line of code.

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1



## which
## Use the results from the previous exercise and the function which to determine the indices of murder_rate associated with values lower than 1.

# Store the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000

# Store the murder_rate < 1 in low 
low <- murder_rate < 1

# Get the indices of entries that are below 1
which(low)



## Ordering vectors
## Use the results from the previous exercise to report the names of the states with murder rates lower than 1, using the square brackets to retrieve the names of the states from the dataset.

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1

# Names of states with murder rates lower than 1 
murders$state[low]

## Filtering
## Define low as before.
## Use the & operator to create a new object ind that is true when low is true and the state is in the Northeast
## Use the brackets [ and ind to show the state names that satisfy this condition

# Store the murder rate per 100,000 for each state, in `murder_rate`
murder_rate <- murders$total/murders$population*100000

# Store the `murder_rate < 1` in `low` 
low <- murder_rate < 1

# States in the Northeast with murder rates lower than 1; store in 'ind'
ind <- low & murders$region=="Northeast"

# Names of states in `ind`
murders$state[ind]



## Filtering continued
## How many states are below the average?

# Store the murder rate per 100,000 for each state, in murder_rate
murder_rate <- murders$total/murders$population*100000

# Compute the average murder rate using `mean` and store it in object named `avg`
avg <-mean(murder_rate)

# How many states are < avg ? Check using sum 
sum(murder_rate < avg)



## Match
## Define a character vector with the abbreviations.
## Start by defining an index of the entries of murders$abb that match the three abbreviations.
## Use the [ operator to extract the states.

# Store the 3 abbreviations in a vector called `abbs` (remember that they are character vectors and need quotes)
abbs <- c("AK", "MI", "IA")

# Match the abbs to the murders$abb and store in `ind`
ind <- match(abbs , murders$abb)

# Print state names from `ind`
murders$state[ind]



## %in%
## Define a character vector with the abbreviations MA, ME, MI, MO, MU.
## Use the %in% operator to create a logical vector that is TRUE when the abbreviation is in murders$abb.

# Store the 5 abbreviations in abbs. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU") 

# Use the %in% command to check if the entries of abbs are abbreviations in the the murders data frame
abbs%in%murders$abb



## Logical operator
## In a previous exercise we computed the index abbs%in%murders$abb. Based on that, and using the which function and the ! operator, get the index of the entries of abbs that are not abbreviations.
## Show the entries of abbs that are not actual abbreviations.

# Store the 5 abbreviations in `abbs`. (remember that they are character vectors)
abbs <- c("MA", "ME", "MI", "MO", "MU") 

# Use the `which` command and `!` operator to find out which index abbreviations are not actually part of the dataset and store in 'ind' 
ind <- which(!abbs%in%murders$abb)

# Names of abbreviations in `ind`
abbs[ind]