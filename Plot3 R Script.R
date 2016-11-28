df<-read.table("raw.txt",sep=";",strip.white=TRUE,header=T,stringsAsFactors = FALSE)
df$Time<-paste(df$Date,df$Time,sep=" ")
df$Time<-strptime(df$Time,"%d/%m/%Y %H:%M:%S")

dfSub<- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(dfSub$Global_active_power)

subMetering1 <- as.numeric(dfSub$Sub_metering_1) 
subMetering2 <- as.numeric(dfSub$Sub_metering_2) 
subMetering3 <- as.numeric(dfSub$Sub_metering_3) 

png("plot3.png", width=480, height=480)
plot(dfSub$Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(dfSub$Time, subMetering2, type="l", col="red")
lines(dfSub$Time, subMetering2, type="l", col="red")
lines(dfSub$Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()