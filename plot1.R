
Sys.setlocale("LC_ALL", "English")
data<- read.csv("household_power_consumption.txt",na.strings="?",fill=T,sep=";",header=T)
data<- data[as.Date(data$Date) == as.Date("01/02/2007")|as.Date(data$Date) == as.Date("02/02/2007"),]
png("plot1.png",width=480,height=480,units='px')
hist(data$Global_active_power,col="red",xlab="Global Active Power(kilowatts) ",main="Global Active Power")
dev.off()
