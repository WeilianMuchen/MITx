### Author: WeilianMuchen
### Assessment 7 - Section 2 Assessment

## Q1:
##  x <- c(2, 43, 27, 96, 18)
## Match the following outputs to the function which produces that output. Options include sort(x), order(x), rank(x) and none of these.

# 1, 2, 3, 4, 5
# none of these

# 1, 5, 3, 2, 4
order(x)

# 1, 4, 3, 5, 2
rank(x)

# 2, 18, 27, 43, 96
sort(x)



## Q2:
## Continue working with the vector x defined in question 1.
## Match the following functions to their output. Options include integers 1 through 5 and none of these.

# min(x) = 2

# which.min(x) = 1

# max(x) = 96

# which.max(x) = 4



## Q3:
## Mandi, Amy, Nicole, and Olivia all ran different distances in different time intervals. Their distances (in miles) and times (in minutes) are as follows:
## name <- c("Mandi", "Amy", "Nicole", "Olivia")
## distance <- c(0.8, 3.1, 2.8, 4.0)
## time <- c(10, 30, 40, 50)
## Write a line of code to convert time to hours. Remember there are 60 minutes in an hour. Then write a line of code to calculate the speed of each runner in miles per hour. Speed is distance divided by time.

time <- time/60
speed <- distance/time
data.frame(name = name, time = time, speed = speed)

# How many hours did Olivia run?

# What was Mandi's speed in miles per hour?

# Which runner had the fastest speed?
i <- which.max(speed)
name[i]