setwd("C:/Users/Desktop/R/Coursera/Lecture4_Project1")

## download files
library (httr)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.zip"
if(!file.exists(file)){
  download.file(url, file)
}

#unzip and create folders (if those ain't exist)
datafolder <- "household_power_consumption"
if(!file.exists(datafolder)){
  unzip(file, list = FALSE, overwrite = TRUE)
}


filename <- "household_power_consumption.txt"
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?" )

## identify the size of this txt file
dim(data)   ## 2075259  9  

attach(data)
## select the data of 2 days
subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[subset, ]

attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)

## identify the size of the newData 
dim (newData)   ## 2880 10
attach(newData)
