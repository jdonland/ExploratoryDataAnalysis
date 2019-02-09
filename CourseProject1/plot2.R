#load the data
data <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")

#keep only the data for February 1st and 2nd, 2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#add a combined date and time field to data
data <- cbind(data, strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
names(data)[10] <- "datetime"

#open the png graphics device, set up the output file
png(filename = "plot2.png", width = 480, height = 480)

#make the plot
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#turn the graphics device off
dev.off()
