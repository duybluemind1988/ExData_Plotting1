library(data.table)
library(lubridate)
path <- "/media/ad/01D6B57CFBE4DB20/1.Linux/Data/household_power_consumption.txt"
dt <- fread(path)
data <- dt[Date == "1/2/2007" | Date =="2/2/2007"]
data$date_time <- paste(data$Date,data$Time)
data$date_time <- dmy_hms(data$date_time )
data <- data %>% mutate_if(is.character,as.numeric)

png("plot1.png", width=480, height=480)
with(data,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col = "red"))
dev.off()

