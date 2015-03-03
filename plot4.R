#Read data
raw_data <- read.table("household_power_consumption.txt",header = TRUE,,na.strings = "?",sep = ";",
                       colClasses = c("character","character",rep("numeric",7)))
library(lubridate)
#change characters to date format
raw_data$Day <- dmy(raw_data[,1])
raw_data$Hour <- hms(raw_data[,2])

#cut the subdata used and create a variable holding the hours and dates
subdata <- subset(raw_data, Day <= ymd("2007-02-02"))
subdata <- subset(subdata, Day >= ymd("2007-02-01"))
subdata$DayTime <- subdata$Day + subdata$Hour


#write the plot to png file with legend 
png(file="plot4.png",width = 480,height=480)
par(mfrow=c(2,2))

plot(subdata$Global_active_power ~ subdata$DayTime,type = "l", ylab = "Global Active Power",
     xlab="")
plot(subdata$Voltage ~ subdata$DayTime, type = "l", ylab="Voltage", xlab="datetime")
plot(subdata$Sub_metering_1 ~ subdata$DayTime,type = "n", ylab ="Energy sub metering",
     xlab = "")
points(subdata$Sub_metering_1 ~ subdata$DayTime,type = "l",col=1)
points(subdata$Sub_metering_2 ~ subdata$DayTime,type = "l",col=2)
points(subdata$Sub_metering_3 ~ subdata$DayTime,type = "l",col=4)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c(1,2,4))
plot(subdata$Global_reactive_power ~ subdata$DayTime,type="l",
     xlab="datetime",ylab="Global_reactive_power")

dev.off()