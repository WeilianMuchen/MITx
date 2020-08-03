### Author: WeilianMuchen
### Assessment 9 - 3.2 Basic Data Wrangling

## dplyr
## Use the function mutate to add a murders column named rate with the per 100,000 murder rate.
## Make sure you redefine murders as done in the example code above.

# Loading data
library(dslabs)
data(murders)

# Loading dplyr
library(dplyr)

# Redefine murders so that it includes a column named rate with the per 100,000 murder rates
murders <- mutate(murders, rate =  total / population * 100000)



## mutate
## Use the function mutate to add a column rank containing the rank, from highest to lowest murder rate. Make sure you redefine murders.

# Note that if you want ranks from highest to lowest you can take the negative and ten compute the ranks 
x <- c(88, 100, 83, 92, 94)
rank(-x)

# Defining rate
rate <-  murders$total/ murders$population * 100000

# Redefine murders to include a column named rank
# with the ranks of rate from highest to lowest
murders <- mutate(murders, rank = rank(-rate))



## select
## Use select to show the state names and abbreviations in murders. Just show it, do not define a new object.

# Load dplyr
library(dplyr)

# Use select to only show state names and abbreviations from murders_south
select(murders, state, abb)



## filter
## Use filter to show the top 5 states with the highest murder rates. After we add murder rate and rank, do not change the murders dataset, just show the result. Note that you can filter based on the rank column.

# Add the necessary columns
murders <- mutate(murders, rate = total/population * 100000, rank = rank(-rate))

# Filter to show the top 5 states with the highest murder rates
filter(murders, rank <= 5)



## filter with !=
## Create a new data frame called no_south that removes states from the South region.
## How many states are in this category? You can use the function nrow for this.

# Use filter to create a new data frame no_south
no_south <- filter(murders, region != "South" )

# Number of states (rows) in this category 
nrow(no_south)



## filter with %in%
## Create a new data frame called murders_nw with only the states from the Northeast and the West.
## How many states are in this category?

# Create a new data frame called murders_nw with only the states from the northeast and the west
murders_nw <- filter(murders, region %in% c("Northeast", "West"))

# Number of states (rows) in this category
nrow(murders_nw)



## filtering by two conditions
## Add a murder rate column and a rank column as done before
## Create a table, call it my_states, that satisfies both the conditions: it is in the Northeast or West and the murder rate is less than 1.
## Use select to show only the state name, the rate and the rank

# add the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# Create a table, call it `my_states`, that satisfies both the conditions 
my_states <- filter(murders, region %in% c("Northeast", "West") & rate < 1)

# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank)



## Using the pipe %>%
## Repeat the previous exercise, but now instead of creating a new object, show the result and only include the state, rate, and rank columns in that order.
## Use a pipe %>% to do this in just one line.

## Define the rate and rank column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# show the result and only include the state, rate, and rank columns, all in one line, in that order
filter(murders, region %in% c("Northeast", "West") & rate < 1) %>%  
  select(state, rate, rank)



## mutate, filter and select
## The original dataset murders
## A call to mutate to add the murder rate and the rank.
## A call to filter to keep only the states from the Northeast or West and that have a murder rate below 1.
## A call to select that keeps only the columns with the state name, the murder rate, and the rank.

# Loading the libraries
library(dplyr)
data(murders)

# Create new data frame called my_states (with specifications in the instructions)
my_states <- murders %>% 
  mutate(rate =  total / population * 100000, rank = rank(-rate)) %>%
  filter(region %in% c("Northeast", "West") & rate < 1) %>%
  select(state, rate, rank)