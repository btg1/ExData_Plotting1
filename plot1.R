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
png(filename="plot1.png",width=480,height=480)
#plot histogram
hist(as.numeric(feb2007_hpc$Global_active_power),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
#shut off the graphic device
dev.off()


