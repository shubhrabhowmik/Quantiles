# Quantiles

#Quantiles are cutoff points that divide a dataset into intervals with set probabilities. 
#The qth quantile is the value at which q% of the observations are equal to or less than that value.

# Percentiles
#Percentiles are the quantiles that divide a dataset into 100 intervals each with 1% probability.

# Quartiles
#Quartiles divide a dataset into 4 parts each with 25% probability.
#They are equal to the 25th, 50th and 75th percentiles.
#The 25th percentile is also known as the 1st quartile, 
#the 50th percentile is also known as the median, and 
#the 75th percentile is also known as the 3rd quartile.
#The summary() function returns the minimum, quartiles and maximum of a vector.

#Load the heights dataset from the dslabs package:
install.packages("dslabs")
library(dslabs)
data("heights")

#Use summary() on the heights$height variable to find the quartiles:
summary(heights$height)

#Find the percentiles of heights$height:
p = seq(0.01, 0.99, 0.01)
percentiles = quantile(heights$height, p)
percentiles

percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]


# Finding quantiles with qnorm

#The qnorm() function gives the theoretical value of a quantile with probability 
#p of observing a value equal to or less than that quantile value given a normal 
#distribution with mean mu and standard deviation sigma: qnorm(p, mu, sigma)
#By default, mu=0 and sigma=1. Therefore, calling qnorm() with no arguments gives 
#quantiles for the standard normal distribution.

p <- seq(0.01, 0.99, 0.01)
theoretical_quantiles <- qnorm(p, 69, 3)
theoretical_quantiles


###
##
#
# define x and z
install.packages("tidyverse")
library(tidyverse)
library(dslabs)
data(heights)
index = heights$sex=="Male"
x = heights$height[index]
z = scale(x)

# proportion of data below 69.5
mean(x <= 69.5)

# calculate observed and theoretical quantiles
p = seq(0.05, 0.95, 0.05)
observed_quantiles_1 = quantile(x, p)
theoretical_quantiles_1 = qnorm(p, mean = mean(x), sd = sd(x))

# make QQ-plot
plot(theoretical_quantiles_1, observed_quantiles_1)
abline(0,1)

# make QQ-plot with scaled values
observed_quantiles = quantile(z, p)
theoretical_quantiles = qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)
