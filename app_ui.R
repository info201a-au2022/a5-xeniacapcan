library(shiny)
library(plotly)

source("source/analysis.R")



intro <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
 mainPanel(
   p("Our World in Data (OWID) provides the data on global CO2 emissions grouped by countries which allows us to analyze the increasing trend in emissions in each country by different types, each country’s consumption of energy and compare it to that country’s population. I was originally born in Moldova and was surprised to see the data for my country on here even though it’s a small country, so I decided to choose it as the subject for this page."),
   imageOutput("intro_pic"),
   p("Moldova is one of the smallest countries in Europe that was part of the Soviet Union and reclaimed its independence in 1991. The population is one of the smallest in Europe and it has been decreasing in a steady pace. The top population of", strong(highest_population_num), "was in", strong(highest_population_year), "and decreased by", strong(population_decrease_in_percentage), "percent since then. The current 2021 population of Moldova stands at", strong(current_population_num), "."),
  plotOutput("population"),
  p("The highest amount of emissions of", strong(highest_emission_num),"millions of tonnes happened in", strong(highest_emission_year) , ". In that year, emission per capita was", strong(highest_emission_per_capita), "tonnes per person. In 2021, it decreased to", strong(current_emmission_per_capita), "tonnes per person."),
  p("The interactive visualization will focus on presenting the total amount of CO2 emissions produced by different types of fuels. The data source provides the number of how many tonnes were released based on that type each year. There are four different types of fuel in this visualization: oil, coal, gas, and cement."),
  p("This visualization can provide us with information on which type of fuel type releases the most CO2 emissions and which one the country should tackle on if they want to reduce their emissions amount and be more considerate of their enivironmental impact.")
   )
 )
  

plot_side_content <- sidebarPanel(
  selectInput(
    "typevar",
    label = "Select type of industry fuel type",
    choices = c("Gas" = "gas_co2",
                "Oil" = "oil_co2",
                "Coal" = "coal_co2",
                "Cement" = "cement_co2"))
)

plot_main_content <- mainPanel(
  plotlyOutput("graph"),
  p("By selecting the type of fuel, you can see the total amount of emissions produced by that type over the years. The amount is measured in millions of tonnes.This is based on territorial emissions, which do not account for emissions embedded in traded goods.")
)
  
plot_tab <- tabPanel(
  "Interactive Plot",
  titlePanel("Plot"),
  sidebarLayout(
    plot_side_content,
    plot_main_content
  )
)

ui <- navbarPage(
  "CO2 Emissions in Moldova",
  intro,
  plot_tab
)