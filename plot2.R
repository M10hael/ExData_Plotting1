#2. PLOT NÚMERO 2
{
        jpeg("PLOT 2.jpg")
        #Primero transformamos las variables de fecha y hora
        powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
        powers$Time <- strptime(powers$Time, format="%H:%M:%S")
        powers[1:1440,"Time"] <- format(powers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
        powers[1441:2880,"Time"] <- format(powers[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
        
        
        #Realizamos el grÃ¡fico
        plot(powers$Time,as.numeric(as.character(powers$Global_active_power)),type="l",xlab="",
             ylab="Global Active Power (kilowatts)") 
        title(main = "Global Active Power VS Time")
        dev.off() #Lo guardamos en forma .jpg
}
