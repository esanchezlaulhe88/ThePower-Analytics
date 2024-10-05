data()
dir.create("datos")
download.file(url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data",destfile = "datos/iris.data")
mis_datos<-read.table(file="datos/iris.data",
                      header=FALSE,
                      sep=",",
                      col.names = c("A","B","C","D","Class"),
                      stringsAsFactors = FALSE
)
head(mis_datos)

csv<-read.csv(file="datos/iris.csv",
         header=FALSE,
         sep=","
)
head(csv)

install.packages("readxl")
library(readxl)
