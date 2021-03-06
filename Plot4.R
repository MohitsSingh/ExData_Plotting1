rm(list = ls())
data <- read.csv("~/ProgrammingAssignment2/ProgrammingAssignment2/assignment/ExData_Plotting1/household_power_consumption.txt", sep=";",stringsAsFactors=F,comment.char="")
neededData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

neededData$Date <- as.Date(neededData$Date, format="%d/%m/%Y")
datetime <- as.POSIXct(paste(neededData$Date, neededData$Time))
Global_active_power<- as.numeric(neededData$Global_active_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(neededData, {
  plot(Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()