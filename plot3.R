# read data
wholeData <- read.table("household_power_consumption.txt",sep = ";",header = T)

# subset data
useData <- wholeData[(wholeData$Date=="1/2/2007"|wholeData$Date=="2/2/2007"),]

# clean and process data
useData$Global_active_power <- as.numeric(as.character(useData$Global_active_power))
useData$Sub_metering_1 <- as.numeric(as.character(useData$Sub_metering_1))
useData$Sub_metering_2 <- as.numeric(as.character(useData$Sub_metering_2))
useData$Sub_metering_3 <- as.numeric(as.character(useData$Sub_metering_3))
useData$datetime <- paste0(useData$Date," ",useData$Time)
useData$datetime <- strptime(useData$datetime,format="%d/%m/%Y %H:%M:%S")

# plot data
png("plot3.png",width = 480,height = 480,units = "px")
plot(useData$datetime,useData$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering",col="black")
lines(useData$datetime,useData$Sub_metering_2,col="red")
lines(useData$datetime,useData$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()