## Programming Assignment 3

best <- function(state, outcome) {
    # Reads data and returns only variables of interest via a "Type" grep input
    readData <- function(type) {
        data <- read.csv("outcome-of-care-measures.csv",na.strings = "Not Available")
        data <- data[,c(2,7,grep(type,names(data)))]
        names <- sapply(strsplit(names(data),".from.")[3:5],"[[",2)
        names(data)[3:5] <- gsub("[.]", " ", tolower(names))
        data
    }
    
    # Reads state and outcome and return a 2 elements logical vector 
    checker <- function(state, outcome) {
        states <- unique(data[,2])
        outcomes <- c("heart attack","pneumonia", "heart failure")
        check <- state %in% states
        check <- c(check,outcome %in% outcomes)
        check
    }
    
    # Reads data, state and outcome and throws the sorted filtered DF
    sorter <- function(data,state,outcome) {
        data <- (data[data$State == state,])[,c("Hospital.Name",outcome)]
        data <- data[order(data[,outcome],data$Hospital.Name),]
    }
    
    data <- readData(type = "Lower.Mort")
    check <- checker(state, outcome)
    
    if(check[1] == TRUE & check[2] == TRUE) {
        sorter(data,state,outcome)[1,1]
    } else if(check[1] == FALSE & check[2] == TRUE) {
        print(paste("Error in best(",state,",",outcome,"): invalid state",
                    sep = "'"))
    } else if(check[1] == TRUE & check[2] == FALSE) {
        print(paste("Error in best(",state,",",outcome,"): invalid outcome",
                    sep = "'"))
    } else {
        print(paste("Error in best(",state,",",
                    outcome,"): invalid outcome and state", sep = "'"))
    }
}
