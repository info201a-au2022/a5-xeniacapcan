#analysis file
library(dplyr)

co2_chart <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

moldova_co2_chart <- co2_chart %>% 
  filter(country == "Moldova")
# Three values to analyze

# 1. How much has the population decreased since when it was the highest to right now?
highest_population <- moldova_co2_chart %>% 
  filter(population == max(population))

current_population <- moldova_co2_chart %>% 
  filter(year == 2021)

highest_population_num <- pull(highest_population, population)
highest_population_year <- pull(highest_population, year)
current_population_num <- pull(current_population, population)

population_decrease_in_percentage <- round(((highest_population_num - current_population_num) / highest_population_num) * 100)

# 2. What year was the co2 emissions the highest and how much was it?
highest_emmission <- moldova_co2_chart %>% 
  filter(co2 == max(co2, na.rm = TRUE))

highest_emission_year <- pull(highest_emmission, year)
highest_emission_num <- pull(highest_emmission, co2)


# 3. What is the co2 use per person in 2021 compared to highest year?

highest_emission_per_capita <- moldova_co2_chart %>% 
  filter(year == highest_emission_year) %>% 
  pull(co2_per_capita)


current_emmission_per_capita <- moldova_co2_chart %>% 
  filter(year == 2021) %>% 
  pull(co2_per_capita)
  

emission_decrease_in_percentage <- 
  round(((highest_emission_per_capita - current_emmission_per_capita) / highest_emission_per_capita) * 100)
