import pandas as pd
import io
from sklearn import linear_model
import statsmodels.api as sm

from google.colab import files
uploaded = files.upload()


df = pd.read_csv(io.BytesIO(uploaded['data R.csv']))
df.head()

X = df[['area', 'bedrooms', 'bathrooms','stories','parking']]
y = df['price']

regr = linear_model.LinearRegression()
regr.fit(X, y)
print('Intercept: \n', regr.intercept_)
print('Coefficients: \n', regr.coef_)

x = sm.add_constant(X) 
model = sm.OLS(y, X).fit()
predictions = model.predict(X) 
 
print_model = model.summary()
print(print_model)