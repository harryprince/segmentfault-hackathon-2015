library(jsonlite)
library(XML)
library(RCurl)

myHttpheader<- c(
  "User-Agent"="Mozilla/5.0(Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6)",
  "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
  "Accept-Language"="en-us",
  "Connection"="keep-alive",
  "Accept-Charset"="GB2312,utf-8;q=0.7,*;q=0.7"
)

food_recognition<-function(img_id){
  curl_url=paste("http://stu.baidu.com/n/pc_search?rn=10&appid=0&tag=1&isMobile=0&queryImageUrl=http://7xnf88.com1.z0.glb.clouddn.com/",img_id,"&querySign=&fromProduct=&productBackUrl=&fm=&uptype=plug_in",sep="")
  v<- getURL(curl_url,httpheader=myHttpheader,.encoding='gbk')
  x<-regmatches(v, regexpr('<a class=\"guess-info-word-link\" href=\"http://www(.*?)</a>', v))
  doc = htmlParse(x, asText=TRUE,encoding='utf-8')
  xpathSApply(doc, "//text()",xmlValue)  
}
img_id = 'chunniunai.jpg'
food_recognition(img_id)

