# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(shinydashboard)
#library(grid)
library(plotrix)
library(ggplot2)
library(httr)
library(RCurl)
library(jsonlite)
library(XML)
library(jpeg)

# 百度识图破解版API

food_recognition<-function(img_id){
  myHttpheader<- c(
    "User-Agent"="Mozilla/5.0(Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6)",
    "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language"="en-us",
    "Connection"="keep-alive",
    "Accept-Charset"="GB2312,utf-8;q=0.7,*;q=0.7"
  )
  curl_url=paste("http://stu.baidu.com/n/pc_search?rn=10&appid=0&tag=1&isMobile=0&queryImageUrl=http://7xnf88.com1.z0.glb.clouddn.com/",img_id,"&querySign=&fromProduct=&productBackUrl=&fm=&uptype=plug_in",sep="")

  v<- getURL(curl_url,httpheader=myHttpheader,.encoding='gbk')
  
  x<-regmatches(v, regexpr('<a class=\"guess-info-word-link\" href=\"http://www(.*?)</a>', v))
  doc = htmlParse(x, asText=TRUE,encoding='utf-8')
  xpathSApply(doc, "//text()",xmlValue)  
}


shinyServer(
  function(input, output) {
    # if(exists(input$file)){POST}
    #logo
    # is_input_file<-reactive({is.null(input$file)})
    
    output$logo<-renderUI({
      img(src="http://7xnf88.com1.z0.glb.clouddn.com/genefan_logo.png",center,width = "288px", height = "144px")
    })
    #显示图片
    output$image_status<-renderText({
      if ({is.null(input$file)})
        return(NULL)
      c('你的美食：')
    })
    #显示图片
    output$user_upload <- renderUI({
      if ({is.null(input$file)})
        return(NULL)
      img_id = input$file["name"]
      curl_url = paste("http://7xnf88.com1.z0.glb.clouddn.com/",img_id,sep="")
      img(src = curl_url,width='200px')
      

    })
    
    
    # read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
    
    # image
    output$food_name <- renderText(function() {
      if (is.null(input$file)) {
        # User has not uploaded a file yet
        return(NULL)
      }
      tryCatch({
        food_recognition(input$file["name"])
      },
      error = function(err){
        return("未知食物")
      })
      
    })
    

    #显示标题
    output$index<-renderText({
      if ({is.null(input$file)})
        return(NULL)
      c('你的基因美食匹配度')
      
      
    })
    # 得分
    output$circle<- renderPlot({
      
      inFile <- input$file

      if (is.null(inFile))
        return(NULL)
      
      library(plotrix)
      if  (food_recognition(input$file["name"])=="纯牛奶"){a=80;color='gray'}
      else{
        if (food_recognition(input$file["name"])=="菠菜"){a=70;color='green'}
        else{a=40;color='blue'}
      }
      
      par(family='STKaiti',mar=c(0,0,0,0))
      plot(1:10,seq(1,10,length=10),type="n",axes=F,xlab="",ylab="",frame.plot=F)#,main='本餐基因饮食匹配度')
      draw.circle(5,5,c(2,2,2),border=color, col=color,lty=1,lwd=1)
      draw.circle(5,5,1.5,border="blue",lty=2,lwd=2)
      text.default(5,5,labels=a,cex=7)#
    })
    # 建议
    output$description<-renderText({
      if (is.null(input$file))
        return(NULL)
      c('建议')

    })
    
    output$history<- renderPlot({
      temp= input$date
      # typeof(temp);
      # length(temp);
      library(plotrix)
      par(family='STKaiti',mar=c(0,0,0,0))
      history = read.csv("history.csv")
      sunspotyear1 <- data.frame(y=history$score[1:temp],x= history$timestamp[1:temp])
      input$date["value"] 
      p=ggplot(sunspotyear1, aes(x=x, y=y)) + geom_point(col='blue',alpha=.2,size=5)+geom_point(col='blue',alpha=.2)+geom_area(fill="purple",alpha=.2) + geom_line()+scale_x_discrete(breaks=sunspotyear1$x[1:temp],labels=history$timestamp[1:temp]) + xlab("")
      
      
      p+ylab("")+theme(axis.title.y=element_text(angle=0))

      
        
    })
  }
)