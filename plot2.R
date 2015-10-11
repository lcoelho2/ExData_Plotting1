ds <- read.table("household_power_consumption.txt",sep=";", header = TRUE,na.strings = "?")

p <- paste(as.Date(ds$Date, "%d/%m/%Y"),ds$Time)
ds$Time <- strptime(p,format = "%Y-%m-%d %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

dss<-ds[ds$Date=="2007-02-02" | ds$Date=="2007-02-01",] 
png(file="plot2.png",width = 480, height = 480, units = "px")
plot(x=dss$Time ,y=dss$Global_active_power,ylab="Global Active Power (kilowatts)",type = "l",xlab="")
dev.off()