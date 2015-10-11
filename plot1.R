ds <- read.table("household_power_consumption.txt",sep=";", header = TRUE,na.strings = "?")

ds$Time <- strptime(ds$Time,format = "%d-%m-%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

dss<-ds[ds$Date=="2007-02-02" | ds$Date=="2007-02-01",] 
x<-dss$Global_active_power

png(file="plot1.png",width = 480, height = 480, units = "px")
hist(x,col = "red",main ="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()