###
### Surveillance
###
### 12/8/2017 
### EDA
###

###
### Preliminaries
###

setwd("~/Documents/Surveillance")

library(lubridate)

###
### Read in data. Must be in CSV format, because not enough memory for xlsx 
### 

d=read.csv("/home/aketz/Documents/Data/WDNR_surveillance/Surveillance_data.csv",header=TRUE)


### should redo this when Dan sends updated surveillance dataset
### as.Date('1/15/2001',format='%m/%d/%Y')

d$kill_date = as.Date(d$kill_date,c("%Y-%m-%d"))
head(d$kill_date)
d$year = year(d$kill_date)
max(d$year,na.rm=TRUE)

d$positive = as.numeric(d$positive)-1
table(d$positive)


raw.prev=c()
for(i in 2002:2017){
    raw.prev=c(raw.prev,sum(d$positive[d$year==i],na.rm=TRUE)/sum(d$year==i,na.rm=TRUE))
}
raw.prev

plot(2002:2017,raw.prev)

###
###
###
head(d)

table(d$positive)
summary(d)

plot(d$kill_date,d$positive)

