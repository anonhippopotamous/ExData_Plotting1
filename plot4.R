# read data into data frame
dataUrl <- paste0(getwd(),"/data/household_power_consumption.txt")
df <- read.table(dataUrl, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# subset required data range
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df.required <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# datetime
df.required$Time <- strptime(paste(df.required$Date, df.required$Time), "%Y-%m-%d %H:%M:%S")

# set up plot window
par(mfrow=c(2,2))

# plot4.png
with(df.required, {
  #1st plot
  plot(Time, Global_active_power, 
       xlab="", ylab="Global Active Power", type="l")
  #2nd plot
  plot(Time, Voltage,
       xlab="datetime", ylab="Voltage", type="l")
  #3rd plot
  plot(x=Time, y=Sub_metering_1,
       xlab="", ylab="Energy sub metering", type="l")
  lines(x=Time, y=Sub_metering_2, col="red")
  lines(x=Time, y=Sub_metering_3, col="blue")
  legend("topright", bty="n",
         lty=1, seg.len=0.5, 
         col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         y.intersp=0.7)
  #4th plot
  plot(Time, Global_reactive_power,
       xlab="datetime", ylab="", type="l")
  })

# export
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
