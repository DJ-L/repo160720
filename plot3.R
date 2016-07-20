setwd("C:\\Users\\Daniel\\Documents\\Coursera\\Exploring Data\\Week 1\\exdata-data-household_power_consumption")


#Loading data
full_data<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,header = TRUE,sep = ";")
full_data$Date = strptime(full_data$Date,"%d/%m/%Y")
feb_data<-full_data["2007-02-01"<=full_data$Date & full_data$Date<="2007-02-02",]
feb_data$sec <- as.numeric(feb_data$Date)-as.numeric(strptime("01/02/2007","%d/%m/%Y"))+as.numeric(substr(feb_data$Time,1,2))*3600+as.numeric(substr(feb_data$Time,4,5))*60+as.numeric(substr(feb_data$Time,7,8))


#Check missing
result <- feb_data$Sub_metering_1=="?"
table(result)#No missing during selected days
result <- feb_data$Sub_metering_2=="?"
table(result)#No missing during selected days
result <- feb_data$Sub_metering_3=="?"
table(result)#No missing during selected days

#Create the plot
par(mfrow=c(1,1))
par(col="black")
plot(feb_data$sec,as.numeric(feb_data$Sub_metering_1),xaxt = "n", yaxt = "n",type = "l",xlab="", ylim=c(0,40), ylab="")
par(col="red")
par(new=T)
plot(feb_data$sec,as.numeric(feb_data$Sub_metering_2),xaxt = "n", yaxt = "n", type = "l",xlab="", ylim=c(0,40), ylab="")
par(col="blue")
par(new=T)
plot(feb_data$sec,as.numeric(feb_data$Sub_metering_3),xaxt = "n", yaxt = "n", type = "l",xlab="", ylim=c(0,40), ylab="Energy sub metering")
par(col="black")
axis(1,c(Thu,Fri,Sat),c("Thu","Fri","Sat"))
axis(2,c(0,10,20,30))
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),cex = 0.7)
box()
dev.copy(png,'plot3.png')
dev.off()
