data(mtcars)
mtcars$Modelo<-rownames(mtcars)
install.packages("writexl")
library(writexl)
write_xlsx(mtcars,"datos/mtcars.xlsx")
install.packages("readxl")
library(readxl)
datos<-read_xlsx(path = "datos/mtcars.xlsx")
head(datos, n=5)
?mtcars
automaticos<-datos[datos$am==0, ]
resume_at<-automaticos[,c("mpg","cyl","hp","gear")]
datos[datos$Modelo=="Mazda RX4", ]$gear
datos[datos$Modelo=="Mazda RX4", ]$mpg


install.packages("rvest")
library(rvest)
url<-"https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
page<-read_html(url)
tables<-html_table(html_elements(page,"table"))
table<-tables[[3]]
class(table)
head(table,n=5)
tail(table,n=5)
table$Mark
ny<-table[table$Venue=="New York",]
ny
