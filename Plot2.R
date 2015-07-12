#prepare column names
names <- c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#read only relevant lines
dat <- read.csv("household_power_consumption.txt",sep = ";", skip = 66636 , nrows = 2880, col.names = names, na.strings = "?")
#open device
png("Plot2.png",height=480, width=480)
#plot data
plot(dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", axes = FALSE)
axis(1, at = c(1, 1440,2880), c("Thu", "Fri", "Sat"))
axis(2)
box()
#save plot
dev.off()
