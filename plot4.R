//loading data

data <- read.table ("household_power_consumption.txt", sep = ";", header = T)

//strptime for Time manipulation
//as.Date for Date manipulation

data$Date <- as.Date (data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Time <- strftime(data$Time, "%H:%M:%S") //turns to char

//filtering only 2 days
data2 <- filter (data, Date >= "2007-02-01" & Date <= "2007-02-02")

//Plot 4

data2$Voltage <- as.numeric(as.character(data2$Voltage))

par(mfrow = c(2,2), mar = c(4, 1, 1, 1))
with(data2, plot(Date_Time, Global_active_power, type = "o", pch = NA, xlab="" ,ylab = "Global Active Power"))

with(data2, plot(Date_Time, Voltage, type = "o", pch = NA, xlab = "datetime"))

with(data2, plot(Date_Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data2, points(Date_Time, Sub_metering_1, type = "o", pch = NA, col = "black"))
with(data2, points(Date_Time, Sub_metering_2, type = "o", pch = NA, col = "red"))
with(data2, points(Date_Time, Sub_metering_3, type = "o", pch = NA, col = "blue"))
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot4.png")
dev.off()
