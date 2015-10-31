//loading data

data <- read.table ("household_power_consumption.txt", sep = ";", header = T)

//strptime for Time manipulation
//as.Date for Date manipulation

data$Date <- as.Date (data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Time <- strftime(data$Time, "%H:%M:%S") //turns to char

//filtering only 2 days
data2 <- filter (data, Date >= "2007-02-01" & Date <= "2007-02-02")


//Plot2
//make new column mutating Date & Time columns

data2 <- mutate(data2, Date_Time = paste(Date, Time))
data2$Date_Time <- strptime (data2$Date_Time, "%Y-%m-%d %H:%M:%S")
with(data2, plot(Date_Time, Global_active_power, type = "o", pch = NA, ylab = "Global Active Power (kilowats)"))

dev.copy(png, file= "plot2.png", width=480, height = 480)
dev.off()

