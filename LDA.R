data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/Balanced_data.csv",
                 header=T)
str(data)

heart <- data.frame(data)
names(heart)

library(MASS)
lda.fit=lda(HeartDisease~Age+Sex+Cholesterol+MaxHR+ChestPainType+
              ST_Slope+Oldpeak,data=heart,family=binomial, subset=train)

lda.fit

lda.pred=predict(lda.fit, heart.test)
names(lda.pred)

lda.class=lda.pred$class
table(lda.class,HeartDisease.test)
mean(lda.class==HeartDisease.test)


sum(lda.pred$posterior[,1]>=.5)
sum(lda.pred$posterior[,1]<.5)

lda.pred$posterior[1:20,1]
lda.class[1:20]

sum(lda.pred$posterior[,1]>.9)


plot(lda.fit)
