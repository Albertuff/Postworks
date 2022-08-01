##### Postwork 1 #####

library(dplyr) #libreria necesaria para el comando select()

# Data frame con los datos de soccer 2019-2020 de la primer divisi'on de la liga española.

datos=data.frame(read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv"))

# Extrayendo las columnas de los goles de los equipos en casa (FTHG) y los visitantes (FTAG)

datos=select(datos,FTHG,FTAG)

# Renombramos las columnas

datos = select(datos,Casa=FTHG,Visita=FTAG)

# Creamos las tablas de frecuencia 

(tabla1 = table(datos$Casa))
(tabla2 = table(datos$Visita))
(tabla3 = table(datos))

# De las tablas anteriores construimos tablas de frecuencia relativa y estimamos probabilidades

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
(round(prop.table(tabla1),2))

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
(round(prop.table(tabla2),2))

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)
(round(prop.table(tabla3),2))

