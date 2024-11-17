file_name <- "household_power_consumption.txt"

# Load and subset data
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert date and time
Sys.setlocale("LC_TIME", "English")
date_converted <- as.Date(data[, "Date"], format = "%d/%m/%Y")
time_axis <- as.POSIXct(paste(date_converted, data[, "Time"]))

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Create plot
plot(time_axis, data[, "Global_active_power"], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# Close device
dev.off()
