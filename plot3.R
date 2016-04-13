## Make plot 3

EPC <-read.table("EPC.txt",header=TRUE,sep=";")
EPC$DateTime <- with(EPC, as.POSIXct(paste(EPC$Date, EPC$Time), format="%d/%m/%Y %H:%M:%S"))

plot(EPC$DateTime, EPC$Sub_metering_1,col="black",type="l",xlab=" ",ylab="Energy Sub-metering")
points(EPC$DateTime,EPC$Sub_metering_2, col = "red",type="l")
points(EPC$DateTime,EPC$Sub_metering_3, col = "blue",type="l")
legend("topright", pch = "_", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
## copy to png device
dev.copy(png,file="plot3.png")
## close png file device
dev.off()