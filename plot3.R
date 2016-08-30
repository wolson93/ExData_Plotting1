plot3 <- function() {
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE,sep=";")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
pwr <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"), ]
pwr$Global_active_power <- as.numeric(as.character(pwr$Global_active_power))
pwr$Global_reactive_power <- as.numeric(as.character(pwr$Global_reactive_power))
pwr$Voltage <- as.numeric(as.character(pwr$Voltage))
pwr$Sub_metering_1 <- as.numeric(as.character(pwr$Sub_metering_1))
pwr$Sub_metering_2 <- as.numeric(as.character(pwr$Sub_metering_2))
pwr$Sub_metering_3 <- as.numeric(as.character(pwr$Sub_metering_3))
pwr$datetime <- as.POSIXct(paste(pwr$Date,pwr$Time))

plot(pwr$datetime,pwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr$datetime,pwr$Sub_metering_2,col="red")
lines(pwr$datetime,pwr$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
}
plot3()