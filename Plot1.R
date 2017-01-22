getwd()
setwd("C:/Users/Marcelo/Desktop/Coursera/datasciencecoursera/Exploratory Data Analysis/Project 1")

load.libraries <- c('data.table', 'ggplot2', 'dplyr')
install.lib <- load.libraries[!load.libraries %in% installed.packages()]
for(libs in install.lib) install.packages(libs, dependences = TRUE)
sapply(load.libraries, require, character = TRUE)

#memory rough calculation
nrows = 2075259
ncols = 9

memory = (nrows*ncols*8)/2^20
memory

# Reading col names
dataNames <- read.table("household_power_consumption.txt",
                        sep = ";",
                        header = TRUE,
                        stringsAsFactors = FALSE,
                        nrows = 1,
                        dec = ".") 
colnames = colnames(dataNames)

#Loading desired dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt",
                   sep = ";",
                   header = FALSE,
                   stringsAsFactors = FALSE,
                   skip = 66637,
                   nrows = 2880,
                   dec = ".")
colnames(data) <- colnames
head(data)
tail(data)

str(data)

# Plot 1 - Global Active Power vs Globa Active Power(kilowatts)

png(filename = "Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")

# writting the plot file
dev.off()