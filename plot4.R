########################################################
#Coursera project
#exploratory data analysis
#plot
#Hui Xiong 07/06/2018
########################################################


# Section 1 download and unzip data
if(!file.exists("rawData.zip")){
      url1<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(url1,"rawData.zip")
      unzip("rawData.zip")}

# Section 2 read and subset data
powerConsumption<-read.table("household_power_consumption.txt",sep=";",
                             header = TRUE,na.strings=("?"))
library(lubridate)
library(dplyr)
DateTime<-as.POSIXct(paste(powerConsumption$Date,powerConsumption$Time),
                     format="%d/%m/%Y %H:%M:%S")
powerConsumption<-mutate(powerConsumption,POSIXTime=DateTime)
selectPowerConsumption<-subset(powerConsumption,POSIXTime>="2007-02-01"
                               & POSIXTime < "2007-02-03")

#Section 3 plot4
png("plot4.png",width = 480,height = 480,units="px",bg="transparent")
par(mfrow=c(2,2))
#first plot
with(selectPowerConsumption, plot(POSIXTime,Global_active_power,type = "l", 
         ylab = "Global Active Power (kilowatts)",  xlab = NA     ))

#second plot
with(selectPowerConsumption, plot(POSIXTime,Global_active_power,type = "l", 
      ylab = "Voltage",  xlab = "datetime"    ))

#third plot
with(selectPowerConsumption, plot(POSIXTime,Sub_metering_1,type = "l", 
     ylab = "Global Active Power (kilowatts)",  xlab = NA, col = "black"))
with(selectPowerConsumption, lines(POSIXTime,Sub_metering_2,col = "red"))
with(selectPowerConsumption, lines(POSIXTime,Sub_metering_3,col = "blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

#fourth plot
with(selectPowerConsumption, plot(POSIXTime,Global_reactive_power,type = "l", 
              ylab = "Global_reactive_power",  xlab = "datetime"    ))


dev.off()

