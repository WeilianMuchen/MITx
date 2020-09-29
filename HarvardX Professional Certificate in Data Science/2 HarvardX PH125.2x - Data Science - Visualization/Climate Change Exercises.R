### Author: WeilianMuchen
### Climate Change Exercises

library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

# Q1
temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  pull(year) %>%
  max()

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  .$year %>%
  max()

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  select(year) %>%
  max()

# Q2
temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  pull(year) %>%
  min()

temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  pull(year) %>%
  max()

carbon1 <- temp_carbon %>%
  filter(year == 1751) %>%
  .$carbon_emissions

carbon2 <- temp_carbon %>%
  filter(year == 2014) %>%
  .$carbon_emissions

carbon2/carbon1

# Q3

temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  pull(year) %>%
  max()

temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  pull(year) %>%
  min()

temp1 <- temp_carbon %>%
  filter(year == "1880") %>%
  .$temp_anomaly

temp2 <- temp_carbon %>%
  filter(year == "2018") %>%
  .$temp_anomaly

temp2 - temp1

# Q4
p <- temp_carbon %>%
  filter(!is.na(temp_anomaly)) %>%
  ggplot(aes(year, temp_anomaly)) +
  geom_line()
p <- p + geom_hline(aes(yintercept = 0), col = "blue")
p

# Q5
p + ylab("Temperature anomaly (degrees C)") +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  geom_text(aes(x=2000, y=0.05, label="20th century mean"), col="blue")

# Q6
temp_carbon %>%
  ggplot(aes(year, temp_anomaly)) +
  geom_line() +
  geom_hline(aes(yintercept = 0), col = "blue") +
  ylab("Temperature anomaly (degrees C)") +
  geom_text(aes(x = 2000, y = 0.05, label = "20th century mean"), col = "blue") +
  xlim(c(1880, 2018)) +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018")

# Q7
temp_carbon %>%
  ggplot(aes(year, temp_anomaly)) +
  geom_line() +
  geom_line(aes(year, land_anomaly), col = "red") +
  geom_line(aes(year, ocean_anomaly), col = "blue") +
  ylab("Temperature anomaly (degrees C)") +
  xlim(c(1880, 2018)) +
  ggtitle("Temperature anomaly on land and ocean")

# Q8
greenhouse_gases %>%
  ggplot(aes(year, concentration)) +
  geom_line() +
  facet_grid(gas~., scales = "free") +
  geom_vline(aes(xintercept=1850)) +
  ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
  ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")

# Q10
temp_carbon %>%
  filter(!is.na(carbon_emissions)) %>%
  ggplot(aes(x=year, y=carbon_emissions)) +
  geom_line()

# Q11
co2_time <- historic_co2 %>%
  ggplot(aes(x=year, y=co2, color=source)) +
  geom_line()
co2_time

co2_time + xlim(-3000,2018)