### Author: WeilianMuchen
### 1 Basics of ggplot2

## Graph Components
library(dslabs)
data(murders)

## Creating a New Plot
library(tidyverse)
library(dslabs)
data(murders)

ggplot(data = murders)

murders %>% ggplot()

p <- ggplot(data = murders)
class(p)
print(p)    # this is equivalent to simply typing p
p