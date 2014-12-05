Sys.setlocale("LC_TIME", 'C')

dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

dataset[,3:8] <- sapply(dataset[,3:8], as.numeric)


subdata <- subset(dataset, dataset$Date =="2007-02-01" | dataset$Date == "2007-02-02")
time <- paste(subdata$Date, subdata$Time)
subdata$datetime <- strptime(time, "%Y-%m-%d %H:%M:%S")

######################################################

# wykres 2
par(mfrow = c(1,1))

dev.copy(png, "plot2.png", width = 480, height = 480)
plot(subdata$datetime, subdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
 

dev.off()


