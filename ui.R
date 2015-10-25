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
      h2("该食物为纯牛奶，纯牛奶有丰富的矿物质、钙、磷、铁、锌、铜、锰、钼。最难得的是，纯牛奶是人体钙的最佳来源，而且钙磷比例非常适当，利于钙的吸收。通过分析您的基因数据发现，MCM6基因产生突变，导致乳糖代谢能力差，即乳糖不耐受，容易出现腹泻、腹胀或腹绞痛等症状。需降低牛奶的饮用量，或者喝低乳糖牛奶或者酸奶."),
      h1("基因检测结果",align='center'),
      h2("MCM6 基因",align='center',col="red"),
      h2("rs4988235  GG低活性",align='center'),
      h2("rs182549  CC低活性",align='center'),
      h2("每日健康值",align='center'),
      plotOutput("history")
              
            )
      )
  )
)