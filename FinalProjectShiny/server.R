#Final Project
#Authors: Mohamed Hamza, Hongwei Wang
#Date: 05/01/2019

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$SOPlot1 <- renderPlot({
    
    
    Data <- read.csv ( "Sex_Offenders.csv")
    
    
    SORecord <- data.frame(Data)
    
    
    
    x <- SORecord$WEIGHT
    
    ## x <- x + input$bins
    for (i in input$bins1[1] : input$bins1[2])
      
      x[i] = x[i] + input$bins
    
    if (is.integer(input$index) & is.integer(input$value) & input$index > 0 & input$index < 1075 )
      x[input$index] = input$value
    
    y <- SORecord$AGE
    
    
    
    ##plot x and y
    
    plot( x, y,
          
          xlab = "Height",
          
          ylab = "Age",
          
          bg = "lightblue",
          
          col = "black", cex = 2, pch = 21, frame = FALSE)
    
    
    
    
  })
  
  output$SOPlot2 <- renderPlot({
    
    
    Data <- read.csv ( "Sex_Offenders.csv")
    
    
    SORecord <- data.frame(Data)
    
    
    
    x <- SORecord$WEIGHT
    
    ## x <- x + input$bins
    for (i in input$bins1[1] : input$bins1[2])
      
      x[i] = x[i] + input$bins
    
    if (is.integer(input$index) & is.integer(input$value) & input$index > 0 & input$index < 1075 )
      x[input$index] = input$value
    
    y <- SORecord$AGE
    
    
    n <- length (y)
    
    fit <- lm(y ~ x) 
    
    e <- resid (fit)
    
    yhat <- predict (fit)
    
    ##create the plot between x and e
    
    plot( x, e,
          
          xlab = "Height",
          
          ylab = "age",
          
          bg = "lightblue",
          
          col = "black", cex = 2, pch = 21, frame = FALSE)
    
    ##add the regression line
    
    abline (h = 0, lwd = 2)
    
    ##add the red lines
    
    for (i in 1 : n)
      
      lines (c(x[i], x[i]), c(e[i],0), col = "red", lwd = 2)
    
  })
  
})
