#this code assumes that the dataset has been downloaded to the working directory
#read dataset into dataframe
df<-read.delim("household_power_consumption.txt",sep = ";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
#subset the dataframe to the dates required for the assignment 
df<-subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
#format as date
df$Date<-as.Date(df$Date,"%d/%m/%Y")

#plot 4 includes plot1,plot3,hourly plot
png(file="plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2))
#graph 1
plot(df$datetime,df$Global_active_power,type="l",xlab="", ylab="Global Active Power", main="")

#graph 2
plot(df$datetime,df$Voltage,type="l",xlab="datetime", ylab="Voltage", main="")

#graph 3
plot(df$datetime,df$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering", main="",col="black")
lines(df$datetime,df$Sub_metering_2,col="red")
lines(df$datetime,df$Sub_metering_3,col="blue")
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))


#graph 4
plot(df$datetime,df$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power", main="")
dev.off() #close device