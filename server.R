
library(shiny)
suppressPackageStartupMessages(library(caret))
library(datasets)
data(mtcars)
#label automatic and manual transmissions:
mtcars$am <- factor(mtcars$am,labels=c("Automatic","Manual"))
summary(mtcars$qsec)
head(mtcars)
colnames(mtcars)
fit <- lm(mpg ~ wt + qsec + am, data=mtcars)
summary(fit)

shinyServer(
  function(input, output) {
    output$MPGPrediction<-renderText({
      userInput <- data.frame(input$var1,input$var2,input$var3)
      names(userInput)<-c("wt","qsec","am")
      predict(fit,newdata=userInput)
    })
    output$Model <- renderPrint({          
      summary(fit)                                       
    })
  }
)
