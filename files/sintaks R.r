data=read.csv(file.choose(), header = TRUE, sep = ",")
head(data)

y=data$price
x1=data$area
x2=data$bedrooms
x3=data$bathrooms
x4=data$stories
x5=data$parking

summary(data)

#plot
plot(y~x1, data = data)
plot(y~x2, data = data)
plot(y~x3, data = data)
plot(y~x4, data = data)
plot(y~x5, data = data)

#analisis regresi berganda
regresi=lm(y~x1+x2+x3+x4+x5, data = data)
summary(regresi)
hasil=summary(regresi)

#menghitung residual
hasil$residuals
length(hasil$residuals)
mean(hasil$residuals)
sd(hasil$residuals)

#histogram dan plot densitas
hist(regresi$residuals, probability = T, main="histogram of data")
lines(density(regresi$residuals), col="red")

qqnorm(regresi$residuals, main = "QQ plot of data", pch=19)
qqline(regresi$residuals, col="red")

#uji normalitas-kolmogorov-smirnov
library(nortest)
lillie.test(regresi$residuals)

#durbin-watson untuk uji auotokorelasi
library(lmtest)
dwtest(regresi)

#uji heterokedastisitas dengan Breusch Pagan test
library(lmtest)
bptest(regresi, studentize = FALSE, data=data)

#uji multiko
library(car)
vif(regresi)
