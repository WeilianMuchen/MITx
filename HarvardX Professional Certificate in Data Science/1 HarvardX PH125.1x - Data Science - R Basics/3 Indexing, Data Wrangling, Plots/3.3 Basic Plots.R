### Author: WeilianMuchen
### Assessment 10 - 3.3 Basic Plots

## Scatterplots
## Transform the variables using the log base 10 transformation
## Plot the log transformed total murders versus population

# Load the datasets and define some variables
library(dslabs)
data(murders)
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions, total_gun_murders)

# Transform population using the log10 transformation and save to object log10_population
log10_population<- log10(murders$population)

# Transform total gun murders using log10 transformation and save to object log10_total_gun_murders
log10_total_gun_murders <- log10(murders$total)

# Create a scatterplot with the log scale transformed population and murders 
plot(log10_population, log10_total_gun_murders)



## Histograms
## Compute the population in millions and save it to the object population_in_millions
## Create a histogram of the state populations using the function hist

# Store the population in millions (same as previous question)
population_in_millions <- murders$population/10^6

# Create a histogram of this variable
hist(population_in_millions)



## Boxplots
## Stratify the state populations by region.
## Generate boxplots for the strata.

# Create a boxplot of state populations by region and specify dataset 
boxplot(population~region, data = murders)