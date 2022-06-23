
# Woche 10 & 11
library(readxl)
#advertising <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Advertising") 
advertising <- read_excel("./WDDA_06.xlsx", sheet = "Advertising")
View(advertising)
attach(advertising)

library(scatterplot3d)
scatterplot3d(x = TV, y = radio, z = sales, scale.y = 0.9, angle = 30)

options(rgl.useNULL = TRUE)
library(rgl)
library(car)
library(mgcv)
scatter3d(x = TV, y = radio, z = sales)

# Multiples modell
md2 <- lm(sales ~ TV + radio)
b <- coef(md2)
# Plane of best fit
pbf <- function(x,y) {b[1] + b[2] * x + b[3] * y}

plot(md2$residuals ~ sales)
abline(0, 0)

hist(md2$residuals + mean(sales), xlim = c(0, 30))
hist(sales)

# Variationsreduktion
TSS <- sum((sales - mean(sales)) ^ 2)
# RSS ist gleich wie sum(md2$residuals ^ 2)
RSS <- sum((sales - predict(md2)) ^ 2)
# Erklärte Streuung / Variation: 
(TSS - RSS) / TSS # 0.897 -> 90 %

# Interpretation der Koeffizienten
coef(md2)
pbf(10, 10) # 5.258
pbf(11, 10) - pbf(10, 10) # 0.04575
pbf(10, 11) - pbf(10, 10) # 0.18799
pbf(0, 0) # 2.9211

RSE <- sqrt(RSS / (length(sales))) # 1.68
# Residual standard error
summary(md2) # 1.681
RSE <- summary(md2)$sigma # 1.68

# Beispiel einer Prognose
# TV = 230, radio = 37.8
pbf(230, 37.8) + 2 * c(-RSE, RSE)
predict(md2,
        newdata = data.frame(TV = 230, radio = 37.8),
        interval = "prediction")

# Konstante variation um x-Achsen
hist(resid(md2)) # linksschief
plot(resid(md2) ~ TV)
plot(resid(md2) ~ radio)
plot(resid(md2) ~ predict(md2))

# Kalibrierungsplot
plot(sales ~ predict(md2))
# Scatterplot
pairs(cbind(sales, TV, radio))
pairs(advertising)


md3 <- lm(sales ~ TV + radio + newspaper)
# ist Modell 3 besser als Modell 2? Nur ein wenig
summary(md3)$sigma # 1.68551
summary(md2)$sigma # 1.68131

RSS_md3 <- sum(resid(md3) ^ 2) # 556.8253
RSS # 556.914

summary(md3) # 1.686
summary(md2) # 1.681

# Nicht Linearer Zusammenhang
#quadratic <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Quadratic") 
quadratic <- read_excel("./WDDA_06.xlsx", sheet = "Quadratic")
View(quadratic)
attach(quadratic)

# Ergibt eine Prabel daher muss man ein Quadratisches Modell machen
md_q1 <- lm(y ~ x)
plot(y ~ x)
abline(md_q1)
summary(md_q1)

# Show funny correlations
library(datasauRus)
if(requireNamespace("ggplot2")){
  library(ggplot2)
  ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset))+
    geom_point()+
    theme_void()+
    theme(legend.position = "none")+
    facet_wrap(~dataset, ncol = 3)
}

# Quadratisches Modell (Regression)
# y gegen eine funktion x^2 -> polynom
md_q2 <- lm(y ~ poly(x, 2, raw = TRUE))
b <- coef(md_q2)
f <- function(x) b[1] + b[2] * x + b[3] * x ^ 2
curve(f(x), add = TRUE, col = "#952e2e")

# Poynomiale Regression
#quadratic <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Quadratic") 
polynomial <- read_excel("./WDDA_06.xlsx", sheet = "Polynomial")
View(polynomial)
attach(polynomial)
detach(quadratic)

# Kubisches Modell (Modell 3. Grades)
md_q3 <- lm(y ~ poly(x, 3, raw = TRUE))
summary(md_q3)
b <- coef(md_q3)
g <- function(x) b[1] + b[2] * x + b[3] * x ^ 2 + b[4] * x ^ 3
plot(y ~ x)
curve(g(x), add = TRUE)
