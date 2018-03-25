# PLOT 1

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

# Plotting
png("plot1.png", width=480, height=480)

hist(as.numeric(subsetData$Global_active_power),
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

