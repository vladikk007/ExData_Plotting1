plot2 <- function() {  
  # read data from CSV and select proper rows
  data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", stringsAsFactors = FALSE)
  data <- data[66637:69517,]
  
  # create dateTime
  dateTime <- paste(data$Date, data$Time, sep=' ')
  dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
  
  # we add the datetime vector as a new column to the imported data.
  data$DateTime <- dateTime
  
  # create plot
  png(file = "plot2.png", width=480, height=480)
  with(data, {
    plot(DateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
  })
  dev.off()
}