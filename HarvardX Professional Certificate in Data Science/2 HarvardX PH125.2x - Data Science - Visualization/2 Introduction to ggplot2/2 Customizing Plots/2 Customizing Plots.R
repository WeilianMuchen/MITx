### Author: WeilianMuchen
### 2 Customizing Plots

## Layers
# Code: Adding layers to a plot
library(tidyverse)
library(dslabs)
data(murders)

murders %>% ggplot() +
  geom_point(aes(x = population/10^6, y = total))

# add points layer to predefined ggplot object
p <- ggplot(data = murders)
p + geom_point(aes(population/10^6, total))

# add text layer to scatterplot
p + geom_point(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))

# Code: Example of aes behavior
# no error from this call
p_test <- p + geom_text(aes(population/10^6, total, label = abb))

# error - "abb" is not a globally defined variable and cannot be found outside of aes
p_test <- p + geom_text(aes(population/10^6, total), label = abb)

## Tinkering
# change the size of the points
p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb))

# move text labels slightly to the right
p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1)

# simplify code by adding global aesthetic
p <- murders %>% ggplot(aes(population/10^6, total, label = abb))
p + geom_point(size = 3) +
  geom_text(nudge_x = 1.5)

# local aesthetics override global aesthetics
p + geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Hello there!"))

## Scales, Labels, and Colors
# Code: Log-scale the x- and y-axis
# define p
library(tidyverse)
library(dslabs)
data(murders)
p <- murders %>% ggplot(aes(population/10^6, total, label = abb))

# log base 10 scale the x-axis and y-axis
p + geom_point(size = 3) +
  geom_text(nudge_x = 0.05) +
  scale_x_continuous(trans = "log10") +
  scale_y_continuous(trans = "log10")

# efficient log scaling of the axes
p + geom_point(size = 3) +
  geom_text(nudge_x = 0.075) +
  scale_x_log10() +
  scale_y_log10()

# Code: Add labels and title
p + geom_point(size = 3) +
  geom_text(nudge_x = 0.075) +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010")

# Code: Change color of the points
# redefine p to be everything except the points layer
p <- murders %>%
  ggplot(aes(population/10^6, total, label = abb)) +
  geom_text(nudge_x = 0.075) +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010")

# make all points blue
p + geom_point(size = 3, color = "blue")

# color points by region
p + geom_point(aes(col = region), size = 3)

#Code: Add a line with average murder rate
# define average murder rate
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)

# basic line with average murder rate for the country
p + geom_point(aes(col = region), size = 3) +
  geom_abline(intercept = log10(r))    # slope is default of 1

# change line to dashed and dark grey, line under points
p + geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col = region), size = 3)

# Code: Change legend title
p <- p + scale_color_discrete(name = "Region")    # capitalize legend title


## Add-on Packages
# Code: Adding themes
# theme used for graphs in the textbook and course
library(dslabs)
ds_theme_set()

# themes from ggthemes
library(ggthemes)
p + theme_economist()    # style of the Economist magazine
p + theme_fivethirtyeight()    # style of the FiveThirtyEight website

# Code: Putting it all together to assemble the plot
# load libraries
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(dslabs)
data(murders)

# define the intercept
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  .$rate

# make the plot, combining all elements
murders %>%
  ggplot(aes(population/10^6, total, label = abb)) +
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col = region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name = "Region") +
  theme_economist()

## Other Examples
# Code: Histograms in ggplot2
# load heights data
library(tidyverse)
library(dslabs)
data(heights)

# define p
p <- heights %>%
  filter(sex == "Male") %>%
  ggplot(aes(x = height))

# basic histograms
p + geom_histogram()
p + geom_histogram(binwidth = 1)

# histogram with blue fill, black outline, labels and title
p + geom_histogram(binwidth = 1, fill = "blue", col = "black") +
  xlab("Male heights in inches") +
  ggtitle("Histogram")

# Code: Smooth density plots in ggplot2
p + geom_density()
p + geom_density(fill = "blue")

# Code: Quantile-quantile plots in ggplot2
# basic QQ-plot
p <- heights %>% filter(sex == "Male") %>%
  ggplot(aes(sample = height))
p + geom_qq()

# QQ-plot against a normal distribution with same mean/sd as data
params <- heights %>%
  filter(sex == "Male") %>%
  summarize(mean = mean(height), sd = sd(height))
p + geom_qq(dparams = params) +
  geom_abline()

# QQ-plot of scaled data against the standard normal distribution
heights %>%
  ggplot(aes(sample = scale(height))) +
  geom_qq() +
  geom_abline()

# Code: Grids of plots with the gridExtra package
# define plots p1, p2, p3
p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")

# arrange plots next to each other in 1 row, 3 columns
library(gridExtra)
grid.arrange(p1, p2, p3, ncol = 3)

## Assessment: Introduction to ggplot2
# Exercise 1. ggplot2 basics
# What is the class of the object p?
library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)
data(murders)
p <- ggplot(murders)
class(p)

# Exercise 3. Pipes
# Using the pipe %>%, create an object p associated with the heights dataset instead of with the murders dataset as in previous exercises.
data(heights)
p <- heights %>% ggplot()

# Exercise 5. geom_point 1
# Fill out the sample code with the correct variable names to plot total murders versus population size.
murders %>% ggplot(aes(x = population, y = total)) +
  geom_point()

# Exercise 6. geom_point 2
# Remake the plot but flip the axes so that total is on the x-axis and population is on the y-axis.
murders %>% ggplot(aes(total, population)) +
  geom_point()

# Exercise 8. geom_point text
# Rewrite the code from the previous exercise to:
# add a label aesthetic to aes equal to the state abbreviation
# use geom_label instead of geom_point
library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)
data(murders)
murders %>% ggplot(aes(population, total, label = abb)) +
  geom_label()

# Exercise 10. geom_point colors 2
# Rewrite the code above to make the labels blue by adding an argument to geom_label.
# You do not need to put the color argument inside of an aes col.
# Note that the grader expects you to use the argument color instead of col; these are equivalent.
library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
murders %>% ggplot(aes(population, total, label = abb)) +
  geom_label(color = "blue")

# Exercise 12. geom_label colors
# Rewrite the code above to make the label color correspond to the state's region. Because this is a mapping, you will have to do this through the aes function. Use the existing aes function inside of the ggplot function.
murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

# Exercise 13. Log-scale
# Change both axes to be in the log scale on a single graph. Make sure you do not redefine p - just add the appropriate layers.
p<- murders %>% ggplot(aes(population, total, label = abb, color = region)) + geom_label()
p + scale_x_log10() + scale_y_log10()

# Exercise 14. Titles
# Edit the code above to add the title "Gun murder data" to the plot.
p<- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()
p + scale_x_log10() +
  scale_y_log10() + 
  ggtitle("Gun murder data")

# Exercise 16. A second example
# Create a ggplot object called p using the pipe to assign the heights data to a ggplot object.
# Assign height to the x values through the aes function.
library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)
p <- heights %>% 
  ggplot(aes(height))

# Exercise 17. Histograms 2
# Add a layer to the object p (created in the previous exercise) using the geom_histogram function to make the histogram.
p <- heights %>% 
  ggplot(aes(height))
p + geom_histogram()

# Exercise 18. Histogram binwidth
# Use the binwidth argument to change the histogram made in the previous exercise to use bins of size 1 inch.
p <- heights %>% 
  ggplot(aes(height))
p + geom_histogram(binwidth = 1)

# Exercise 19. Smooth density plot
# Add the appropriate layer to create a smooth density plot of heights.
heights %>% 
  ggplot(aes(height)) + 
  geom_density()

# Exercise 20. Two smooth density plots
# heights %>% 
ggplot(aes(height, group = sex)) + 
  geom_density()

# Exercise 21. Two smooth density plots 2
# Change the density plots from the previous exercise to add color.
heights %>% 
  ggplot(aes(height, color = sex)) + 
  geom_density() 

# Exercise 22. Two smooth density plots 3
# Set the alpha parameter to 0.2 in the geom_density function to make this change.
heights %>% 
  ggplot(aes(height, fill = sex)) + 
  geom_density(alpha = 0.2)