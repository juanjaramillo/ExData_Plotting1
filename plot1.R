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
plot1 <- hist(as.numeric(levels(s[,3]))[s[,3]], main="Global Active power", ylim=c(0, 1200), xlab="Global Active Power (kilowatts)", ylab="Frequency", col= "red")
