## NOTE: Set your working directory where you have the file
## 'household_power_consumption.txt'

source("prepData.R")

powerConsumption <- loadData("household_power_consumption.txt")
png(filename = "plot4.png", width = 480, height = 480)
plot4(powerConsumption)
dev.off()
