
# Woche 10
library(readxl)
advertising <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Advertising") 
#advertising <- read_excel("./WDDA_06.xlsx", sheet = "Advertising")
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
pbf(10, 10)
pbf(11, 10) - pbf(10, 10)
pbf(10, 11) - pbf(10, 10)
pbf(0, 0)

RSE <- sqrt(RSS / (length(sales)))
summary(md2)
RSE <- summary(md2)$sigma

# Beispiel einer Prognose
# TV = 230, radio = 37.8
pbf(230, 37.8) + 2 * c(-RSE, RSE)
predict(md2,
        newdata = data.frame(TV = 230, radio = 37.8),
        interval = "prediction")

# Konstante variation um x-Achsen
plot(resid(md2) ~ TV)
plot(resid(md2) ~ radio)

plot(resid(md2) ~ predict(md2))

# Kalibrierungsplot
plot(sales ~ predict(md2))

# Scatterplot
pairs(cbind(sales, TV, radio))
pairs(advertising)

md3 <- lm(sales ~ TV + radio + newspaper)

# ist Modell 3 besser als Modell 2?
summary(md3)$sigma
summary(md2)$sigma

RSS_md3 <- sum(resid(md3) ^ 2)
RSS

summary(md3)
summary(md2)
