source("load_data.R")
t<- load()

plot2 <- function(t){
  p<-plot(t$Global_active_power,
       ylab = "Global Active Power (kilowatts)",
       type='l',
       xlab='',
       main='',
       xaxt="n"
  )
  index_for_friday<-nrow(t%>% filter(weekday == 'Thursday'))
  axis(1, at=c(1, index_for_friday,  length(t$Global_active_power)), labels=c('Thu', 'Fri', 'Sat'))
  return(plot)
}

png('./plot2.png',  height = 480, width = 480, units = 'px')
print(plot2(t))
dev.off()