
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


# Plot  3 
library(datasets)

Sys.setlocale("LC_TIME", "us_US")
## combine date and time column into one vector
DateTime <- strftime(paste(DF1$Date, DF1$Time), format = "%Y-%m-%d %H:%M:%S")
# for each element of the vector DateTime finds which week day corresponds
DayOfWeek <- strftime(DateTime, format = "%a")
### merge data set DF1 with 2 new columns Day of week and Datetime
DF2 <- cbind(DayOfWeek, DateTime, DF1)

# Plot  3

png(file = "plot3.png", width = 480, height = 480)
plot(DF2$DateTime, DF2$Sub_metering_1,
     ylim = c(0, max(DF2$Sub_metering_1, DF2$Sub_metering_2, DF2$Sub_metering_3)),
     main = "", 
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n")
lines(DF2$DateTime, DF2$Sub_metering_1, col = "black")
lines(DF2$DateTime, DF2$Sub_metering_2, col = "red")
lines(DF2$DateTime, DF2$Sub_metering_3, col = "blue")
axis(1, at = DF2$DateTime[DF2$Time == "00:00:00"], 
     labels = DF2$DayOfWeek[DF2$Time == "00:00:00"])
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = rep(1, 3),
       col = c("black", "red", "blue"))
dev.off()
