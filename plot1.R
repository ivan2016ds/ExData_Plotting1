# read data
wholeData <- read.table("household_power_consumption.txt",sep = ";",header = T)

# subset data
useData <- wholeData[(wholeData$Date=="1/2/2007"|wholeData$Date=="2/2/2007"),]

# clean and process data
useData$Global_active_power <- as.numeric(as.character(useData$Global_active_power))

# plot data
png("plot1.png",width = 480,height = 480,units = "px")
hist(useData$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()