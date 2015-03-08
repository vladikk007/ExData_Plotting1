plot4 <- function() {  
  # read data from CSV and select proper rows
  data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", stringsAsFactors = FALSE)
  data <- data[66637:69517,]
  
  # create dateTime
  dateTime <- paste(data$Date, data$Time, sep=' ')
  dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
  
  # add the datetime vector as a new column to data
  data$DateTime <- dateTime
  
  # create histogram
  png(file = "plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))
  
  # first
  with(data, {
    plot(DateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power')
  })
  
  # second
  with(data, {
    plot(DateTime, Voltage, type='l', xlab='datetime', ylab="Voltage")
  })
  
  # third
  with(data, {
    plot(DateTime, Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
  })
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', bty = "n", col=c('black', 'red', 'blue'))
  
  # fourth
  with(data, {
    plot(DateTime, Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
  })
  
  dev.off()
}