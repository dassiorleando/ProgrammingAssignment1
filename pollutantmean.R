# We load the readr package
library('readr')


# Calculate the mean of a pollutant(sulfate or nitrate) across a specified list of monitors(range of id)
pollutantmean <- function(directory, pollutant, id = 1:332){
    # 3 digits representation of a number
    treeDigitOfNumber <- function(number){
        if(number<10){
            number <- paste("00", number, sep = "")
        }else if(number>=10 && number <100){
            number <- paste("0", number, sep = "")
        }
        number
    }
    
    # Some validations on directory and the choosed pollutant
    dataDir <- dir.exists(directory)
    if(!dataDir){
        stop("ERROR: the data's directory does not exists!")
    }
    
    if(pollutant != "sulfate" && pollutant != "nitrate"){
        stop("ERROR: undefined pollutant choosed!")
    }
    
    allMonitorPollutant <- c()
    for(i in id){
        # To get the correct file name as: 001.csv, 012.csv and 123.csv
        fileName <- treeDigitOfNumber(i)
        
        file <- paste(directory, "/", fileName, ".csv", sep = "")
        data <- read_csv(file) # We read the file
        # Cleaning of pollutant column of the csv file: to drop all rows with NA values
        # We get all NA value
        bad <- is.na(data[pollutant])
        dataCleanOfPollutantNa <- data[!bad, ] # Choose only not NA values

        # Compute of all good values on a vector: only pollutant column too
        allMonitorPollutant <- c(allMonitorPollutant, dataCleanOfPollutantNa[[pollutant]])
    }
    
    # Mean of the final vector
    pollutantMean <- mean(allMonitorPollutant)
}