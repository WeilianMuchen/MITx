### Author: WeilianMuchen
### Assessment 4 - 2.1 Vectors

## Numeric Vectors:
## Use the function c() to create a numeric vector with the average high temperatures in January for Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto. The average high temperatures are 35, 88, 42, 84, 81, and 30 degrees Fahrenheit. Call the object temp.

# Here is an example creating a numeric vector named cost
cost <- c(50, 75, 90, 100, 150)

# Create a numeric vector to store the temperatures listed in the instructions into a vector named temp
# Make sure to follow the same order in the instructions
temp <- c(35, 88, 42, 84, 81, 30)



## Character vectors:
## The temperatures we stored in temp are from the cities Beijing, Lagos, Paris, Rio de Janeiro, San Juan, and Toronto.
## Create a vector with these city names and call the object city. Make sure to use the correct order, spelling and capitalization!

# here is an example of how to create a character vector
food <- c("pizza", "burgers", "salads", "cheese", "pasta")

# Create a character vector called city to store the city names
# Make sure to follow the same order as in the instructions
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")



## Connecting Numeric and Character Vectors:
## Use the names function and the objects defined in the previous exercises to associate the temperature data with its corresponding city. (You can go back to the previous questions and copy the objects stored.) Note: to see what happened, after assigning the city names to the temp vector, try printing the temp vector to understand how the names are associated with elements of temp.

# Associate the cost values with its corresponding food item
cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food

# You already wrote this code
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Associate the temperature values with its corresponding city
names(temp) <- city



## Subsetting vectors:
##Use the [ and : operators to access the temperature of the first three cities in the list, which are already stored in temp.

# cost of the last 3 items in our food list:
cost[3:5]

# temperatures of the first three cities in the list:
temp[1:3]



## Subsetting vectors continued...:
## This time we will access our object using just the [ operator. Use the [ operator to access the temperature of Paris and San Juan already stored in the temp object.

# Access the cost of pizza and pasta from our food list 
cost[c(1,5)]

# Define temp
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city

# Access the temperatures of Paris and San Juan
temp[c(3,5)]



## Sequences:
## This time we will use just the : operator. Use the : operator to create a sequence of consecutive integers starting at 12 and ending at 73 and save it in an object x, then determine the length of object x.

# Create a vector m of integers that starts at 32 and ends at 99.
m <- 32:99

# Determine the length of object m.
length(m)

# Create a vector x of integers that starts at 12 and ends at 73.
x <- 12:73

# Determine the length of object x.
length(x)



## Sequences continued...:
## Create a vector containing all the positive odd numbers smaller than 100. The numbers should be in ascending order.

# Create a vector with the multiples of 7, smaller than 50.
seq(7, 49, 7) 

# Create a vector containing all the positive odd numbers smaller than 100.
# The numbers should be in ascending order
seq(1, 99, 2)



## Sequences and length:
## Create a vector of numbers that starts at 6, does not go beyond 55, and adds numbers in increments of 4/7. So the first three numbers will be 6, 6+4/7, and 6+8/7. How many numbers does the list have? Use only one line of code to answer both questions.

# We can create a vector with the multiples of 7, smaller than 50 like this 
seq(7, 49, 7) 

# But note that the second argument does not need to be the last number
# It simply determines the maximum value permitted
# so the following line of code produces the same vector as seq(7, 49, 7)
seq(7, 50, 7)

# Create a sequence of numbers from 6 to 55, with 4/7 increments and determine its length
seq(6, 55, 4/7)
length(seq(6, 55, 4/7))



## Sequences of certain length:
## Determine the class of a vector generated with seq using the length.out argument.
## Specifically, what is the class of the following object a <- seq(1, 10, length.out = 100)?

# Store the sequence in the object a
a <- seq(1, 10, length.out = 100)

# Determine the class of a
class(a)



## Integers:
## Does this change depending on what we store in an object? What is the class of the following object a <- seq(1, 10)?

# Store the sequence in the object a
a <- seq(1,10)

# Determine the class of a
class(a)



## Integers and Numerics:
## Confirm that the class of 1 is numeric and the class of 1L is integer.

# Check the class of 1, assigned to the object a
class(1)

# Confirm the class of 1L is integer
class(1L)



## Coercion:
## Define the following vector: x <- c(1, 3, 5,"a")
## Notice that x has been coerced into a character string.
## If we assign something new to a vector that we've already created, the new definition replaces whatever was previously assigned to the vector.
## Convert x to a vector of numbers using the as.numeric() function. (Note that you will get a warning message, but that is okay!)

# Define the vector x
x <- c(1, 3, 5,"a")

# Note that the x is character vector
x

# Redefine `x` to typecast it to get an integer vector using `as.numeric`.
# You will get a warning but that is okay
x <- as.numeric(x)