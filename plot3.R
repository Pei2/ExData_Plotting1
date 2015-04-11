elec<-read.table("household_power_consumption.txt", sep=";", header=TRUE,na="?")
dim(elec) # 2075259 9
str(elec)
elec1<-subset(elec, elec$Date %in% c("1/2/2007","2/2/2007"))
elec1$DateTime<-as.POSIXct(strptime(paste(elec1$Date,elec1$Time), "%d/%m/%Y %H:%M:%S"))
dim(elec1) #2880 9 

png(file="plot3.png", width=480, height=480,units="px")
with(elec1, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(elec1, lines(DateTime, Sub_metering_2, col="red"))
with(elec1, lines(DateTime, Sub_metering_3, col="blue"))
with(elec1, legend("topright", col=c("black", "red","blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd=1))
dev.off()