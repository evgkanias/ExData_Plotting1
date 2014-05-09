fn <- "household_power_consumption.txt"
data <- read.csv(fn, header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data <- data[
    data$Date == as.Date("2007-02-01") |
        data$Date == as.Date("2007-02-02"),
    ]
global_active_power <- as.numeric(as.character(data$Global_active_power))

png(file="plot1.png", width=480, height=480, units="px", bg="transparent")
hist(global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
