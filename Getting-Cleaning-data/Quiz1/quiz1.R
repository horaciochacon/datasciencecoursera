library(tidyverse)
library(readxl)
library(xml2)
library(data.table)

properties <- read_csv("getdata_data_ss06hid.csv")

properties <- properties %>% select(VAL) %>% filter(VAL == 24)

dat <- read_excel("getdata_data_DATA.gov_NGAP.xlsx", skip = 17, n_max = 5)

xml <- read_xml("getdata_data_restaurants.xml")
recs <- xml_find_all(xml, "//zipcode")
vals <- trimws(xml_text(recs))
table(vals)

DT <- fread("getdata_data_ss06pid.csv")

system.time(for (i in 1:10000) {
    DT[,mean(pwgtp15),by=SEX]
})

system.time(for (i in 1:10000) {
    mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
})

system.time(for (i in 1:10000) {
    DT[,mean(pwgtp15),by=SEX]
})

system.time(for (i in 1:10000) {
    sapply(split(DT$pwgtp15,DT$SEX),mean)
})

system.time(for (i in 1:10000) {
    tapply(DT$pwgtp15,DT$SEX,mean)
})

DT_Numeric <- select(DT, -RT, -NAICSP, -SOCP)
rowMeans(DT_Numeric)[DT_Numeric$SEX==1]; 
rowMeans(DT_Numeric)[DT_Numeric$SEX==2]





