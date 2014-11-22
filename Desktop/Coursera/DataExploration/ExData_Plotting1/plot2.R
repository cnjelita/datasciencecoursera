## File         : plot2.R 
## System       : Plot assignment
## Date         : 09/06/2014
## Author       : Charles Njelita
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Exploratory Data Analysis
##
##                plot2. Line graph.  Time->Consumption
##
##                All of these plot files are stand alone
##                and self contained.  They read the data,
##                clean the data and draw the required plot.

library(lubridate)
# If the raw data has not been saved, download, unzip, and load it.
# Save it to an .rds file for easy access later.

# Read data into a table with appropriate classes
power.df <- read.table('household_power_consumption.txt', header=TRUE,
                       sep=';', na.strings='?',
                       colClasses=c(rep('character', 2), 
                                    rep('numeric', 7)))

# Convert dates and times
power.df$Date <- dmy(power.df$Date)
power.df$Time <- hms(power.df$Time)

# Reduce data frame to what we need
start <- ymd('2007-02-01')
end <- ymd('2007-02-02')
power.df <- subset(power.df, year(Date) == 2007 & 
                     month(Date) == 2 &
                     (day(Date) == 1 | day(Date) == 2))

# Combine date and time
power.df$date.time <- power.df$Date + power.df$Time    

# Create Line Chart
plot(power.df$date.time, power.df$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')