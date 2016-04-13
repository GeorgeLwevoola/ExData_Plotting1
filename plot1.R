## create a data table for the dataset

if(!file.exists("EPC.txt")){
 EPC_df<- read.table("household_power_consumption.txt",header=TRUE,fill=FALSE,strip.white=TRUE,na.strings="?",sep=";",stringsAsFactors = FALSE)
 ## convert date and time to approriate types
 EPC_df$DateTime <- with(EPC_df, as.POSIXct(paste(EPC_df$Date, EPC_df$Time), format="%d/%m/%Y %H:%M:%S"))
 EPC_dt <- subset(EPC_df, EPC_df$DateTime>="2007/02/01" & EPC_df$DateTime<"2007/02/03")
 write.table(EPC_dt,file="EPC.txt", col.names=TRUE, row.names=FALSE,sep=";")
}
## Make plot 1
hist(EPC$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## copy to png device
dev.copy(png,file="plot1.png")
## close png file device
dev.off()