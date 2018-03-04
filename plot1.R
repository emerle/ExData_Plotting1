# plot1.R - Plot (Histogram) of Global Active Power from 2007 Feb 1 to 2007 Feb 2
#
# Data Set: Individual household electric power consumption Data Set from UC Irvine Machine Learning Repository
# Data Set URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# 1. Download the project's dataset ZIP file
# 2. Unzip the downloaded file and extract the dataset
# 3. Read the dataset
# 4. Plot Global Active Power data from dates 2007-02-01 and 2007-02-02 (2 days)

# Download the datasets, save to ./data folder
# Note: The downloading and unzipping scripts will not be included in plot2.R, plot3.R and plot4.R
if(!dir.exists("./data")){ # Check if data folder exists
  dir.create("./data")
}
zipFilename <- "./data/dataset.zip"
if (!file.exists(zipFilename)){ # check if the dataset is already existing (file has already been downloaded)
  datasetFileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(datasetFileURL, zipFilename)
}

# Unzip the downloaded file to ./data folder
if (!file.exists("./data/household_power_consumption.txt")){  # Check if the data set text file already exists
  unzip(zipFilename, exdir="./data")
}  

# Read the data set (Note: HPC stands for household power consumption)
dataSetHPC <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date column data to Date class
dataSetHPC$Date <- as.Date(dataSetHPC$Date, format = "%d/%m/%Y")

# Get subset of data with dates from 2007 Feb 1 to 2007 Feb 2 (2 days)
dataSubSetHPC <- subset(dataSetHPC, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

par(mfrow = c(1, 1))

# Plot (histogram) the data subset for Global_active_power and its frequency
windows(width=480, height=480) # set screen size
hist(dataSubSetHPC$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Copy graph to png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()