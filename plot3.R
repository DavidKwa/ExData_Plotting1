#set library path for that session
.libPaths("D:\\RScripts\\library")

#set working dir
setwd("D:\\RScripts\\Coursera\\4_ExploratoryDataAnalysis")

srcdata <- "..\\DATA\\household_power_consumption.txt"
plot1data <- read.table(srcdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selplot1data <- plot1data[plot1data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(selplot1data$Date, selplot1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(selplot1data$Sub_metering_1)
submetering2 <- as.numeric(selplot1data$Sub_metering_2)
submetering3 <- as.numeric(selplot1data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
