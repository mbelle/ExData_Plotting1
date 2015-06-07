#this code assumes that the dataset has been downloaded to the working directory
#read dataset into dataframe
df<-read.delim("household_power_consumption.txt",sep = ";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
#subset the dataframe to the dates required for the assignment 
df<-subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
#format as date time
df$datetime<-paste(df$Date,df$Time)
df$datetime<-as.POSIXct(strptime(df$datetime, "%d/%m/%Y %H:%M:%S"))

#plot hourly global active power in kilowatts, label x with weekdays only

png(file="plot2.png",width=480,height=480,bg="transparent")
plot(df$datetime,df$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)", main="")

dev.off() #close device