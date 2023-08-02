data=read.csv(file.choose(), header = TRUE, sep = ",")
head(data)

na.omit(data)

summary(data)

y=data$SalePrice
x1=data$MSSubClass
x2=data$LotArea
x3=data$Neighborhood
x4=data$HouseStyle
x5=data$OverallQual
x6=data$OverallCond
x7=data$YearBuilt
x8=data$RoofStyle
x9=data$ExterQual
x10=data$BsmtQual
x11=data$TotalBsmtSF
x12=data$CentralAir
x13=data$Electrical
x14=data$GrLivArea
x15=data$FullBath
x16=data$BedroomAbvGr
x17=data$KitchenAbvGr
x18=data$KitchenQual
x19=data$TotRmsAbvGrd
x20=data$Fireplaces
x21=data$GarageCars
x22=data$GarageArea
x23=data$PoolArea
x24=data$MoSold
x25=data$YrSold
x26=data$SaleType
x27=data$SaleCondition

#analisis regresi berganda
regresi=lm(y~x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+
             x11+x12+x13+x14+x15+x16+x17+x18+x19+x20+
             x21+x22+x23+x24+x25+x26+x27,data = data)

summary(regresi)
hasil=summary(regresi)

#menghitung residual
hasil$residuals
hasil$coefficients

test=read.csv(file.choose(), header = TRUE, sep = ",")
head(test)

df = predict(regresi, newdata = test[-1])
write.csv(df, "C:/Users/NITA/Downloads/house-prices-advanced-regression-techniques (1)/result.csv", row.names=FALSE)
