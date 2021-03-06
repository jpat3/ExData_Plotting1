
# read data in
data<-read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings="?")
data_1<-data[data[,"Date"] %in% c("1/2/2007","2/2/2007"), ]
#create date time string
datetime_str<-paste(data_1[,"Date"],data_1[,"Time"])
#convert to date and time in R
datetime<-strptime(datetime_str,format = "%d/%m/%Y %H:%M:%S")

data_2 <- cbind(data_1, datetime)

png(filename = "Plot1.png")

hist(data_2[,"Global_active_power"], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.off()