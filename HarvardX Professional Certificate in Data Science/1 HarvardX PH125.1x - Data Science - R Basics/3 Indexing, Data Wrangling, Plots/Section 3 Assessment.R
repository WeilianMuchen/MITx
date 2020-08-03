### Author: WeilianMuchen
### Assessment 11 - Section 3 Assessment

library(dslabs)
data(heights)
options(digits = 3)    # report 3 significant digits for all answers

# Q1
# First, determine the average height in this dataset. Then create a logical vector ind with the indices for those individuals who are above average height.
# How many individuals in the dataset are above average height?
str(heights)
ind <- heights$height > mean(heights$height)
sum(ind)

# Q2
# How many individuals in the dataset are above average height and are female?
sum(ind & heights$sex == "Female")

# Q3
# If you use mean() on a logical (TRUE/FALSE) vector, it returns the proportion of observations that are TRUE.
# What proportion of individuals in the dataset are female?

mean(heights$sex == "Female")

# Q4: This question takes you through three steps to determine the sex of the individual with the minimum height.
# Q4a: Determine the minimum height in the heights dataset.
min(heights$height)

# Q4b: Use the match() function to determine the index of the first individual with the minimum height.
match(min(heights$height),heights$height)

# Q4c: Subset the sex column of the dataset by the index in 4b to determine the individual’s sex.
heights$sex[match(min(heights$height),heights$height)]

# Q5: This question takes you through three steps to determine how many of the integer height values between the minimum and maximum heights are not actual heights of individuals in the heights dataset.
# Q5a: Determine the maximum height.
max(heights$height)

# Q5b: Which integer values are between the maximum and minimum heights? For example, if the minimum height is 10.2 and the maximum height is 20.8, your answer should be x <- 11:20 to capture the integers in between those values. (If either the maximum or minimum height are integers, include those values too.)
# Write code to create a vector x that includes the integers between the minimum and maximum heights (as numbers).
x <- 50:82

# Q5c: How many of the integers in x are NOT heights in the dataset?
sum(!(x %in% heights$height))

# Q6: Using the heights dataset, create a new column of heights in centimeters named ht_cm. Recall that 1 inch = 2.54 centimeters. Save the resulting dataset as heights2.
# Q6a: What is the height in centimeters of the 18th individual (index 18)?
heights2 <- heights$height * 2.54
heights2[18]

heights2 <- mutate(heights, ht_cm = height*2.54) # Method2
heights2$ht_cm[18]

# Q6b: What is the mean height in centimeters?
mean(heights2)

mean(heights2$ht_cm) # Method2

# Q7: Create a data frame females by filtering the heights2 data to contain only female individuals.
females <- filter(heights2, sex == "Female")
nrow(females)

mean(heights2$sex == "Female") * 1050 # Method2

# Q7b: What is the mean height of the females in centimeters?
mean(females$ht_cm)

mean(females$height) * 2.54 # Method2

# Q8: The olive dataset in dslabs contains composition in percentage of eight fatty acids found in the lipid fraction of 572 Italian olive oils:
library(dslabs)
data(olive)
head(olive)
# Plot the percent palmitic acid versus palmitoleic acid in a scatterplot. What relationship do you see?
plot(olive$palmitic, olive$palmitoleic)

# Q9: Create a histogram of the percentage of eicosenoic acid in olive. Which of the following is true?
hist(olive$eicosenoic)
  
# Q10: Make a boxplot of palmitic acid percentage in olive with separate distributions for each region.
# Which region has the highest median palmitic acid percentage?
# Which region has the most variable palmitic acid percentage?
boxplot(palmitic ~ region, data = olive)