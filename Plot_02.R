# PLOT 2
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
png("plot2.png", width=480, height=480)

plot(subsetData$datetime, subsetData$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power Vs Time")

dev.off()
