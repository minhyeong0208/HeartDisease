data <- read.csv("C:/programming/Rworks/StatwithR/Heart_Disease_Renew/outlier.csv",
                 header=T)
heart <- data.frame(data)
names(heart)
dim(heart)
summary(heart)
pairs(heart)

cor(heart[,-11])

#4.6.2
glm.fit=glm(HeartDisease~Age+Sex+ChestPainType+RestingBP+Cholesterol+FastingBS+
              RestingECG+MaxHR+Oldpeak+ST_Slope, data=heart,family=binomial)
summary(glm.fit)

coef(glm.fit)
summary(glm.fit)$coef
summary(glm.fit)$coef[,4]

glm.probs=predict(glm.fit, type="response")
glm.probs[1:10]

glm.pred=rep(0, 1669)
glm.pred[glm.probs>0.5]=1

table(glm.pred,data$HeartDisease)
(498+463)/1669
mean(glm.pred==data$HeartDisease)

train=(Cholesterol<200) #서수인 경우만 가능
heart.200=heart[!train,]
dim(heart.200)
HeartDisease.200=HeartDisease[!train]

glm.fit=glm(HeartDisease~Age+Sex+ChestPainType+RestingBP+Cholesterol+FastingBS+
              RestingECG+MaxHR+Oldpeak+ST_Slope,data=heart,family=binomial,subset=train)
glm.probs=predict(glm.fit,heart.200,type="response")

glm.pred=rep(0,1061)
glm.pred[glm.probs>0.5]=1
table(glm.pred,HeartDisease.200)
mean(glm.pred==HeartDisease.200)
mean(glm.pred!=HeartDisease.200)

glm.fit=glm(HeartDisease~Age+Sex+ChestPainType+RestingBP+Cholesterol+FastingBS+
              RestingECG+MaxHR+Oldpeak+ST_Slope,data=heart,family=binomial,subset=train)
glm.probs=predict(glm.fit,heart.200,type="response")
glm.pred=rep("0",1061)
glm.pred[glm.probs>.5]=1
table(glm.pred,HeartDisease.200)
mean(glm.pred==HeartDisease.200)


