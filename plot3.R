getwd()
setwd("~/RProgramming/")
library(reshape2)
library(dplyr)
install.packages("gsubfn")
library(gsubfn)

#Load Data
powerdata <- read.table('household_power_consumption.txt',
                        header = TRUE,
                        sep = ";",
                        colClasses = c("character", "character", rep("numeric",7)),
                        na = "?")

#Subset to dates of interest
powerdata.1 <- subset(powerdata, Date == '1/2/2007' | Date == '2/2/2007')
powerdata.1$datetime <- strptime(paste(powerdata.1$Date, powerdata.1$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

Sub_Metering_1 <- powerdata.1$Sub_metering_1
Sub_Metering_2 <- powerdata.1$Sub_metering_2
Sub_Metering_3 <- powerdata.1$Sub_metering_3
Date <- (powerdata.1$datetime)


plot(Date, Sub_Metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(Date, Sub_Metering_2, col = "red")
lines(Date, Sub_Metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)

dev.off()
