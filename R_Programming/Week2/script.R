library(dplyr)

pollutantmean <- function(directory, pollutant, id = 1:332){
  b <- data.frame()
  for (i in id) {
    a <- read.csv(paste(directory,formatC(i,width = 3, flag = "0"),".csv",sep = ""))
    b <- rbind(a,b)} 
  if (pollutant == "sulfate") mean(b$sulfate,na.rm = T)
  else if (pollutant == "nitrate") mean(b$nitrate,na.rm = T)
}

complete <- function(directory, id){
  b <- data.frame()
  for (i in id) {
    a <- read.csv(paste(directory,formatC(i,width = 3, flag = "0"),".csv",sep = ""))
    b <- rbind(a,b)} 
  b %>% mutate(complete = !is.na(Date) & !is.na(sulfate) & !is.na(nitrate)) %>% 
    group_by(ID) %>% summarise(nobs = sum(complete))
}

corr <- function(directory, threshold = 0){
  b <- data.frame()
  for (i in 1:332) {
    a <- read.csv(paste(directory,formatC(i,width = 3, flag = "0"),".csv",sep = ""))
    b <- rbind(a,b)} 
  c <- b %>% filter(!is.na(Date) & !is.na(sulfate) & !is.na(nitrate)) %>% 
    group_by(ID) %>% count() %>% filter(n > threshold)
  b %>% filter(ID %in% c$ID) %>% 
    filter(!is.na(Date) & !is.na(sulfate) & !is.na(nitrate)) %>% 
    group_by(ID) %>% summarise(cor = cor(sulfate,nitrate)) %>% select(cor)
}

set.seed(42)
cc <- complete("R_Programming/Week2/data/specdata/", 1:332)
use <- sample(332, 10)
print(cc[use, "n"])

cr <- corr("specdata/")                
cr <- sort(pull(cr,cor))              
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata/", 129)                
cr <- sort(pull(cr,cor))                  
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata/", 2000)                
n <- length(pull(cr,cor))                
cr <- corr("specdata/", 1000)                
cr <- sort(pull(cr,cor))
print(c(n, round(cr, 4)))
