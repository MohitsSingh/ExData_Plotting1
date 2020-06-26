rm(list = ls())
data <- read.csv("~/ProgrammingAssignment2/ProgrammingAssignment2/assignment/ExData_Plotting1/household_power_consumption.txt", sep=";",stringsAsFactors=F,comment.char="")
neededData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

neededData$Date <- as.Date(neededData$Date, format="%d/%m/%Y")
datetime <- as.POSIXct(paste(neededData$Date, neededData$Time))
Global_active_power<- as.numeric(neededData$Global_active_power)
with(neededData, {
  plot(as.numeric(Sub_metering_1)~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(as.numeric(Sub_metering_2)~datetime,col='Red')
  lines(as.numeric(Sub_metering_3)~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
