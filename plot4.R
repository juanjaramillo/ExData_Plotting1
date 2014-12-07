out <- read.table("household_power_consumption.txt", sep=";", header=T)
out$Date <- as.Date(out$Date, format="%d/%m/%Y")
x <- paste(out$Date,out$Time)
out$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")

bla1 <- "2007-02-01"
bla2 <- "2007-02-02"

s1 <- subset(out, out[,1] == bla1) 
s2<- subset(out, out[,1] == bla2)
s <- rbind(s1,s2)
head(s)
par( mfrow = c( 2, 2 ) )
plota <- plot(s[,2], as.numeric(levels(s[,3]))[s[,3]], xlab=" ", ylab="Global Active Power (kilowatts)", type="l", col= "black")
plotb <- plot(s[,2], as.numeric(levels(s[,5]))[s[,5]], xlab="datetime", ylab="Voltage", type="l", col= "black")
plotc <- plot(s[,2], as.numeric(levels(s[,7]))[s[,7]], xlab=" ", ylab="Sub Metering", type="l", col= "black")
lines(s[,2], as.numeric(levels(s[,8]))[s[,8]], col ="red")
lines(s[,2], s[,9], col ="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lty = 1,merge = TRUE)

plotd <- plot(s[,2], as.numeric(levels(s[,3]))[s[,3]], xlab="datetime", ylab="Global_Reactive_Power", type="l", col= "black")
