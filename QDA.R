qda.fit=qda(HeartDisease~Age+Sex+Cholesterol+MaxHR+ChestPainType+
              ST_Slope+Oldpeak,data=heart,family=binomial, subset=train)
qda.fit

qda.class=predict(qda.fit,heart.test)$class
table(qda.class,HeartDisease.test)
mean(qda.class==HeartDisease.test)
