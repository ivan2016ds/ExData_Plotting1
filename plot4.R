# read data
wholeData <- read.table("household_power_consumption.txt",sep = ";",header = T)

# subset data
useData <- wholeData[(wholeData$Date=="1/2/2007"|wholeData$Date=="2/2/2007"),]

# clean and process data
useData$Global_active_power <- as.numeric(as.character(useData$Global_active_power))
useData$Sub_metering_1 <- as.numeric(as.character(useData$Sub_metering_1))
useData$Sub_metering_2 <- as.numeric(as.character(useData$Sub_metering_2))
useData$Sub_metering_3 <- as.numeric(as.character(useData$Sub_metering_3))
useData$Voltage <- as.numeric(as.character(useData$Voltage))
useData$Global_reactive_power <- as.numeric(as.character(useData$Global_reactive_power))
useData$datetime <- paste0(useData$Date," ",useData$Time)
useData$datetime <- strptime(useData$datetime,format="%d/%m/%Y %H:%M:%S")

# plot data

## init
png("plot4.png",width = 480,height = 480,units = "px")
par(mfcol=c(2,2))

## 1st plot
plot(useData$datetime,useData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## 2nd plot
plot(useData$datetime,useData$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering",col="black")
lines(useData$datetime,useData$Sub_metering_2,col="red")
lines(useData$datetime,useData$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## 3rd plot
plot(useData$datetime,useData$Voltage,type="l",xlab="datetime",ylab="Voltage")

## 4th plot
plot(useData$datetime,useData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## close
dev.off()