raw_data <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";",
                       colClasses = c("character","character",rep("numeric",7)))
#dates used 2007-02-01 and 2007-02-02
library(lubridate)
raw_data[,1] <- dmy(raw_data[,1])
raw_data[,2] <- hms(raw_data[,2])
data <- raw_data[raw_data[,1] == startdate | raw_data[,1] == enddate,]





png(file = "plot1.png",width = 480,height = 480)
hist(data$Global_active_power, main = "Global Active Power", col ="red",
     xlab = "Global Active Power (kilowatts)")
dev.off()