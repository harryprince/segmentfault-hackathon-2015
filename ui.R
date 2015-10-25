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
      uiOutput('user_upload'),
      h3(textOutput("food_name"),align='center'),
      h1(textOutput("index"),align='center'),
      plotOutput("circle"),
      # tabPanel("Live Images", 
      #          conditionalPanel(condition = "input.image_type == 'img_type1'",
      #                           img(src = "img_type1.jpeg")
      #          ),
      #          conditionalPanel(condition = "input.image_type == 'img_type2'",
      #                           img(src = "img_type2.jpeg")
      #          )
      # ),
      # 
      h2(textOutput("description")),
      h2("    ",margin=c(2,0,0,0)),
      h5(textOutput("suggestion"),align='center'),
      h2("基因检测结果",align='center'),
      h3("MCM6 基因",align='center',col="red"),
      h3("rs4988235  GG低活性",align='center'),
      h3("rs182549  CC低活性",align='center'),
      h2("每日健康值",align='center'),
      plotOutput("history"),
      sliderInput('date',min=1,max=25,step=1,value=10,label='时段选取',animate=T),
      h2("日期",align='center')
            )
      )
  )
)