library(readxl)
library(dplyr)
library(ggplot2)

raw<-read_excel(path = "datos/mtcars.xlsx")
head(raw)

summary(raw)

clean<-raw%>%select(mpg,cyl,disp,hp,wt,am)%>%
      mutate(am=factor(am, level= c(0,1),labels = c("Automático","Manual")), cyl= as.factor(cyl))
summary(clean)             

correlation<-cor(clean[,c("mpg","disp","hp","wt")])
correlation

pairs(clean[,c("mpg","disp","hp","wt")])

ggplot(data=clean,aes(x=am,y=mpg,fill = am))+
      geom_boxplot()+
      labs(title = "Relación entre Consumo y Tipo de Transmisión",
            x="Tipo de Transmisión",
            y="Consumo (Millas/Galón)")

ggplot(data=clean,aes(x=cyl,y=mpg,fill = cyl))+
  geom_boxplot()+
  labs(title = "Relación entre Consumo y Cilindros",
       x="Cilindros",
       y="Consumo (Millas/Galón)")

t<- t.test(mpg~am,data = clean)
t

anova<-aov(mpg~cyl,data = clean)
summary(anova)

model<-lm(mpg~hp+disp+wt, data = clean)
summary(model)

