ile         : plot1.R 
## System       : Plot build assignment 
## Date         : 09/06/2014
## Author       : Charles Njelita
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Exploratory Data Analysis
##
##                plot1.  A red histogram.
##
##                All of these plot files are stand alone
##                and self contained.  They read the data,
##                clean the data and draw the required plot.

require(sqldf)
require(tcltk)
require("data.table")
power.df <- read.csv.sql(file=("C:/Users/Charles/Desktop/Coursera/DataExploration/household_power_consumption.txt"),sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE)
# Load data
source('scripts/load-power-data.R')

# Open png device
png(filename='plots/plot1.png')

## Run Plot1: Histogram
require(dplyr)
require("reshape2")
hist(power.df$Global_active_power , col = "red", breaks = 25, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")