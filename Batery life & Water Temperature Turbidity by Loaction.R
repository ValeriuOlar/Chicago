
 getwd()            #dir location
setwd("C:\\Users\\Valeriu\\Desktop\\Kaggle")
getwd()            #load dir locaction
cago <- read.csv("beach-water-quality-automated-sensors-1.csv")
head(cago)             #open CSV file 
summary(cago)
str(cago)

#activater ggpot2
#install.packages("ggplot2")
library(ggplot2)

#cool insight

ggplot(data=cago, aes(x=Battery.Life)) + geom_bar() # batery life is estimated betwen 9 and 2

#preparing the data and aes layers:
p <- ggplot(data=cago, aes(x=Turbidity, y=Water.Temperature))
p

#adding geometric
q <- p + 
  #geom_point() +
  geom_jitter(aes(size=Beach.Name, colour=Battery.Life)) + 
  geom_boxplot(alpha=0.7, outlier.colour =NA )
q

#non-data ink
q <- q +
  xlab("Turbidity")+
  ylab("Water Temperatre")+
  ggtitle("Batery life & Water Temperature Turbidity by loaction")
q

#theme

q <- q + 
  theme(
    axis.title.x = element_text(colour = "Blue", size=30),
    axis.title.y = element_text(colour = "Blue", size=30),
    axis.title.x = element_text(size=20),
    axis.title.y = element_text(size=20),
    
    plot.title = element_text(sie=40),
    
    legend.title = element_text(size=20),
    legend.text = element_text(size = 20),
    
    text = element_text(family = "Comic Sans MS")
  )
q



  