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
#subset only the days we need
sub2<-subset(sub,dmy(sub$Date)>=dmy("1/2/2007") & dmy(sub$Date)<=dmy("2/2/2007"))
#histogram
with(sub2,hist(as.numeric(Global_active_power),main="Global Active Power",col = "red",xlab="Global Active Power(Kilowatts"))
dev.copy(png,"plot1.png", width=480, height=480)#saving plot1.png
dev.off()
