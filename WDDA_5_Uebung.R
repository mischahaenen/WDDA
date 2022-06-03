# Übungsserie 5
library(readxl)
#dimond_rings <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "DimondRings") 
diamonds_rings <- read_excel("./WDDA_05.xlsx", sheet = "Diamonds Rings")
View(diamonds_rings)
attach(diamonds_rings)
names(diamonds_rings) <- c("weight", "price")

# 2. 
# a) Streudiagramm
plot(price ~ weight)
# b) Modell anpassen
# Interpretation: Nimmt das Gewicht um 1 Karat zu steigt der Preis um 3721 USD
m1 <- lm(price ~ weight)
abline(m1)
plot(price ~ weight, xlim = c(0, 0.35), ylim = c(0, 1200))
# c) Interpretieren sie RSE, RSS, TSS
summary(m1)
# r ^ 2 = multiple r-squared = 0.9783 adusted = 0.9778
# 98% der Preisunterschiede werden durch ddas Gewicht erklärt
# RSE - Residual standart error: 31.84 Singapurdollar
# RSS (residuals sum of squares) nicht in summary enthalten -> was am schluss noch drinn ist
RSS <- sum(m1$residuals ^ 2) # 46635.67
# TSS (Total sum of squares) nicht in summary enthalten
TSS <- sum((price - mean(price)) ^ 2) # 2145232
# erklärte unterschiede
(TSS - RSS) / TSS # 0.9782608 = r ^2
