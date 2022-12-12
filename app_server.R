#app server
library(shiny)

source("source/analysis.R")


server <- function(input, output) {
  
  options(scipen = 100)
  
  output$intro_pic <- renderImage({
    list(src = "www/moldova.jpeg",
         width = "100%",
         height = "100%")
  }, deleteFile = FALSE)
  
  output$population <- renderPlot({
    ggplot(data = moldova_co2_chart) +
      geom_line(mapping = aes(x = year, y = population))+
      labs(
        x = "Year",
        y = "Population",
        title = "Moldova Population Over the Years"
      )
  })
  
  output$graph <- renderPlotly({
    plot_ly(
      data = moldova_co2_chart,
      x = ~year,
      y = ~(get(input$typevar)),
      type = "scatter",
      mode = "lines"
    ) %>% 
    layout(
      xaxis = list(title = "Year"),
      yaxis = list(title = "Millions of Tonnes")
    )
  })
  
}