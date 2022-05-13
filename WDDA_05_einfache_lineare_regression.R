# Woche 9
library(readxl)
#advertising <- read_excel("projects/school/WDDA/WDDA_05.xlsx", sheet = "Advertising") 
advertising <- read_excel("./WDDA_05.xlsx", sheet = "Advertising")
View(advertising)
attach(advertising)

hist(sales)
# Anzeigen der Variation
var(sales) # 27.22185
# TV-Werbung beeinflusst Sales
plot(sales~TV)

# Modellsuche
linie1 <- function(x) 7 + 0.04 * x
abline(a = 7, b = 0.04, col = "blue")
linie2 <- function(x) 5 + 0.07 * x
abline(a = 5, b = 0.07, col = "darkgreen")
# Messzahl für Abweichung zum Modell sales~TV
sum((sales - linie1(TV)) ^ 2) # 2446.132
sum((sales - linie2(TV)) ^ 2) # 3165.513
# Fazit: Linie 1 passt besser da tieferer Wert

# Berechnung Line of Best Fit
b1 <- cor(sales, TV) * sd(sales) / sd(TV) # 0.0475
b0 <- mean(sales) - b1 * mean(TV) # 7.03
# lbf - line of best fit
lbf <- function(x) b0 + b1 * x
abline(a = b0, b = b1, col = "red")
sum((sales - lbf(TV)) ^ 2) # 2102.531

# Lineare Regression -> sucht optimale Gerade
# lm - linear model
md1 <- lm(sales~TV)
abline(md1)

# Totale Quadratsumme (TSS): Gibt Abweichung von sales um seinen Mittelwert an.
TSS <- sum((sales - mean(sales)) ^ 2) # 5417
# Residuenquadratsumme (RSS): Gibt die in den Residuen verbleibende Variation an. # nolint
RSS <- sum((sales - lbf(TV)) ^ 2) # 2103
# Erklärte Quadratsumme (ESS): Gibt die Variation in den Modellwerten an.
ESS <- sum((lbf(TV) - mean(lbf(TV))) ^ 2) # 3315
# Zerlegung der Variation
# TSS = ESS + RSS
TSS # 5417.149
RSS + ESS # 5417.149

# Bestimmtheitsmass
(TSS - RSS) / TSS # 0.6118751
cor(sales, TV) ^ 2 # 0.6118751

md1 <- lm(sales~TV)
# Erwartungen an Residuen
# 1. Eine glockenförmige Verteilung, zentriert bei 0.
hist(resid(md1))
# 2. Eine konstante Streuung um die x-Achse.
plot(resid(md1) ~ TV)
abline(h = 0, lwd = 2)
# 3. RSE: heisst Standardfehler der Regression.
sqrt(RSS / (200 - 2)) # 3.258656
RSE <- summary(md1)$sigma  # 3.258656

