#set library path for that session
.libPaths("D:\\RScripts\\library")

#set working dir
setwd("D:\\RScripts\\Coursera\\4_ExploratoryDataAnalysis")

srcdata <- "..\\DATA\\household_power_consumption.txt"
plot1data <- read.table(srcdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selplot1data <- plot1data[plot1data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(selplot1data$Date, selplot1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(selplot1data$Global_active_power)
globalreactivepower <- as.numeric(selplot1data$Global_reactive_power)
voltage <- as.numeric(selplot1data$Voltage)
submetering1 <- as.numeric(selplot1data$Sub_metering_1)
submetering2 <- as.numeric(selplot1data$Sub_metering_2)
submetering3 <- as.numeric(selplot1data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex=0.95)

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
