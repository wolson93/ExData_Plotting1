plot1 <- function(){
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

hist(pwr$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
}
plot1()