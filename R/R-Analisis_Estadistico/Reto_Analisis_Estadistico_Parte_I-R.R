install.packages("forecast")

library(dplyr)
library(ggplot2)
library(mlbench)
library(stats)
library(forecast)


data(package="mlbench",PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2,n=10)

mean(PimaIndiansDiabetes2$glucose,na.rm = TRUE)
sd(PimaIndiansDiabetes2$glucose,na.rm = TRUE)

summary(PimaIndiansDiabetes2$glucose)

table(PimaIndiansDiabetes2$diabetes)
prop.table(table(PimaIndiansDiabetes2$diabetes))

summary(PimaIndiansDiabetes2)


hist(PimaIndiansDiabetes2$glucose,
     main="Histograma Casos con Diabetes e Índice de Glucosa",
     xlab="Índice de Glucosa",
     ylab="Nº de casos",
     col = "#66CDAA",
     border = "#458B74",
     density = 75)

t<-t.test(glucose~diabetes,data = PimaIndiansDiabetes2)
t

datos<-PimaIndiansDiabetes2 %>% na.omit()
cor(datos$glucose,datos$pressure)
