?read.csv()

#Method 1: Selecting the File Manualy

#stats <- read.csv(file.choose()) # runing the Beach Water qualiy
#stats # verifing the data in the file 

# Method 2: Set WD and Read Data
getwd()            #dir location
# Windows 
setwd("C:\\Users\\Valeriu\\Desktop\\Kaggle")
getwd()            #load dir locaction
rm(stats)          # removing statats 
#stats <- read.csv("beach-weather-stations-automated-sensors-1.csv")
#stats               #open CSV file 2
stats <- read.csv("beach-water-quality-automated-sensors-1.csv")
stats               #open CSV file 

#----------------------------------------- Exploring dataset------------------
stats
nrow(stats)         # telling the number of rows -- imported 34923 from beach-water-quality-automated-sensors-1.csv
ncol(stats)         # number of colums 10
head(stats, n=10)         # Tells the tow 6 rows 
tail(stats, n=8)         # Used if the data is ordered alphabeticly
str(stats)              # Structure for more info of dataset / str("string") runif("Run in opereation if somthing is corect")
summary(stats)      # categorizing variabiles, etc.

#----------------------------------------Using the $ sign accesing data in dataframe to extract the vector in the fast way
stats
head(stats)      # Geting top 6 rows 
stats[3,3]      # select row
stats[3,"Water.Temperature"] # using a cloum name with Water.Temperature
stats$Water.Temperature #returning all Water.Temperature colum
stats$Water.Temperature[2] #returning all Water.Temperature colum with [2] row 14.4
levels(stats$Measurement.Timestamp) #function that gives a colums   

#-----------------------------------------Basic operation with a DF sub seting 
stats[1:10,] #sub seting  for the firs 10 row's
stats[2:10,]
stats[c(4,100),] 
# remember how the []wotk:
is.data.frame(stats[1,]) # cheking if is a data frame
is.data.frame(stats[,1]) # extracting a vecor/ data frame
is.data.frame(stats[,1,drop=F]) # Confirming that is a data frame
# multyplay columns
head(stats)
stats$Turbidity * stats$Water.Temperature # multipliing the clom's rows
stats$Turbidity * stats$Water.Temperature # multipliing the clom's rows
#adding a cloum to the data frame
head(stats)
stats$MyCalc <- stats$Turbidity * stats$Water.Temperature # addin some calcualtinons to an output
# testing 
stats$xyz <- 1:4 # vector gets recicled
head(stats, n=12) 
# remove a column
head(stats)
#stats$MyCalc <- NULL
#stats$xyz <- NULL
#--------------------------------Filtering Data Frames
head(stats)
filter <- stats$Turbidity < 2 # comparing the value of the vector
stats[filter,] # filtering data

stats[stats$Water.Temperature > 5,] #getting all info from all Water.Temperature over 10
stats[stats$Water.Temperature > 5 & stats$Turbidity < 2,]
stats[stats$ Beach.Name == "High Temperature",]
levels(stats$ Beach.Name)

#-------------------------------QPLOT()
#install.packages("ggplot2")
library(ggplot2) # adding qplot librery
?qplot 
qplot(data=stats, x=Water.Temperature)
qplot(data=stats, x= Beach.Name, y=Water.Temperature)
qplot(data=stats, x= Beach.Name, y=Turbidity, z=Water.Temperature, size=I(3)) #Maping the value to size 10
qplot(data=stats, x= Beach.Name, y=Water.Temperature, size=I(3),
    color=I("blue")) # display with clor blue
qplot(data=stats, x= Turbidity, color=Beach.Name, y=Water.Temperature, geom="boxplot") # Finding the water temperature and displaying the data



#------------------------------Second things that i need to visualise


qplot(data=stats, x= Turbidity, y=Water.Temperature)
qplot(data=stats, x= Turbidity, y=Water.Temperature,
      color=I("red"), size=I(4))
# 
qplot(data=stats, x= Water.Temperature, y=Turbidity,
      color=Beach.Name, size=I(5)) # Shows based on groups
#--------------------------------
qplot(data=stats, x=Turbidity, y=Water.Temperature,
      colour=Beach.Name, size=I(5), shape=I(24),
      alpha=I(0.6),
      main="Water Temperature and Turbidity") #schatered chart




