# read data into data frame
dataUrl <- paste0(getwd(),"/data/household_power_consumption.txt")
df <- read.table(dataUrl, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# subset required data range
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df.required <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# datetime
df.required$Time <- strptime(paste(df.required$Date, df.required$Time), "%Y-%m-%d %H:%M:%S")

# plot3.png
with(df.required, {
  plot(x=Time, y=Sub_metering_1,
       xlab="", ylab="Energy sub metering", 
       type="n")
  lines(x=Time, y=Sub_metering_1)
  lines(x=Time, y=Sub_metering_2, col="red")
  lines(x=Time, y=Sub_metering_3, col="blue")
  legend("topright", lty=1,
         col=c("black", "red", "blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })


# export
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
