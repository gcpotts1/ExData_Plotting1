## plot3.R
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
png(filename="plot3.png", type="windows")

## Plot the data and specify labels
with(pdata, plot(day, Sub_metering_1, type='l',col="black", xlab="", ylab="Energy sub metering"))
with(pdata, lines(day, pdata$Sub_metering_2, col="red"))
with(pdata, lines(day, pdata$Sub_metering_3, col="blue"))
legend("topright", lty=1 ,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close the file
dev.off()
