#prepare column names
names <- c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#read only relevant lines
dat <- read.csv("household_power_consumption.txt",sep = ";", skip = 66636 , nrows = 2880, col.names = names, na.strings = "?")
#open device
png("Plot4.png",height=480, width=480)
#plot data
par(mfrow=c(2,2))
#subplot1
plot(dat$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", axes = FALSE)
axis(1, at = c(1, 1440,2880), c("Thu", "Fri", "Sat"))
axis(2)
box()
#subplot2
plot(dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", axes = FALSE)
axis(1, at = c(1, 1440,2880), c("Thu", "Fri", "Sat"))
axis(2)
box()
#subplot 3
plot(dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", axes = FALSE, xlab = "", col=c("Black"))
lines(dat$Sub_metering_2, type = "l", ylab = "", xlab = "", col=c("Red"))
lines(dat$Sub_metering_3, type = "l", ylab = "", xlab = "", col=c("Blue"), ylab= "Energy sub metering")
axis(1, at = c(1, 1440,2880), c("Thu", "Fri", "Sat"))
axis(2, at = c(0,10,20,30))
legend("topright", legend = c(names[7:9]), col=c("black","red","blue"), lwd=1, bty="n")
box()
#subplot 4
plot(dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = names[4], axes = FALSE)
axis(1, at = c(1, 1440,2880), c("Thu", "Fri", "Sat"))
axis(2)
box()
#save plot
dev.off()
