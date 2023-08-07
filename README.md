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

    ```R
    # pengecekan data
    > dim(data)
    [1] 1338    7

    > names(data)
    [1] "age"      "sex"      "bmi"      "children" "smoker"   "region"   "charges" 

    # missing value 
    > sum(is.na(data)) # total keseluruhan NA bila ada
    [1] 0

    > colSums(is.na(data)) # total NA per kolom
     age      sex      bmi children   smoker   region  charges 
       0        0        0        0        0        0        0  
        
    >   data=na.omit(data) # menghapus NA
    ```

    dari hasil yang didapatkan, diketahui dimensi data sebanyak 7 kolom dan 1338 baris. diketahui pula bahwa data personal medical cost tidak memiliki nilai NA atau nilai kosong. 

    ```R
    > tab1(data$children, sort.group = "decreasing", cum.percent = TRUE, graph = FALSE)
    data$children : 
            Frequency Percent Cum. percent
    0             574    42.9         42.9
    1             324    24.2         67.1
    2             240    17.9         85.1
    3             157    11.7         96.8
    4              25     1.9         98.7
    5              18     1.3        100.0
    Total      1338   100.0        100.0
    > tab1(data$region, sort.group = "decreasing", cum.percent = TRUE, graph = FALSE)
    data$region : 
            Frequency Percent Cum. percent
    southeast       364    27.2         27.2
    southwest       325    24.3         51.5
    northwest       325    24.3         75.8
    northeast       324    24.2        100.0
    Total        1338   100.0        100.0
    ```
    melihat one-way tabulation untuk mengetahui frekuensi dari variabel `children` dan `region`

3. Melakukan deskriptif statistik pada data (melihat rata-rata, median, dan nilai lainnya)

    ```R
    # Statistik Deskriptif 
    # install.packages("pastecs")
    > summary(data)
        age             sex             bmi           children         smoker          region         charges     
    Min.   :18.00   Min.   :1.000   Min.   :15.96   Min.   :0.000   Min.   :1.000   Min.   :1.000   Min.   : 1122  
    1st Qu.:27.00   1st Qu.:1.000   1st Qu.:26.30   1st Qu.:0.000   1st Qu.:1.000   1st Qu.:2.000   1st Qu.: 4740  
    Median :39.00   Median :2.000   Median :30.40   Median :1.000   Median :1.000   Median :3.000   Median : 9382  
    Mean   :39.21   Mean   :1.505   Mean   :30.66   Mean   :1.095   Mean   :1.205   Mean   :2.516   Mean   :13270  
    3rd Qu.:51.00   3rd Qu.:2.000   3rd Qu.:34.69   3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:3.000   3rd Qu.:16640  
    Max.   :64.00   Max.   :2.000   Max.   :53.13   Max.   :5.000   Max.   :2.000   Max.   :4.000   Max.   :63770    
    
    > library(pastecs)
    > stat.desc(data)
                        age          sex          bmi     children       smoker       region      charges
    nbr.val      1.338000e+03 1.338000e+03 1.338000e+03 1.338000e+03 1.338000e+03 1.338000e+03 1.338000e+03
    nbr.null     0.000000e+00 0.000000e+00 0.000000e+00 5.740000e+02 0.000000e+00 0.000000e+00 0.000000e+00
    nbr.na       0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00 0.000000e+00
    min          1.800000e+01 1.000000e+00 1.596000e+01 0.000000e+00 1.000000e+00 1.000000e+00 1.121874e+03
    max          6.400000e+01 2.000000e+00 5.313000e+01 5.000000e+00 2.000000e+00 4.000000e+00 6.377043e+04
    range        4.600000e+01 1.000000e+00 3.717000e+01 5.000000e+00 1.000000e+00 3.000000e+00 6.264855e+04
    sum          5.245900e+04 2.014000e+03 4.102763e+04 1.465000e+03 1.612000e+03 3.366000e+03 1.775582e+07
    median       3.900000e+01 2.000000e+00 3.040000e+01 1.000000e+00 1.000000e+00 3.000000e+00 9.382033e+03
    mean         3.920703e+01 1.505232e+00 3.066340e+01 1.094918e+00 1.204783e+00 2.515695e+00 1.327042e+04
    SE.mean      3.841024e-01 1.367353e-02 1.667142e-01 3.295616e-02 1.103632e-02 3.020571e-02 3.310675e+02
    CI.mean.0.95 7.535090e-01 2.682390e-02 3.270500e-01 6.465140e-02 2.165039e-02 5.925574e-02 6.494682e+02
    var          1.974014e+02 2.501596e-01 3.718788e+01 1.453213e+00 1.629689e-01 1.220771e+00 1.466524e+08
    std.dev      1.404996e+01 5.001596e-01 6.098187e+00 1.205493e+00 4.036940e-01 1.104885e+00 1.211001e+04
    coef.var     3.583531e-01 3.322808e-01 1.988751e-01 1.100989e+00 3.350761e-01 4.391967e-01 9.125566e-01
    ```

    Hasil Deskriptif Statistik yang didapatkan dapat digunakan sebagai langkah awal identifikasi data, dimana terlihat data personal medical cost memiliki nilai `charges` paling tinggi pada nilai $63,770 sedangkan nilai paling rendah pada $1,122 dengan nilai standar deviasi sebesar  1.21.

4. Memvisualisasikan data untuk melihat pola data

    ![Alt text](Rplot01.png)
    
    Scatter plot Charges VS BMI: data memiliki pola positif pada data-data dengan nilai `BMI` tinggi dan memiliki status YES pada variabel `smoker`. artinya apabila seseorang memiliki status perokok, semakin tinggi berat badan maka biaya atau `charges` yang harus dibayarkan semakin tinggi pula.

    ![Alt text](Rplot02.png)

    Scatter plot Charges VS Children: data terbagi menjadi 5 kategori sesuai dengan banyaknya anak yang dimiliki. pada data ini tidak terdapat pola yang pasti sehingga biaya atau `charges` dari rumah sakit tidak bergantung pada jumlah anak.

    ![Alt text](Rplot03.png)
    Scatter plot Charges VS Age: dari hasil yang terbentuk terlihat pola positif dimana semakin tua seseorang (`age`) maka semakin tinggi pula biaya atau `charges` yang harus dibayar. dalam plot ini juga terlihat bahwa region tidak mempengaruhi biaya.

5. Melihat adanya outlier menggunakan boxplot
6. Menghapus outlier
7. Mengubah data kategorik menjadi ata numerik apabila diperlukan
8. Mencari hubungan antar variabel menggunakan matriks scatter plot


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