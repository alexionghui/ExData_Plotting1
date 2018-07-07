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
powerConsumption$Date<-as.Date(powerConsumption$Date,"%d/%m/%Y")
selectPowerConsumption<-subset(powerConsumption,Date>="2007-02-01"
                               & Date <= "2007-02-02")

#Section 3 plot1
png("plot1.png",width = 480,height = 480,units="px",bg="transparent")
hist(selectPowerConsumption$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",main = "Global Active Power")
dev.off()

