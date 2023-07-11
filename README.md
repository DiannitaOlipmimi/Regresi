# REGRESI LINIER DAN ASUMSINYA

## 📌Table of contents
- [Definisi](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#definition)
- [Study Case](https://github.com/DiannitaOlipmimi/regresi_linier#study-case)
- [Step by Step analysis](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)
- [Result](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)
- [Dataset](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)
- [Links](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)

## 📌**Definisi**

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
### **Memprediksi Harga Rumah Menggunakan Regresi Linier Berganda**

### 📒 Deskripsi Masalah:
sebuah agensi real estate ingin membuat model yang dapat memprediksi harga rumah berdasarkan fasilitas dalam rumah seperti jumlah kamar, luas rumah, dan lain-lain. agensi ini memiliki tujuan membantu kliennya memperkirakan harga rumah dan mengembangkan proses pengambilan keputusan.

### 📒 Data dan Variabel:
data yang didapatkan merupakan data yang memiliki informasi harga-harga penjualan rumah pada tahun-tahun sebelumnya. data ini memiliki data numerik dan data kategorikal dengan variabel-variabelnya,
- *price* : harga rumah
- *area* : luas area rumah
- *bedrooms* : jumlah kamar tidur 
- *bathrooms* : jumlah kamar mandi
- *stories* : jumlah lantai/tingkatan dalam satu rumah
- *parking* : banyaknya kendaraan yang bisa terparkir didalam rumah

### 📒 Tujuan:
membuat model regresi yang dapat memprediksi harga penjualan rumah berdasarkan variabel yang ada

### 📒 Langkah Analisis:
✅ *Exploratory Data Analysis* (EDA):
1. Melakukan pengecekan apakah terdapat missing data, duplicate data, dan error data
2. Mengubah data kategorik menjadi ata numerik apabila diperlukan
3. Melakukan deskriptif statistik pada data (melihat rata-rata, median, dan nilai lainnya)
4. Memvisualisasikan data untuk melihat pola data
5. Melihat adanya outlier menggunakan boxplot
6. Mencari hubungan antar variabel menggunakan scatter plot

✅ Analisis:
1. Membuat model regresi linier berganda
2. Membuat hasil ulang menggunakan model

✅ Evaluasi:
1. Melakukan pengujian secara overall dan parsial
2. Melakukan pengujian asumsi 
3. Melihat hasil kecocokan model menggunakan indikator seperi R-Squared, RMSE, dll.
4. Visualisasi data awal dengan data hasil model
5. Melakukan percobaan dengan dummy variable

## 📌**Step by step analysis**
### 📒 **menggunakan Excel**
1. menginstall add-ins **Data Analysis ToolPak** pada Excel 
[Tutorial dari Microsoft](https://support.microsoft.com/en-gb/office/load-the-analysis-toolpak-in-excel-6a63e598-cd6d-42e3-9317-6b40ba1a66b4)
2. membuka tab Data pada excel > Ribbon Analysis > memilih menu Data Analysis
3. memilih Regression sebagai analysis tools dan mengisi value cell sesuai dengan perintah dialog box

### 📒 **menggunakan R/RStudio**
- membuat model
```r
regresi=lm(y~x1+x2+x3+x4+x5, data = data)
summary(regresi)
hasil=summary(regresi)
```

- menguji asumsi
```r
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
```

### 📒**menggunakan Python**
Google colab
https://colab.research.google.com/drive/1jeNXk2dnevsDgpS5lBgTOu0HKH68HpaV?usp=sharing


## 📌**Result**
### 📒**menggunakan Excel**
![Alt text](<images/Regresi Excel 1.png>)
![Alt text](<images/Regresi Excel 2.png>)

### 📒**menggunakan R/RStudio**

### 📒**menggunakan Python**

## 📌**Dataset**
### **Housing Prices (5 data teratas)**
|price|area|bedrooms|bathrooms|stories|mainroad|guestroom|basement|hotwaterheating|airconditioning|parking|prefarea|furnishingstatus|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|13300000|7420|4|2|3|yes|no|no|no|yes|2|yes|furnished|
|12250000|8960|4|4|4|yes|no|no|no|yes|3|no|furnished|
|12250000|9960|3|2|2|yes|no|yes|no|no|2|yes|semi-furnished|
|12215000|7500|4|2|2|yes|no|yes|no|yes|3|yes|furnished|
|11410000|7420|4|1|2|yes|yes|yes|no|yes|2|no|furnished|



## 📌**Links**
https://www.analyticsvidhya.com/blog/2021/10/everything-you-need-to-know-about-linear-regression/

https://www.kaggle.com/datasets/yasserh/housing-prices-dataset 

https://support.microsoft.com/en-gb/office/load-the-analysis-toolpak-in-excel-6a63e598-cd6d-42e3-9317-6b40ba1a66b4