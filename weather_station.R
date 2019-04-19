getwd()            #dir location
# Windows 
setwd("C:\\Users\\Valeriu\\Desktop\\Kaggle")
getwd()   

#fin  <- read.csv("beach-weather-stations-automated-sensors-1.csv")
#fin

fin  <- read.csv("beach-weather-stations-automated-sensors-1.csv", na.strings =c(""))
fin
 

head(fin, 30)
tail(fin, 10)
str(fin)
summary(fin)

#---------Biometrical preure is mising data NA
#---------Air Temperature
#fin$Battery.Life <- factor(fin$Battery.Life)
#summary(fin)
#str(fin)

##------------Changing the data format
#fin$Wind.Direction <-factor(fin$Battery.Life)
#summary(fin)
#str(fin)
# ------- The factors variabiles trap when triing to convert factors ton non factors

a <- c("13","14","15","12","13")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)
#Converting factors to numberic
z <- factor(c("13","14","15","12","13"))
z # recognized as numerics 
y <- as.numeric(z)
y # avoiding wrong numbers 
# correct way 
x <- as.character(z)
x # 
typeof(x)
#---------the factors variabiles FVT # DANGEROS TO CHAGE DATA 

# ------ Dealing with missing data
# predict with 100%  
# Leaving the record as it is if a field is not important for my analyses
# Removing the record entirely if it cant be fuly restored / can be inportant and cause a desaster if is inportant 
# Replacing the Mean or Median if we have many rows and the imporatnt value is missing then we can predict 
# Fill in by xploring correleations  and similaritis 
# introducing dummy variabiles for "Missing"

#--------Dealing with NA and missing data
#--------Waht is an NA? 
# Update inport to:fin  <- read.csv("beach-weather-stations-automated-sensors-1.csv", na.strings =c(""))
head(fin,24) 
fin[!complete.cases(fin),] #--- cheking the missing data
str(fin)



# Visualization
# Install Packages("ggplot2")
library(ggplot2)
p <- ggplot(data=fin)
p
p + geom_point(aes(x=Rain.Intensity, y=Humidity,
                   colour=Station.Name))



ggplot(fin, aes(x = Humidity, # Kernel Density and  humidity
           fill = Station.Name)) +
  geom_density(alpha = 0.4) +
  labs(title = "Humidity rank")


