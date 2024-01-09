library(dplyr)

#Import DF from txt file
file <- "D:\\R Coursera\\exDF_DF_household_power_consumption\\household_power_consumption.txt"
DF <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Subset DF from the dates 2007-02-01 and 2007-02-02

DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

Sys.setlocale("LC_TIME", "English")

#Format the time vector
date_converted <- as.Date(DF[, 1], format = "%d/%m/%Y")
time_converted <- strptime(DF[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, DF[, 2]))

plot(time_axis, DF[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, DF[, 8], col = "red")
lines(time_axis, DF[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

#copying to png
dev.copy(png, filename="D:\\R Coursera\\plot3.png")
dev.off()
