library(lubridate)
library(dplyr)
library(graphics)
library(grDevices)

#the file was download in "exdata%2Fdata%2Fhousehold_power_consumption" in the working directory
sub<-read.table("exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE,sep = ";")
object.size(sub)# prints file size

sub<-tbl_df(sub)
#to eliminate rows with ? synbol
a<-1
for (i in 1:9){
  if (a<=9) 
  {sub<-filter(sub,sub[,a]!="?")
  a<-a+1
  }
}
#subset omle the days we need
a<-1
for (i in 1:9){
  if (a<=9) 
  {sub<-filter(sub,sub[,a]!="?")
  a<-a+1
  }
}
#subset only the days we need
sub2<-subset(sub,dmy(sub$Date)>=dmy("1/2/2007") & dmy(sub$Date)<=dmy("2/2/2007"))


sub2$Date<- paste(dmy(sub2$Date), sub2$Time)#join in one column date and time
sub2$Date <- as.POSIXct(sub11$Date)

with(sub2,plot(Date,Sub_metering_1, type="l",ylab="Energy Sub metering", xlab=""))
with(sub2,lines(Date,Sub_metering_2,col="red"))
with(sub2,lines(Date,Sub_metering_3,col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)#saving plot1.png
dev.off()
     
