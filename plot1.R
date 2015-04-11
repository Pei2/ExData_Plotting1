elec<-read.table("household_power_consumption.txt", sep=";", header=TRUE,na="?")
dim(elec) # 2075259 9
str(elec)
elec1<-subset(elec, elec$Date %in% c("1/2/2007","2/2/2007"))
elec1$DateTime<-as.POSIXct(strptime(paste(elec1$Date,elec1$Time), "%d/%m/%Y %H:%M:%S"))
dim(elec1) #2880 9 

# Draw the first plot in png
png(file="plot1.png",width=480,height=480,units="px")
with(elec1, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
