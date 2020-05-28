#Read Data 

library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt",na.strings="?", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                                           trim_ws = TRUE)

#subset data
dat=household_power_consumption[household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02",]


###plot 1
hist(dat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

# plot 2
with(dat, {
  plot(Global_active_power~as.POSIXct(paste(Date,Time)), type="l",
       ylab="Global Active Power (kilowatts)", xlab="")})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#####plot 3
with(dat, {
  plot(Sub_metering_1~as.POSIXct(paste(Date,Time)), type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~as.POSIXct(paste(Date,Time)),col='Red')
  lines(Sub_metering_3~as.POSIXct(paste(Date,Time)),col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

########plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat, {
  plot(Global_active_power~as.POSIXct(paste(Date,Time)), type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~as.POSIXct(paste(Date,Time)), type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~as.POSIXct(paste(Date,Time)), type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~as.POSIXct(paste(Date,Time)),col='Red')
  lines(Sub_metering_3~as.POSIXct(paste(Date,Time)),col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~as.POSIXct(paste(Date,Time)), type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

