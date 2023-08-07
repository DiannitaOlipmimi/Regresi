# ANALISIS REGRESI
**Medical Cost Personal Datasets**

**⛳Deskripsi Masalah**

Machine Learning with R by Brett Lantz is a book that provides an introduction to machine learning using R. As far as I can tell, Packt Publishing does not make its datasets available online unless you buy the book and create a user account which can be a problem if you are checking the book out from the library or borrowing the book from a friend. All of these datasets are in the public domain but simply needed some cleaning up and recoding to match the format in the book.

**📌Tujuan Analisis**

Membantuk model regresi dari data yang tersedia

## Table of contents
- [Dataset dan Variabel](https://github.com/DiannitaOlipmimi/Regresi#dataset-dan-variabel)
- [Result](https://github.com/DiannitaOlipmimi/Regresi#result)
- [Links](https://github.com/DiannitaOlipmimi/Regresi#link)

## 🧵Dataset dan Variabel
**📒Data awal dataset personal medical cost**

| age | sex    | bmi    | children | smoker | region    | charges      |
|-----|--------|--------|----------|--------|-----------|--------------|
| 19  | female | 27.9   | 0        | yes    | southwest | 16884.924    |
| 18  | male   | 33.77  | 1        | no     | southeast | 1725.5523    |
| 28  | male   | 33     | 3        | no     | southeast | 4449.462     |
| 33  | male   | 22.705 | 0        | no     | northwest | 21984.47061  |
| 32  | male   | 28.88  | 0        | no     | northwest | 3866.8552    |

**📒Variabel dalam data**
- `age`: age of primary beneficiary
- `sex`: insurance contractor gender, female, male
- `bmi`: Body mass index, providing an understanding of body, weights that are relatively high or low relative to height, objective index of body weight (kg / m ^ 2) using the ratio of height to weight, ideally 18.5 to 24.9
- `children`: Number of children covered by health insurance / Number of dependents
- `smoker`: Smoking
- `region`: the beneficiary's residential area in the US, northeast, southeast, southwest, northwest.
- `charges`: Individual medical costs billed by health insurance

## 🧵**Result**
**📒Langkah Analisis:**
✅ *Exploratory Data Analysis* (EDA):
1. Melakukan pengecekan apakah terdapat missing data, duplicate data, dan error data

![Alt text](<images/EDA 1.png>)

dari hasil yang didapatkan, diketahui dimensi data sebanyak 7 kolom dan 1338 baris. diketahui pula bahwa data personal medical cost tidak memiliki nilai NA atau nilai kosong. 

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
2. Melihat hasil kecocokan model menggunakan indikator seperi R-Squared, RMSE, dll.
3. Visualisasi data awal dengan data hasil model
4. Melakukan percobaan dengan dummy variable

## 🧵**Link**
📊**Kaggle dataset**
https://www.kaggle.com/datasets/mirichoi0218/insurance

📊**Kaggle Notebook**
https://www.kaggle.com/code/diannitaekaputri/regression-on-medical-cost