# read data from working directory
library(data.table) 
data <- fread("household_power_consumption.txt",na.strings="?", 
      colClasses = "character")[Date == "1/2/2007"|Date == "2/2/2007",]
DT <- data.frame(data)

# set active power varible to mnumeric
power <- as.numeric(DT[, 3])

# plot histogram
hist(power, main="Global Active Power", xlab= "Global Active Power (kilowatts)",
     col ="red")

#creat png file
png("plot1.png",width = 480, height = 480)
hist(power, main="Global Active Power", xlab= "Global Active Power (kilowatts)",
     col ="red")
dev.off()
