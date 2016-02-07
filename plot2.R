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

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

Global_Active_Power <- powerdata.1$Global_active_power
Date <- (powerdata.1$datetime)

plot(Date, Global_Active_Power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
