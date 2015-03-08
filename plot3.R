plot3 <- function() {  
  # read data from CSV and select proper rows
  data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", stringsAsFactors = FALSE)
  data <- data[66637:69517,]
  
  # create dateTime
  dateTime <- paste(data$Date, data$Time, sep=' ')
  dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
  
  # add the datetime vector as a new column to data
  data$DateTime <- dateTime
  
  # create plot
  png(file = "plot3.png", width=480, height=480)
  with(data, {
    plot(DateTime, Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
  })
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))
  dev.off()
}