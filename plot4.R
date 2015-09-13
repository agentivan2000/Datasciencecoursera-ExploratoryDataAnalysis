
# Importing the data into R
raw_data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

# Subseting getting the required date range.
req_data<-raw_data[raw_data$Date == "1/2/2007"|raw_data$Date == "2/2/2007",]
rm("raw_data")

#Converting the Date field into a date format. 
req_data$DateTime <- paste(req_data$Date, req_data$Time)
req_data$DateTime <- strptime(req_data$DateTime,"%d/%m/%Y %H:%M:%S")

#Plotting 4 graphs on the same canvas
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(y=req_data$Global_active_power, x=req_data$DateTime,ylab = "Global Active Power (Kilowatts)", xlab = "",type = "l")
plot(y=req_data$Voltage, x=req_data$DateTime,ylab = "Voltage", xlab = "datetime",type = "l")
with(req_data,plot(DateTime,Sub_metering_1,ylab = "Energy sub metering", xlab = "", type = "n"))
points(x=req_data$DateTime,y=req_data$Sub_metering_1, type = "l",col = "black")
points(x=req_data$DateTime,y=req_data$Sub_metering_2, type = "l",col = "red")
points(x=req_data$DateTime,y=req_data$Sub_metering_3, type = "l",col = "blue")
legend("topright",pch = "-",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(y=req_data$Global_reactive_power, x=req_data$DateTime,ylab = "Global_reactive_power", xlab = "datetime",type = "l")
dev.off()