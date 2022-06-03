
# inferenz auf regressions modelle
library(readxl)
# advertising <- read_excel("projects/school/WDDA/WDDA_07.xlsx", sheet = "Advertising") 
advertising <- read_excel("./WDDA_07.xlsx", sheet = "Advertising")
View(advertising)
attach(advertising)

# Simple regressionsmodelle (SRM)
# Modellkoeffizienten
coef(lm(sales ~ TV), data = advertising)
# Konfidenzintervall: Koeffizienten aus Stichproben und 5% ausschliessen
# Resampling für Stichprobe
library(mosaic)
simcoef <- do(5000) * coef(lm(sales ~ TV), data = resample(advertising))

# Konfidenzintervalle
md1 <- quantile(simcoef$Intercept, probs = c(0.025, 0.975))
md1 <- lm(sales ~ TV, data = advertising)
# Ergibt 2.5% = 7.032 & 97.5% = 7.032
quantile(simcoef$TV, probs = c(0.025, 0.975))
# Ergibt 2.5% = 0.048 & 97.5% = 0.048
confint(lm(sales ~ TV))
# Intercept: [6; 7.9]
# TV: [0.04; 0.05]

# Inferenz für Multiple Lineare Regression (MRM)
simcoef <- do(5000) * coef(lm(sales ~ TV + radio), data = resample(advertising))

# Partielle Steigungen
md2 <- lm(sales ~ TV + radio)
confint(md2)
# Intercept: [2.3; 3.5]
# TV: [0.04; 0.05]
# radio: [0.17; 0.2]

# Nicht statistisch signifikante Variable
md3 <- lm(sales ~ TV + radio + newspaper)
# Erhöhung in R^2 reicht nicht aus
# Im vergleich zu Modell 2 ist das Modell 3 nicht besser
c(summary(md2)$r.sq, summary(md3)$r.sq) # 0.8971943 0.8972106
c(summary(md2)$adj.r.sq, summary(md3)$adj.r.sq) # 0.8961505 0.8956373
# Im vergleich zu Modell 1 ist das Modell 2 besser
c(summary(md1)$r.sq, summary(md2)$r.sq) # 0.6118751 0.8971943
# Konfidenzinterval
confint(md3)
# Intercept: [2.3; 3.5]
# TV: [0.04; 0.05]
# radio: [0.17; 0.2]
# newspaper: [-0.01; 0.01]
# --> Newspaper ist nicht signifikant und sollte aus md3 entfernt werden

# lm summary
summary(md3)
# R-Sq: 0.8971943
# Adj. R-Sq: 0.8961505

# Modellkoeffizienten
coefs_list <- coef(summary(md3))
# Standard Error: Genauigkeit der Koeffizienten
ub <- coefs_list[1:4] + 2 * coefs_list[5:8]
# 3.56270584 0.04855444 0.20575248 0.01070453
lb <- coefs_list[1:4] - 2 * coefs_list[5:8]
# 2.31507290  0.04297485  0.17130755 -0.01277951
confint(md3)
# t value
(coefs_list[1:4] - 0) / coefs_list[5:8]
# 9.4222884 32.8086244 21.8934961 -0.1767146

# Schritte beim Aufbau von Regressionsmodellen

# Vorhersagen
new_xi <- data.frame(TV = 222, radio = 4.5)
predict(md2, new_xi, interval = "prediction")
# fit 13.92464 lwr: 10.57998 upr: 17.26931
predict(md2, new_xi, interval = "confidence")
# fit 13.92464 lwr 13.48598 upr 14.36331
