#clean-up
rm(list=ls())
#NOTE: assuming the data file is in the current directory
#read file
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,quote = "\"'",stringsAsFactors = FALSE)
#formatting the Time column
hpc$Time<-strptime(paste(as.character(hpc$Date), as.character(hpc$Time)),format="%d/%m/%Y %H:%M:%S")
#formatting the Date column
hpc$Date<-as.Date(as.character(hpc$Date),format="%d/%m/%Y")
#subset - for the two days in Feb 2007
feb2007_hpc<-subset(hpc,Date >= "2007-02-01" & Date <= "2007-02-02")
#plot data
#open file - graphic device type = png
png(filename="plot4.png",width=480,height=480)
#mfcol is set to control the order of plotting
par(mfcol=c(2,2))
#plot 1
with(feb2007_hpc,plot(Time,Global_active_power,type="n",xlab="",ylab="Global Active Power"))
with(feb2007_hpc,lines(Time,Global_active_power))
#plot 2
with(feb2007_hpc,plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy Sub metering"))
with(feb2007_hpc,lines(Time,Sub_metering_1,col="black"))
with(feb2007_hpc,lines(Time,Sub_metering_2,col="red"))
with(feb2007_hpc,lines(Time,Sub_metering_3,col="blue"))
with(feb2007_hpc,legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n"))
#plot 3
with(feb2007_hpc,plot(Time,Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(feb2007_hpc,lines(Time,Voltage))
#plot 4
with(feb2007_hpc,plot(Time,Global_reactive_power,type="n",xlab="datetime",ylab="Global Reactive Power"))
with(feb2007_hpc,lines(Time,Global_reactive_power))
#shut off the graphic device
dev.off()