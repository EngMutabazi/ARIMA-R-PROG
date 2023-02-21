dset<- read.csv("fullpath")
dset
names(dset)
acf(dset)
pacf(dset)
names(dset)

dset$TeaProduction
library(forecast)
#Convert into time series
xt<-ts(dset$TeaProduction,frequency = 32)
xt
# CONVERT THE INDEPENDENT VARIABLES TEMP AND PR INTO MATRIX
XT=dset[c("Annual_precipitation","Annual_mean_temperature")]
XT
newSet=data.matrix(XT)
newSet
# ARIMA MODEL(AUTO ARIMA (p,d,q)) arima (0,1,0) is fitted for the data

modeln=auto.arima(xt,xreg = newSet)
summary(modeln)
acf(resid(modeln))
predicte=forecast(modeln,xreg = newSet, h=32)
print(predicte)
plot(predicte)

library(ggplot2)
checkresiduals(resid(modeln))
acf(resid(modeln))
#INTERPRETATIONS
#=================================================================
  #check on the residuals of the model
  # acf plot showa the residuals are not serial autocorrelated
  # check residuls 
#====================================================================
print(prediction)
plot(prediction)

library(lmtest)
coeftest(model)
