
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
householdelectricdatatemp <- tempfile()
download.file(dataurl, householdelectricdatatemp)
householdelectricdatatempcon <- unz(householdelectricdatatemp, "household_power_consumption.txt")
householdelectricdata <- read.table(householdelectricdatatempcon, sep = ";", head = TRUE)
householdelectricdata['Date'] = as.Date(householdelectricdata$Date, "%d/%m/%Y")
householdelectricdatasubset <- householdelectricdata[householdelectricdata$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

## Plot 3

png(filename = "plot3.png", width =480, height =480)
plot(as.POSIXct(paste(householdelectricdatasubset$Date, householdelectricdatasubset$Time), 
                format="%Y-%m-%d %H:%M:%S"), 
     as.numeric(as.character(householdelectricdatasubset$Sub_metering_1)) ,
     type = 'l',
     xlab = "",
     ylab = "Energy sub metering",
     yaxt = 'n')
axis(2, at=seq(0,40, by=10), labels = seq(0,40,by=10))
lines(as.POSIXct(paste(householdelectricdatasubset$Date, householdelectricdatasubset$Time), 
                 format="%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(householdelectricdatasubset$Sub_metering_2)),
      col = 'red'
)
lines(as.POSIXct(paste(householdelectricdatasubset$Date, householdelectricdatasubset$Time), 
                 format="%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(householdelectricdatasubset$Sub_metering_3)),
      col = 'blue')
legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),        
       lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()

##
