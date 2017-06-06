# ProgrammingAssignment1
Air pollution monitoring data in the United State

## Done
- 


## Part 1: [pollutanmean.R](https://github.com/dassiorleando/ProgrammingAssignment1/blob/master/pollutanmean.R)
Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors ignoring missing values coded NA.

## Part 2: [complete.R](https://github.com/dassiorleando/ProgrammingAssignment1/blob/master/complete.R)
Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.

## Part 3: [corr.R](https://github.com/dassiorleando/ProgrammingAssignment1/blob/master/corr.R)
Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0