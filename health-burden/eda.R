# Exploratory data analysis (see readme for more detail)
# Feel free to follow these steps, or complete your own EDA

# Set up (install packages if you don't have them)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(vioplot)
setwd('~/Code/info370/eda/health-burden/')
risk.data <- read.csv('./data/prepped/risk-data.csv', stringsAsFactors = FALSE)

######################
### Data Structure ###
######################

## Using a variety of functions, investigate the structure of your data, such as:

# Dimensions, column names, structure, summaries, etc.
dim(risk.data)
colnames(risk.data)
sapply(risk.data, class)
head(risk.data)
str(risk.data)
summary(risk.data)

# Replacing missing values...?
risk.data[is.na(risk.data)] <- 0

# Find unique values???
which(duplicated(risk.data[1:6]))
unique(risk.data$age)
###########################
### Univariate Analysis ###
###########################

## Using a variety of approaches, investigate the structure each (risk column) individually

# Summarize data

# Create histograms, violin plots, boxplots
hist(risk.data$drug.use)
hist(risk.data$high.meat)
hist(risk.data$smoking)
hist(risk.data$alcohol.use)
hist(risk.data$low.exercise)



g <- ggplot(risk.data,
            aes(x = drug.use,
                fill = super.region)) +
    geom_histogram(binwidth = 5) +
    scale_x_continuous(name = "Death from drug use\nparts per million",
                       limits = c(0, 100)) +
    scale_y_continuous(name = "Count",
                       limits = c(0, 500))

g

####################################
### Univariate Analysis (by age) ###
####################################

# Investiage how each risk-variable varies by **age group**

hist(data.by.age$drug.use)

# Create histograms, violin plots, boxplots. Calculate values as needed.


####################################
### Univariate Analysis (by sex) ###
####################################

# Investiage how each risk-variable varies by **sex**

# Compare male to female values -- requires reshaping (and dropping population)!


########################################
### Univariate Analysis (by country) ###
########################################

## Investiage how each risk-variable varies by **country**

# Aggregate by country

# Create a choropleth map (see https://plot.ly/r/choropleth-maps/)

###########################
### Bivariate Analysis ####
###########################

# Compare risks-variables to one another (visually)
paris(risk.data[,8:ncol((risk.data))])
