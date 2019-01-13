rm(list = ls())
datalocation <- "./data/"
AbaloneDataPath <- paste(datalocation, "abalone.data", sep="")
AbaloneData <- read.csv(AbaloneDataPath, header = TRUE, sep = ",", na.strings="Not Available")

