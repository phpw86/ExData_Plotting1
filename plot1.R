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


png(filename = "plot1.png", 
       width = 480, height = 480, 
       units = "px", bg = "transparent")

Global_Active_Power <- powerdata.1$Global_active_power

hist(Global_Active_Power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))

dev.off()
