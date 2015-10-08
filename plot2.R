# read data into data frame
dataUrl <- paste0(getwd(),"/data/household_power_consumption.txt")
df <- read.table(dataUrl, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# subset required data range
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df.required <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# datetime
df.required$Time <- strptime(paste(df.required$Date, df.required$Time), "%Y-%m-%d %H:%M:%S")

# plot2.png
with(df.required, plot(Time, Global_active_power,
                       xlab="",
                       ylab="Global Active Power (kilowatts)",
                       type="l"))

# export
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
