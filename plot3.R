
#3.PLOT NÚMERO 3
{
        jpeg("PLOT 3.jpg")
        #Transformamos los datos 
        powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
        powers$Time <- strptime(powers$Time, format="%H:%M:%S")
        powers[1:1440,"Time"] <- format(powers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
        powers[1441:2880,"Time"] <- format(powers[1441:2880,"Time"],"2007-02-02 %H:%M:%s")
        
        
        # Realizamos el grÃ¡fico
        plot(powers$Time,powers$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(powers,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(powers,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(powers,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        title(main = "PLOT 3")  
        dev.off() #Lo guardamos en forma .jpg
}
