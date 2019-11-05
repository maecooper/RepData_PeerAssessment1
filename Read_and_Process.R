
library(lubridate)
library(stringr)
library(plyr)
library(dplyr)

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip",temp)
activity<- read.csv(unz(temp, "activity.csv"))
unlink(temp)

activity$date<- ymd(activity$date)

activity$interval<- str_pad(activity$interval, 4, pad = "0")
activity$interval<- hm(paste(substr(activity$interval,1,2),":",substr(activity$interval,3,4)))

activity2<- subset(activity,is.na(activity$steps)==FALSE)
