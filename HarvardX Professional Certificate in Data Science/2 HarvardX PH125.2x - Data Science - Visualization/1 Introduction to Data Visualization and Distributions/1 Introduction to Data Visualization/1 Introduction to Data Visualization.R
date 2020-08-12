### Author: WeilianMuchen
### 1 Introduction to Data Visualization

## Introduction to Data Visualization
library(dslabs)
data(murders)
head(murders)



## Exercise 1. Variable names
## Let's start by reviewing how to extract the variable names from a dataset using the names function. What are the two variable names used in the heights dataset?
library(dslabs)
data(heights)
names(heights)



## Exercise 3. Numerical values
## Use the unique and length functions to determine how many unique heights were reported.
library(dslabs)
data(heights)
x <- heights$height
length(unique(x))



## Exercise 4. Tables
## Use the table function to compute the frequencies of each unique height value. Because we are using the resulting frequency table in a later exercise we want you to save the results into an object and call it tab.
library(dslabs)
data(heights)
x <- heights$height
tab <- table(x)



## Exercise 5. Indicator variables
## In the previous exercise we computed the variable tab which reports the number of times each unique value appears. For values reported only once tab will be 1. Use logicals and the function sum to count the number of times this happens.
library(dslabs)
data(heights)
tab <- table(heights$height)
sum(tab==1)