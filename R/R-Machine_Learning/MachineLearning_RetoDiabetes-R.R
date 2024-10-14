data(package="mlbench",PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)
summary(PimaIndiansDiabetes2)

data<-PimaIndiansDiabetes2%>%
  select(pregnant,glucose,pressure,mass,pedigree,age,diabetes)%>%
  na.omit()
summary(data)


set.seed(478)
index<-createDataPartition(data$diabetes,
                           p=0.7,
                           list=FALSE)
index
train_set<-data[index,]
test_set<-data[-index,]

ctrl<-trainControl(method = "cv", number=8, verboseIter = TRUE)

knn_model<-train(diabetes~.,
                 data=train_set,
                 method="knn",
                 trControl=ctrl,
                 tuneGrid=expand.grid(k=c(2:20))
)

knn_model

knn_predict<-predict(knn_model,test_set)
confusionMatrix(knn_predict,test_set$diabetes)

plot(knn_model)


regresion_logistica<-train(diabetes~.,
                           data=train_set,
                           method="glm",
                           trControl=ctrl
)

regresion_logistica

rlogistica_predict<-predict(regresion_logistica,test_set)
confusionMatrix(rlogistica_predict,test_set$diabetes)

plot(rlogistica_predict)
