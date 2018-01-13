#Reading .txt file in from working directory
power <- read_delim("household_power_consumption.txt", delim = ";")
library(lubridate)
#Changing Date column to date class
power$Date <- dmy(power$Date)
#Filtering to dates of analysis
library(dplyr)
power2 <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
#Constructing plot 1
par(mfcol = c(1,1))
with(power2, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
#Export png
dev.copy(png, "plot1.png")
dev.off()
