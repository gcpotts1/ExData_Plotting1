## plot1.R
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

## Open the png graphics device
png(filename="plot1.png", type="windows")

## Plot the data and specify labels
hist(pdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Close the file
dev.off()
