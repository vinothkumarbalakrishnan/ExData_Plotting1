dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
householdelectricdatatemp <- tempfile()
download.file(dataurl, householdelectricdatatemp)
householdelectricdatatempcon <- unz(householdelectricdatatemp, "household_power_consumption.txt")
householdelectricdata <- read.table(householdelectricdatatempcon, sep = ";", head = TRUE)
householdelectricdata['Date'] = as.Date(householdelectricdata$Date, "%d/%m/%Y")
householdelectricdatasubset <- householdelectricdata[householdelectricdata$Date %in% as.Date(c('2007-02-01','2007-02-02')),]



## Plot 2 
png(filename = "plot2.png", width =480, height =480)
plot(as.POSIXct(paste(householdelectricdatasubset$Date, householdelectricdatasubset$Time), 
                format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(householdelectricdatasubset$Global_active_power)),
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     ##ylim = c(0,6),
     yaxt = 'n',
     type = 'l')
axis(2, at=seq(0,6, by=2), labels = seq(0,6,by=2))
dev.off()
##
