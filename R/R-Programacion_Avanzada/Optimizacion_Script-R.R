install.packages("readr")
install.packages("ggplot2")
install.packages("profvis")
library(readr)
library(ggplot2)
library(profvis)
data("diamonds")
head(diamonds)
write_csv(diamonds,file="datos/diamantes.csv",sep=",")

profvis({
path<-"datos/diamantes.csv"
datos<-read.csv(path)

resultados<-list()

cortes<-unique(datos$cut)

for (i in 1:length(cortes)){
  seleccion<-datos[datos$cut==cortes[i],]
  media<-mean(seleccion$price)
  resultados[[i]]<-data.frame(cortes=cortes[i],Media=media)
}

resumen_diamantes<-do.call(rbind,resultados)

ggplot(resumen_diamantes,aes(x=cortes,y=Media))+
  geom_col()+
  geom_text(aes(label=Media))
})


install.packages("microbenchmark")
library(microbenchmark)
microbenchmark({
  datos<-read_csv(path)
},
{
  datos<-read.csv(path)
}
)

system.time(read_csv(path))
system.time(read.csv(path))

install.packages("dplyr")
library(dplyr)

resumen_diamonds<-datos%>%group_by(cut)%>%
  summarise(Media=mean(price))
resumen_diamonds

resumen_diamantes
