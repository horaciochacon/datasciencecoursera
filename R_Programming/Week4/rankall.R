## Programming Assignment 3
## rankall Function

library(tidyverse)

rankall <- function(outcome, num = "best") {
    # Reads data and returns only variables of interest via a "Type" grep input
    readData <- function(type) {
        data <- read.csv("outcome-of-care-measures.csv",na.strings = "Not Available")
        data <- data[,c(2,7,grep(type,names(data)))]
        names <- sapply(strsplit(names(data),".from.")[3:5],"[[",2)
        names(data)[3:5] <- gsub("[.]", " ", tolower(names))
        data
    }
    
    # Reads state and outcome and return a 2 elements logical vector 
    checker <- function(outcome) {
        outcomes <- c("heart attack","pneumonia", "heart failure")
        check <- outcome %in% outcomes
        check
    }
    
    # Reads data, state and outcome and throws the sorted filtered DF
    sorter <- function(data,outcome) {
        data <- data[,c("Hospital.Name","State",outcome)]
        data <- data[order(data[,outcome],data$Hospital.Name),]
        data <- data %>% group_by(State) %>% mutate(n = row_number()) 
        data
    }
    
    data <- readData(type = "^Hospital.30.Day.Death..Mortality..Rates.from")
    State <- sort(unique(data[,2])) 
    check <- checker(outcome)
    sorted <- sorter(data, outcome)
    
    if(check == TRUE) {
        if(num == "best") {
            sorted %>% filter(n == 1) %>% arrange(State)
        } else if(num == "worst"){
            sorted <- sorted[!is.na(sorted[,outcome]),]
            n <- sapply(split(sorted,sorted$State), function(x) max(x[,"n"]))
            left_join(data.frame(State,n),sorted, by= c('n','State')) %>% 
                arrange(State)
        } else {
            left_join(as.data.frame(State),(sorted %>% filter(n == num) %>% arrange(State))) %>% 
                arrange(State)
        }
    } else if(check == FALSE) {
        print(paste("Error in best(",state,",",outcome,"): invalid outcome",
                    sep = "'"))
    }
}
