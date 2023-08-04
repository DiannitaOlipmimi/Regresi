# ANALISIS REGRESI

## 🍡Table of contents
- [Definisi]()
- [Study Case]()
- [Result]()
- [Links]()

## 📌**Definisi**
### 📒Analisis Regresi
analisis regresi merupakan salah satu teknik statistik dalam mencari hubungan antar variabel, dimana variabel yang digunakan terbagi menjadi variabel dependen (y) dan variabel independen (x). variabel dependen merupakan variabel yang dipengaruhi oleh variabel independen, contoh kasus:

nilai ujian mahasiswa (y) dan lama waktu belajar semalam sebelumnya (x)

analisis regresi memiliki beberapa tujuan, yaitu:
- Prediction
- Inference
- Controlled Experiments
- Forecasting
- Causal Inference

salah satu jenis regresi yang sering digunakan adalah regresi linier.

### 📒Analisis Regresi Linier
Analisis regresi linier merupakan analisis yang digunakan untuk melihat hubungan dua variabel yang diasumsikan memiliki hubungan yang linier (bergaris lurus). regresi linier terbagi menjadi dua, yaitu:
1. regresi linier sederhana (*simple linear regression*)
2. regresi linier berganda (*multiple linear regression*)

### 📒Uji Asumsi dalam Regresi Linier
dikarenakan regresi linier merupakan metode yang memiliki asumsi pada variabel-variabelnya memiliki hubungan yang linier, maka diperlukan pengujian asumsi untuk membuktikan kevalidannya. uji asumsi yang dilakukan pada regresi linier antara lain:
- uji asumsi kenormalan residual
- uji asumsi kebebasan residual
- uji asumsi kehomogenan variansi residual
- uji asumsi ketiadaan multikolinieritas dalam variabel prediktor X dengan jumlah lebih dari 2

### 📒Evaluasi Model Regresi Linier
ketepatan hasil regresi linier dapat diketahui dengan menggunakan:
1. koefisien determinasi (*R squared*)
2. Uji F dari tabel ANOVA
3. uji T pada variabel independennya

## 📌**Study Case**

**Medical Cost Personal Datasets**

### ⛳Deskripsi Masalah
Machine Learning with R by Brett Lantz is a book that provides an introduction to machine learning using R. As far as I can tell, Packt Publishing does not make its datasets available online unless you buy the book and create a user account which can be a problem if you are checking the book out from the library or borrowing the book from a friend. All of these datasets are in the public domain but simply needed some cleaning up and recoding to match the format in the book.

### ⛳Tujuan Analisis
Membantuk model regresi dari data yang tersedia

### ⛳Dataset dan Variabel
1. Data awal dataset personal medical cost

| age | sex    | bmi    | children | smoker | region    | charges      |
|-----|--------|--------|----------|--------|-----------|--------------|
| 19  | female | 27.9   | 0        | yes    | southwest | 16884.924    |
| 18  | male   | 33.77  | 1        | no     | southeast | 1725.5523    |
| 28  | male   | 33     | 3        | no     | southeast | 4449.462     |
| 33  | male   | 22.705 | 0        | no     | northwest | 21984.47061  |
| 32  | male   | 28.88  | 0        | no     | northwest | 3866.8552    |

2. Variabel dalam data
- `age`: age of primary beneficiary
- `sex`: insurance contractor gender, female, male
- `bmi`: Body mass index, providing an understanding of body, weights that are relatively high or low relative to height, objective index of body weight (kg / m ^ 2) using the ratio of height to weight, ideally 18.5 to 24.9
- `children`: Number of children covered by health insurance / Number of dependents
- `smoker`: Smoking
- `region`: the beneficiary's residential area in the US, northeast, southeast, southwest, northwest.
- `charges`: Individual medical costs billed by health insurance

## 📌**Result**
### 📒 Langkah Analisis:
✅ *Exploratory Data Analysis* (EDA):
1. Melakukan pengecekan apakah terdapat missing data, duplicate data, dan error data

```R
# pengecekan data
dim(data)
head(data)
names(data)

# missing value 
sum(is.na(data)) # total keseluruhan NA bila ada
colSums(is.na(data)) # total NA per kolom

data=na.omit(data) # menghapus NA
```

2. Mengubah data kategorik menjadi ata numerik apabila diperlukan

```R
# encoding data
unique(data$sex)
unique(data$smoker)
unique(data$region)

data$sex = as.numeric(factor(data$sex))
data$smoker = as.numeric(factor(data$smoker))
data$region = as.numeric(factor(data$region))
```

3. Melakukan deskriptif statistik pada data (melihat rata-rata, median, dan nilai lainnya)

```R
# Statistik Deskriptif 
#install.packages("pastecs")
summary(data)

library(pastecs)
stat.desc(data)
```

4. Memvisualisasikan data untuk melihat pola data

```R
#install.packages("gridExtra")
library(ggplot2)
library(dplyr)
library(gridExtra)
library(gridExtra)

# scatter plot
# berdasarkan jenis kelamin
plot1 = ggplot(data, aes(x=age, y=charges, col=sex))+geom_point()+ggtitle("scatter plot age vs charges")
plot2 = ggplot(data, aes(x=bmi, y=charges, col=sex))+geom_point()
plot3 = ggplot(data, aes(x=children, y=charges, col=sex))+geom_point()

# berdasarkan region
plot4 = ggplot(data, aes(x=age, y=charges, col=region))+geom_point()
plot5 = ggplot(data, aes(x=bmi, y=charges, col=region))+geom_point()
plot6 = ggplot(data, aes(x=children, y=charges, col=region))+geom_point()

# berdasarkan smoker
plot7 = ggplot(data, aes(x=age, y=charges, col=smoker))+geom_point()
plot8 = ggplot(data, aes(x=bmi, y=charges, col=smoker))+geom_point()
plot9 = ggplot(data, aes(x=children, y=charges, col=smoker))+geom_point()

grid.arrange(plot1, plot2, plot3, 
             plot4, plot5, plot6,
             plot7, plot8, plot9,
             nrow = 3, ncol = 3)

# bar plot
#berdasarkan sex
plot10 = ggplot(data, aes(x = children)) + geom_bar(aes(fill = sex))
plot11 =ggplot(data, aes(x = smoker)) + geom_bar(aes(fill = sex))

#berdasarkan region
plot12 =ggplot(data, aes(x = sex)) + geom_bar(aes(fill = region))
plot13 =ggplot(data, aes(x = children)) + geom_bar(aes(fill = region))
plot14 =ggplot(data, aes(x = smoker)) + geom_bar(aes(fill = region))

grid.arrange(plot10, plot11, plot12, 
             plot13, plot14,
             nrow = 2, ncol = 3)

```

5. Melihat adanya outlier menggunakan boxplot

```R
plot_a=ggplot(data, aes(x=age)) + geom_boxplot(fill='blue')+coord_flip()
plot_b=ggplot(data, aes(x=bmi)) + geom_boxplot(fill='blue')+coord_flip()
plot_c=ggplot(data, aes(x=children)) + geom_boxplot(fill='blue')+coord_flip()
plot_d=ggplot(data, aes(x=charges)) + geom_boxplot(fill='blue')+coord_flip()

grid.arrange(plot_a, plot_b, 
             plot_c, plot_d,
             nrow = 2, ncol = 2)

```

6. Mencari hubungan antar variabel menggunakan scatter plot

```R
library(PerformanceAnalytics)
chart.Correlation(data, histogram = TRUE, method = "pearson")
```


✅ Analisis:
1. Membuat model regresi linier berganda

```R
#analisis regresi berganda
regresi=lm(charges~age+sex+bmi+children+smoker+region,data = data)

summary(regresi)
hasil=summary(regresi)

#menghitung residual
hasil$residuals
hasil$coefficients
hasil$r.squared
```

2. Membuat hasil ulang menggunakan model

✅ Evaluasi:
1. Melakukan pengujian secara overall dan parsial
2. Melakukan pengujian asumsi 
3. Melihat hasil kecocokan model menggunakan indikator seperi R-Squared, RMSE, dll.
4. Visualisasi data awal dengan data hasil model
5. Melakukan percobaan dengan dummy variable

## 📌**Link**
📊**Kaggle dataset**
https://www.kaggle.com/datasets/mirichoi0218/insurance

📊**Kaggle Notebook**
https://www.kaggle.com/code/diannitaekaputri/regression-on-medical-cost