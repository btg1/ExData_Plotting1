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
png(filename="plot3.png",width=480,height=480)
#empty plot with labels 
plot(feb2007_hpc$Time,feb2007_hpc$Sub_metering_1,type="n",xlab="",ylab="Energy Sub metering")
#line graphs 
lines(feb2007_hpc$Time,feb2007_hpc$Sub_metering_1,col="black")
lines(feb2007_hpc$Time,feb2007_hpc$Sub_metering_2,col="red")
lines(feb2007_hpc$Time,feb2007_hpc$Sub_metering_3,col="blue")
#add legend for each data plotted
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#shut off the graphic device
dev.off()