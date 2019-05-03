#Final Project
#Authors: Mohamed Hamza, Hongwei Wang
#Date: 05/01/2019


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(strong("Sex Offenders Profile")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      h5("Authors:"),
      h5("Mohamed Hamza"),
      h5("Hongwei Wang"),
      h5("The data shows the informtion of all current sex offenders in city of Chicago."),
      h5("Link: https://catalog.data.gov/dataset/sex-offenders-938b3"),
      h5("By analysing this data we wanted to know what are the characteristics of sex offenders?"),
      h5("and is there a certain profile that all or most sex offenders fall under?"),
      
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
                  value = 100),
      checkboxInput("showModel1","Show/Hide Model 1", value = TRUE),
      checkboxInput("showModel2","Show/Hide Model 2", value = TRUE),
      
      h5("Interpretation of the Coefficients:"),
      h5("Coefficients:"),
      h5("Intercept: Estimate = 48.623346, Std. Error = 1.692458, t value = 28.729, Pr(>|t|) = <2e-16"),
      h5("x: Estimate = 0.001200, Std. Error = 0.008663, t value = 0.138, Pr(>|t|)0.89"),
      h5("Residual standard error: 12.25 on 1072 degrees of freedom"),
      h5("Multiple R-squared:  1.789e-05,	Adjusted R-squared:  -0.0009149 "),
      h5("F-statistic: 0.01918 on 1 and 1072 DF,  p-value: 0.8899"),
      h5("***********************************************"),
      h4("From this we can see that there is no clear relationship between a sex offender's weight and age 
         people usually have a set picture for people who commit such crimes, but if our study showed anything,
         it showed that it can be anyone with any body shape in whatever age from late teens to even late 80s"),
      
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
