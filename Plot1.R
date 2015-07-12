#prepare column names
names <- c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#read only relevant lines
dat <- read.csv("household_power_consumption.txt",sep = ";", skip = 66636 , nrows = 2880, col.names = names, na.strings = "?")
#open png device
png("Plot1.png",height = 480, width = 480)
#plot data
plt <- hist(dat$Global_active_power, ylim = c(0,1200), col = c("Red"),xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#save plot
dev.off()
