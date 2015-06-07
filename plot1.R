#this code assumes that the dataset has been downloaded to the working directory
#read dataset into dataframe
df<-read.delim("household_power_consumption.txt",sep = ";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
#subset the dataframe to the dates required for the assignment 
df<-subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
#format as date
df$Date<-as.Date(df$Date,"%d/%m/%Y")


png(file="plot1.png",width=480,height=480,bg="transparent")
par(bg="transparent")  
hist(df$Global_active_power, col = "red",xlab="Global Active Power (kilowatts)",main="Global Active Power",breaks=14,xaxt = 'n')
axis(side=1,at=seq(0,6,by=2))

dev.off() #close device
