pollutantvector <- function(directory, pollutant, id = 1:332, p) {
  resultVec <- c(Date=character(),sulfate=numeric(),
                 nitrate=numeric(),ID=integer())
  
  # Print error message when receiving wrong param
  if(pollutant != 'sulfate' && pollutant != 'nitrate') {
    print(paste("Error:", pollutant, "is unknown.
                    Please use either \'sulfate\' or \'nitrate\'"))
    return(resultVec)
  }
  
  if(1 > min(id) || 332 < max(id)) {
    print(paste("Error: id is illegal (should be 1:332)"))
    return(resultVec)
  }
  
  for(i in id) {
    # read each csv
    filename = paste(directory, "\\", formatC(i, width = 3, flag="0"),
                     ".csv", sep="")
    data <- read.csv(filename) #read each csv
    
    # extract valid value to a vector
    validDataList <- apply(data[`pollutant`], 1, function(x) (!is.na(x)&&(x > p)))
    validData <- data[validDataList,]
    
    # append valid data into result data frame
    resultVec <- rbind(resultVec, validData)
    
  }
  
  return(resultVec)
}

pollutantvector("specdata", "sulfate", 1:35, 0.5)