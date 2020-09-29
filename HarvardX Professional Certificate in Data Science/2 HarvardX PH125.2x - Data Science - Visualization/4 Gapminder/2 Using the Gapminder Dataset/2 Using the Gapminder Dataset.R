### Author: WeilianMuchen
### 2 Using the Gapminder Dataset

## Faceting
# facet by continent and year
filter(gapminder, year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(continent ~ year)

# facet by year only
filter(gapminder, year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(. ~ year)

# facet by year, plots wrapped onto multiple rows
years <- c(1962, 1980, 1990, 2000, 2012)
continents <- c("Europe", "Asia")
gapminder %>%
  filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_wrap(~year)

## Time Series Plots
# Code: Single time series
# scatterplot of US fertility by year
gapminder %>%
  filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_point()

# line plot of US fertility by year
gapminder %>%
  filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_line()

# Code: Multiple time series
# line plot fertility time series for two countries- only one line (incorrect)
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility)) +
  geom_line()

# line plot fertility time series for two countries - one line per country
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, group = country)) +
  geom_line()

# fertility time series for two countries - lines colored by country
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country)) +
  geom_line()

# Code: Adding text labels to a plot
# life expectancy time series - lines colored by country and labeled, no legend
labels <- data.frame(country = countries, x = c(1975, 1965), y = c(60, 72))
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy, col = country)) +
  geom_line() +
  geom_text(data = labels, aes(x, y, label = country), size = 5) +
  theme(legend.position = "none")

## Transformations
# add dollars per day variable
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

# histogram of dollars per day
past_year <- 1970
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")

# repeat histogram with log2 scaled data
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")

# repeat histogram with log2 scaled x-axis
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2")

## Stratify and Boxplot
# Code: Boxplot of GDP by region
# add dollars per day variable
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

# number of regions
length(levels(gapminder$region))

# boxplot of GDP by region in 1970
past_year <- 1970
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day))
p + geom_boxplot()

# rotate names on x-axis
p + geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Code: The reorder function
# by default, factor order is alphabetical
fac <- factor(c("Asia", "Asia", "West", "West", "West"))
levels(fac)

# reorder factor by the category means
value <- c(10, 11, 12, 6, 4)
fac <- reorder(fac, value, FUN = mean)
levels(fac)

# Code: Enhanced boxplot ordered by median income, scaled, and showing data
# reorder by median income and color by continent
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%    # reorder
  ggplot(aes(region, dollars_per_day, fill = continent)) +    # color by continent
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("")
p

# log2 scale y-axis
p + scale_y_continuous(trans = "log2")

# add data points
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE)

## Comparing Distributions
# Code: Histogram of income in West versus developing world, 1970 and 2010
# add dollars per day variable and define past year
gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970

# define Western countries
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

# facet by West vs devloping
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(. ~ group)

# facet by West/developing and year
present_year <- 2010
gapminder %>%
  filter(year %in% c(past_year, present_year) & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

# Code: Income distribution of West versus developing world, only countries with data 
# define countries that have data available in both years
country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1, country_list_2)

# make histogram including only countries with data available in both years
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%    # keep only selected countries
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

# Code: Boxplots of income in West versus developing world, 1970 and 2010
p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("") + scale_y_continuous(trans = "log2")

p + geom_boxplot(aes(region, dollars_per_day, fill = continent)) +
  facet_grid(year ~ .)

# arrange matching boxplots next to each other, colored by year
p + geom_boxplot(aes(region, dollars_per_day, fill = factor(year)))

## Density Plots
# Code: Faceted smooth density plots
# see the code below the previous video for variable definitions

# smooth density plots - area under each curve adds to 1
gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>% group_by(group) %>%
  summarize(n = n()) %>% knitr::kable()

# smooth density plots - variable counts on y-axis
p <- gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day, y = ..count.., fill = group)) +
  scale_x_continuous(trans = "log2")
p + geom_density(alpha = 0.2, bw = 0.75) + facet_grid(year ~ .)

# Code: Add new region groups with case_when
# add group as a factor, grouping regions
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others"))

# reorder factor levels
gapminder <- gapminder %>%
  mutate(group = factor(group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West")))

# Code: Stacked density plot
# note you must redefine p with the new gapminder object first
p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  ggplot(aes(dollars_per_day, fill = group)) +
  scale_x_continuous(trans = "log2")

# stacked density plot
p + geom_density(alpha = 0.2, bw = 0.75, position = "stack") +
  facet_grid(year ~ .)

# Code: Weighted stacked density plot
# weighted stacked density plot
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  group_by(year) %>%
  mutate(weight = population/sum(population*2)) %>%
  ungroup() %>%
  ggplot(aes(dollars_per_day, fill = group, weight = weight)) +
  scale_x_continuous(trans = "log2") +
  geom_density(alpha = 0.2, bw = 0.75, position = "stack") + facet_grid(year ~ .)

# Ecological Fallacy
# define gapminder
library(tidyverse)
library(dslabs)
data(gapminder)

# add additional cases
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central America", "South America", "Caribbean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands"))

# define a data frame with group average income and average infant survival rate
surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group)) %>%
  group_by(group) %>%
  summarize(income = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
surv_income %>% arrange(income)

# plot infant survival versus income, with transformed axes
surv_income %>% ggplot(aes(income, infant_survival_rate, label = group, color = group)) +
  scale_x_continuous(trans = "log2", limit = c(0.25, 150)) +
  scale_y_continuous(trans = "logit", limit = c(0.875, .9981),
                     breaks = c(.85, .90, .95, .99, .995, .998)) +
  geom_label(size = 3, show.legend = FALSE) 

## Assessment: Exploring the Gapminder Dataset
# Exercise 1. Life expectancy vs fertility - part 1
# Using ggplot and the points layer, create a scatter plot of life expectancy versus fertility for the African continent in 2012.
# Remember that you can use the R console to explore the gapminder dataset to figure out the names of the columns in the dataframe.
# In this exercise we provide parts of code to get you going. You need to fill out what is missing. But note that going forward, in the next exercises, you will be required to write most of the code.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% filter(continent=="Africa" & year == 2012) %>%
  ggplot(aes(fertility, life_expectancy)) +
  geom_point()

# Exercise 2. Life expectancy vs fertility - part 2 - coloring your plot
# Remake the plot from the previous exercises but this time use color to distinguish the different regions of Africa to see if this explains the clusters. Remember that you can explore the gapminder data to see how the regions of Africa are labeled in the data frame!
# Use color rather than col inside your ggplot call - while these two forms are equivalent in R, the grader specifically looks for color.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% filter(continent=="Africa" & year == 2012) %>%
  ggplot(aes(fertility, life_expectancy, color = region)) +
  geom_point()

# Exercise 3. Life expectancy vs fertility - part 3 - selecting country and region
# Create a table showing the country and region for the African countries (use select) that in 2012 had fertility rates of 3 or less and life expectancies of at least 70.
# Assign your result to a data frame called df.
library(dplyr)
library(dslabs)
data(gapminder)
df <- gapminder %>%
  filter(continent == "Africa" & year == 2012 & fertility <= 3 & life_expectancy >= 70) %>%
  select(country, region)

# Exercise 4. Life expectancy and the Vietnam War - part 1
# Use filter to create a table with data for the years from 1960 to 2010 in Vietnam and the United States.
# Save the table in an object called tab.
library(dplyr)
library(dslabs)
data(gapminder)
years <- 1960:2010
countries <- c("United States", "Vietnam")
tab <- gapminder %>% 
  filter(year %in% years & country %in% countries)

# Exercise 5. Life expectancy and the Vietnam War - part 2
# Use geom_line to plot life expectancy vs year for Vietnam and the United States and save the plot as p. The data table is stored in tab.
# Use color to distinguish the two countries.
# Print the object p.
p <- tab %>% ggplot(aes(x=year, y=life_expectancy, color=country)) + geom_line()
p

# Exercise 6. Life expectancy in Cambodia
# Use a single line of code to create a time series plot from 1960 to 2010 of life expectancy vs year for Cambodia.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% 
  filter(year >= 1960 & year <= 2010 & country == "Cambodia") %>%
  ggplot(aes(year, life_expectancy)) + geom_line()

# Exercise 7. Dollars per day - part 1
# Use mutate to create a dollars_per_day variable, which is defined as gdp/population/365.
# Create the dollars_per_day variable for African countries for the year 2010.
# Remove any NA values.
# Save the mutated dataset as daydollars.
library(dplyr)
library(dslabs)
data(gapminder)
daydollars <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year == 2010 & !is.na(dollars_per_day))

# Exercise 8. Dollars per day - part 2
# The dataset including the dollars_per_day variable is preloaded as daydollars.
# Create a smooth density plot of dollars per day from daydollars.
# Use scale_x_continuous to change the x-axis to a log (base 2) scale.
daydollars %>%
  ggplot(aes(dollars_per_day)) + geom_density() + scale_x_continuous(trans = "log2")

# Exercise 9. Dollars per day - part 3 - multiple density plots
# Create the dollars_per_day variable as in Exercise 7, but for African countries in the years 1970 and 2010 this time.
# Make sure you remove any NA values.
# Create a smooth density plot of dollars per day for 1970 and 2010 using a log (base 2) scale for the x axis.
# Use facet_grid to show a different density plot for 1970 and 2010.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_density() +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ .)

# Exercise 10. Dollars per day - part 4 - stacked density plot
# Much of the code will be the same as in Exercise 9:
# Create the dollars_per_day variable as in Exercise 7, but for African countries in the years 1970 and 2010 this time.
# Make sure you remove any NA values.
# Create a smooth density plot of dollars per day for 1970 and 2010 using a log (base 2) scale for the x axis.
# Use facet_grid to show a different density plot for 1970 and 2010.
# Make sure the densities are smooth by using bw = 0.5.
# Use the fill and position arguments where appropriate to create the stacked density plot of each region.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day)) %>%
  ggplot(aes(dollars_per_day, fill=region)) +
  geom_density(bw=0.5, position="stack") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ .)

# Exercise 11. Infant mortality scatter plot - part 1
# Generate dollars_per_day using mutate and filter for the year 2010 for African countries.
# Remember to remove NA values.
# Store the mutated dataset in gapminder_Africa_2010.
# Make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# Use color to denote the different regions of Africa.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder_Africa_2010 <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year == 2010 & !is.na(dollars_per_day) & !is.na(infant_mortality))
gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, color=region)) + geom_point()

# Exercise 12. Infant mortality scatter plot - part 2 - logarithmic axis
# The mutated dataset is preloaded as gapminder_Africa_2010.
# As in the previous exercise, make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# As in the previous exercise, use color to denote the different regions of Africa.
# Transform the x axis to be in the log (base 2) scale.
gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, color=region)) + geom_point() + scale_x_continuous(trans ="log2")

# Exercise 13. Infant mortality scatter plot - part 3 - adding labels
# The mutated dataset is preloaded as gapminder_Africa_2010.
# As in the previous exercise, make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# As in the previous exercise, use color to denote the different regions of Africa.
# As in the previous exercise, transform the x axis to be in the log (base 2) scale.
# Add a geom_text layer to display country names in addition to of points.
gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, color=region, label=country)) +
  geom_text() +
  scale_x_continuous(trans="log2")

# Exercise 14. Infant mortality scatter plot - part 4 - comparison of scatter plots
# Generate dollars_per_day using mutate and filter for the years 1970 and 2010 for African countries.
# Remember to remove NA values.
# As in the previous exercise, make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# As in the previous exercise, use color to denote the different regions of Africa.
# As in the previous exercise, transform the x axis to be in the log (base 2) scale.
# As in the previous exercise, add a layer to display country names instead of points.
# Use facet_grid to show different plots for 1970 and 2010. Align the plots vertically.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>%
  mutate(dollars_per_day=gdp/population/365) %>%
  filter(continent=="Africa" & year %in% c(1970,2010) & !is.na(dollars_per_day) & !is.na(infant_mortality)) %>%
  ggplot(aes(dollars_per_day, infant_mortality, color=region, label=country)) +
  geom_text() +
  scale_x_continuous(trans="log2") +
  facet_grid(year~.)