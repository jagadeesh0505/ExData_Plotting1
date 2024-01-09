library(dplyr)

#Import DF from txt file
file <- "D:\\R Coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt"
DF <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Subset DF from the dates 2007-02-01 and 2007-02-02

DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

Sys.setlocale("LC_TIME", "English")

#Format the time vector
date_converted <- as.Date(DF[, 1], format = "%d/%m/%Y")
time_converted <- strptime(DF[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, DF[, 2]))

#Plot global active power against time vector
plot(time_axis, DF[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#copying to png
dev.copy(png, filename="D:\\R Coursera\\plot2.png")
dev.off()
