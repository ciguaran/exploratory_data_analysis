library(tidyverse)
load <- function(){
  t<-read.table('./household_power_consumption.txt', na.strings = "?", sep=";", header=TRUE)  
  dates<-as.Date(t$Date, '%d/%m/%Y')
  t$parsed_date <- dates
  t$year<- year(t$parsed_date)
  t$weekday <-weekdays(t$parsed_date)
  t<- t %>%
    filter(parsed_date == as.Date('01/02/2007', '%d/%m/%Y') | parsed_date == as.Date('02/02/2007', '%d/%m/%Y'))
}