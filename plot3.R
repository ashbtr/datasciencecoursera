#Reading .txt file in from working directory
power <- read_delim("household_power_consumption.txt", delim = ";")
library(lubridate)
#Changing Date column to date class
power$Date <- dmy(power$Date)

#Filtering to dates of analysis
library(dplyr)
power2 <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
power2$datetime <- as.POSIXct(paste(power2$Date, power2$Time), format = "%Y-%m-%d %H:%M:%S")
#Constructing plot 3
par(mfcol = c(1,1))
plot(power2$datetime, power2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(power2$datetime, power2$Sub_metering_2, xlab="", ylab="", col = "red")
lines(power2$datetime, power2$Sub_metering_3, xlab="", ylab="", col = "blue")
legend("topright", xjust = 1, yjust = 1, col = c("black", "red", "blue"),lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Export png
dev.copy(png, "plot3.png")
dev.off()