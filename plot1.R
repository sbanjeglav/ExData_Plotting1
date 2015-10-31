//loading data

data <- read.table ("household_power_consumption.txt", sep = ";", header = T)

//strptime for Time manipulation
//as.Date for Date class manipulation

data$Date <- as.Date (data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Time <- strftime(data$Time, "%H:%M:%S") //turns to char

//filtering only 2 days
data2 <- filter (data, Date >= "2007-02-01" & Date <= "2007-02-02")

//Plot1: HISTOGRAM

//Converting "Global_active_power" from factor to numeric

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

hist(data2$Global_active_power, main= "Global active power", col="red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file= "plot1.png", width=480, height = 480) //480x480 pix
