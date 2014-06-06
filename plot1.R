# read data from working directory
data <- read.csv2("household_power_consumption.txt", header=TRUE,
                  na.strings="?", colClasses = "character", nrows=70000)

# subset data
DT <- data[which(data$Date=="1/2/2007"|data$Date== "2/2/2007"),]

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
