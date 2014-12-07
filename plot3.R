
Sys.setlocale("LC_ALL", "English")
data<- read.csv("household_power_consumption.txt",na.strings="?",fill=T,sep=";",header=T,stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data<- data[data$Date == as.Date("1/2/2007", format="%d/%m/%Y")|data$Date == as.Date("2/2/2007", format="%d/%m/%Y"),]
data$datetime <-  strptime(paste(data$Date,data$Time),     format="%Y-%m-%d %H:%M:%S")

png("plot3.png",width=480,height=480,units='px')
plot(data$datetime, data$Sub_metering_1, type="l",   xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
