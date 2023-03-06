library(shiny)
library(tidyverse)
library(plotly)
source("app_ui.r")
COVID_dataset <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/02-01-2020.csv")


COVID_dataset <- COVID_dataset %>% 
  filter(Province.State != '')



PIE_CHART <- plot_ly(COVID_dataset, labels = ~Province.State, values = ~Deaths, type = "pie")


COVID_DATA_PIEChart <- PIE_CHART %>% 
  layout(
    title = "PIE CHART COVID DATA",
    xaxis = list(showgrid = FALSE, zeroline = FALSE, showtickLabels = FALSE)
  )

server <- function(input,output){
  
  output$PIE_CHART <- renderPlotly({
    COVID_dataset <- COVID_dataset %>% 
      filter(Province.State != '' ) %>% 
      filter(Province.State %in% input$select_state)
    
    
    
    PIE_CHART <- plot_ly(COVID_dataset, labels = ~Province.State, values = ~Deaths, type = "pie")
    
    
    COVID_DATA_PIEChart <- PIE_CHART %>% 
      layout(
        title = "PIE CHART COVID DATA",
        xaxis = list(showgrid = FALSE, zeroline = FALSE, showtickLabels = FALSE)
      )
    return(COVID_DATA_PIEChart)
  })
  
  output$Render_TABLE <- renderTable({
    COVID_dataset <- COVID_dataset %>% 
      filter(Province.State != '' ) %>% 
      filter(Province.State %in% input$select_state_table)
    return(COVID_dataset)
  })
}
