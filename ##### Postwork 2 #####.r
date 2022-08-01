##### Postwork 2 #####

library(dplyr)

# Data frame con los datos de soccer 2017-2018 de la primer divisi'on de la liga española.

datos1=read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")

# Data frame con los datos de soccer 2018-2019 de la primer división de la liga española.

datos2=read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")

# Data frame con los datos de soccer 2019-2020 de la primer división de la liga española.

datos3=read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

# Revisando la estructura de los data frames con los comandos (str,head,view,summary).

str(datos1);str(datos2);str(datos3)

head(datos1);head(datos2);head(datos3)

View(datos1);View(datos2);View(datos3)

summary(datos1);summary(datos2);summary(datos3)

# Seleccionamos las columnas Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR de los data frames.
# Notamos que el data frame 3 (datos3) tiene una columna extra (time)a los otros dos data frames.

datos1=select(datos1,Date:FTR)
datos2=select(datos2,Date:FTR)
datos3=select(datos3,Date,HomeTeam:FTR)

# Nos aseguramos de que seleccionamos correctamente las columnas

names(datos1);names(datos2);names(datos3)

# Cambiamos el formato de la fecha para que todas coincidan.

datos1=mutate(datos1,Date=as.Date(Date,"%d/%m/%y"))
datos2=mutate(datos2,Date=as.Date(Date,"%d/%m/%Y"))
datos3=mutate(datos3,Date=as.Date(Date,"%d/%m/%Y"))

# Verificamos que las fechas tienen el mismo formato

str(datos1$Date);str(datos2$Date);str(datos3$Date)
View(datos1);View(datos2);View(datos3)

# Unimos los data frames em uno (las columnas son iguales y en el mismo orden).

datos4=rbind(datos1,datos2,datos3)

# Visualizamos el data frame que contiene todos los datos.

View(datos4)

# Guardamos el data frame en un archivo .csv para usarlo despues.
# Se debe de tener en cuenta la ruta donde se guarda el archivo, utilizando setwd("Ruta").

write.csv(datos4,"p2res1.csv")
