ds <- read.table("household_power_consumption.txt",sep=";", header = TRUE,na.strings = "?")

p <- paste(as.Date(ds$Date, "%d/%m/%Y"),ds$Time)
ds$Time <- strptime(p,format = "%Y-%m-%d %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

dss<-ds[ds$Date=="2007-02-02" | ds$Date=="2007-02-01",] 

png(file="plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(dss$Time,dss$Global_active_power,ylab="Global Active Power",type = "l",xlab="")
plot(dss$Time,dss$Voltage,xlab="datetime",ylab="Voltage",type = "l") 
plot(dss$Time, dss$Sub_metering_1 , type = "l",xlab="",ylab="Energy sub metering") 
points(dss$Time, dss$Sub_metering_2, col = "red",type = "l")
points(dss$Time, dss$Sub_metering_3, col = "blue",type = "l")       
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=0.75)
plot(dss$Time,dss$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type = "l")
dev.off()