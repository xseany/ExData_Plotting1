# install sqldr package; allows data to be specified with SQL query before loading
plot1 <- function(){
  
  #Import data 
  dat <- read.csv.sql("household_power_consumption.txt", 
      sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
  
  #Create plot
  hist(dat$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")
  
  #Create PNG and turn PNG off
  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  dev.off()
}