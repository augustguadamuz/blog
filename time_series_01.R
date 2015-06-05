# Aug's Blog
# Time series data forecasting

# first I am going to clear any existing data from the environment
rm(list=ls())

# ctrl + L will clear the console

# Let's take a look at the R Datasets Package 
library(help = "datasets")

# Let's load the R Datasets Package
require("datasets")

# This looks like an interesting dataset
# Yearly Sunspot Data, 1700-1988
# Let's look at the data
sunspot.year

# Let's look at the structure of the data
str(sunspot.year)

# For fun, let's look at a graph of the sunspot data
plot(sunspot.year)

# Also for fun, we can look at time and cycle
?time
time(sunspot.year)
cycle(sunspot.year)
?par

# install the forecast package, if not installed
# you may want to install the package from the RStudio GUI
# and make sure that you have "install dependencies" checked
install.packages("fpp")

# Load the fpp package
require("fpp")

# since the data is already in time series format
# we can simply run the forecast command
forecast(sunspot.year)

# we can plot the forecast
plot(forecast(sunspot.year))

# we should likely make adjustments to that
# the forecast and plot do not have negative values
# setting a range between 0 and 800 for the Y axis
plot(forecast(sunspot.year),
     xlim=c(1800, 1990),
     ylim=c(0, 800))

write.csv(forecast(sunspot.year), file = "C:/Users/augustg/Desktop/sunspot.csv")
