# Aufgabe 1
library(readxl)
# goldchains <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Gold Chains")
goldchains <- read_excel("./WDDA_06.xlsx", sheet = "Gold Chains")
names(goldchains) <- c("Price", "Length", "Width")
attach(goldchains)
View(goldchains)
# a) Streudiagramme der Zielvariablen auf den beiden erklärenden Variablen
# Price ist die erklärte Variable
plot(Price ~ Length) # Schwache korrelation
plot(Price ~ Width) # Starke korelation
#  Length & Width sind die erklärenden Variablen
plot(Length ~ Width)
# Alle Diagramme auf einmal anzeigen
pairs(goldchains)
# Keine Indizien gegen eine lineare multiple regression
# b) Korrelationen zwischen jedem Variablen paar
cor(goldchains)
# Length auf Price: 0.2
# Length auf Width: 0.954
# Lenght hat die grösste Korrelation mit Price
# c) marginale Steigung
mod1 <- lm(Price ~ Width)
coef(mod1) # 221 Dollar, 223.9 Dollar pro zoll
# marginale Steigung: 223.9 $/mm
# d) partielle Steigung mit Breite
mod2 <- lm(Price ~ Length + Width)
coef(mod2) # 406, 222 $/mm * width + 9 $/mm * length
# Wir stellen fest marginale Steigung fast gleich wie partielle Steigung
# e) Multiple Regression anpassen
# Nimmt die Breite um 1 mm zu, steigt der Preis um 222 Dollar
# wenn die Länge gleichbleibt.
# Partielle Steigung, wenn sich eine Variable anpasst,
# beeinflusst es nicht die andere Variable
# f) r^2 und standardfehler
# intercept -406$, macht keinen Sinn ist eine Exploration
summary(mod2)
# Modell 2 erklärt 94% der Preisvariation
# r^2 = 0.94
# RSE = Resiudal standard error = 56.9$
# RSS
RSS <- sum(mod2$residuals^2)
# TSS
TSS <- sum((Price - mean(Price))^2)
(TSS - RSS) / TSS # 0.9384459 gleich wie r^2
# g) sind residuen glockenförfmig?
hist(mod2$residuals)
# Ist rechtsschief und nicht glockenfördmig
qqnorm(mod2$residuals)
qqline(mod2$residuals)
# h) Residuen gegenüber den Inputvariablen
plot(mod2$residuals ~ Length)
plot(mod2$residuals ~ Width)
# Nicht gut, da wir eine U form haben. Sollte zufällig sein.
# Nicht zu frieden, denn keine Zufallsverteilung
# i) MRM Bedingungen nicht erfüllt
#    Bedingungen: Residuen müsse zufällig verteilt sein
#    und um Null verteilt sein.
# Residuen sind nicht glockenförmig!
# Residuen zu Width sind nicht zufallsverteilt!
# j) Spalte hinzufügen
goldchains$Area <- Length * Width
attach(goldchains)
View(goldchains)
mod4 <- lm(Price ~ Length + Width + Area)
plot(mod4$residuals ~ Length)
plot(mod4$residuals ~ Width)
# Fazit: Bringt keine Verbesserung da es auf Lenth * width basiert
# k) Berechnen und interpretieren das Residium der 1 Beobachtung
Price[1] # 56.57
mod2$fitted.values[1] # -18.75627
mod2$residuals[1] # 75.32627
# Residium: 56.57 - (-18.76) = 75.33
# Modell unterschätzt den Preis
# l) 25. Beobachtung ist unüblich hoch?
Price[25] # 883
mod2$fitted.values[25] # 697.5321
# Konfidenzintervall
mod2$fitted.values[25] + c(2, -2) * summary(mod2)$sigma
# -> 811.2351 583.8291, daher ist 883 unüblich hoch
# m) Kalibrierungsdiagramm für Modell.
plot(Price ~ predict(mod2))
abline(lm(Price ~ predict(mod2)), col = "red")
# Fazit: sieht linear aus
# n) Ploten der Residuen auf angepassten Werte
plot(mod4$residuals ~ Length) # Um zufällig 0 verteilt
plot(mod4$residuals ~ Width) # Macht eine U Form
# o) Pfaddiagramm um Modell zusammenzufassen
# Scatterplot
pairs(goldchains)
# p) 3D-Visualisierung um Stichprobe und Modell anzuzeigen
library(scatterplot3d)
scatterplot3d(Price, Length, Width)

options(rgl.useNULL = TRUE)
library(rgl)
library(car)
library(mgcv)
scatter3d(
    x = Length, y = Width, z = Price,
    col = "red", pch = 20,
    xlab = "Length", ylab = "Width", zlab = "Price"
)

# 2) Personalabteilung hat Regressionsmodell erstellt um Erfolg
#    und Lohn zu bestimmen.
# a) Notieren Sie die Gleichung des MRMs, des angepassten MRMs und
#    interpretieren Sie die geschätzten Koeffizienten
# Lösung: Salary =  5 * year + 2 * point # nolint
# b) Enthält das Pfaddiagramm nötige Informationen, um das
#    Jahresgehalt zu schätzen?
# Lösung: Nein, intercept und RSE Fehlen und sollte Intervall ergeben
#         Salary = (intercept + 5 * year + 2 * point) * (2 *RSE, -2 * RSE)
# c) Was ist grösser: der direkte oder indirekte Effekt des
#    Testergebnisses?
# Lösung: Indirekt da das Jahr die Points beeinflusst: 5 * 2 = 10 > 2
# d) Ermitteln Sie die marginale Steigung des Gehalts anhand der
#    Testergebnisse
# Lösung: Indirekter + Direkter Effekt = 10 + 2 = 12
# e) Wenn Sie ein neuer Bewerber wären und einen speziellen Kurs
#    belegen könnten, der in einer Woche Ihre Testergebnisse um 5
#    Punkte erhöhen könnte, wäre der Kurs die berechneten
#    25.000 USD wert? Welche Steigung ist relevant:
#    partielle oder marginale Steigung?
# Lösung partielle Steigung. Denn nur der Score wird angepasst
# es beeinflusst jedoch nicht die years. Der Kurs Lohnt sich nach
# etwas mehr als zwei Jahren aus da der TN 10'000 Dollar mehr Lohn
# erhält jedoch der Kurs 25'000$ kostet.

# 3) Messung der Datengeschwindigkeit in einem Netzwerk
#    um Videokonferenzen zu prüfen.
library(readxl)
# download <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Download")
download <- read_excel("./WDDA_06.xlsx", sheet = "Download")
names(download) <-
    c("transfer_time_in_sec", "file_size_in_MB", "hours_past_8", "vendor")
download$vendor <- NULL
attach(download)
View(download)
# a) Korrelationen zwischen diesen Variablen.
cor(download)
cor(transfer_time_in_sec, file_size_in_MB) # 0.79
cor(transfer_time_in_sec, hours_past_8) # 0.78
cor(file_size_in_MB, hours_past_8) # 0.99
# b) Untersuchen Sie die Streudiagramme der Sendezeit auf den
#    erklärenden Variablen sowie der erklärenden Variablen.
#    Sind die ok für eine multiple Regression?
plot(transfer_time_in_sec ~ file_size_in_MB)
plot(transfer_time_in_sec ~ hours_past_8)
plot(file_size_in_MB ~ hours_past_8)
# Fazit: Passt für multiple Regression
# c) BestimmenundInterpretieren Sie die marginale Steigung der Dateigrösse.
mod1 <- lm(transfer_time_in_sec ~ file_size_in_MB)
coef(mod1) # Intercept: 7.27 sekunden + 0.31 Sekunden / MB
# Fazit: Wenn die Dateigrösse um 1MB zunimmt dauert
#        die Übertragung 0.31 Sekunden länger.
# d) Gleichen Wert für die partielle Steigung der Dateigrösse? Erklären!
mod2 <- lm(transfer_time_in_sec ~ file_size_in_MB + hours_past_8)
coef(mod2) # Intercept: 7.14 sekunden
#                   + 0.32 Sekunden / MB - 0.19 Sekunden / Stunde nach 8
# Fazit: Nicht wirklich da beide stark korrelieren man braucht
#        wahrscheinlich nur eine von beiden.
# e) Multiple Regression anpassen und interpretieren partielle
#    Steigung der Dateigrösse.
# Fazit: Wenn die Dateigrösse um 1 MB zunimmt dauert
#        die Übertragung 0.32 Sekunden länger. Wahrscheinlich
#        ist das Netzwerk nach 8 Uhr mehr ausgelastet.
# f) Interpretieren Sie das Intercept, R-Quadrat und den Standardfehler.
summary(mod2)
# Intercept: 7.14 sekunden -> vorbereitungszeit
# RSE (Standartfehler): +/- 2 * 6.243 sollte in diesem Bereich liegen.
# R-Quadrat: 62.46% -> Modell erklärt 62.46% des Modells
# g) Sind Residuen glockenförmig? Wenn ja, fassen Sie diese mit den
#    entsprechenden Statistiken zusammen.
hist(residuals(mod2)) # Ist glockenförmig und um 0 verteilt!
# h) Betrachten Sie den Scatterplot der Residuen auf den erklärenden
#    Variablen. Zufrieden?
plot(residuals(mod2)) # zufälllige und konstante variation um X-Achse.
# i) Sind die MRM-Bedingungen Ihrer Meinung nach erfüllt? Erklären Sie warum.
# Fazit: Ja, da die MRM-Bedingungen erfüllt sind. Hist ist glockenförmig und
#        plot ist zufällig und konstant um X-Achse verteilt.
# j) Erstellen und interpretieren Sie das Kalibrierungsdiagramm
#    für Ihr Modell. Dies ist eine Alternative zu einer der oben genannten
#    Fragen. Welcher? Stimmt dies mit Schlussfolgerung in dieser Frage überein?
plot(transfer_time_in_sec ~ predict(mod2))
abline(lm(transfer_time_in_sec ~ predict(mod2)), col = "red")
# Fazit: Ja, sieht linear aus.
# k) Plotten Sie die Residuen auf den angepassten Werten. Dies ist eine
#    Alternative zu einer der oben genannten Fragen. Welcher? Stimmt dies
#    mit Ihrer Schlussfolgerung in dieser Frage überein?
plot(residuals(mod2) ~ file_size_in_MB)
plot(residuals(mod2) ~ hours_past_8)
# Fazit: Ja, beide sind zufällig und konstant um X-Achse verteilt.
# l) Verwenden Sie ein Pfaddiagramm, um Ihr Modell zusammenzufassen.
# m) Verwenden Sie die 3D-Visualisierung, um Stichprobe & Modell anzuzeigen.
scatterplot3d(download)
# n) Betrachten Sie das SRM mit Dateigrösse als erklärende Variable.
#    Vergleichen Sie R2, ¯ R2 von SRM und MRM.
# SRM
summary(mod1)
# R2: 62.46%, ¯ R2: 61.97%
# MRM
summary(mod2)
# R2: 62.46%, ¯ R2: 61.48%
# o) Sind Sie mit Ihrem MRM zufrieden? Wenn Nicht, was schlagen Sie vor?
# Fazit: Nein, es braucht nicht beide erklärenden Variablen da Modell 1
#        gleichviel erklärt wie Modell 2 -> SRM bevorzugen
# p) Berechnen und interpretieren Sie das Residuum der 41. Beobachtung.
download$transfer_time_in_sec[41] # 19.3 sekunden
mod2$fitted.values[41] # 25.77537 sekunden
mod2$residuals[41] # -6.475 sekunden
# Fazit: 19.3 - 25.77537 = -6.475 < 0 -> Übertragung war schneller als
#        vom Modell erwartet.
# q) Schätzen Sie die Übertragungszeit der 16. und 80. Beobachtung.
#    Geben Sie Ihre Antwort als Bereich an.
#    Waren diese Übertragungen extrem langsam oder schnell?
mod2$fitted.values[16] + c(2, -2) * summary(mod2)$sigma
# 16.35 => [3.78, 28.92]
mod2$fitted.values[80] + c(2, -2) * summary(mod2)$sigma
# 38.27 => [25.7, 50.84]

# 4) Daten von BFH
library(readxl)
bfh <- read_excel("./WDDA_06.xlsx", sheet = "BFH")
attach(bfh)
View(bfh)
unique(gender)
# a) Nennen alle möglichen erklärenden Variablen für die Körpergrösse und warum.
# Lösung: gender, dob, foot
# b) Wenn Sie genau eine auswählen dürfen, welche nehmen Sie dann?
# Lösung: gender, foot
# c) Passen Sie das MRM mit einigen von diesen Variablen an, wenn möglich.
# Gender in zahlen umwandeln für korrelation
bfh$gender[gender == "Male"] <- 1
bfh$gender[gender == "Female"] <- 2
bfh$gender[gender == "Non binary"] <- 3
bfh_transformed <- transform(bfh, gender = as.numeric(gender))
bfh_transformed <- transform(bfh, dob = as.Date(dob))
sapply(bfh, mode) # show types of dataframe
# transform bfh$dob to age in years
library(ggplot2)
library(nloptr)
library(eeptools)
bfh$age <- age_calc(bfh_transformed$dob, Sys.Date(), units = "years")
# Correlation
cor(height, foot) # 0.28
cor(height, bfh_transformed$gender) # -0.7
cor(height, bfh$age) # 0.28
mod1 <- lm(height ~ foot + bfh_transformed$gender + bfh$age)
coef(mod1)
# Intercept: 186.921 + 0.234 (foot) - 12.52 (gender) + 0.00067 (age) #nolint
# Man sieht das Alter mach fast keinen unterschied, das Geschlecht jedoch schon
summary(mod1)
# Summary bestätigt das und Modell erklärt nur 50.5 % der Daten
# d) Diagramm, um die Linearität fÜr Ihr Modell zu beurteilen.
plot(height ~ predict(mod1))
abline(lm(height ~ predict(mod1)), col = "red")
# Faziit: ist gar nicht linear
# e) Diagramm, um die konstante Streuung der Residuen beurteilen.
plot(residuals(mod1) ~ mod1$fitted.values)
# f) Diagramm, um die glockenfÖrmige Form Ihrer Residuen zu beurteilen.
hist(residuals(mod1))
library(moments)
skewness(residuals(mod1)) # 0.28
# Fazit: Leicht Rechtsschief da positiv
# g) Zufrieden mit Modell? Erklären Sie warum. Interpretation der Koeffizienten.
summary(mod1)
# Intercept: 186.92
# RSE: 6.583
# R squared: 50.51% des Modells erklärt
# Fazit: Nein da das Modell nur 50% der Daten erklärt.
# h) Einige erklärenden Variablen aus Modell entfernen? warum oder warum nicht!
# Ganz sicher age da es nur 0.000677 cm ausmacht. Hingegen das Geschlecht
# -12.51 cm ausmacht.
# i) Versuchen Sie, eine optimale Variablenkombination zu finden.