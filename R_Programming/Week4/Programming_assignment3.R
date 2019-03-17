## Programming Assignment 3

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 

best <- function(state, outcome) {
    data <- read.csv("outcome-of-care-measures.csv")
    data <- data[,c(2,7,grep("Lower",names(data)))]
    
    
}