# plot2.R - Plot (Line) of Global Active Power from 2007 Feb 1 to 2007 Feb 2
#
# Data Set: Individual household electric power consumption Data Set from UC Irvine Machine Learning Repository
# Data Set URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# 1. Download the project's dataset ZIP file
# 2. Unzip the downloaded file and extract the dataset
# 3. Read the dataset
# 4. Plot (Line) Global Active Power

# Assumption: The data set has been downloaded (see plot1.R) and extracted to ./data folder

# Read the data set (Note: HPC stands for household power consumption)
dataSetHPC <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date column data to Date class
dataSetHPC$Date <- as.Date(dataSetHPC$Date, format = "%d/%m/%Y")

# Get subset of data with dates from 2007 Feb 1 to 2007 Feb 2 (2 days)
dataSubSetHPC <- subset(dataSetHPC, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert Date and Time 
dataSubSetHPC$dateTime <- strptime(paste(dataSubSetHPC$Date, dataSubSetHPC$Time), "%Y-%m-%d %H:%M:%S")

par(mfrow = c(1, 1))

# Plot (line) the data subset for Global_active_power for 2 days 
windows(width=480, height=480) # set screen size
plot(dataSubSetHPC$dateTime, dataSubSetHPC$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Copy graph to png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()