data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/Balanced_data.csv",
                 header=T)
heart <- data.frame(data)
names(heart)
summary(glm.fit)
glm.fit=glm(HeartDisease~Age+Sex+ChestPainType+RestingBP+Cholesterol+FastingBS+RestingECG+MaxHR+Oldpeak+ST_Slope,data=heart,family=binomial,subset=train)


glm.probs=predict(glm.fit, type="response")

glm.pred=rep(0, 1580)
glm.pred[glm.probs>0.5]=1

table(glm.pred,data$HeartDisease)

mean(glm.pred==data$HeartDisease)


#train/test
idx <- sample(1:nrow(data), size = nrow(data)*0.8, replace=FALSE)

train = data[idx,]
test = data[-idx,]
heart.test=heart[!train,]
write.csv(train, "C:/programming/Rworks/StatwithR/HeartDisease/train.csv")
dim(test)
train=(data$Num>316)
heart.test=heart[!train,]
dim(heart.test)
HeartDisease.test = HeartDisease[!train]
dim(HeartDisease.test)

library(ISLR)
attach(heart)
glm.fit=glm(HeartDisease~Age+Sex+Cholesterol+MaxHR+ChestPainType+
              ST_Slope+Oldpeak,data=heart,family=binomial, subset=train)
glm.probs=predict(glm.fit,heart.test,type="response")

glm.pred=rep(0, 316)
glm.pred[glm.probs>.5]=1
table(glm.pred, HeartDisease.test)
mean(glm.pred==HeartDisease.test)
mean(glm.pred!=HeartDisease.test)
