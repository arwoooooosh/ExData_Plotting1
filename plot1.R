file_name <- "household_power_consumption.txt"

# Load and subset data
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Create plot
hist(data[, "Global_active_power"], col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close device
dev.off()
