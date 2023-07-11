# REGRESI LINIER DAN ASUMSINYA
regresi linier dengan pengujian asumsinya

## 📌Table of contents
- [Definition](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#definition)
- [Study Case](https://github.com/DiannitaOlipmimi/regresi_linier#study-case)
- [Step by Step analysis](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)
- [Result](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)
- [Dataset](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)
- [Links](https://github.com/DiannitaOlipmimi/regresi_dan_asumsinya#step-by-step-analysis)

## 📌**Definition**

### 📒Analisis regresi
Regresi merupakan salah satu alat statistik yang digunakan untuk mengatahui pengaruh antara dua variabel atau lebih, dimana variabel ini terbagi menjadi variabel dependen (**Y**) dan variabel independen (**X**). salah satu jenis analisis regresi yang sering digunakan adalah regresi linier.

### 📒Analisis regresi linier
Analisis regresi linier merupakan analisis yang digunakan untuk melihat hubungan dua variabel yang diasumsikan memiliki hubungan yang linier (bergaris lurus). regresi linier terbagi menjadi dua, yaitu:
1. regresi linier sederhana (*simple linear regression*)
2. regresi linier berganda (*multiple linear regression*)

keduanya dibedakan dengan banyaknya variabel, dimana regresi linier sederhana hanya memiliki 1 variabel dependen dan 1 variabel independen sedangkan regresi linier berganda memiliki 1 variabel dependen dan 2 atau lebih variabel independen.

### 📒Uji asumsi dalam regresi linier berganda
dikarenakan regresi linier merupakan metode yang memiliki asumsi pada variabel-variabelnya memiliki hubungan yang linier, maka diperlukan pengujian asumsi untuk membuktikan kevalidannya. uji asumsi yang dilakukan pada regresi linier antara lain:
- uji asumsi kenormalan residual
- uji asumsi kebebasan residual
- uji asumsi kehomogenan variansi residual
- uji asumsi ketiadaan multikolinieritas dalam variabel prediktor X dengan jumlah lebih dari 2

apabila salah satu uji asumsi tidak terpenuhi, maka dapat dikatakan akurasi hasil prediksi atau hubungan antar variabel dalam analisis model tidak sepenuhnya benar.

### 📒Evaluasi hasil regresi linier
ketepatan hasil regresi linier dapat diketahui dengan menggunakan:
1. koefisien determinasi (*R squared*)
2. Uji F dari tabel ANOVA
3. uji T pada variabel independennya

## 📌**Study Case**
**Memprediksi Harga Rumah Menggunakan Regresi Linier Berganda**

### 📒 Problem Statement:
sebuah agensi real estate ingin membuat model yang dapat memprediksi harga rumah berdasarkan fasilitas dalam rumah seperti jumlah kamar, luas rumah, dan lain-lain. agensi ini memiliki tujuan membantu kliennya memperkirakan harga rumah dan mengembangkan proses pengambilan keputusan.

### 📒 Data Description:
data yang didapatkan merupakan data yang memiliki informasi harga-harga penjualan rumah pada tahun-tahun sebelumnya. data ini memiliki data numerik dan data kategorikal dengan variabel-variabelnya,
- price : harga rumah
- area : luas area rumah
- bedrooms : jumlah kamar tidur 
- bathrooms : jumlah kamar mandi
- stories : jumlah lantai/tingkatan dalam satu rumah
- parking : banyaknya kendaraan yang bisa terparkir didalam rumah

### 📒 Objective:
membuat model regresi yang dapat memprediksi harga penjualan rumah berdasarkan variabel yang ada

### 📒 Analysis Steps:
#### ✅ Exploratory Data Analysis (EDA):
1. Melakukan pengecekan apakah terdapat missing data, duplicate data, dan error data
2. Mengubah data kategorik menjadi ata numerik apabila diperlukan
3. Melakukan deskriptif statistik pada data (melihat rata-rata, median, dan nilai lainnya)
4. Memvisualisasikan data untuk melihat pola data dengan barchart
5. Melihat adanya outlier menggunakan boxplot
6. Mencari hubungan antar variabel menggunakan scatter plot

#### ✅ Model Selection:
1. Membuat model regresi linier berganda
2. Membuat hasil ulang menggunakan model

#### ✅ Model Evaluation:
1. Melakukan pengujian secara overall dan parsial
2. Melakukan pengujian asumsi 
3. Melihat hasil kecocokan model menggunakan indikator seperi R-Squared, RMSE, dll.
4. Visualisasi data awal dengan data hasil model
5. Melakukan percobaan dengan dummy variable

## 📌**Step by step analysis**
### 📒 **menggunakan Excel**
1. menginstall add-ins Data Analysis ToolPak pada Excel 
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

### 📒**menggunakan R/RStudio**

### 📒**menggunakan Python**

## 📌**Dataset**
Housing Prices (5 data teratas)
| price    | area  | bedrooms | bathrooms | stories | parking |
| -------- | ----- | -------- | --------- | ------- | ------- |
| 13300000 | 7420  | 4        | 2         | 3       | 2       |
| 12250000 | 8960  | 4        | 4         | 4       | 3       |
| 12250000 | 9960  | 3        | 2         | 2       | 2       |
| 12215000 | 7500  | 4        | 2         | 2       | 3       |
| 11410000 | 7420  | 4        | 1         | 2       | 2       |


## 📌**Links**
https://www.analyticsvidhya.com/blog/2021/10/everything-you-need-to-know-about-linear-regression/

https://www.kaggle.com/datasets/yasserh/housing-prices-dataset 

https://support.microsoft.com/en-gb/office/load-the-analysis-toolpak-in-excel-6a63e598-cd6d-42e3-9317-6b40ba1a66b4