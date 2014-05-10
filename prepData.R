# Project 1
Sys.setlocale(locale = "C")
loadData <- function(file) {
  # We will only be using data from the dates 2007-02-01 and 2007-02-02, 
  # then we find what lines we need:
  # <<< Because this is too specific, i compute it only once >>>
  # lines <- grep("^[1-2]/2/2007", readLines(file))
  skip <- 66637 # lines[1] - 1
  nrows <- 2880 # length(lines) 
  # Loading the data
  data <- read.table(file=file, 
                     sep=";", 
                     skip=skip, 
                     nrows=nrows, 
                     stringsAsFactors=FALSE)
  
  colnames(data) <- c("date", "datetime", "global_active_power", 
                      "global_reactive_power",
                      "voltage", "global_intensity", 
                      "sub_metering_1", "sub_metering_2", 
                      "sub_metering_3")
  
  data$date <- as.Date(data$date, format="%d/%m/%Y")
  
  data$datetime <- as.POSIXct(paste(data$date,
                                    data$datetime),
                              format="%Y-%m-%d %H:%M:%S")
  data
}

# Plot 1
plot1 <- function(data) {
  hist(data$global_active_power, 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", 
       col="red")
}

#Plot 2
plot2 <- function(data, ylab) {
  with(data, plot(datetime, global_active_power, 
                  type="l",
                  ylab=ylab,
                  xlab=""))
}

#Plot 3
plot3 <- function(data) {
  with(data, plot(datetime, sub_metering_1,
                  xlab="",
                  ylab="Energy sub metering", 
                  type="n"))
  with(data, points(datetime, sub_metering_1, type="l"))
  with(data, points(datetime, sub_metering_2, type="l", 
                    col="blue"))
  with(data, points(datetime, sub_metering_3, type="l", 
                    col="red"))
  legend("topright",
         cex=0.7,
         lty=1,
         col=c("black", "red", "blue"),
         legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
}

# Plot 4
plot4 <- function(data) {
  par(mfrow=c(2, 2))
  plot2(data, "Global Active Power")
  with(data, plot(datetime, voltage, 
                  type="l",
                  ylab="Voltage"))
  plot3(data)
  with(data, plot(datetime, global_reactive_power,
                  type="l",
                  ylab="Global_reactive_power"))
  par(mfrow=c(1, 1))
}



