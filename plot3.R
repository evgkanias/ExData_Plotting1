fn <- "household_power_consumption.txt"
data <- read.csv(fn, header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data <- data[
    data$Date == as.Date("2007-02-01") |
        data$Date == as.Date("2007-02-02"),
    ]
date_time <- strptime(
    paste(data$Date, data$Time),
    format = "%Y-%m-%d %H:%M:%S"
);

Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

png(file="plot3.png", width=480, height=480, units="px", bg="transparent")
plot(date_time, Sub_metering_1, type="l", col = "black",
     xlab = "", ylab = "Energy sub metering")
points(date_time, Sub_metering_2, type="l", col = "red")
points(date_time, Sub_metering_3, type="l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
