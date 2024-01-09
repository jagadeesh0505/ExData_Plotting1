library(dplyr)

#Import DF from txt file
file <- "D:\\R Coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt"
DF <- read.table(file, header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Subset DF from the dates 2007-02-01 and 2007-02-02

DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

#Plot the histogram plot
hist(DF[, 3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#copying to png
dev.copy(png, filename="D:\\R Coursera\\exdata_data_household_power_consumption\\plot1.png")
dev.off()
