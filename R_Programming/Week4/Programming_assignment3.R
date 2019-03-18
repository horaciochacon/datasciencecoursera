## Programming Assignment 3

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 

best <- function(state, outcome) {
    # Reads data and returns only variables of interest via a "Type" grep input
    readData <- function(type) {
        data <- read.csv("outcome-of-care-measures.csv")
        data <- data[,c(2,7,grep(type,names(data)))]
        names <- sapply(strsplit(names(data),".from.")[3:5],"[[",2)
        names(data)[3:5] <- names
        data
    }
    
    
    checker <- function(state, outcome) {
        states <- unique(data[,2])
        outcomes <- c("heart attack","pneumonia", "heart failure")
        check <- state %in% states
        check <- c(check,outcome %in% outcomes)
        check
    }
    
    sor
    
    data <- readData(type = "Lower.Mort")
    checker(state, outcome)
}
