data1 <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/heart_2020.csv")
data2 <- read.csv("C:/programming/Rworks/StatwithR/HeartDisease/heart_1988.csv")

merge_data <- rbind(data1,data2)
write.csv(merge_data, "C:/programming/Rworks/StatwithR/HeartDisease/heart.csv")
