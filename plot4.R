
df <-read.table("EPC.txt",header=TRUE,sep=";")
df$DateTime <- with(df, as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

## open png device and create "plot4.png" in default directory

par(mfrow=c(2,2))

## Make plot 1
plot(df$DateTime,df$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")

## Make plot 2
plot(df$DateTime,df$Voltage,type="l",xlab="DateTime",ylab="Voltage")


## Make plot 3
plot(df$DateTime, df$Sub_metering_1,col="black",type="l",xlab=" ",ylab="Energy Sub-metering")
points(df$DateTime,df$Sub_metering_2, col = "red",type="l")
points(df$DateTime,df$Sub_metering_3, col = "blue",type="l")
legend("topright", pch = "_", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## Make plot 4
plot(df$DateTime,df$Global_reactive_power,type="l",xlab=" ",ylab="Global_Reactive_Power")
## copy to png device
dev.copy(png,file="plot4.png")
## close png file device
dev.off()

