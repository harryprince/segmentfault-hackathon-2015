# segmentfault-hackathon-2015

本项目于2015-10-24 到 2015-10-25截止，利用shiny+docker+ggplot2+RCurl技术，破解了百度识图API，并利用shiny构建了前后端分离的R语言Web开发框架，实践了敏捷开发。
本项目致力于解决人体基因与膳食解决方案，基于人体基因的某些天然缺陷和食品成分，我们提供了完整的膳食分析和推荐技术，为用户解决科学膳食的问题，母婴、老年用户将成为我们的主力用户。
本次大赛该项目有幸获得了特别奖，键盘为PORK键盘一个。

技术实现比较粗糙，大家见谅。

需要安装一些依赖包:
```
install.packages("shiny",repos="http://mirror.bjtu.edu.cn/cran/")
install.packages("shinydashboard",repos="http://mirror.bjtu.edu.cn/cran/")
install.packages("plotrix",repos="http://mirror.bjtu.edu.cn/cran/")
install.packages("ggplot2",repos="http://mirror.bjtu.edu.cn/cran/")
install.packages("RCurl",repos="http://mirror.bjtu.edu.cn/cran/")
# 安装XML依赖
system("sudo apt-get install libxml2-dev") # ubuntu
system("sudo yum install libxml2-devel")# CentOS/RHEL
install.packages("XML",repos="http://mirror.bjtu.edu.cn/cran/")
install.packages("jpeg",repos="http://mirror.bjtu.edu.cn/cran/")
```

```
# 运行
runApp()
```
