library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(" Predict brain weight over body weight"),
  
  h3(textOutput("Brain_Weight")),
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("Body_Weight",
                  "Body_Weight",
                  min = 1,
                  max = 500,
                  value = 30)
    ),   
    
    # Show a plot 
    mainPanel(
      plotOutput("distPlot")
    )
  ),
  h6("Using slide to pick a value of body weight , see brain weight value and see visualize on plot ")
))