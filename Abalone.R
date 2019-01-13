

# Read in the hospital data
#read file from folder. Expects to have only one file.
datalocation <- "./data/"
AbaloneDataPath <- paste(datalocation, "abalone.data", sep="")
AbaloneData <- read.csv(AbaloneDataPath, header = TRUE, sep = ",", na.strings="Not Available")
