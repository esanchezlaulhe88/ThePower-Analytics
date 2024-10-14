install.packages("caret")
library(caret)

data("mtcars")
names(mtcars)

set.seed(123)
index<-createDataPartition(mtcars$mpg,
                           p=0.7,
                           list=FALSE)
train_set<-mtcars[index,]
test_set<-mtcars[-index,]


funcion_control<-trainControl(method = "cv", number=10, verboseIter = TRUE)

regresion_lineal<-train(mpg~.,
                        data=train_set,
                        method="lm",
                        trControl=funcion_control
)
regresion_lineal

rlineal_predict<-predict(regresion_lineal, test_set)
rlineal_rmse<-sqrt(mean((rlineal_predict-test_set$mpg)^2))
rlineal_rmse


knn<-train(mpg~.,
           data=train_set,
           method="knn",
           trControl=funcion_control,
           tuneGrid=expand.grid(k=seq(1,20,1))
)
knn

knn_predict<-predict(knn,test_set)
knn_rmse<-sqrt(mean((knn_predict-test_set$mpg)^2))
knn_rmse

modelLookup("neuralnet")

red_neuronal<-train(mpg~.,
                    data = train_set,
                    method = "neuralnet",
                    trControl = funcion_control,
                    tuneGrid = expand.grid(layer1=c(1:3),layer2=c(1:3),layer3=0)
)
red_neuronal

rneuronal_predict<-predict(red_neuronal,test_set)
rneuronal_rmse<-sqrt(mean((rneuronal_predict-test_set$mpg)^2))

cat("Regresion lineal", rlineal_rmse, "\n")
cat("KNN", knn_rmse, "\n")
cat("Red Neuronal", rneuronal_rmse, "\n")

