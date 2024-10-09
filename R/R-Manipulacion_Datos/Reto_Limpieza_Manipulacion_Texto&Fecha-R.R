library(rvest)
library(stringr)
install.packages("lubridate")
library(lubridate)
library(ggplot2)

url<-"https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
page<-read_html(url)
tablas<-html_table(html_elements(page, "table"))
raw<-as.data.frame(tablas[3])
summary(raw)
head(raw)


meters<-str_sub(raw$Mark,1,4)
head(meters)
class(meters)
meters<-as.numeric(meters)
class(meters)

country<-str_sub(raw$Athlete,-4,-2)
head(country)

athlete<-str_sub(raw$Athlete,1,-6)
head(athlete, n=5)
athlete<-str_trim(athlete)
athlete<-str_to_upper(athlete)
head(athlete, n=5)

dates<-raw$Date
head(dates, n=5)
dates<-str_replace(dates,"\\[[1-9]\\]","")
head(dates, n=5)
class(dates)


dates<-dmy(dates)
head(dates)
dates

year<-year(dates)
month<-month(dates)
day<-day(dates)

record_time_elapsed<-year(today())-year(dates)
head(record_time_elapsed)

clean_data<-data.frame("Record"=meters,
                       "Athlete"=athlete,
                       "Country"=country,
                       "City"=raw$Venue,
                       "Record_Date"=dates,
                       "Record_Year"=year,
                       "Record_Month"=month,
                       "Record_Day"=day,
                       "Record_Time_Elapsed"=record_time_elapsed)

library(dplyr)

head(clean_data,n=5)

info<- clean_data %>% mutate ("Multiple Records" = ifelse(duplicated(Athlete), TRUE, FALSE)) %>%
      select(Record, Athlete, Record_Year,"Multiple Records", Country)
      
head(info)

info<- clean_data %>% select(Record, Athlete, Record_Year, Country) %>%
      filter(Record>2.30) %>% group_by(Country) %>%
      summarise("maxrecord"=max(Record), "N. of Records" = n()) %>% 
      arrange(desc(maxrecord))

info
clean_data
