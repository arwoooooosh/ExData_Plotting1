file_name <- "household_power_consumption.txt"

# Load and subset data
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert date and time
Sys.setlocale("LC_TIME", "English")
date_converted <- as.Date(data[, "Date"], format = "%d/%m/%Y")
time_axis <- as.POSIXct(paste(date_converted, data[, "Time"]))

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set up 2x2 layout
par(mfrow = c(2, 2))

# Create plots
plot(time_axis, data[, "Global_active_power"], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(time_axis, data[, "Voltage"], xlab = "datetime", ylab = "Voltage", type = "l")
plot(time_axis, data[, "Sub_metering_1"], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, "Sub_metering_2"], col = "red")
lines(time_axis, data[, "Sub_metering_3"], col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), cex = 0.8, lty = 1, bty = "n")
plot(time_axis, data[, "Global_reactive_power"], xlab = "datetime", ylab = "Global Reactive Power", type = "l")

# Close device
dev.off()
