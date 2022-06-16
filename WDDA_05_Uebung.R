# Übungsserie 5
library(readxl)
# 1) Advertising mit TV als erklärende Variable.
#    Welche der folgenden Linien passt besser?
#advertising <- read_excel("projects/school/WDDA/WDDA_05.xlsx", sheet = "Advertising") 
advertising <- read_excel("./WDDA_05.xlsx", sheet = "Advertising")
View(advertising)
attach(advertising)
plot(sales~TV)
linie <- function(a, b, x) a + b * x
# a) Achsenabschnitt = 7.1, Steigung = 0.049
abline(a = 7.1, b = 0.049, col = "blue")
rss_a <- sum((sales - linie(7.1, 0.049, TV)) ^ 2) # 2121.642
# b) Achsenabschnitt = 6.8, Steigung = 0.048
abline(a = 6.8, b = 0.048, col = "darkgreen")
rss_b <- sum((sales - linie(6.8, 0.048, TV)) ^ 2) # 2108.255
# c) Achsenabschnitt = 7.0 Steigung = 0.045
abline(a = 7, b = 0.045, col = "red")
rss_c <- sum((sales - linie(7, 0.045, TV)) ^ 2) # 2144.869
# d) Achsenabschnitt = 7.3, Steigung = 0.041
abline(a = 7.3, b = 0.041, col = "black")
rss_d <- sum((sales - linie(7.3, 0.041, TV)) ^ 2) # 2261.464
# Lösung: b) passt am besten

# 2.Diamond Rings zeigt die Listenpreise und das Gewicht von 48 Diamantringen
#dimond_rings <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "DimondRings") 
diamonds_rings <- read_excel("./WDDA_05.xlsx", sheet = "Diamonds Rings")
View(diamonds_rings)
attach(diamonds_rings)
names(diamonds_rings) <- c("weight", "price")
# a) Streudiagramm
plot(price ~ weight) # Ja denn es sieht sehr linear aus.
# b) Modell anpassen
# Interpretation: Nimmt das Gewicht um 1 Karat zu steigt der Preis um 3721 USD
md1 <- lm(price ~ weight) # md1 -> 3721.0
abline(md1)
plot(price ~ weight, xlim = c(0, 0.35), ylim = c(0, 1200))
# c) Interpretieren sie RSE, RSS, TSS
summary(md1)
# r ^ 2 = multiple r-squared = 0.9783 adusted = 0.9778
# 98% der Preisunterschiede werden durch ddas Gewicht erklärt
# RSE - Residual standart error: 31.84 Singapur Dollar
# RSS (residuals sum of squares) !nicht in summary enthalten!
RSS <- sum(md1$residuals ^ 2) # 46635.67
# TSS (Total sum of squares) nicht in summary enthalten
TSS <- sum((price - mean(price)) ^ 2) # 2145232
# erklärte unterschiede
(TSS - RSS) / TSS # 0.9782608 = r ^2
# d) Was ist der durschnittliche Preisunterschied
#    zwischen 0.25 und 0.35 Karat?
mean(price[weight == 0.25]) # 680
mean(price[weight == 0.35]) # 1086
diff <- mean(price[weight == 0.35]) - mean(price[weight == 0.25]) # 406
# f) Wie sollte die Fixkosten das Model beeinflussen?
# Lösung: Positiver Achenabschnitt
# g) Ein Ring mit einem 0.18-Karat-Diamanten ist für SGD 325 gelistet.
#    Ist dies ein Schnäppchen?
# Konfidenzintervall von gewicht.
mean(md1$fitted.values[weight == 0.18]) + c(2, -2) * summary(md1)$sigma
# Ergibt: [473.8396 346.4775] daher ja es ist ein Schnäppchen
# h) Was sagt die Standardabweichung der Residuen
#    über die Anpassung dieser Gleichung aus?
sd(md1$residuals) # 31.5
plot(resid(md1)~weight)
abline(h = 0, col = "red")
hist(resid(md1), col = "red")
# Ergebnis: Glockenförmige verteilung mit Mittelwert = 0, SE ist sehr klein
#           daher sind viele Diamantringe innerhalb der schätzgeraden.

# 3) Gleich wie 2 nur mit Download Tabelle
download <- read_excel("./WDDA_05.xlsx", sheet = "Download")
names(download) <-
    c("transfer_time_in_sec", "file_size_in_MB", "hour_past_8", "vendor")
attach(download)
View(download)
# a) Streudiagramm der Übertragungszeit der Dateigrössen
#    Erscheint Linie als gute Zusammenfassung?
plot(transfer_time_in_sec ~ file_size_in_MB)
mod1 <- lm(transfer_time_in_sec ~ file_size_in_MB)
abline(mod1) # Intercept von 7.2 sekunden
# Fazit: Ja, jedoch gibt es auch andere Faktoren für die Übertragungszeit
# b) Passen lineares Modell für die Übertragungszeit auf der Dateigrösse an.
plot(transfer_time_in_sec ~ file_size_in_MB, xlim = c(0, 100), ylim = c(0, 60))
abline(mod1)
# Fazit: Man sieht eine klaren Bereich am Anfang der keine Punkte aufweist
#        anscheinden gibt es unanhängig der Dateigrösse
#        eine Latenz in der Übertragungszeit
# c) r^2, RSE, RSS TSS
summary(mod1)
# r ^ 2 = multiple r-squared = 62.46%
# RSE = Residual standard error: 6.243 sekunden
# RSS
RSS <- sum(mod1$residuals ^ 2) # 3040.392 s^2
# TSS
TSS <-
    sum((transfer_time_in_sec - mean(transfer_time_in_sec)) ^ 2) # 8098.035 s^2
# d) Unterschied zwischen 50MB und 60MB (aufpassen median und mean)
diff <- median(transfer_time_in_sec[file_size_in_MB == 60]) -
    median(transfer_time_in_sec[file_size_in_MB == 50]) # 3.35 sekunden
# e) erweitern auf übertragungszeit in minuten & dateigrösse in kilobyte
download$transfer_time_in_min <- download$transfer_time_in_sec / 60
download$file_size_in_KB <- download$file_size_in_MB * 1024
summary(download)
plot(transfer_time_in_min ~ file_size_in_KB,
    xlim = c(0, 101376), ylim = c(0, 0.8767))
lm(transfer_time_in_min ~ file_size_in_KB) # 0.1212 Minuten
# 0.000005099 minuten pro kilobyte
# Fazit: Gleiches Modell
# f) Residuen mit Dateigrössen darstellen
sd(resid(mod1)) # 6.203706 sekunden
plot(resid(mod1)~file_size_in_KB) # Kein Muster
abline(h = 0, col = "red")
hist(resid(mod1), col = "red") # Ist glockenförmig
# Fazit: Kein Muster
# h) Wie viele Daten können in 15 sekunden übertragen werden?
mod2 <- lm(file_size_in_MB ~ transfer_time_in_sec)
mean(mod2$fitted.values[transfer_time_in_sec == 15])
    + c(2, -2) * summary(mod1)$sigma
# Lösung: zwischen 24.295 MB & 49.268 MB in 15 sekunden

# 4) Tabelle Cars
cars <- read_excel("./WDDA_05.xlsx", sheet = "Cars")
attach(cars)
View(cars)
# a) Streudiagramm Leistung auf Motorengrösse
plot(cars$Horsepower ~ cars$`Displacement (liters)`)
#Fazit: Ja ein Linearer Zusammenhang besteht da die punkte nicht
#       eine grosse Streuung aufweisen.
# b) Lineare Gleichung mithilfe der MEthode der kleinsten Quadrate
plot(cars$Horsepower ~ cars$`Displacement (liters)`
    , xlim = c(0, 8), ylim = c(0, 700))
mod1 <- lm(cars$Horsepower ~ cars$`Displacement (liters)`)
abline(mod1)
# Intercept: 34.16 PS, 69.2 PS / Liter
# Fazit: Intercept besteht da ein Auto mit weniger als 1 Peferstärke nicht
#        fahren wird
# c) r^2, RSE, RSS, TSS
summary(mod1)
# r ^ 2 = multiple r-squared = 75.9%
# RSE = Residual standard error: 57.72 PS
# RSS
RSS <- sum(mod1$residuals ^ 2) # 1052771 PS^2
# TSS   
TSS <-
    sum((cars$Horsepower - mean(cars$Horsepower)) ^ 2) # 4372056 PS^2
# d) Motor um 0.5 Liter vergrössert, sollte er dann 0,5b1 verwenden,
#    um abzuschätzen, wie viel mehr Leistung der Motor hat?
# TODO Lösung: Kausalität vs Korrelation! WTF
# e) Auto mit 3 Liter und 333 PS
filtered_cars <- cars[`Displacement (liters)` == 3.0 & Horsepower == 333,]
mod2 <- lm(filtered_cars$Horsepower ~ filtered_cars$`Displacement (liters)`)
# TODO: Lösung steht: 91.22
# f) Positives Residuen: LKW?, Negatives Residuen: Leichte Autos?
# g) Residuen mit Motorgrösse darstellen
plot(resid(mod1)~cars$`Displacement (liters)`) # Fast kein Muster
# h) Konfidenzintervall für 3-Liter Hubraum
filtered_cars <- cars[`Displacement (liters)` == 3.0,]
mod3 <- lm(filtered_cars$Horsepower ~ filtered_cars$`Displacement (liters)`)
confint(mod3)
# Konfidenzintervall: [251.424, 284.004]
summary(mod3) # 35.79 Liter, nicht gleicher RSE wie ganzer Datensatz
