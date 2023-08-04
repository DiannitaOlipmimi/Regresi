# ANALISIS REGRESI
## Medical Cost Personal Datasets 

# import dataset
data = read.csv(file.choose(), header = TRUE, sep = ",")

# pengecekan data
dim(data)
head(data)
names(data)

# missing value 
sum(is.na(data)) # total keseluruhan NA bila ada
colSums(is.na(data)) # total NA per kolom

data=na.omit(data) # menghapus NA

# Statistik Deskriptif 
#install.packages("pastecs")
summary(data)

library(pastecs)
stat.desc(data)

#EDA
library(tidyverse)
library(ggplot2)

#install.packages('epiDisplay')
library(epiDisplay)
tab1(data$age, sort.group = "decreasing", cum.percent = TRUE)
tab1(data$children, sort.group = "decreasing", cum.percent = TRUE)
tab1(data$region, sort.group = "decreasing", cum.percent = TRUE)

# scatter plot
# berdasarkan jenis kelamin
plot1 = ggplot(data, aes(x=age, y=charges, col=sex))+geom_point()+ggtitle("scatter plot age vs charges")
plot1

plot2 = ggplot(data, aes(x=bmi, y=charges, col=sex))+geom_point()
plot2

plot3 = ggplot(data, aes(x=children, y=charges, col=sex))+geom_point()
plot3

# berdasarkan region
plot4 = ggplot(data, aes(x=age, y=charges, col=region))+geom_point()
plot4

plot5 = ggplot(data, aes(x=bmi, y=charges, col=region))+geom_point()
plot5

plot6 = ggplot(data, aes(x=children, y=charges, col=region))+geom_point()
plot6

# berdasarkan smoker
plot7 = ggplot(data, aes(x=age, y=charges, col=smoker))+geom_point()
plot7

plot8 = ggplot(data, aes(x=bmi, y=charges, col=smoker))+geom_point()
plot8

plot9 = ggplot(data, aes(x=children, y=charges, col=smoker))+geom_point()
plot9

# bar plot
#berdasarkan sex
plot10 = ggplot(data, aes(x = children)) + geom_bar(aes(fill = sex))
plot10

plot11 =ggplot(data, aes(x = smoker)) + geom_bar(aes(fill = sex))
plot11

#berdasarkan region
plot12 =ggplot(data, aes(x = sex)) + geom_bar(aes(fill = region))
plot12

plot13 =ggplot(data, aes(x = children)) + geom_bar(aes(fill = region))
plot13

plot14 =ggplot(data, aes(x = smoker)) + geom_bar(aes(fill = region))
plot14

#install.packages("gridExtra")
library(gridExtra)

grid.arrange(plot1, plot2, 
             plot3, plot10,
             plot12, plot14,
             nrow = 3, ncol = 2)

# Data Wrangling
summary(data)

# encoding data
unique(data$sex)
unique(data$smoker)
unique(data$region)

data$sex = as.numeric(factor(data$sex))
data$smoker = as.numeric(factor(data$smoker))
data$region = as.numeric(factor(data$region))

library(PerformanceAnalytics)
chart.Correlation(data, histogram = TRUE, method = "pearson")

# Outlier
plot_a=ggplot(data, aes(x=age)) + geom_boxplot(fill='blue')+coord_flip()
plot_b=ggplot(data, aes(x=bmi)) + geom_boxplot(fill='blue')+coord_flip()
plot_c=ggplot(data, aes(x=children)) + geom_boxplot(fill='blue')+coord_flip()
plot_d=ggplot(data, aes(x=charges)) + geom_boxplot(fill='blue')+coord_flip()

grid.arrange(plot_a, plot_b, 
             plot_c, plot_d,
             nrow = 2, ncol = 2)

# mendeteksi outlier
# get threshold values for outliers
upper_limit_bmi = quantile(data$bmi,0.75)+1.5*IQR(data$bmi)
upper_limit_bmi
lower_limit_bmi = quantile(data$bmi,0.25)-1.5*IQR(data$bmi)
lower_limit_bmi

# find outlier
outlier=data[!(data$bmi > lower_limit_bmi & data$bmi < upper_limit_bmi ),]
outlier

# outlier
new_data=data[!(data$bmi < lower_limit_bmi & data$bmi > upper_limit_bmi ),]
head(new_data)

# linear regression
#analisis regresi berganda
regresi=lm(charges~age+sex+bmi+children+smoker+region,data = data)

summary(regresi)
hasil=summary(regresi)

#menghitung residual
hasil$residuals
hasil$coefficients
hasil$r.squared
