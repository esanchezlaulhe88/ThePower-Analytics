install.packages("mlbench")
library(mlbench)
library(ggplot2)

?mpg

data(mpg)
head(mpg)

ggplot(mpg,aes(x=cyl)) +
  geom_histogram( binwidth = 2, color="#8B5F65", fill = "#FFB6C1", linetype = 1, linewidth = 1.1,alpha=0.7)+
  labs(title = "Histograma nº Coches por Clilindrada",
       x="Cilindros",
       y="N. de Coches")

ggplot(mpg,aes(x=class)) +
  geom_bar(aes(fill=trans)) +
  labs(title = "Distribución Coches por Clase",
       x="Modelo",
       y="N. de Clase")+
  theme(panel.background = element_blank())+
  theme(plot.title = element_text(color = "#53868B"))+
  theme(legend.position = "none")

library(stringr)
library(dplyr)

mpg$trans<-mpg$trans%>%str_sub(1,-5)

ggplot(mpg,aes(x=trans, y=cty))+
  geom_boxplot(aes(fill = trans))+
  labs(title = "Consumo por Tipo de Transmisión",
       x= "Transmisión",
       y="Consumo urbano")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank())

ggplot(mpg,aes(x=cty,y=hwy))+
  geom_point(aes(color = trans, size = cyl ))+
  labs(x= "Cantidad por Ciudad",
       y="Tipo de Transmisión")

ggplot(mpg,aes(x=cty,y=hwy))+
  geom_point(aes(color = class, size = cyl))+
  facet_wrap(~trans)+
  labs(x= "Consumo en Ciudad",
       y="Consumo en Autopista")
