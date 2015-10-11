ds <- read.table("household_power_consumption.txt",sep=";", header = TRUE,na.strings = "?")

p <- paste(as.Date(ds$Date, "%d/%m/%Y"),ds$Time)
ds$Time <- strptime(p,format = "%Y-%m-%d %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

dss<-ds[ds$Date=="2007-02-02" | ds$Date=="2007-02-01",] 
png(file="plot3.png",width = 480, height = 480, units = "px")
with(dss, plot(dss$Time, dss$Sub_metering_1 , type = "l",xlab="",ylab="Energy sub metering")) 
points(dss$Time, dss$Sub_metering_2, col = "red",type = "l")
points(dss$Time, dss$Sub_metering_3, col = "blue",type = "l")       
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=0.75)
dev.off()