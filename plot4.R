source("load_data.R")
source("plot1.R")
source("plot2.R")
t<- load()



voltage_plot <- function(t) {
  plot(t$Voltage, type='l', ylab='Voltage', xlab='datetime', xaxt="n")
  index_for_friday<-nrow(t%>% filter(weekday == 'Thursday'))
  axis(1, at=c(1, index_for_friday,  length(t$Global_active_power)), labels=c('Thu', 'Fri', 'Sat'))  
}

grp_plot <- function(t){
  plot(t$Global_reactive_power, ylab="Global_reactive_power", type='l', xlab="", xaxt="n")
  index_for_friday<-nrow(t%>% filter(weekday == 'Thursday'))
  axis(1, at=c(1, index_for_friday,  length(t$Global_active_power)), labels=c('Thu', 'Fri', 'Sat'))
}

par(mfrow=c(2,2))
plot2(t)
voltage_plot(t)
plot3(t)
grp_plot(t)
dev.copy(png, './plot4.png',  height = 480, width = 480, units = 'px')
dev.off()