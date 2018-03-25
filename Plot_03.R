# PLOT 3
# Loading data
data <- read.table("./household_power_consumption.txt",
                   sep=";",
                   nrows = 2075259,
                   header = T,
                   na.strings = "?",
                   stringsAsFactors=FALSE,
                   dec=".")

# Subsetting data, getting only the rows fitting
# the range of 1/2/2007 and 2/2/2007
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Transforming the date and time variables into the right format
# to be plotted
subsetData$datetime <- as.POSIXct(paste(subsetData$Date, subsetData$Time),
                                  format = "%d/%m/%Y %H:%M:%S")

# Plotting
png("plot3.png", width=480, height=480)

plot(subsetData$datetime, subsetData$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(subsetData$datetime, subsetData$Sub_metering_2,
      col = "red")
lines(subsetData$datetime, subsetData$Sub_metering_3,
      col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 2.5,
       col = c("black", "red", "blue"))

dev.off()

