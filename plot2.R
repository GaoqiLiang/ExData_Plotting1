setwd("C:/Users/c3179782/Desktop/R/Coursera/Lecture4_Project1")
source("Load_data_preprocessing_data.R")
png(filename = "plot2.png",
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(DateTime, Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()