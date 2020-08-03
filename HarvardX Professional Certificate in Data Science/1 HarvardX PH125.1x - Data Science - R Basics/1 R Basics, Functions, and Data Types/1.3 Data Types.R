### Author: WeilianMuchen
### Assessment 2 - 1.3 Data Types

## Variable names:
## For this question, we will use the names() function to extract the column names of the murders data frame.
## What are the column names used by the murders data frame for the five variables?

# Load package and data
library(dslabs)
data(murders)

# Use the function names to extract the variable names 
names(murders)



## xamining Variables:
## Use the accessor $ to extract the state abbreviations and assign them to the object a. What is the class of this object?

# To access the population variable from the murders dataset use this code:
p <- murders$population 

# To determine the class of object `p` we use this code:
class(p)

# Use the accessor to extract state abbreviations and assign it to a
a <- murders$abb
# Determine the class of a
class(a)



## Multiple ways to access variables:
## Use the square brackets [[ to extract the state abbreviations and assign them to the object b.
## Then use the identical function to determine if a, as defined in the previous exercises, and b are the same.

# We extract the population like this:
p <- murders$population

# This is how we do the same with the square brackets:
o <- murders[["population"]] 

# We can confirm these two are the same
identical(o, p)

# Use square brackets to extract `abb` from `murders` and assign it to b
b <- murders[["abb"]]
# Check if `a` and `b` are identical 
identical(a, b)



## Factors:
## For this question we will combine two functions, in a nested way, to determine the number of unique categories. Use the functions levels and length to determine the number of regions defined by this dataset and contained in murders$region.

# We can see the class of the region variable using class
class(murders$region)

# Determine the number of regions included in this variable 
length(levels(murders$region))



## Tables:
## Use the table function in one line of code to create a table showing the number of states per region.

# The "c" in `c()` is short for "concatenate," which is the action of connecting items into a chain
# The function `c()` connects all of the strings within it into a single vector, which we can assign to `x`
x <- c("a", "a", "b", "b", "b", "c")
# Here is an example of what the table function does
table(x)
str(murders)
print(murders$region)
# Write one line of code to show the number of states per region
table(murders$region)