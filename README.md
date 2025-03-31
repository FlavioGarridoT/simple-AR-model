
Creating a simple AR model to fit the US monthly corporate bond yields (1990-1994).
<br>
<br>

A graph showing the series

<br>
<br>

![](dados/grafico1.png)

<br>
<br>

Supposing the data are stationary, I will observe the correlogram and determine which specification fits best.

<br>
<br>

![](dados/grafico2.png)

<br>
<br>

By observing the ACF/PACF, the behavior of the series is similar to an AR(1).
Since the original series exhibits a downward trend, I include a negative drift in the model.

<br>
<br>

An estimate of the model is:

<br>
<br>

$Yt = -0.0428 + Yt-1 + ut$

<br>
<br>

where -0.0428 is the drift.

<br>
<br>

Plotting the AR(1)

<br>
<br>

![](dados/grafico3.png)

<br>
<br>

Then I finally checked whether the residuals are white noise by apllying an ADF Test. It returned a p-value of 0.01, indicating that the residuals are white noise.

<br>
<br>






















