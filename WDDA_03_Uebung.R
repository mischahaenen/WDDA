# BFH import
library(readxl)
BFH <- read_excel("./WDDA_02.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

# Aufgabenserie 3

# 1. Körpergrösse Männer & Frauen
# a) Anzahl Frauen grösser als durchschnitt Mann
mean_man = mean(height[gender == "Male"])
length(height[(gender == "Female" & height >= mean_man)])
# b) Anzahl Männer kleiner als durchscnitt Frau
mean_female = mean(height[gender == "Female"])
length(height[(gender == "Male" & height <= mean_female)])

# 2. schwarmintelligenz jar
# a) Mittelwert jar
mean_jar = mean(jar)
# b) geburtstadum person bester guess
kleinste_abweichung = min(abs(jar-405))
# gibt nur ein resultat
which.min(abs(jar-405))
# findet alle resultate
best_guess = abs(jar-405) == kleinste_abweichung
dob[best_guess]
# c) anzahl näher am Tatsächlichen wert als am Median
sum(abs(jar-405) < abs(jar-mean(jar)))

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
quantile(height,0.75)-quantile(height,0.25)
quantile(maths,0.75)-quantile(maths,0.25)
quantile(cash,0.75)-quantile(cash,0.25)

# 8. Nebeneinander liegende Boxplots
# a) Boxplot zeigt Harlängen pro Geschlecht auf
boxplot(hair~gender, horizontal = T)
# b) Boxplot zeigt distanz pro fahrzeug auf
boxplot(distance~transport, horizontal = T)
# c) Boxplot zeigt Fussgrösse aufgeteilt nach Augenfarbe
boxplot(foot~eye, horizontal = T)

# 9) Standartabweichung
# Definition: Die Varianz ist ein Mass für die durchschnittliche Abweichung vom Mittelwert für alle Daten.
#             Die Standardabweichung ist die Quadratwurzel der Varianz.
# a) height
sd(height)
# b) maths
sd(maths)
# c) cash
sd(cash)

# FIXME: 10 Empirische Regel
# a) height
boxplot(height, horizontal = T)
hist(height)
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
ratings <- IHG$"Customer ratings"
# a) Mittelwert
mean(ratings)
# a) Median 
median(ratings)
# b) Den Mittelwert oder den Median als Mass für die zentrale Lage zu verwenden
# Lösung: Mittelwert da es keine Ausreisser gibt.
# c) Erste Quartil
quantile(ratings, 0.25)
# c) IQR
quantile(ratings, 0.75) - quantile(ratings, 0.25) 
# d) 85. Perzentil
quantile(ratings, 0.85)

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
foot_z <- (foot- mean(foot)) / sd(foot)
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
n / ((n - 1) * (n - 2)) * sum(distance_z ^ 3) # 1.74 -> rechtschief (positiv)
hist(distance)
# c) cash
cash_z <- (cash - mean(cash)) / sd(cash)
n <- length(cash_z)
n / ((n - 1) * (n - 2)) * sum(cash_z ^ 3) # 5.5 -> rechtschief (positiv) 
hist(cash)
# d) hair men
hair_men <- hair[gender == "Male"]
hair_men_z <- (hair_men - mean(hair_men)) / sd(hair_men)
n <- length(hair_men_z)
n / ((n - 1) * (n - 2)) * sum(hair_men_z ^ 3) # 1.74 -> rechtschief (positiv) 
hist(hair_men)
# d) hair women
hair_women <- hair[gender == "Female"]
hair_women_z <- (hair_women - mean(hair_women)) / sd(hair_women)
n <- length(hair_women_z)
n / ((n - 1) * (n - 2)) * sum(hair_women_z ^ 3) # 0.313 -> leicht rechtschief (positiv) 
hist(hair_women)

# 15)
# a) Vielleicht etwa 11 Tage.
# b) Die Verteilung hat ihrem höchsten Punkt bei 7 Tagen.
# c) Offensichtlich ist sie rechtsschief.
# d) Dies ist die Fläche unter der Kurve.

# 16) Vergleichen von Daten 
# a) Streudiagramm height & foot
plot(foot~height)
# a) Anpassungsgerade height & foot
fit <- lm(foot~height)
abline(fit)
# a) Korrelationskoeffizient height & foot
cor(foot, height) # 0.2839648
# b) hair & foot
plot(foot~hair)
fit <- lm(foot~hair)
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

#TODO: 22), 23), 24), 25)