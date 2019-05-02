#Final Project
#Authors: Mohamed Hamza, Hongwei Wang
#Date: 05/01/2019

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  Data <- read.csv ( "Sex_Offenders.csv")
  
  
  SORecord <- data.frame(Data)
  
  x <- SORecord$WEIGHT
  y <- SORecord$AGE
  
  Data$WEIGHTSP <- ifelse(Data$WEIGHT - 320 > 0, Data$WEIGHT - 320, 0)
 
  
  model1 <- lm(AGE ~ WEIGHT, data = Data)
  model2 <- lm(AGE ~ WEIGHTSP + WEIGHT, data = Data)
  
  model1pred <- reactive({
    
    xInput <- input$bins2
    predict(model1, newdata = data.frame(WEIGHT = xInput))
    
  })
  
  model2pred <- reactive({
    
    xInput <- input$bins2
    predict(model2, newdata = data.frame(WEIGHT = xInput, WEIGHTSP = ifelse(xInput - 320 > 0,xInput -320, 0) ))
    
  })
  
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
    xInput <- input$bins2
    Data$WEIGHTSP <- ifelse(Data$WEIGHT - 320 > 0, Data$WEIGHT - 320, 0)
    
    model1 <- lm(y ~ x)
    model2 <- lm(y ~ WEIGHTSP + WEIGHT, data = Data)
    
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
    
    if(input$showModel2){
      model2lines <- predict(model2, newdata = data.frame(WEIGHT = 0:1073, WEIGHTSP = ifelse(0:1073 - 320 > 0, 0:1073 - 320, 0)))
      lines(0:1073, model2lines, col = "blue", lwd = 2)
    }
    
    legend(25, 250, c("Model 1 Prediction","Model 2 Prediction"), pch = 21, col = c("red","blue"), bty = "n", cex = 1.2)
    points(xInput, model1pred(), col = "red", pch = 16, cex = 2)
    points(xInput, model2pred() , col = "blue", pch = 16, cex = 2)
    
    
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
  
  output$pred1 <- renderText({
    model1pred()
  })
  output$pred2 <- renderText({
    model2pred()
  })
  
})
