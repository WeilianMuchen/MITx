### Author: WeilianMuchen
### Properties of Stars Exercises

library(tidyverse)
library(dslabs)
library(lattice)
library(ggrepel)
data(stars)
options(digits = 3)
head(stars)
str(stars)

# Q1
mean(stars$magnitude)
sd(stars$magnitude)

# Q2
stars %>% ggplot(aes(x=magnitude)) +
  geom_density()

# Q3
stripplot(stars$temp)

stars %>%
  ggplot(aes(temp)) +
  geom_density()

# Q4
stars %>%
  ggplot(aes(temp, magnitude)) +
  geom_point()

# Q5
stars %>% ggplot(aes(temp, magnitude)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_reverse()

# Q8
stars %>% ggplot(aes(log10(temp), magnitude, label=star)) +
  geom_point() +
  geom_text_repel() +
  scale_y_reverse() +
  scale_x_reverse()

# Q8.1
stars %>% filter(temp>5000, magnitude>0) %>%
  ggplot(aes(x=temp, y=magnitude, label=star)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous() +
  geom_label_repel()

# Q8.2
stars %>% filter(temp<5000, magnitude>0) %>%
  ggplot(aes(x=temp, y=magnitude, label=star)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous() +
  geom_label_repel()

# Q9
stars %>%
  ggplot(aes(x=temp, y=magnitude, color=type)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous()