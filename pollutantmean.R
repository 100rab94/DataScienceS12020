rm(list = ls())
setwd("C:/Users/admin/Desktop/Sem2/Data Science/Assignment1")


pollutantmean <- function(directory, pollutant, id = 1:332) {
  means <- c()
  for(monitor in id){
  path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
  monitor_data <- read.csv(path)
  interested_data <- monitor_data[pollutant]
  means <- c(means, interested_data[!is.na(interested_data)])
}
  
  mean(means)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 23)