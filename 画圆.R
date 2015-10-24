# 画圆
library("plotrix")
par(family='STKaiti',mar=c(0,0,0,0))
plot(1:10,seq(1,10,length=10),type="n",axes=F,xlab="",ylab="",frame.plot=F)#,main="烧豆腐")
draw.circle(5,5,c(2,2,2),border="purple", col=c("#ff00ff","#ff77ff","#ffccff"),lty=1,lwd=1)
text.default(5,5,labels="80",cex=7)

