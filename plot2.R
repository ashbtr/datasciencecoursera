#Reading .txt file in from working directory
power <- read_delim("household_power_consumption.txt", delim = ";")
library(lubridate)
#Changing Date column to date class
power$Date <- dmy(power$Date)

#Filtering to dates of analysis
library(dplyr)
power2 <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
power2$datetime <- as.POSIXct(paste(power2$Date, power2$Time), format = "%Y-%m-%d %H:%M:%S")
#Constructing plot 2
par(mfcol = c(1,1))
plot(power2$datetime, power2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#Export png
dev.copy(png, "plot2.png")
dev.off()