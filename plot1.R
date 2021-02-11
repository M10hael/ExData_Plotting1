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
png("PLOT 1.png")
hist(as.numeric(as.character(powers$Global_active_power)), 
             col = "red", main = "Global Active Power", xlab = 
                     "Global Active Power (Kilowatts)")
title("Global Active Powers")
dev.off() #Lo guradamos en forma .jpg
}
 
