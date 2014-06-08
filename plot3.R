# read data from working directory
library(data.table) 
data <- fread("household_power_consumption.txt",na.strings="?", 
              colClasses = "character")[Date == "1/2/2007"|Date == "2/2/2007",]
DT <- data.frame(data)

# creat new variable datetime in DT to combind date and time and change it to 
# POSIXlt format
DT$datetime <- paste(DT$Date, DT$Time)
x <- strptime(DT$datetime, format = "%d/%m/%Y%H:%M:%S", tz = "")

# change variables for sub metering energy from character to mumeric
y1 <- as.numeric(DT[, 7])
y2 <- as.numeric(DT[, 8])
y3 <- as.numeric(DT[, 9])

## creat png file
png("plot3.png",width = 480, height = 480)

# plot the graph
plot(x, y1, type="l", xlab="", ylab= "Energy sub metering")
lines(x, y2, type="l", col="red")
lines(x, y3, type="l", col="blue")
legend('topright', names(DT)[7:9], lty=1, col=c('black', 'red', 'blue'), bty='n',
       cex=.75)

## Close plot session
dev.off()


