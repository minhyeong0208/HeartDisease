before_2020 <-read.csv("C:/programming/Rworks/StatwithR/Heart_Disease_Renew/heart_2020.csv",header=T)
str(before_2020)

before_2020$Age = before_2020$Age
before_2020$Sex = factor(before_2020$Sex, levels=c("M","F"), labels=c(1,0))
before_2020$ChestPainType = factor(before_2020$ChestPainType, levels=c("ASY","ATA","NAP","TA"), labels=c(0,1,2,3))
before_2020$RestingBP = before_2020$RestingBP
before_2020$Cholesterol = before_2020$Cholesterol
before_2020$FastingBS = before_2020$FastingBS
before_2020$RestingECG = factor(before_2020$RestingECG, levels=c("LVH","Normal","ST"),
                                labels=c(0,1,2))
before_2020$MaxHR = before_2020$MaxHR
before_2020$Oldpeak = before_2020$Oldpeak
before_2020$ST_Slope = factor(before_2020$ST_Slope, levels=c("Down","Flat","Up"), labels=c(0,1,2))
before_2020$HeartDisease = before_2020$HeartDisease

#write.csv(before_2020, "C:/Users/minhy/Documents/StatwithR/Heart_Disease_Renew/heart_2020_int.csv")

pairs(~ Age + Sex + ChestPainType + RestingBP + Cholesterol + FastingBS + RestingECG + 
        MaxHR + Oldpeak + ST_Slope + HeartDisease, data = before_2020)

