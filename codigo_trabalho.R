

library("readxl")
library("lmtest")
library("forecast")
library("tseries")

series <- read_excel("D:/Mestrado/Materias/Modelos macro/Trabalho final/simple-ARMA-model/dados/bond_yield.xlsx")


# Transformando os dados do Excel em uma serie de tempo no R
dados <- ts(series$Yt, start = c(1990,1), end = c(1993, 3), frequency = 12)


# Grafico da serie
plot(dados, type = "l", main="Corporate bond yields")

# Correlograma da serie(em nivel)
#CORRELOGRAMA --> AR(1) 
par(mfrow=c(2,1))    
acf(dados, main="ACF")
pacf(dados, main="PACF")

par(mfrow=c(1,1))       



# Estimativa do modelo

# AR(1) --> No caso, sera um passeio aleatorio com drift negativo. 
random_walk <- Arima(dados, order = c(1,0,0), include.drift = TRUE)
plot(random_walk$fitted, type = "l", main = "Random walk with drift of -0.0428")

par(mfrow=c(2,1))
acf(random_walk$fitted, main="ACF - AR(1) model")
pacf(random_walk$fitted, main="PACF - AR(1) model")
par(mfrow=c(1,1))


# Erro eh ruido branco?

#Fazendo um teste de Dickey-Fuller para saber se o erro eh ruido branco
#H0: Nao estacionario
#H1: Estacionario
#Se o p-valor for menor que 0.05, entao rejeita H0. Ou seja, eh estacion?rio

adf.test(random_walk$residuals)  #p-valor = 0.01. Entao, residuos sao estacionarios.


