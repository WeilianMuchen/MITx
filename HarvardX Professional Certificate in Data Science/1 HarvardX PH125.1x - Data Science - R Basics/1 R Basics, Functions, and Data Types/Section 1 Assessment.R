### Author: WeilianMuchen
### Assessment 3 - Section 1 Assessment

## Q1:
## To find the solutions to an equation of the format 𝑎𝑥2+𝑏𝑥+𝑐, use the quadratic equation: 𝑥=−𝑏±𝑏2−4𝑎𝑐√2𝑎.
## What are the two solutions to  2𝑥2−𝑥−4=0  ? Use the quadratic equation.
## Report the positive solution first, using 3 significant digits for both solutions (both will be numbers).

a <- 2
b <- -1
c <- -4

# Evaluate the equation and store in variables
solution_1 <- (-b + sqrt(b^2 - 4*a*c)) / ( 2*a )
solution_2 <- (-b - sqrt(b^2 - 4*a*c)) / ( 2*a )

# Print the solutions
print(solution_1)
print(solution_2)



## Q2:
## Use R to compute log base 4 of 1024. You can use the help() function to learn how to use arguments to change the base of the log() function.

log(1024, base = 4)



## Q3:
## Q3a: How many rows are in the dataset?
## Q3b: How many different variables are in the dataset?
## Q3c: What is the variable type of title ?
## Q3d: What is the variable type of genre ?

install.packages("dslabs")
library(dslabs)
data(movielens)

# Q3a & Q3b
str(movielens)
# Q3c
str(movielens$title)
# Q3d
str(movielens[["genres"]])



## Q4:
## We already know we can use the levels() function to determine the levels of a factor. A different function, nlevels(), may be used to determine the number of levels of a factor.
## Use this function to determine how many levels are in the factor genres in the movielens data frame.

nlevels(movielens$genres)