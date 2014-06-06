# Read data file from working directory
data <- read.csv2("household_power_consumption.txt", header=TRUE,
        na.strings="?", colClasses = "character", nrows=70000)

# subset data
DT <- data[which(data$Date=="1/2/2007"|data$Date== "2/2/2007"),]

# creat new variable datetime in DT to combind date and time and change it to 
# POSIXlt format
DT$datetime <- paste(DT$Date, DT$Time)
x <- strptime(DT$datetime, format = "%d/%m/%Y%H:%M:%S", tz = "")

# change variables from character to mumeric
for(i in 3:9){
        DT[,i]=as.numeric(DT[,i])   
}

## creat png file
png("plot4.png",width = 480, height = 480)

par(mfcol = c(2,2))

# plot "Global Active Power
plot(x, DT[,3], xlab="", ylab= "Global Active Power", type="l")

# plot "Energy sub metering"
plot(x, DT[,7], type="l", xlab="", ylab= "Energy sub metering")
lines(x, DT[,8], type="l", col="red")
lines(x, DT[,9], type="l", col="blue")
legend('topright', names(DT)[7:9], lty=1, col=c('black', 'red', 'blue'), bty='n',
       cex=.75)

# plot "Voltage"
plot(x, DT[,5], xlab="datetime", ylab= "Voltage", type="l")

# plot "Global_reactive_power"
plot(x, DT[,4], xlab="datetime", ylab= "Global_reactive_power", type="l")

## Close plot session
dev.off()


