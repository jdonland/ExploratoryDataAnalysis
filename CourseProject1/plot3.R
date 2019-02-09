#load the data
data <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")

#keep only the data for February 1st and 2nd, 2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#add a combined date and time field to data
data <- cbind(data, strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
names(data)[10] <- "datetime"

#open the png graphics device, set up the output file
png(filename = "plot3.png", width = 480, height = 480)

#make the plot
plot(data$datetime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
points(data$datetime, data$Sub_metering_1, type = "l")
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = names(data)[7:9], lty = 1, lwd = 1, col = c("black", "red", "blue"))

#turn the graphics device off
dev.off()