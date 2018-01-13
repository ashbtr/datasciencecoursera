#Reading .txt file in from working directory
power <- read_delim("household_power_consumption.txt", delim = ";")
library(lubridate)
#Changing Date column to date class
power$Date <- dmy(power$Date)

#Filtering to dates of analysis
library(dplyr)
power2 <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
power2$datetime <- as.POSIXct(paste(power2$Date, power2$Time), format = "%Y-%m-%d %H:%M:%S")

#Making plot array
par(mfrow = c(2,2))
#Add plotA
plot(power2$datetime, power2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
#Add plotB
with(power2, plot(datetime, Voltage, col = "black", type = "l"))
#Add plotC
plot(power2$datetime, power2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(power2$datetime, power2$Sub_metering_2, xlab="", ylab="", col = "red")
lines(power2$datetime, power2$Sub_metering_3, xlab="", ylab="", col = "blue")
legend("topright", bty = "n", xjust = 1, yjust = 1, col = c("black", "red", "blue"),lty = 1, cex = 0.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Add plotD
with(power2, plot(datetime, Global_reactive_power, col = "black", type = "l"))
#Export png
dev.copy(png, "plot4.png")
dev.off()