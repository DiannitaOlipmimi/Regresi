# ANALISIS REGRESI
## Medical Cost Personal Datasets 

# import dataset
data = read.csv(file.choose(), header = TRUE, sep = ",")

# pengecekan data
dim(data)
names(data)

# missing value 
sum(is.na(data)) # total keseluruhan NA bila ada
colSums(is.na(data)) # total NA per kolom

# Statistik Deskriptif 
#install.packages("pastecs")
library(pastecs)
stat.desc(data)

#EDA
library(tidyverse)
library(ggplot2)

#install.packages('epiDisplay')
library(epiDisplay)
tab1(data$children, sort.group = "decreasing", cum.percent = TRUE, graph = F)
tab1(data$region, sort.group = "decreasing", cum.percent = TRUE, graph = F)

# scatter plot
plot1 = ggplot(data, aes(x=bmi, y=charges, col=smoker))+geom_point()
plot2 = ggplot(data, aes(x=children, y=charges, col=sex))+geom_point()
plot3 = ggplot(data, aes(x=age, y=charges, col=region))+geom_point()

plot1
plot2
plot3

# bar plot
#berdasarkan sex
plot4 = ggplot(data, aes(x = children)) + geom_bar(aes(fill = sex))
plot5 =ggplot(data, aes(x = smoker)) + geom_bar(aes(fill = sex))
plot6 =ggplot(data, aes(x = sex)) + geom_bar(aes(fill = sex))

plot4
plot5
plot6

# Data Wrangling
# Encoding data
unique(data$sex)
unique(data$smoker)
unique(data$region)

data$sex = as.numeric(factor(data$sex))
data$smoker = as.numeric(factor(data$smoker))
data$region = as.numeric(factor(data$region))

# Mendeteksi Outlier
plot_a=ggplot(data, aes(x=age)) + geom_boxplot(fill='blue')+coord_flip()
plot_b=ggplot(data, aes(x=bmi)) + geom_boxplot(fill='blue')+coord_flip()
plot_c=ggplot(data, aes(x=children)) + geom_boxplot(fill='blue')+coord_flip()
plot_d=ggplot(data, aes(x=charges)) + geom_boxplot(fill='blue')+coord_flip()

grid.arrange(plot_a, plot_b, 
             plot_c, plot_d,
             nrow = 2, ncol = 2)

# mencari limit outlier
upper_limit_bmi = quantile(data$bmi,0.75)+1.5*IQR(data$bmi)
upper_limit_bmi
lower_limit_bmi = quantile(data$bmi,0.25)-1.5*IQR(data$bmi)
lower_limit_bmi

# mencari letak outlier pada data
outlier=data[!(data$bmi > lower_limit_bmi & data$bmi < upper_limit_bmi ),]
outlier

# membuat data baru tanpa outlier
new_data=data[!(data$bmi < lower_limit_bmi & data$bmi > upper_limit_bmi ),]
head(new_data)

# Matriks korelasi
library(PerformanceAnalytics)
chart.Correlation(data, histogram = TRUE, method = "pearson")

# linear regression
#analisis regresi berganda
regresi=lm(charges~age+sex+bmi+children+smoker+region,data = data)
summary(regresi)
hasil=summary(regresi)

