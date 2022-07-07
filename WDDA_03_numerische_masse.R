# Deskriptive Statistik - Numerische Masse
library(readxl)
# Theorie Handout 3
graduates <- read_excel("./WDDA_03.xlsx", sheet = "Graduates")
# graduates <- read_excel("dev/projects/school/WDDA/WDDA_03.xlsx", sheet = "Graduates")
View(graduates)
attach(graduates)

# Aritmetrischer Mittelwert
# Der arithmetische Mittelwert eines numerischen Datensatzes ist
# die Summe aller Datenwerte geteilt durch die Anzahl der
# Beobachtungen.
sum(Salary / length(Salary)) # 3630.717
# Aritmetrischer Mittelwert
mean(Salary) # 3630.717
# Median, wird vorgezogen wenn es starke Ausreisser gibt
# Der Median von geordneten Daten ist der Wert in der Mitte.
median(Salary) # 3663
# Max, min
max(Salary) # 4568
min(Salary) # 2840
# Min: 2840, 1st Qu: 3338, Median: 3663, Mean: 3631,3rd Qu: 3969, Max: 4568
summary(Salary)

detach(graduates)
auto <- read_excel("./WDDA_02.xlsx", sheet = "Auto")
# auto <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "Auto")
attach(auto)

# Modus
table_brand <- table(Brand)
# Nummer vom eintrag, der max wert besitzt.
which.max(table_brand) # 5
# gibt max wert von table zurück
max(table_brand) # 19

# Gewichteter Mittelwert
prices <- c(3, 3.4, 2.8, 2.9, 3.25)
weights <- c(1200, 500, 2750, 1000, 800)
# vektoren zusammenrechnen
prices * weights # 3600 1700 7700 2900 2600
# Rechnung: Gewichteter Mittelwert
sum(prices * weights) / sum(weights) # 2.96

detach(auto)
attach(graduates)

# Spannweite
max(Salary) - min(Salary) # 1728
# Gibt min und max zurück
range(Salary) # 2840 4568

# Quartile:
# 1. Quartil (unteres) = 25%
# 2. Quartil = 50%
# 3. Quartil (oberes) = 75%
# 4. Quartil = 100%

# Quantile = beliebige unterteilung
quantile(Salary) # Gibt alle Quartile zurück
quantile(Salary, 0.75) # Gibt oberes Quartil zurück
quantile(Salary)[4] # Gibt oberes Quartil zurück
# IQR = Inter Quartil Abstand (unteres Quartil minus oberes quartil)
quantile(Salary, 0.75) - quantile(Salary, 0.25)
# Interquartilsabstand (IQR) schöner
IQR(Salary)

# Perzentile, Quantile
quantile(Salary, 0.95) # Obere 5 Prozent verdienen 4241.35.-

library(MASS)
head(Cars93)
boxplot(Cars93$EngineSize, horizontal = T)

# Boxplot (wiskery = gepunktete striche)
boxplot(Salary, horizontal = TRUE)
boxplot(Salary ~ Major)

# Varianz
# Varianz: berechung
sum((Salary - mean(Salary))^2) / (length(Salary) - 1)
# Varianz: funktion
var(Salary)

# Standardabweichung
# Standardabweichung: Quadrieren der Varianz
sqrt(var(Salary))
# Standardabweichung: funktion
sd(Salary)

# Z-Werte (standartisierte Werte)
# Die standardisierten Werte, auch z-Werte genannt, geben an,
# wie weit jeder Datenpunkt vom Mittelwert entfernt ist, gemessen
# in Standardabweichungen:
# ausgangslage: vergleich schwer da x-achse sehr unterschiedlich
hist(Salary)
hist(Cars93$EngineSize)

# z steht für standartisierten wert
salary_z <- (Salary - mean(Salary)) / sd(Salary)
mean(salary_z) # ist immer fast 0
sd(salary_z) # ist immer 1

engine_z <- (Cars93$EngineSize -
    mean(Cars93$EngineSize)) / sd(Cars93$EngineSize)
hgA <- hist(engine_z)
hgB <- hist(salary_z)
plot(hgA, col = "blue")
plot(hgB, col = "red", add = TRUE)

# Schiefe
# Schiefe Formel
n <- length(salary_z)
n / ((n - 1) * (n - 2)) * sum(salary_z^3) # -0.14
# Interpretation
# negativ => linksschief
# null => symmetrisch
# positiv => rechtsschief

# Beispiel mit libraries
library(e1071)
skewness(Salary)
hist(Salary)
library(moments)
skewness(Salary)

detach(graduates)
# advertising <- read_excel("dev/projects/school/WDDA/WDDA_03.xlsx", sheet = "Advertising")
advertising <- read_excel("./WDDA_03.xlsx", sheet = "Advertising")
attach(advertising)

# Stärke Zusammenhang
# Punkte erheben sich -> positiven Zusammenhang
# Punkte senken sich -> negativer Zusammenhang
plot(sales ~ adverts) # Streudiagramm anzeigen

# Kovarianz
# Kovarianz: Formel
n <- length(sales)
1 / (n - 1) * sum((sales - mean(sales)) * (adverts - mean(adverts)))
# Kovarianz: Funktion
cov(sales, adverts)

# Korrelationskoeffizient
# Zahl zwischen -1 (schwach) , 0  (keine) und + 1 (stark)
# Korrelationskoeffizient: Formel
cov(sales, adverts) / (sd(sales) * sd(adverts))
# Korrelationskoeffizient: Funktion
cor(sales, adverts)