# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Welcome!"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    fileInput(inputId = "file",label = "Select File:", multiple = 1, accept = NULL),
    submitButton("Submit")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h1("match degree",align='center'),
    plotOutput("circle"),
    h2("milk"),
    h1("Gene detecction result",align='center'),
    h2("MCM6 gene",align='center',col="red"),
    h2("rs4988235  GG low activity",align='center'),
    h2("rs182549  CC low activity",align='center'),
    plotOutput("history")
  )
))
