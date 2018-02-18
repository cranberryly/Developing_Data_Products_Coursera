
library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Miles Per Gallon (MPG) Prediction"),  
    
    sidebarPanel(
      #p(strong("Documentation:",style="color:red"), a("User Help Page",href="https://lmcmahan.shinyapps.io/project/userHelpPage.html")),    
      h3('User Input'),
      numericInput('var1', strong('Weight (1000 lbs)'), 3.325, min = 0.000, max = 10.000),
      numericInput('var2', strong('1/4 mile time (Second)'), 17.71, min = 0.00, max = 30.00, step = 0.1),
      selectInput("var3", strong('Transmission Type'), 
                  choices = list("Automatic", "Manual"), selected = "Automatic"),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Prediction Output'),
      h4('Predicted Miles Per Gallon (MPG)'),
      verbatimTextOutput("MPGPrediction"),
      h4('Predicted MPG based on this linear modele:'),
      verbatimTextOutput("Model")
    )
  )
)