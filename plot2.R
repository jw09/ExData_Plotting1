# read data from working directory
library(data.table) 
data <- fread("household_power_consumption.txt",na.strings="?", 
              colClasses = "character")[Date == "1/2/2007"|Date == "2/2/2007",]
DT <- data.frame(data)

# creat new variable datetime in DT to combind date and time and change it to 
# POSIXlt format
DT$datetime <- paste(DT$Date, DT$Time)
x <- strptime(DT$datetime, format = "%d/%m/%Y%H:%M:%S", tz = "")

# change variable Global_active_power from character to mumeric
y <- as.numeric(DT[, 3])

# plot the graph
plot(x, y, xlab="", ylab= "Global Active Power (kilowatts)", type="l")

## Copy to png file
png("plot2.png",width = 480, height = 480)
plot(x, y, xlab="", ylab= "Global Active Power (kilowatts)", type="l")

## Close plot session
dev.off()