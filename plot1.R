source("load_data.R")

t<- load()
plot1 <- function(t){
  hist(t$Global_active_power,
       xlab = "Global Active Power (kilowatts)",
       col = 'red',
       main='Global Active Power'
  )
}
png('./plot1.png',  height = 480, width = 480, units = 'px')
print(plot1(t))
dev.off()