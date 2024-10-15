install.packages("tidyverse")

library(RSQLite)
library(DBI)
library(tidyverse)

db<-"tuberculosis.db"

con<-dbConnect(SQLite(),dbname=db)
dbListTables(con)


dbWriteTable(conn = con,
             name = "population",
             value = population)

dbWriteTable(conn = con,
             name = "who",
             value = who)

dbListTables(con)

tbl(con, "population")
tbl(con, "who")

query_1<-"SELECT who.year, who.country, who.new_sp_f4554, population.population"
from_query_1<-"FROM who"
join_query_1<-"LEFT JOIN population on who.country=population.country and who.year=population.year"
where_query_1<-"WHERE (who.country='Spain' or who.country='Mexico') and who.year>=2008"

query1<-paste(query_1,from_query_1,join_query_1,where_query_1)
query1

resultado<-RSQLite::dbGetQuery(con,query1)

resultado
class(resultado)
summary(resultado)

resultado_no_na <- na.omit(resultado)


ggplot(resultado, aes(x = factor(year), y = population, fill = country)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(
    title = "Población de México y España a lo Largo del Tiempo",
    x = "Año",
    y = "Población",
    fill = "País"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    legend.position = "top"
  ) +
  scale_y_continuous(labels = scales::comma)  



query_2<-tbl(con, "who")%>%
  filter(country %in% c("Spain","Mexico"), year>=2001,year<=2008) %>%
  select("country","year","new_sp_f4554") %>%
  left_join(y = tbl(con,"population"), by=c("country", "year"))

show_query(query_2)

resultado2<-query_2 %>% collect()
class(resultado2)
summary(resultado2)
resultado2


resultado2_no_na <- na.omit(resultado2)

ggplot(resultado2_no_na, aes(x = year, y = new_sp_f4554, color = country)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) + 
  labs(
    title = "Evolución de los Casos de Tuberculosis (2001-2008)",
    x = "Año",
    y = "Casos de Tuberculosis",
    color = "País"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    legend.position = "top"
  )




query_3<-tbl(con, "who")%>%
  filter(country %in% c("Spain","Mexico"), year>=2001,year<=2008) %>%
  select("country","year","new_sp_f4554") %>%
  left_join(y = tbl(con,"population"), by=c("country", "year")) %>%
  group_by(country,year) %>%
  summarise("Casos por millón"=new_sp_f4554/population * 1000000)

show_query(query_3)

resultado3<-query_3 %>% collect()
class(resultado3)
summary(resultado3)
resultado3


ggplot(resultado3, aes(x = factor(year), y = "Casos por millón", fill = country)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(
    title = "Casos de Tuberculosis por Millón de Habitantes (2001-2008)",
    x = "Año",
    y = "Casos por Millón",
    fill = "País"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    legend.position = "top"
  )


ggplot(resultado3, aes(x = year, y = `Casos por millón`, fill = country)) +
  geom_area(alpha = 0.6, size = 1, color = "black") +
  labs(
    title = "Evolución de los Casos de Tuberculosis por Millón de Habitantes (2001-2008)",
    x = "Año",
    y = "Casos por Millón",
    fill = "País"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    legend.position = "top"
  )
