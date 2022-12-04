data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/removeNA.csv",
                 header=T)

boxplot(data$RestingBP)
data$RestingBP <-ifelse(data$RestingBP <90 | data$RestingBP>175,NA,data$RestingBP)

data<- na.omit(data)

write.csv(data, "C:/programming/Rworks/StatwithR/HeartDisease/outlier_RestingBP.csv")

#Cholesterol
data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/outlier_RestingBP.csv",
                 header=T)

boxplot(data$Cholesterol)
data$Cholesterol <-ifelse(data$Cholesterol <120 | data$Cholesterol>375,NA,data$Cholesterol)

data<- na.omit(data)

write.csv(data, "C:/programming/Rworks/StatwithR/HeartDisease/outlier_Cholesterol.csv")

#MaxHR
data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/outlier_Cholesterol.csv",
                 header=T)

boxplot(data$MaxHR)
data$MaxHR <-ifelse(data$MaxHR <80 | data$MaxHR>200,NA,data$MaxHR)

data<- na.omit(data)

write.csv(data, "C:/programming/Rworks/StatwithR/HeartDisease/outlier_MaxHR.csv")

#Oldpeak
data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/outlier_MaxHR.csv",
                 header=T)

boxplot(data$Oldpeak)
data$Oldpeak <-ifelse(data$Oldpeak>5,NA,data$Oldpeak)

data<- na.omit(data)

write.csv(data, "C:/programming/Rworks/StatwithR/HeartDisease/outlier.csv")

#par
outlier_graph <- par(no.readonly=TRUE)
par(mfcol=c(2,2))
boxplot(data$RestingBP, main="RestingBP")
boxplot(data$Cholesterol, main="Cholesterol")
boxplot(data$MaxHR,main="MaxHR")
boxplot(data$Oldpeak, main="Oldpeak")
