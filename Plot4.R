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

# Pasting date and time columns
dateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# plot 4 - multiple Graphs
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Plot 1
plot(dateTime, data$Global_active_power, type = 'l',  ylab = "Global Acgtive Power",
     xlab = "", col = "black")

# Plot 2
plot(dateTime, data$Voltage, type = 'l',  ylab = "Voltage",
     xlab = "datetime", col = "black")

# Plot 3
plot(dateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "", col = "black")
lines(dateTime,data$Sub_metering_2, col = "red" )
lines(dateTime,data$Sub_metering_3, col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty = 1,
       lwd = 2.5,
       col = c("black", "red", "blue"))

# Plot 4
plot(dateTime, data$Global_reactive_power, type = 'l',  ylab = "Global Reactive Power",
     xlab = "datetime", col = "black")
dev.off()