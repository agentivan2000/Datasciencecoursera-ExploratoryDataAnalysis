
# Importing the data into R
raw_data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

# Subseting getting the required date range.
req_data<-raw_data[raw_data$Date == "1/2/2007"|raw_data$Date == "2/2/2007",]
rm("raw_data")

#Converting the Date field into a date format. 
req_data$DateTime <- paste(req_data$Date, req_data$Time)
req_data$DateTime <- strptime(req_data$DateTime,"%d/%m/%Y %H:%M:%S")

# Plotting the second graph
png(filename = "plot2.png")
plot(y=req_data$Global_active_power, x=req_data$DateTime,ylab = "Global Active Power (Kilowatts)", xlab = "",type = "l")
dev.off()