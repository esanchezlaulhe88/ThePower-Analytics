install.packages("RPostgreSQL")
install.packages("RSQLite")
install.packages("fastmap")

library(RSQLite)
library(DBI)
library(mlbench)
library(fastmap)

data("PimaIndiansDiabetes2")

db<-"PimaIndians.db"

con <- dbConnect(RSQLite::SQLite(), dbname = db)

dbListTables(con)

dbWriteTable(conn = con,
             name = "Pima",
             value = PimaIndiansDiabetes2)

dbListTables(con)


query_1<-"SELECT * FROM Pima WHERE diabetes = 'pos'"
resultado<-RSQLite::dbGetQuery(conn = con,
                               statement = query_1)


resultado
class(resultado)
table(resultado$diabetes)


query_2<-"SELECT * FROM Pima WHERE glucose >180 and age >50"
resultado_2<-RSQLite::dbGetQuery(conn = con,
                               statement = query_2)

resultado_2
summary(resultado_2)


query_3<-"SELECT glucose, pregnant,mass FROM Pima WHERE glucose >160 and diabetes = 'pos'"
resultado_3<-RSQLite::dbGetQuery(conn = con,
                                 statement = query_3)

resultado_3
summary(resultado_3)
summary(resultado_3$glucose)

tbl(src = con,"Pima")

q_1<-tbl(src = con,"Pima")%>% filter(diabetes=="pos")
show_query(q_1)

resultado_q1<-q_1%>%collect()
resultado_q1


q_2<-tbl(src = con,"Pima")%>% filter(age>50, glucose>160)
show_query(q_2)

resultado_q2<-q_2%>%collect()
resultado_q2

q_3<-tbl(src = con,"Pima")%>% filter(diabetes=="pos", glucose>180)%>%
  select(glucose,pregnant,mass)
show_query(q_3)

resultado_q3<-q_3%>%collect()
resultado_q3
