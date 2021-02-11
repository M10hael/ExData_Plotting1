#Instalamos el paquete ggplot2
install.packages("ggplot2")
library(ggplot2)

#cargamos los datos
setwd("C:/Users/Usuario/Desktop/coursera/proyecto 4")
energy <- read.csv("C:/Users/Usuario/Desktop/coursera/proyecto 4/household_power_consumption.txt", sep=";")
names(energy) <- c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Usamos solo los datos de las fechas que necesitamos
powers <- subset(energy,energy$Date=="1/2/2007" | energy$Date=="2/2/2007") 

#1.PLOT NÚMERO 1
{
#Creamos el plot usando hist
jpeg("PLOT 1.jpg", width = 480, height = 480)
        
hist(as.numeric(as.character(powers$Global_active_power)), 
             col = "red", main = "Global Active Power", xlab = 
                     "Global Active Power (Kilowatts)")
title("Global Active Power")
dev.off() #Lo guradamos en forma .jpg
}
 
#2. PLOT NÚMERO 2
{
        
#Primero transformamos las variables de fecha y hora
powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
powers$Time <- strptime(powers$Time, format="%H:%M:%S")
powers[1:1440,"Time"] <- format(powers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powers[1441:2880,"Time"] <- format(powers[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Realizamos el gráfico
jpeg("PLOT 2.jpg",width = 480, height = 480)
plot(powers$Time,as.numeric(as.character(powers$Global_active_power)),type="l",xlab="",
     ylab="Global Active Power (kilowatts)") 
title(main = "Global Active Power VS Time")
dev.off() #Lo guardamos en forma .jpg
}

#3.PLOT NÚMERO 3
{
#Transformamos los datos 
powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
powers$Time <- strptime(powers$Time, format="%H:%M:%S")
powers[1:1440,"Time"] <- format(powers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powers[1441:2880,"Time"] <- format(powers[1441:2880,"Time"],"2007-02-02 %H:%M:%s")
   

# Realizamos el gráfico
jpeg("PLOT 3.jpg",width = 480, height = 480)
plot(powers$Time,powers$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(powers,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(powers,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(powers,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
title(main = "PLOT 3")  
dev.off() #Lo guardamos en forma .jpg
}

#4. PLOT NÚMERO 4
{
#Transformamos los datos 
powers$Date <- as.Date(powers$Date, format="%d/%m/%Y")
powers$Time <- strptime(powers$Time, format="%H:%M:%S")
powers[1:1440,"Time"] <- format(powers[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powers[1441:2880,"Time"] <- format(powers[1441:2880,"Time"],"2007-02-02 %H:%M:%s")

#Empezamos a construir todos los gráficos 
par(mfrow=c(2,2))
#Hacemos los 4 gráficos
png("PLOT 4.png",width = 480, height = 480)
with(powers, {
plot(powers$Time,as.numeric(as.character(powers$Global_active_power)),type="l",xlab="",
                   ylab="Global Active Power (kilowatts)") 
        title(main = "PLOT 1")
plot(powers$Time,as.numeric(as.character(powers$Voltage)), type = "l", 
                   xlab = "Datatime", ylab = "Voltage")
        title(main = "PLOT 2")
plot(powers$Time,powers$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(powers,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(powers,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(powers,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        title(main = "PLOT 3")
plot(powers$Time,as.numeric(as.character(powers$Global_reactive_power)), type = "l", xlab = "Datetime", ylab = "Globar_Reactive_Power")
        title(main = "PLOT 4")
})
dev.off() #Lo guardamos en forma .jpg
}
