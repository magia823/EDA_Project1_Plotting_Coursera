
### Porject 1  EDA Coursera
setwd("C:/Users/mkocic/Desktop/Coursera/4.EDA/Week2/Project1")
##read the data 
DF <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
# Convert Date variable, change the format
DF$Date<-as.Date(DF$Date, format= "%d/%m/%Y")
### subset data set by dates 2007-02-01 and 2007-02-02  
DF1<-DF[DF$Date >="2007-02-01" & DF$Date<= "2007-02-02",]
#### add to df1 and value for the case DF$Date == "2007-02-03" & DF$Time == "00:00:00"
DF1 <- rbind(DF1, DF[DF$Date == "2007-02-03" & DF$Time == "00:00:00", ])


# Plot  1 
library(datasets)
png(file = "plot1.png", width=480,height=480)
hist(DF1$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
