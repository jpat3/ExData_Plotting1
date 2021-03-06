
# read data in
data<-read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings="?")
data_1<-data[data[,"Date"] %in% c("1/2/2007","2/2/2007"), ]
#create date time string
datetime_str<-paste(data_1[,"Date"],data_1[,"Time"])
#convert to date and time in R
datetime<-strptime(datetime_str,format = "%d/%m/%Y %H:%M:%S")

data_2 <- cbind(data_1, datetime)

png(filename = "Plot4.png")


par(mfrow =c(2,2))
plot(data_2[,"datetime"],data_2[,"Global_active_power"], type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

plot(data_2[,"datetime"],data_2[,"Voltage"], type = "l", ylab = "Voltage", xlab="datetime")

plot(data_2[,"datetime"],data_2[,"Sub_metering_1"], type = "l",ylab = "Energy sub metering", xlab="")
points(data_2[,"datetime"],data_2[,"Sub_metering_2"], type = "l", col = "red")
points(data_2[,"datetime"],data_2[,"Sub_metering_3"], type = "l", col = "blue" )
legend("topright", lwd = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

plot(data_2[,"datetime"],data_2[,"Global_reactive_power"], type = "l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()