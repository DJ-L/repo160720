setwd("C:\\Users\\Daniel\\Documents\\Coursera\\Exploring Data\\Week 1\\exdata-data-household_power_consumption")


#par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
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
feb_data<-feb_data[order(as.numeric(feb_data$Date),as.numeric(feb_data$sec)),]
hist(as.numeric(feb_data$Global_active_power),  
     xaxt = "n",
     yaxt = "n",
     xlab="Global active power (kilowatts)",
     col= "red",
     main = "Global Active Power"
     # ylim = range(0,200,400,600,800,1000,1200),
     # axes = FALSE
)
axis(1,cex.axis=.75)
axis(2,c(0,200,400,600,800,1000,1200),cex.axis=0.75)
dev.copy(png,'plot1.png')
dev.off()