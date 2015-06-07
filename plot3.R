#this code assumes that the dataset has been downloaded to the working directory
#read dataset into dataframe
df<-read.delim("household_power_consumption.txt",sep = ";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
#subset the dataframe to the dates required for the assignment 
df<-subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
#format as date time
df$datetime<-paste(df$Date,df$Time)
df$datetime<-as.POSIXct(strptime(df$datetime, "%d/%m/%Y %H:%M:%S"))

#plot hourly energy submetering, 3 line series, 1=black, 2=red, 3= blue, xaxis days
png(file="plot3.png",width=480,height=480,bg="transparent")
plot(df$datetime,df$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering", main="",col="black")
lines(df$datetime,df$Sub_metering_2,col="red")
lines(df$datetime,df$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))


dev.off() #close device