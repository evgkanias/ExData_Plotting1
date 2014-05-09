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
global_active_power <- as.numeric(as.character(data$Global_active_power))

png(file="plot2.png", width=480, height=480, units="px", bg="transparent")
plot(date_time, global_active_power, type="l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
