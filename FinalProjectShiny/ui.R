#Final Project
#Authors: Mohamed Hamza, Hongwei Wang
#Date: 05/01/2019


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(strong("Sex Ofenders Profile")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      numericInput("index", "Exact index:", value = NULL, min = 0, max = 1074, step = 1 ),
      
      
      numericInput("value", "Value of chosen index:", value = NULL, min = 0, max = 1000, step = 1 ),
      
      h4("Use the first slider to choose the range of predectors you want to manipulate"),
      sliderInput("bins1",
                  "Range:",
                  min = 0,
                  max = 1074,
                  value = c(0,1074)),
      h4("Use the second slider to change the values of chosen predictors"),
      sliderInput("bins",
                  "Value:",
                  min = 0,
                  max = 500,
                  value = 0),
      sliderInput("bins2",
                  "Value:",
                  min = 0,
                  max = 620,
                  value = 0),
      checkboxInput("showModel1","Show/Hide Model 1", value = TRUE),
      checkboxInput("showModel2","Show/Hide Model 2", value = TRUE),
      h6("Author:"),
      h6("Mohamed Hamza"),
      h6("Hongwei Wang"),
      
      img(src = "12.png", height = 240, width = 240)
      
      
    ),
    
    
    
    
    
    
    mainPanel(
      list(tags$head(tags$style("body {background-color: #2f6640; }"))),
      plotOutput("SOPlot1"),
      
      plotOutput("SOPlot2"),
      
      h3("Predicted Age from Model 1:"),
      textOutput("pred1"),
      h3("Predicted Age from Model 2:"),
      textOutput("pred2")
      
    )
  )
))
