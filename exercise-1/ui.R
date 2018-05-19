# ui.R
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(
  theme = shinytheme("sandstone"),
  "Electoral College",
  # Create a tab panel for your map
  tabPanel(
    "Map",
    titlePanel("Electoral College Votes"),
    # Create sidebar layout
    sidebarLayout(

      # Side panel for controls
      sidebarPanel(
        tags$h2("This is an interactive map"),

        # Input to select variable to map
        selectInput(
          "mapvar",
          label = "Variable to Map",
          choices = list(
            "Population" = "population",
            "Electoral Votes" = "votes",
            "Votes / Population" = "ratio"
          )
        ),
        tags$br(),
        HTML("<strong>Wow, I'm blown away!</strong>"),
        tags$div(
          class = "sidebar",
          tags$blockquote("I'm a floating blockquote!")
        )
      ),

      # Main panel: display plotly map
      mainPanel(
        plotlyOutput("map"),
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        tags$div(
          class = "summary", checked = NA,
          tags$p("This map shows the electoral college votes by states. The darker
               the color, the higher the number of votes. California has 
                 the highest votes.")
        ),
        tags$a(
          href = "https://www.archives.gov/federal-register/electoral-college/about.html",
          "for more information"
        )
      )
    )
  ),

  # Create a tabPanel to show your scatter plot
  tabPanel(
    "Scatter",
    titlePanel("Population v.s. Vote Power"),
    sidebarLayout(
      sidebarPanel(
        textInput("search", label = "Find a State", value = "")
      ),
      mainPanel(
        plotlyOutput("scatter")
      )
    )
  )
))