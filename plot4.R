setwd("C:\\Users\\Daniel\\Documents\\Coursera\\Exploring Data\\Week 1\\exdata-data-household_power_consumption")

#Loading data
full_data<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,header = TRUE,sep = ";")
full_data$Date = strptime(full_data$Date,"%d/%m/%Y")
feb_data<-full_data["2007-02-01"<=full_data$Date & full_data$Date<="2007-02-02",]
feb_data$sec <- as.numeric(feb_data$Date)-as.numeric(strptime("01/02/2007","%d/%m/%Y"))+as.numeric(substr(feb_data$Time,1,2))*3600+as.numeric(substr(feb_data$Time,4,5))*60+as.numeric(substr(feb_data$Time,7,8))
feb_data<-feb_data[order(as.numeric(feb_data$Date),as.numeric(feb_data$sec)),]

#Check missing
result <- feb_data$Global_active_power=="?"
table(result)#No missing during selected days
result <- feb_data$Sub_metering_1=="?"
table(result)#No missing during selected days
result <- feb_data$Sub_metering_2=="?"
table(result)#No missing during selected days
result <- feb_data$Sub_metering_3=="?"
table(result)#No missing during selected days
result <- feb_data$Voltage=="?"
table(result)#No missing during selected days
result <- feb_data$Global_reactive_power=="?"
table(result)#No missing during selected days

#Create plot 1
par(mfrow = c(2, 2), mar = c(3, 4.2, 0, 1), oma = c(0, 0, 0, 0))
par(pty="s")
Thu<-0
Fri<-as.numeric(strptime("02/02/2007","%d/%m/%Y"))-as.numeric(strptime("01/02/2007","%d/%m/%Y"))
Sat<-as.numeric(strptime("03/02/2007","%d/%m/%Y"))-as.numeric(strptime("01/02/2007","%d/%m/%Y"))
par(pch=0, col="black")
plot(feb_data$sec,as.numeric(feb_data$Global_active_power),xaxt = "n", type = "l",xlab="", ylab="Global active power",cex.lab=0.75,cex.axis = 0.75)
axis(1,c(Thu,Fri,Sat),c("Thu","Fri","Sat"),cex.axis = 0.75)

#Create plot 2
par(pch=0, col="black")
plot(feb_data$sec,as.numeric(feb_data$Voltage),xaxt = "n", type = "l",xlab="datetime", ylab="Voltage",cex.lab=0.75,cex.axis = 0.75)
axis(1,c(Thu,Fri,Sat),c("Thu","Fri","Sat"),cex.axis = 0.75)

#Create plot 3
par(col="black")
plot(feb_data$sec,as.numeric(feb_data$Sub_metering_1),xaxt = "n", yaxt = "n",type = "l",xlab="", ylim=c(0,40), ylab="")
par(col="red")
par(new=T)
plot(feb_data$sec,as.numeric(feb_data$Sub_metering_2),xaxt = "n", yaxt = "n", type = "l",xlab="", ylim=c(0,40), ylab="")
par(col="blue")
par(new=T)
plot(feb_data$sec,as.numeric(feb_data$Sub_metering_3),xaxt = "n", yaxt = "n", type = "l",xlab="", ylim=c(0,40), ylab="Energy sub metering",cex.lab = 0.75)
par(col="black")
axis(1,c(Thu,Fri,Sat),c("Thu","Fri","Sat"),cex.axis = 0.75)
axis(2,c(0,10,20,30),cex.axis = 0.75)
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),cex = 0.6)
box()

#Create plot 4
par(pch=0, col="black")
plot(feb_data$sec,as.numeric(feb_data$Global_reactive_power),xaxt = "n", type = "l",xlab="datetime", ylab="Global_reactive_powe",cex.lab=0.75,cex.axis = 0.75)
axis(1,c(Thu,Fri,Sat),c("Thu","Fri","Sat"),cex.axis = 0.75)

dev.copy(png,'plot4.png')
dev.off()