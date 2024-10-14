data(iris)
head(iris)
summary(iris)

set.seed(568)
index<-createDataPartition(iris$Species,
                           p=0.8,
                           list=FALSE)
train_set<-iris[index,]
test_set<-iris[-index,]

ctrl<-trainControl(method = "cv",number=10,verboseIter = TRUE)

knn_model<-train(Species~.,
                 data = train_set,
                 method="knn",
                 trControl=ctrl,
                 tuneGrid=expand.grid(k=seq(2,15,1)))
knn_model

knn_predict<-predict(knn_model,test_set)

confusionMatrix(knn_predict, test_set$Species)