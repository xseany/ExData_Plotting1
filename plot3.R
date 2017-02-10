# install sqldr package; allows data to be specified with SQL query before loading
plot3 <- function(){
  
  #Import data 
  dat <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
  
  #Create date object and add to dataframe
  datestring <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
  datWithTime <- cbind(dat, datestring)
  
  #Create plot
  with(datWithTime, plot(datestring, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
  lines(newdat$datestring, newdat$Sub_metering_2, type = "l", col = "red")
  lines(newdat$datestring, newdat$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, y.intersp = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #Create PNG and turn PNG off
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
}