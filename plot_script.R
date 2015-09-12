
# Importing the data into R
raw_data<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

# Subseting getting the required date range.
req_data<-raw_data[raw_data$Date == "1/2/2007"|raw_data$Date == "2/2/2007",]
rm("raw_data")

#Converting the Date field into a date format. 
req_data[[1]] <- as.Date(req_data[[1]],"%d/%m/%Y")

# test[[1]] <- as.Date(test[[1]],"%d/%m/%Y")
# test[[2]] <- strptime(test[[2]],"%H:%M:%S")

# Plotting the first graph
png(filename = "plot1.png")
hist(req_data$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)",main = "Global Active Power")
dev.off()

# 