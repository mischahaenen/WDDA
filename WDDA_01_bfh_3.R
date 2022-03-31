# BFH import
library(readxl)
BFH <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "BFH")
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
# Definition: Die Varianz ist ein Mass f¨ur die durchschnittliche Abweichung vom Mittelwert für alle Daten.
#             Die Standardabweichung ist die Quadratwurzel der Varianz.
# a) height
sd(height)<
# b) maths
sd(maths)
# c) cash
sd(cash)
# 10 Empirische Regel
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
