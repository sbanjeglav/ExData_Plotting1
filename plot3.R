//loading data

data <- read.table ("household_power_consumption.txt", sep = ";", header = T)

//strptime for Time manipulation
//as.Date for Date manipulation

data$Date <- as.Date (data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Time <- strftime(data$Time, "%H:%M:%S") //turns to char

//filtering only 2 days
data2 <- filter (data, Date >= "2007-02-01" & Date <= "2007-02-02")

//Plot 3
//change column class from factor to numeric

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

//changing margins to fit the legend

par(mar = c(2,4.1,1,1))
with(data2, plot(Date_Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data2, points(Date_Time, Sub_metering_1, type = "o", pch = NA, col = "black"))
with(data2, points(Date_Time, Sub_metering_2, type = "o", pch = NA, col = "red"))
with(data2, points(Date_Time, Sub_metering_3, type = "o", pch = NA, col = "blue"))
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()
