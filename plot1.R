
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
householdelectricdatatemp <- tempfile()
download.file(dataurl, householdelectricdatatemp)
householdelectricdatatempcon <- unz(householdelectricdatatemp, "household_power_consumption.txt")
householdelectricdata <- read.table(householdelectricdatatempcon, sep = ";", head = TRUE)
householdelectricdata['Date'] = as.Date(householdelectricdata$Date, "%d/%m/%Y")
householdelectricdatasubset <- householdelectricdata[householdelectricdata$Date %in% as.Date(c('2007-02-01','2007-02-02')),]


##Plot 1 -- Histogram
png(filename = "plot1.png", width =480, height =480)
hist(as.numeric(as.character(householdelectricdatasubset$Global_active_power)), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     breaks = 12,
     xlim = c(0,6),
     ylim = c(0,1200),
     col = 'red',
     xaxt = 'n'
)
axis(1, at=seq(0,6, by=2), labels = seq(0,6,by=2))
dev.off()
##