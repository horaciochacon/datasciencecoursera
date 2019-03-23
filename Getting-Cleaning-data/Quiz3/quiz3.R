# Quiz 3

# Q1

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
data <- read_csv(url)

agricultureLogical <- data$ACR == 3 & data$AGS == 6 
which(agricultureLogical)

# Q2

library(jpeg)

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
file <- download.file(url, destfile = "hola.jpg")
img <- readJPEG("hola.jpg",native = TRUE)
quantile(img,probs = c(0.3,0.8))

# Q3
library(readr)

pbi <- read_csv(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
                skip = 3,n_max = 232)
edu <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")


pbi <- pbi %>% 
    select(X1, Ranking, Economy,`US dollars)`) %>% 
    na.omit() %>% rename(country = X1, pbi = `US dollars)`)

edu <- edu %>% rename(country = CountryCode)

merge <- merge(pbi,edu)

a <- merge %>% arrange(desc(Ranking))

# Q4
merge %>% group_by(Income.Group) %>% summarise(mean = mean(Ranking,na.rm = T))

# Q5
table(merge$Income.Group, cut(merge$Ranking,quantile(merge$Ranking,seq(0, 1, 0.2))))







