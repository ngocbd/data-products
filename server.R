library(shiny)
library(ggplot2)
data <- read.table("http://scg.sdsu.edu/wp-content/uploads/2013/09/brain_body.txt", 
                   skip = 12, 
                   header = TRUE)

fit  <- lm(Brain_Weight ~ log(Body_Weight), data = data)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  
  output$Brain_Weight <-renderText({ 
    newdata = data.frame(Body_Weight=input$Body_Weight)
    aaa<-predict(fit,newdata)
    paste("Predicted Brain Weight : ",aaa)
  })
  
  output$distPlot <- renderPlot({
   
    
    p<-ggplot(data, aes(x = Body_Weight, y = Brain_Weight)) + 
      geom_point() +stat_smooth(method = "lm", col = "red")
    
    p + geom_vline(xintercept =  input$Body_Weight, colour="green",size=1 )
  })
})