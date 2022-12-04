data <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/outlier.csv",
                 header=T, na.strings=c("."))
table(data$HeartDisease)

heart_disease_0 <- subset(data, data$HeartDisease == 0)
heart_disease_0
#write.csv(heart_disease_0, "C:/programming/Rworks/StatwithR/HeartDisease/heart_disease=0.csv")

heart_disease_0 <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/heart_disease=0.csv",
                            header=F, na.strings=c("."))
heart_disease_0 <- data.frame(heart_disease_0)

library(dplyr)
heart_disease_0_790 <- sample_n(heart_disease_0[,],790, replace=FALSE)
write.csv(heart_disease_0_790, "C:/programming/Rworks/StatwithR/HeartDisease/heart_disease=0_790.csv")


heart_disease_1 <- subset(data, data$HeartDisease == 1)
write.csv(heart_disease, "C:/programming/Rworks/StatwithR/HeartDisease/heart_disease=1.csv")

#merge
merge_data <- rbind(heart_disease_0_790,heart_disease_1)
write.csv(merge_data, "C:/programming/Rworks/StatwithR/HeartDisease/Balanced_data.csv")
