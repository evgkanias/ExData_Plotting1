fn <- "household_power_consumption.txt"
data <- read.csv(fn, header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data <- data[
    data$Date == as.Date("2007-02-01") |
        data$Date == as.Date("2007-02-02"),
    ]
datetime <- strptime(
    paste(data$Date, data$Time),
    format = "%Y-%m-%d %H:%M:%S"
);

global_active_power <- as.numeric(as.character(data$Global_active_power))

voltage <- as.numeric(as.character(data$Voltage))

Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

png(file="plot4.png", width=480, height=480, units="px", bg="transparent")

par(mfrow = c(2,2))

# plot 1.1
plot(datetime, global_active_power, type="l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# plot 1.2
plot(datetime, voltage, type="l", ylab = "Voltage")

# plot 2.1
plot(datetime, Sub_metering_1, type="l", col = "black",
     xlab = "", ylab = "Energy sub metering")
points(datetime, Sub_metering_2, type="l", col = "red")
points(datetime, Sub_metering_3, type="l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 2.2
plot(datetime, Global_reactive_power, type="l")

dev.off()
