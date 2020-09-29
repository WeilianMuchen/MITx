### Author: WeilianMuchen
### 2 Data Visualization Principles, Part2

## Show the Data
# dot plot showing the data
heights %>% ggplot(aes(sex, height)) + geom_point()

# jittered, alpha blended point plot
heights %>% ggplot(aes(sex, height)) + geom_jitter(width = 0.1, alpha = 0.2)

# Ease Comparisons: Compared Visual Cues Should Be Adjacent
color_blind_friendly_cols <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

p1 <- data.frame(x = 1:8, y = 1:8, col = as.character(1:8)) %>%
  ggplot(aes(x, y, color = col)) +
  geom_point(size = 5)
p1 + scale_color_manual(values = color_blind_friendly_cols)

## Assessment: Data Visualization Principles, Part 2
# Exercise 1: Customizing plots - watch and learn
# Redefine the state object so that the levels are re-ordered by rate.
# Print the new object state and its levels (using levels) so you can see that the vector is now re-ordered by the levels.
state <- reorder(state, rate)
print(state)
levels(state)

# Exercise 2: Customizing plots - redefining
# Add a single line of code to the definition of the dat table that uses mutate to reorder the states by the rate variable.
# The sample code provided will then create a bar plot using the newly defined dat.
library(dplyr)
library(ggplot2)
library(dslabs)
data(us_contagious_diseases)
dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>%
  mutate(state = reorder(state, rate))
dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()

# Exercise 4: Making a box plot
# Order the regions by their median murder rate by using mutate and reorder.
# Make a box plot of the murder rates by region.
# Show all of the points on the box plot.
library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
murders %>% mutate(rate = total/population*100000) %>%
  mutate(region=reorder(region, rate, FUN=median)) %>%
  ggplot(aes(region, rate)) +
  geom_boxplot() +
  geom_point()