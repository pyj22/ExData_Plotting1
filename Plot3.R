rawdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                    na.strings = "?", nrows = 2075259, check.names = F, 
                    stringsAsFactors = F, comment.char = "", quote = '\"')
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")
data <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(rawdata)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
png(file="Plot3.png")
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()