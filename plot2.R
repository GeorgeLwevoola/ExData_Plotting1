## Make plot 2
EPC <-read.table("EPC.txt",header=TRUE,sep=";")
EPC$DateTime <- with(EPC, as.POSIXct(paste(EPC$Date, EPC$Time), format="%d/%m/%Y %H:%M:%S"))
plot(EPC$DateTime,EPC$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
