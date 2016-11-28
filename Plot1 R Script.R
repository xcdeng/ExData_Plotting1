df<-read.table("raw.txt",sep=";",strip.white=TRUE,header=T,stringsAsFactors = FALSE)
df$Time<-paste(df$Date,df$Time,sep=" ")
df$Time<-strptime(df$Time,"%d/%m/%Y %H:%M:%S")

dfSub<- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(dfSub$Global_active_power)
png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 


dev.off()