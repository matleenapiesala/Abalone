
# Practice project to learn R and Machine Learning by studying Abalone data from UCI
# Data: http://mlr.cs.umass.edu/ml/machine-learning-databases/abalone/
# (c) Miia Ketolainen and Matleena Piesala

# --- initial clean-ups, initializations etc ---------------------
rm(list = ls())                        # removes variables and functions
graphics.off()                         # removes existing plots, should reset plot par values to defaults
cat("\f")                              # clears console
options(scipen = 6)                    # penalty for scientific notation (in plots)

# --- check that necessary packages exist and load them ---
packages <- c("Hmisc", "ggplot2", "tictoc")

if (length(packages) > 0) {
  if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
    install.packages(setdiff(packages, rownames(installed.packages())))
  }
}

library(Hmisc)             # describe()
library(ggplot2)            # plotting
library(tictoc)            # timing 

rm(packages)        # these variables are not needed anymore

# ======= Set home directory and output directories ===================
# set home dir and print it
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
cat(sprintf("working directory set to %s\n", getwd()))

# create an output directory
outputDirectory <- "./output"
if (!file.exists(outputDirectory)) {
  dir.create(file.path(getwd(), outputDirectory))
}
# add the ending "/" after checking for existence
outputDirectory <- paste(outputDirectory, "/", sep = "")


# ===================== Read in the data ==============================

datalocation <- "./data/"
AbaloneDataPath <- paste(datalocation, "abalone.data", sep="")
AbaloneData <- read.csv(AbaloneDataPath, header = FALSE, sep = ",", na.strings="Not Available")

# Name  		    Data Type	  Meas.	  Description
#----		        ---------	  -----	  -----------
# Sex		        nominal			        M, F, and I (infant)
# Length		    continuous	mm	    Longest shell measurement
# Diameter	    continuous	mm	    perpendicular to length
# Height		    continuous	mm	    with meat in shell
# Whole weight	continuous	grams	  whole abalone
# Shucked weight	continuous	grams	weight of meat
# Viscera weight	continuous	grams	gut weight (after bleeding)
# Shell weight	continuous	grams	  after being dried
# Rings		      integer			        +1.5 gives the age in years

# Name the columns
colnames(AbaloneData) <- c("Sex", "Length", "Diameter", "Height", "WholeWeight", "ShuckledWeight",
                    "VisceraWeight", "ShellWeight", "Rings")

# basic anaysis of the data
describe(AbaloneData)


# Statistical summary
summary(AbaloneData)

# ============== Some plots as an example ==============

hist(AbaloneData)
hist(AbaloneData$WholeWeight)

plot(AbaloneData$Rings, AbaloneData$WholeWeight)

plot(AbaloneData$Rings, AbaloneData$ShellWeight)

# ====== Principal Component Analysis ==========
# basic info: https://www.datacamp.com/community/tutorials/pca-analysis-r

tic()
PCAresults <- prcomp(AbaloneData[,-1])  #exclude gender, but this should be par of this. maybe 
toc()

summary(PCAresults)


