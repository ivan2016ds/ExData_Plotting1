# read data
wholeData <- read.table("household_power_consumption.txt",sep = ";",header = T)

# subset data
useData <- wholeData[(wholeData$Date=="1/2/2007"|wholeData$Date=="2/2/2007"),]

# clean and process data
useData$Global_active_power <- as.numeric(as.character(useData$Global_active_power))
useData$datetime <- paste0(useData$Date," ",useData$Time)
useData$datetime <- strptime(useData$datetime,format="%d/%m/%Y %H:%M:%S")

# plot data
png("plot2.png",width = 480,height = 480,units = "px")
plot(useData$datetime,useData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()