library(data.table)
library(lubridate)
path <- "/media/ad/01D6B57CFBE4DB20/1.Linux/Data/household_power_consumption.txt"
dt <- fread(path)
data <- dt[Date == "1/2/2007" | Date =="2/2/2007"]
data$date_time <- paste(data$Date,data$Time)
data$date_time <- dmy_hms(data$date_time )
data <- data %>% mutate_if(is.character,as.numeric)

png("plot3.png", width=480, height=480)
plot(data$date_time,data$Sub_metering_1,
     type="l",xlab="", ylab="Energy sub metering")
lines(data$date_time,data$Sub_metering_2, col="red")
lines(data$date_time,data$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()