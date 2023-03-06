library(shiny)
library(shiny)
library(tidyverse)
library(plotly)
COVID_dataset <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/02-01-2020.csv")

first_page <- tabPanel(
  h4("Intro Page"),
  p("Hello my name is Suheaf Hussein and today we will be discussing covid"),
  p("This data collection provides information about the COVID-19 pandemic"),
  p("including the number of confirmed cases, fatalities, and recoveries in various geographic regions"),
  p("The data is gathered, stored, and updated daily by the Center for Systems Science and Engineering at Johns Hopkins University"),
  p("It contains demographic information on the individuals impacted, such as age and gender")
)

Second_page <- tabPanel(
  h4("Chart Page"),
  p("The pie chart depicts the distribution of COVID cases among various locations or demographic groups."),
  p("Each section of the pie chart represents a distinct group or category, with the size of each section representing"),
  p("the proportion of instances attributable to that group By displaying the data in this manner, it is simple to compare"),
  p("the relative sizes of each category and comprehend the overall case distribution"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "select_state",
        label = "SELECT STATE",
        choices = COVID_dataset$Province.State,
        multiple = TRUE
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "PIE_CHART"),
      
    )
  )
)

Third_page <- tabPanel(
  h4("Table Page"),
  p("The offered data includes information on COVID-19."),
  p("instances in various provinces or states within nations."),
  p("as well as the number of confirmed cases, fatalities, and recoveries."),
  p("at each site the last Updatecolu mn displays the date and time of the most"),
  p("recent data collection or update by evaluating this data, we may acquire insight"),
  p("into the regional distribution and global effect of COVID-19 in various locations"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "select_state_table",
        label = "SELECT STATE",
        choices = COVID_dataset$Province.State,
        multiple = TRUE
      )
    ),
    mainPanel(
      tableOutput(outputId = "Render_TABLE")
    )
  )
)

ui <- navbarPage(
  tags$title("Climate change"),
  first_page,
  Second_page,
  Third_page
)