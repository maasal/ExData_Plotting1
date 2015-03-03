#Read data
raw_data <- read.table("household_power_consumption.txt",header = TRUE,,na.strings = "?",sep = ";",
                       colClasses = c("character","character",rep("numeric",7)))
library(lubridate)
raw_data$Day <- dmy(raw_data[,1]) #change to readable dates
raw_data$Hour <- hms(raw_data[,2]) #change to readable hours

#cut data to a manageable size
subdata <- subset(raw_data, Day <= ymd("2007-02-02")) 
subdata <- subset(subdata, Day >= ymd("2007-02-01"))
subdata$DayTime <- subdata$Day + subdata$Hour

#write plot to png file
png(file="plot2.png",width = 480,height=480)
plot(subdata$Global_active_power ~ subdata$DayTime,type = "l", ylab = "Global Active Power (kilowatts)",
     xlab="")
dev.off()
