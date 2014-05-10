## NOTE: Set your working directory where you have the file
## 'household_power_consumption.txt'

source("prepData.R")

powerConsumption <- loadData("household_power_consumption.txt")
png(filename = "plot2.png", width = 480, height = 480)
plot2(powerConsumption, "Global Active Power (kilowatts)")
dev.off()
