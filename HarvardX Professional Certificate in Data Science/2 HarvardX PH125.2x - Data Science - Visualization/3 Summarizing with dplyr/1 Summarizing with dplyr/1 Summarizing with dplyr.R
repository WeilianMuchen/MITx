### Author: WeilianMuchen
### 1 Summarizing with dplyr

## dplyr
library(tidyverse)
library(dslabs)
data(heights)

# compute average and standard deviation for males
s <- heights %>%
  filter(sex == "Male") %>%
  summarize(average = mean(height), standard_deviation = sd(height))

# access average and standard deviation from summary table
s$average
s$standard_deviation

# compute median, min and max
heights %>%
  filter(sex == "Male") %>%
  summarize(median = median(height),
            minimum = min(height),
            maximum = max(height))
# alternative way to get min, median, max in base R
quantile(heights$height, c(0, 0.5, 1))

# NOTE: The following code will NOT generate an error if using dplyr 1.0 or later

# generates an error: summarize can only take functions that return a single value
heights %>%
  filter(sex == "Male") %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))

## The Dot Placeholder
library(tidyverse)
library(dslabs)
data(murders)

murders <- murders %>% mutate(murder_rate = total/population*100000)
summarize(murders, mean(murder_rate))

# calculate US murder rate, generating a data frame
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 100000)
us_murder_rate

# extract the numeric US murder rate with the dot operator
us_murder_rate %>% .$rate

# calculate and extract the murder rate with one pipe
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 100000) %>%
  .$rate

## Group By
# libraries and data
library(tidyverse)
library(dslabs)
data(heights)
data(murders)

# compute separate average and standard deviation for male/female heights
heights %>%
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))

# compute median murder rate in 4 regions of country
murders <- murders %>%
  mutate(murder_rate = total/population * 100000)
murders %>%
  group_by(region) %>%
  summarize(median_rate = median(murder_rate))

## Sorting Data Tables
# libraries and data
library(tidyverse)
library(dslabs)
data(murders)

# set up murders object
murders <- murders %>%
  mutate(murder_rate = total/population * 100000)

# arrange by population column, smallest to largest
murders %>% arrange(population) %>% head()

# arrange by murder rate, smallest to largest
murders %>% arrange(murder_rate) %>% head()

# arrange by murder rate in descending order
murders %>% arrange(desc(murder_rate)) %>% head()

# arrange by region alphabetically, then by murder rate within each region
murders %>% arrange(region, murder_rate) %>% head()

# show the top 10 states with highest murder rate, not ordered by rate
murders %>% top_n(10, murder_rate)

# show the top 10 states with highest murder rate, ordered by rate
murders %>% arrange(desc(murder_rate)) %>% top_n(10)

## Assessment: Summarizing with dplyr
# Exercise 1. Blood pressure 1
# Filter the NHANES dataset so that only 20-29 year old females are included and assign this new data frame to the object tab.
# Use the pipe to apply the function filter, with the appropriate logicals, to NHANES.
#  Remember that this age group is coded with 20-29, which includes a space. You can use head to explore the NHANES table to construct the correct call to filter.
library(dplyr)
library(NHANES)
data(NHANES)
tab <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female")

# Exercise 2. Blood pressure 2
# Complete the line of code to save the average and standard deviation of systolic blood pressure as average and standard_deviation to a variable called ref.
# Use the summarize function after filtering for 20-29 year old females and connect the results using the pipe %>%. When doing this remember there are NAs in the data!
library(dplyr)
library(NHANES)
data(NHANES)
ref <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm = TRUE))
ref

# Exercise 3. Summarizing averages
# Modify the line of sample code to assign the average to a numeric variable called ref_avg using the . or pull.
library(dplyr)
library(NHANES)
data(NHANES)
ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE)) %>%
  .$average

# Exercise 4. Min and max
# Report the min and max values for the same group as in the previous exercises.
# Use filter and summarize connected by the pipe %>% again. The functions min and max can be used to get the values you want.
# Within summarize, save the min and max of systolic blood pressure as minbp and maxbp.

library(NHANES)
data(NHANES)
NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>%
  summarize(minbp = min(BPSysAve, na.rm = TRUE), 
            maxbp = max(BPSysAve, na.rm = TRUE))

# Exercise 5. group_by
# Use the functions filter, group_by, summarize, and the pipe %>% to compute the average and standard deviation of systolic blood pressure for females for each age group separately.
# Within summarize, save the average and standard deviation of systolic blood pressure (BPSysAve) as average and standard_deviation.
# Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>%
  filter(Gender == "female") %>%
  group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE))

# Exercise 6. group_by example 2
# Calculate the average and standard deviation of systolic blood pressure for males for each age group separately using the same methods as in the previous exercise.
# Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
library(NHANES)
data(NHANES)
NHANES %>%
  filter(Gender == "male") %>%
  group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE))

# Exercise 7. group_by example 3
# Create a single summary table for the average and standard deviation of systolic blood pressure using group_by(AgeDecade, Gender).
#  Note that we no longer have to filter!
#  Your code within summarize should remain the same as in the previous exercises.
# Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.
library(NHANES)
data(NHANES)
NHANES %>%
  group_by(AgeDecade, Gender) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE))

# Exercise 8. Arrange
# Compute the average and standard deviation for each value of Race1 for males in the age decade 40-49.
# Order the resulting table from lowest to highest average systolic blood pressure.
# Use the functions filter, group_by, summarize, arrange, and the pipe %>% to do this in one line of code.
# Within summarize, save the average and standard deviation of systolic blood pressure as average and standard_deviation.
library(dplyr)
library(NHANES)
data(NHANES)
NHANES %>%
  filter(Gender == "male" & AgeDecade==" 40-49") %>%
  group_by(Race1) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>%
  arrange(average)