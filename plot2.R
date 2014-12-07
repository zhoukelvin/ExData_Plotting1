
Sys.setlocale("LC_ALL", "English")
data<- read.csv("household_power_consumption.txt",na.strings="?",fill=T,sep=";",header=T,stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data<- data[data$Date == as.Date("1/2/2007", format="%d/%m/%Y")|data$Date == as.Date("2/2/2007", format="%d/%m/%Y"),]
data$datetime <-  strptime(paste(data$Date,data$Time),     format="%Y-%m-%d %H:%M:%S")

png("plot2.png",width=480,height=480,units='px')
plot(data$datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
