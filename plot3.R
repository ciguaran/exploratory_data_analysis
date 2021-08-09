source("load_data.R")
t<- load()

plot3 <- function(t) {
  plot(t$Sub_metering_1, type = 'l', ylab='Energy sub metering',xaxt="n")
  lines(t$Sub_metering_2, col='red')
  lines(t$Sub_metering_3, col='blue')
  index_for_friday<-nrow(t%>% filter(weekday == 'Thursday'))
  axis(1, at=c(1, index_for_friday,  length(t$Global_active_power)), labels=c('Thu', 'Fri', 'Sat'))
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=1:2, cex=0.8)
}
plot3(t)
dev.copy(png, './plot3.png',  height = 480, width = 480, units = 'px')
dev.off()