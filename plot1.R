# read data into data frame
dataUrl <- paste0(getwd(),"/data/household_power_consumption.txt")
df <- read.table(dataUrl, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

# subset required data range
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df.required <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# plot1.png
with(df.required, hist(Global_active_power, 
                       xlab="Global Active Power (kilowatts)",
                       ylab="Frequency",
                       main="Global Active Power",
                       col="red"))

# export
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()