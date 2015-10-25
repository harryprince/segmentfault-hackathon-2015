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
      h3(textOutput("food_name")),
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
      h5("该食物为纯牛奶，其钙磷比例非常适当，利于钙的吸收。MCM6基因产生突变，导致乳糖代谢能力差，易出现腹泻、腹胀或腹绞痛等症状。需降低牛奶的饮用量，或者喝低乳糖牛奶或者酸奶."),
      h2("基因检测结果",align='center'),
      h3("MCM6 基因",align='center',col="red"),
      h3("rs4988235  GG低活性",align='center'),
      h3("rs182549  CC低活性",align='center'),
      h2("每日健康值",align='center'),
      plotOutput("history"),
      h2("日期",align='center')
            )
      )
  )
)