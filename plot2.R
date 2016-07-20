setwd("C:\\Users\\Daniel\\Documents\\Coursera\\Exploring Data\\Week 1\\exdata-data-household_power_consumption")


#Loading data
full_data<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,header = TRUE,sep = ";")
full_data$Date = strptime(full_data$Date,"%d/%m/%Y")
feb_data<-full_data["2007-02-01"<=full_data$Date & full_data$Date<="2007-02-02",]
feb_data$sec <- as.numeric(feb_data$Date)-as.numeric(strptime("01/02/2007","%d/%m/%Y"))+as.numeric(substr(feb_data$Time,1,2))*3600+as.numeric(substr(feb_data$Time,4,5))*60+as.numeric(substr(feb_data$Time,7,8))

#Check missing
result <- feb_data$Global_active_power=="?"
table(result)#No missing during selected days

#Create the plot
par(mfrow=c(1,1))
Thu<-0
Fri<-as.numeric(strptime("02/02/2007","%d/%m/%Y"))-as.numeric(strptime("01/02/2007","%d/%m/%Y"))
Sat<-as.numeric(strptime("03/02/2007","%d/%m/%Y"))-as.numeric(strptime("01/02/2007","%d/%m/%Y"))
par(pch=0, col="black")
plot(feb_data$sec,as.numeric(feb_data$Global_active_power),xaxt = "n", type = "l",xlab="", ylab="Global active power (kilowatts)")
axis(1,c(Thu,Fri,Sat),c("Thu","Fri","Sat"))


dev.copy(png,'plot2.png')
dev.off()
