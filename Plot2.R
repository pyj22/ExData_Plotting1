rawdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")
data <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(rawdata)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png(file="Plot2.png")
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
