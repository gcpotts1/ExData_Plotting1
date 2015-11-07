## plot4.R
## Exploratory Data Analysis
## Greg Potts

#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl, destfile = "./household_power_consumption.zip")
#dateDownloaded <- date()
#unzip("./household_power_consumption.zip", overwrite = FALSE)

library(graphics)
library(grDevices)

## Read in the rows of interest: 2007-02-01 to 2007-02-02
cnames <- read.table("./household_power_consumption.txt", sep=";", nrows=1, colClasses="character")
pdata <- read.table("./household_power_consumption.txt", sep=";", skip=66637, nrows=2880)
colnames(pdata)<-cnames
DateTime <- paste(pdata$Date, pdata$Time, sep=" ")
day <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

## Open the png graphics device
png(filename="plot4.png", type="windows")

## Setup plot array
par(mfrow=c(2,2))

## Plot the Global Active Power data and specify labels
with(pdata, plot(day, Global_active_power, type='l',xlab="", ylab="Global Active Power"))

## Plot the Voltage data and specify labels
with(pdata, plot(day, Voltage, type='l', xlab="datetime", ylab="Voltage"))

## Plot the Sub metering data and specify labels
with(pdata, plot(day, Sub_metering_1, type='l',col="black", xlab="", ylab="Energy sub metering"))
with(pdata, lines(day, pdata$Sub_metering_2, col="red"))
with(pdata, lines(day, pdata$Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

## Plot the Global Reactive Power data and specify labels
## Did not specify a y label since the desired label is the default
with(pdata, plot(day, Global_reactive_power, type='l', xlab="datetime"))

## Close the file
dev.off()
