rm(list = ls())
data <- read.csv("~/ProgrammingAssignment2/ProgrammingAssignment2/assignment/ExData_Plotting1/household_power_consumption.txt", sep=";",stringsAsFactors=F,comment.char="")
neededData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

neededData$Date <- as.Date(neededData$Date, format="%d/%m/%Y")
dataforHistogram<- as.numeric(neededData$Global_active_power)
hist(dataforHistogram, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()