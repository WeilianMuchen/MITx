### Author: WeilianMuchen
### 4 Exploratory Data Analysis

## Assessment: Robust Summaries with Outliers

# Exercise 1. Exploring the Galton Dataset - Average and Median
# Compute the average and median of these data. Note: do not assign them to a variable.
library(HistData)
data(Galton)
x <- Galton$child
mean(x)
median(x)

# Exercise 2. Exploring the Galton Dataset - SD and MAD
# Compute the standard deviation and the median absolute deviation of these data.
library(HistData)
data(Galton)
x <- Galton$child
sd(x)
mad(x)

# Exercise 3. Error impact on average
# Report how many inches the average grows after this mistake. Specifically, report the difference between the average of the data with the mistake x_with_error and the data without the mistake x.
library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mean(x_with_error)- mean(x)

# Exercise 4. Error impact on SD
# Report how many inches the SD grows after this mistake. Specifically, report the difference between the SD of the data with the mistake x_with_error and the data without the mistake x.
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
sd(x_with_error)- sd(x)

# Exercise 5. Error impact on median
# Report how many inches the median grows after the mistake. Specifically, report the difference between the median of the data with the mistake x_with_error and the data without the mistake x.
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
median(x_with_error)- median(x)

# Exercise 6. Error impact on MAD
# Report how many inches the MAD grows after the mistake. Specifically, report the difference between the MAD of the data with the mistake x_with_error and the data without the mistake x.
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mad(x_with_error)- mad(x)

# Exercise 8. Using EDA to explore changes
# Write a function called error_avg that takes a value k and returns the average of the vector x after the first entry changed to k. Show the results for k=10000 and k=-10000.
x <- Galton$child

error_avg <- function(k){
  x[1] <- k
  mean(x)
}

error_avg(10000)
error_avg(-10000)