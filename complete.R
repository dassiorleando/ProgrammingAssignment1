# We load the readr package
library('readr')

## To get the completely observed cases of a range of monitors
## Each monitor is knowing by his id, then his file is also his_id.csv
## All these files are located in a specified directory
complete <- function(directory, id=1:332){
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
    
    # Create a dataframe to hold our simple stats
    cmp <- data.frame("id"=integer(), "nobs"=integer())
    
    for(i in id){
        # To get the correct file name as: 001.csv, 012.csv and 123.csv
        fileName <- treeDigitOfNumber(i)
        
        file <- paste(directory, "/", fileName, ".csv", sep = "")
        data <- read_csv(file) # We read the file
        
        good <- complete.cases(data) # A boolean vector of completed cases 
        goodData <- data[good, ]     # data frame of completed cases
        # Cleaning of pollutant column of the csv file: to drop all rows with NA values
        cmp <- rbind(cmp, list(id= as.integer(fileName), nobs= nrow(goodData)))
    }
    # We return these cases
    cmp
}

