#set library path for that session
.libPaths("D:\\RScripts\\library")

#set working dir
setwd("D:\\RScripts\\Coursera\\4_ExploratoryDataAnalysis")

srcdata <- "..\\DATA\\household_power_consumption.txt"
plot1data <- read.table(srcdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selplot1data <- plot1data[plot1data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(selplot1data$Date, selplot1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(selplot1data$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
