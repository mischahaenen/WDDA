# BFH import
library(readxl)
BFH <- read_excel("./WDDA_02.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

# Aufgabenserie 3

# 1. Körpergrösse Männer & Frauen
# a) Anzahl Frauen grösser als durchschnitt Mann
mean_man <- mean(height[gender == "Male"])
length(height[(gender == "Female" & height >= mean_man)])
# b) Anzahl Männer kleiner als durchscnitt Frau
mean_female <- mean(height[gender == "Female"])
length(height[(gender == "Male" & height <= mean_female)])

# 2. schwarmintelligenz jar
# a) Mittelwert jar
mean_jar <- mean(jar)
# b) geburtstadum person bester guess
kleinste_abweichung <- min(abs(jar - 405))
# gibt nur ein resultat
which.min(abs(jar - 405))
# findet alle resultate
best_guess <- abs(jar - 405) == kleinste_abweichung
dob[best_guess]
# c) anzahl näher am Tatsächlichen wert als am Median
sum(abs(jar - 405) < abs(jar - mean(jar)))

# 3. vergleich mittelwert (mean) & median (median)
# Erklärung: Der Median wird dem Mittelwert vorgezogen, wenn der Datensatz Extremwerte enth¨alt.
# a) jar
mean(jar) # 299.66
median(jar) # 287
# b) siblings
mean(siblings) # 1.543
median(siblings) # 1
# c) distance
mean(distance) # 25.2
median(distance) # 24

# 5. Mittelwert present
mean(present) # 77.35

# 6. bereich darstellen
quantile(height)
quantile(maths)
quantile(cash)

# 7. Interquartilsabstand (IQR)
quantile(height, 0.75) - quantile(height, 0.25)
quantile(maths, 0.75) - quantile(maths, 0.25)
quantile(cash, 0.75) - quantile(cash, 0.25)

# 8. Nebeneinander liegende Boxplots
# a) Boxplot zeigt Harlängen pro Geschlecht auf
boxplot(hair ~ gender, horizontal = T)
# b) Boxplot zeigt distanz pro fahrzeug auf
boxplot(distance ~ transport, horizontal = T)
# c) Boxplot zeigt Fussgrösse aufgeteilt nach Augenfarbe
boxplot(foot ~ eye, horizontal = T)

# 9) Standartabweichung
# Definition: Die Varianz ist ein Mass für die durchschnittliche
# Abweichung vom Mittelwert für alle Daten.
# Die Standardabweichung ist die Quadratwurzel der Varianz.
# a) height
sd(height)
# b) maths
sd(maths)
# c) cash
sd(cash)

# 10) Empirische Regel
# ≈ 68% der Beobachtungen liegen im Intervall [x − s, x + s]
# ≈ 95% der Beobachtungen liegen im Intervall [x − 2s, x + 2s]
# Fast alle der Beobachtungen liegen im Intervall [x − 3s, x + 3s]
# a) height
boxplot(height, horizontal = T)
hist(height)
x_bar <- mean(height)
se <- sd(height)
# 1. Regel
confint(height, level = 0.68)
x <- x_bar + c(-se, se)
length(height[height >= x[1] & height <= x[2]]) / length(height)
# covers 63% of the data (0.6267)
# 2. Regel
confint(height, level = 0.95)
x <- x_bar + c(-2 * se, 2 * se)
length(height[height >= x[1] & height <= x[2]]) / length(height)
# covers 96.77% (0.9677)
# 3. Regel
confint(height, level = 1)
x <- x_bar + c(-3 * se, 3 * se)
length(height[height >= x[1] & height <= x[2]]) / length(height)
# covers 100% of the data (1)
# b) foot
boxplot(foot, horizontal = T)
hist(foot)
# c) distance
boxplot(distance, horizontal = T)
hist(distance)
# d) reaction1
boxplot(reaction1, horizontal = T)
hist(reaction1)
# Median,Durchschnitt,Modus, Quartile etc darstellen
summary(height)

# 11: Intercontinental Hotels Group (IHG)
IHG <- read_excel("./WDDA_03.xlsx", sheet = "IHG")
View(IHG)
names(IHG) <- c("hotel", "rating", "reviews")
attach(IHG)
# a) Mittelwert
mean(rating)
# a) Median
median(rating)
# b) Den Mittelwert oder den Median als Mass für die zentrale Lage zu verwenden
# Lösung: Mittelwert da es keine Ausreisser gibt. Besser ist der Durchschnitt
# da er genauere angaben macht. Des weiteren sind Ausreisser nicht möglich.
# c) Erste Quartil
quantile(rating, 0.25)
# alle quantile anzeigen
quantile(rating)
# c) IQR
quantile(rating, 0.75) - quantile(rating, 0.25)
IQR(rating)
# d) 85. Perzentil
quantile(rating, 0.85)

# Aufgabenserie 3
# 11. IHG
# a) Mittelwert
# a) Durchscnitt
# c) Quartile
quantile(rating)
# c) IQR
quantile(rating, 0.75) - quantile(rating, 0.25)
# d) 85 percentile
quantile(rating, 0.85)
# 12. polizeiaufzeichnungen
aufzeichnungen_winter <- c(18, 20, 15, 16, 21, 20, 12, 16, 19, 20)
aufzeichnungen_sommer <- c(28, 18, 24, 32, 18, 29, 23, 38, 28, 18)
# a) Spannweite
max(aufzeichnungen_winter) - min(aufzeichnungen_winter)
max(aufzeichnungen_sommer) - min(aufzeichnungen_sommer)
# a) IQR
quantile(aufzeichnungen_winter, .75) - quantile(aufzeichnungen_winter, .25)
quantile(aufzeichnungen_sommer, .75) - quantile(aufzeichnungen_sommer, .25)

# 12) Polizeiaufzeichnungen zeigen die täglich gemeldeten Verbrechen
winter <- c(18, 20, 15, 16, 21, 20, 12, 16, 19, 20)
sommer <- c(28, 18, 24, 32, 18, 29, 23, 38, 28, 18)
# a) Spannweite für jede Periode
spannweite_winter <- max(winter) - min(winter) # 9
spannweite_sommer <- max(sommer) - min(sommer) # 20
# a) Interquartilsabstand für jede Periode
IQR(winter) # 4
IQR(sommer) # 9.5
# b) Varianz für jede Periode
var(winter) # 8.233333
var(sommer) # 44.48889
# b) Standartabweichung für jede Periode
sd(winter) # 2.869379
sd(sommer) # 6.669999
# c) Variationskoeffizienten für jede Periode
cv_winter <- sd(winter) / mean(winter) * 100 # 16.2%
cv_sommer <- sd(sommer) / mean(sommer) * 100 # 26.1%
# d) Vergleichen Sie die Variabilität der beiden Zeiträume
sum((winter - mean(winter))^2) # 74.1
sum((sommer - mean(sommer))^2) # 400.4

#  13) Mittelwert und die Standardabweichung (als Stichprobe)
BFH <- read_excel("./WDDA_02.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)
# a) height
height_z <- (height - mean(height)) / sd(height)
mean(height_z) # ~0
sd(height_z) # 1
# b) foot
foot_z <- (foot - mean(foot)) / sd(foot)
mean(foot_z) # ~0
sd(foot_z) # 1
# c) house
house_z <- (house - mean(house)) / sd(house)
mean(house_z) # ~0
sd(house_z) # 1

# 14) Schiefe für die folgenden Daten
# a) height
height_z <- (height - mean(height)) / sd(height)
n <- length(height_z)
n / ((n - 1) * (n - 2)) * sum(height_z^3) # -0.156 -> symmetrisch (nahe null)
hist(height)
# b) distance
distance_z <- (distance - mean(distance)) / sd(distance)
n <- length(distance_z)
n / ((n - 1) * (n - 2)) * sum(distance_z^3) # 1.74 -> rechtschief (positiv)
hist(distance)
# c) cash
cash_z <- (cash - mean(cash)) / sd(cash)
n <- length(cash_z)
n / ((n - 1) * (n - 2)) * sum(cash_z^3) # 5.5 -> rechtschief (positiv)
hist(cash)
# d) hair men
hair_men <- hair[gender == "Male"]
hair_men_z <- (hair_men - mean(hair_men)) / sd(hair_men)
n <- length(hair_men_z)
n / ((n - 1) * (n - 2)) * sum(hair_men_z^3) # 1.74 -> rechtschief (positiv)
hist(hair_men)
# d) hair women
hair_women <- hair[gender == "Female"]
hair_women_z <- (hair_women - mean(hair_women)) / sd(hair_women)
n <- length(hair_women_z)
n / ((n - 1) * (n - 2)) * sum(hair_women_z^3) # 0.313 -> leicht rechtschief (positiv)
hist(hair_women)

# 15)
# a) Vielleicht etwa 11 Tage.
# b) Die Verteilung hat ihrem höchsten Punkt bei 7 Tagen.
# c) Offensichtlich ist sie rechtsschief.
# d) Dies ist die Fläche unter der Kurve.

# 16) Vergleichen von Daten
# a) Streudiagramm height & foot
plot(foot ~ height)
# a) Anpassungsgerade height & foot
fit <- lm(foot ~ height)
abline(fit)
# a) Korrelationskoeffizient height & foot
cor(foot, height) # 0.2839648
# b) hair & foot
plot(foot ~ hair)
fit <- lm(foot ~ hair)
abline(fit)
cor(foot, hair) # -0.1886152

# 17) Zusammenhang in Bezug auf das Geschlecht
# a) Korrelation height & hair
cor(height, hair) # -0.6186634 je grösser somit jemand ist, desto kürzer sind seine Haare.
# b) Female
cor(height[gender == "Female"], hair[gender == "Female"]) # 0.006966206
# c) Male
cor(height[gender == "Male"], hair[gender == "Male"]) # 0.1163308

# 18) Formel für die Kovarianz
# wird immer 1 (starke korrelation) ergeben da es die gleichen daten sind
cor(hair, hair)

# 19) Schätzung Korrelation
# a) r = 0.9, b) r = -0.6, c) r = 0.3, d) r = 0
# e) r = 0.2, f) r = 0.5, g) r = -0.3, h) r = -0.8, i) r = 0

# 20) Alle haben gleicher Korrelationswert von 0.7

# 21) Tief (r = 0.17) da Korrelation nicht linear ist

# 22) Stock_2008
stock_2008 <- read_excel("./WDDA_03.xlsx", sheet = "Stock_2008")
View(stock_2008)
attach(stock_2008)
# a) Bestimmen Sie Mittelwert und Median der prozentualen Änderungen.
# Median
median(Fall) # 39.19
# Mittelwert
mean(Fall) # 38.96786
# b) Bestimmen Sie das erste und dritte Quartil.
quantile(Fall, probs = c(0.25, 0.75)) # [32.610 43.815]
# c) Enthalten die Daten irgendwelche Ausreisser? Konstruieren Sie ein Boxplot.
boxplot(Fall)
# keine Ausreisser
# d) Welche Perzentile würden Sie für Belgien melden?
belgium <- Fall[Country == "Belgium"]
# PErzentil anzeigen vom Wert
match(belgium, sort(Fall)) / (length(Fall) + 1)
# 0.7231379 Perzentil

# 3tes Quartil da das 3 Quartil erst bei 43.8 endet

# 23) DAX_CAC
dax_cac <- read_excel("./WDDA_03.xlsx", sheet = "DAX_CAC")
View(dax_cac)
attach(dax_cac)
# a) Berechnen Sie den Korrelationskoeffizienten für diese Daten. CAC.
cor(CAC, DAX) # 0.92
# b) Sindsie schlecht korreliert, oder haben sie einen starken Zusammenhang?
# Lösung: Sie haben einen sehr starken positiven linearen Zusammenhang.

# 24) Korrelationen zwischen Factual Reporting und Bias
# Gemäss Grafik schwindet die Factual Reporting je Politisch Rechter
# die Zeitschrift wird.

# 25) Economist
# a) Die Republikaner sind eher radikaler geworden und Demokraten
# leicht liberaler