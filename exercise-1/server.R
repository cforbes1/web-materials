# server.R
library(dplyr)
library(shiny)

# Read in data
source('./scripts/build_map.R')
source('./scripts/build_scatter.R')
df <- read.csv('./data/electoral_college.csv', stringsAsFactors = FALSE)
state_codes <- read.csv('./data/state_codes.csv', stringsAsFactors = FALSE)

# Join together state.codes and df
joined_data <- left_join(df, state_codes, by="state")

# Compute the electoral votes per 100K people in each state
joined_data <- joined_data %>% mutate(ratio = votes/population * 100000)

# Start shinyServer
shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$map <- renderPlotly({ 
      return(build_map(joined_data, input$mapvar))
  }) 
  
  output$scatter <- renderPlotly({
    return(build_scatter(joined_data, input$search))
  })
 
})