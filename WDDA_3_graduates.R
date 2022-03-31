library(readxl)
# Theorie Handout 3
#graduates <- read_excel("./WDDA_03.xlsx", sheet = "Graduates")
graduates <- read_excel("dev/projects/school/WDDA/WDDA_03.xlsx", sheet = "Graduates")
View(graduates)
attach(graduates)

gesamt_summe = sum(Salary)
# Mittelwert
sum(Salary/length(Salary))
# Aritmetrischer Mittelwert
mean(Salary) # 3630.717
# Median, wird vorgezogen
median(Salary) # 3663
# Mittelwert verhunzen, daher Median bevorzugen
Salary[60] = 1000000
mean(Salary) # 20228.93
median(Salary) # 3663

# Max, min
max(Salary)
min(Salary)


detach(graduates)
#auto <- read_excel("./WDDA_02.xlsx", sheet = "Auto")
auto <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "Auto")
attach(auto)
table_brand = table(Brand)
# Nummer vom eintrag, der max wert besitzt hier position 5
which.max(table_brand)
# gibt max wert von table heraus hier 19
max(table_brand)

# gewichteter mittelwert
prices = c(3, 3.4, 2.8, 2.9, 3.25)
weights = c(1200, 500, 2750, 1000, 800)
# vektoren zusammenrechnen
prices*weights
# rechnung gewichteter mittelwert
sum(prices*weights)/sum(weights)

# spannweite
detach(auto)
attach(graduates)
# differenz zwischen grösster, kleinster datensatz
max(Salary)-min(Salary)
range(Salary)

# Quartile:
# 1. Quartil (unteres) = 25%, 2. Quartil = 50% 3. Quartil (oberes) = 75% 4. Quartil = 100%
# Quantile = beliebige unterteilung
quantile(Salary)
quantile(Salary, 0.75)
quantile(Salary)[4]
# IQR = Inter Quartil Abstand (unteres Quartil minus oberes quartil)
quantile(Salary, 0.75)-quantile(Salary, 0.25)
quantile(Salary)[4]-quantile(Salary)P[2]
IQR(Salary)

# Perzentile, Quantile
quantile(Salary, 0.95) # Obere 5 Prozent verdienen 4241.35.- 

# Boxplot (wiskery = gepunktete striche)
boxplot(Salary, horizontal = TRUE)
library(MASS)
head(Cars93)
boxplot(Cars93$EngineSize, horizontal = T)
boxplot(Salary~Major)

# Varianz
sum((Salary-mean(Salary))^2)/(length(Salary)-1)
var(Salary)

# Standartabweichung
sqrt(sum((Salary-mean(Salary))^2)/(length(Salary)-1))
sqrt(var(Salary))
sd(Salary)

# Z-Werte (standartisierte Werte)
# ausgangslage: vergleich schwer da x-achse sehr unterschiedlich
hist(Salary)
hist(Cars93$EngineSize)
# z steht für standartisierten wert
salary_z = (Salary-mean(Salary)) / sd(Salary)
mean(salary_z) # ist immer 0
sd(salary_z) # ist immer 1
engine_z = (Cars93$EngineSize-mean(Cars93$EngineSize)) / sd(Cars93$EngineSize)
hgA = hist(engine_z)
hgB = hist(salary_z)
plot(hgA, col = "blue")
plot(hgB, col = "red", add = TRUE)

# Schiefe
n <- length(salary_z)
# Schiefe Formel: Ergibt Wert negativ = linksschief / null = symmetrisch / positiv = rechtsschief
n / ((n-1)*(n-2))*sum(salary_z^3) # = Symmetrisch
# Beispiel mit libraries
library(e1071)
skewness(Salary)
library(moments)
skewness(Salary)

# Stärke Zusammenhang
# Punkte erheben sich -> positiven Zusammenhang
# Punkte senken sich -> negativer Zusammenhang
detach(graduates)
library(readxl)
advertising <- read_excel("dev/projects/school/WDDA/WDDA_03.xlsx", sheet = "Advertising")
attach(advertising)
plot(sales~adverts)
n <- length(sales)
# Brechnung Kovarianz
1/(n-1)*sum((sales-mean(sales))*(adverts-mean(adverts)))
# Befehl Kovarianz
cov(sales,adverts)
# Korrelationskoeffizient: Zahl zwischen -1 (schwach) , 0  (keine) und + 1 (stark)
# Berechung
cov(sales,adverts)/(sd(sales)*sd(adverts))
# Befehl
cor(sales,adverts)
