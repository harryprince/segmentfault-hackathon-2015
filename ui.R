# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  headerPanel("我的基因，我的饭!"),
  sidebarLayout(
  # Application title
  # Sidebar with a slider input for number of bins
      sidebarPanel(
               fileInput(inputId = "file",label = "开始匹配:", multiple = 1, accept = c(
                                                      'image/jpeg',
                                                      'image/jpg',
                                                      'image/png',
                                                      'image/gif'))
                                                      #,
                                                      #datapath='temp')
                        # ),
               # fileInput("files", "File data", multiple=TRUE)
                  ),
           
    # actionButton("match","开始匹配")
             

  # Show a plot of the generated distribution
    mainPanel(
      uiOutput('logo'),
      h2(textOutput("image_status")),
      textOutput("food_name"),
      uiOutput('user_upload'),
      h1(textOutput("index"),align='center'),
      plotOutput("circle"),
      
      tabPanel("Live Images", 
               conditionalPanel(condition = "input.image_type == 'img_type1'",
                                img(src = "img_type1.jpeg")
               ),
               conditionalPanel(condition = "input.image_type == 'img_type2'",
                                img(src = "img_type2.jpeg")
               )
      ),
      
      h2(textOutput("description")),
      h2("milk"),
      h1("Gene detecction result",align='center'),
      h2("MCM6 gene",align='center',col="red"),
      h2("rs4988235  GG low activity",align='center'),
      h2("rs182549  CC low activity",align='center'),
      plotOutput("history")
              
            )
      )
  )
)