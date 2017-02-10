# install sqldr package; allows data to be specified with SQL query before loading
plot2 <- function(){}

  #Import data
  dat <- read.csv.sql("household_power_consumption.txt", 
      sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
  
  #Create date object and add to dataframe
  datestring <- paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S"
  datWithTime <- cbind(dat, datestring)
  
  #Create plot
  plot(datWithTime$datestring, datWithTime$Global_active_power, 
       type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #Create PNG and turn PNG off
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  dev.off()
  }
  
  