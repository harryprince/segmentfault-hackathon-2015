# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
#library(grid)
library(plotrix)
library(ggplot2)
shinyServer(
  function(input, output) {
    
    output$circle<- renderPlot({
      
      # if(str(input$file[,1])){
      library(plotrix)
      par(family='STKaiti',mar=c(0,0,0,0))
      plot(1:10,seq(1,10,length=10),type="n",axes=F,xlab="",ylab="",frame.plot=F)
      draw.circle(5,5,c(2,2,2),border="purple", col=c("#ff00ff","#ff77ff","#ffccff"),lty=1,lwd=1)
      text.default(5,5,labels="80",cex=7)
      #write.csv(nhistory,file="history.csv",quote=FALSE,row.names = FALSE)
      # }
      
    })
    output$history<- renderPlot({
      
      # if(str(input$file[,1])){
      library(plotrix)
      history = read.csv("history.csv")
      sunspotyear1 <- data.frame(y=history$score,x= time(history$timestamp))
      
      p=ggplot(sunspotyear1, aes(x=x, y=y)) + geom_point(col='blue',alpha=.2,size=5)+geom_point(col='blue',alpha=.2)+geom_area(fill="red",alpha=.2) + geom_line()+scale_x_discrete(breaks=sunspotyear1$x,labels=history$timestamp) + xlab("Date")
      
      p+ylab("Healty Score")+theme(axis.title.y=element_text(angle=0))
      # }
      
    })
  }
)
