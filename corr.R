## Calculate the cor of nitrate and sulfate
corr <- function(directory, treshold=0){
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
    
    # Create a vector to hold correlation
    cr <- c()
    # We get first all completed cases in all files specified by id range
    # using the complete.R function load as object in our workspace
    completes <- complete(directory, 1:332)
    nobs <- completes$nobs
    validNobs <- completes$id[nobs > treshold]
    
    for(id in validNobs){
    	# We read the corresponding file(id.csv)
        file <- paste(directory, "/", treeDigitOfNumber(id), ".csv", sep = "")
        data <- read_csv(file) # We read the file
        # Clean the data to get only valid one(complete cases)
        good <- complete.cases(data)
        data <- data[good, ]
        # Nitrate and Sulfate columns
        nitrate <- data$nitrate
        sulfate <- data$sulfate
        
        # Let's calculate the cor between these two variables
        ci <- cor(sulfate, nitrate, use="complete.obs")
        # Update our vector
        cr <- c(cr, c(ci))
    }
    # We return the vector of calculated corrs
    cr
}