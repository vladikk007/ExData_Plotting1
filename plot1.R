plot1 <- function() {
  # read data from CSV and select proper rows
  data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?", stringsAsFactors = FALSE)
  data <- data[66637:69517,]
  
  # create histogram
  histogram <- hist(data[,3], breaks=20, plot = FALSE)
  png(file = "plot1.png", width=480, height=480)
  plot(histogram, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
  dev.off()
}
