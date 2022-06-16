library(readxl)
goldchains <- read_excel("./WDDA_06.xlsx", sheet = "Gold Chains")
names(goldchains) <- c("Price", "Length", "Width")
attach(goldchains)
# Aufgabe 1
# a) Streudiagramme der Zielvariablen auf den beiden erklärenden Variablen
plot(Price~Length)
plot(Price~Width)
plot(Length~Width)
# Alle Diagramme auf einmal anzeigen
pairs(goldchains)
# Keine Indizien gegen eine lineare multiple regression
# b) Korrelationen zwischen jedem Variablen paar
cor(goldchains)
# Lenght hat die grösste Korrelation mit Price
# c) marginale Steigung
mod1 <- lm(Price~Width)
coef(mod1) # 221 Dollar, 223.9 Dollar pro zoll
# marginale Steigung: 223.9 $/mm
# d) partielle Steigung mit Breite
mod2 <- lm(Price~Length + Width)
coef(mod2) # 406, 222 $/mm * width + 9 $/mm * length
# Wir stellen fest marginale Steigung fast gleich wie partielle Steigung$
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
# Resiudal standard error: 56.9$
# g) sind residuen glockenförfmig?
hist(mod2$residuals)
# Ist rechtsschief und nicht glockenfördmig
qqnorm(mod2$residuals)
qqline(mod2$residuals)
# h) Residuen gegenüber den Inputvariablen
plot(mod2$residuals~Length)
plot(mod2$residuals~Width)
# Nicht gut, da wir eine U form haben. Sollte zufällig sein.
# Nicht zu frieden, denn keine Zufallsverteilung
# i) MRM Bedingungen erfükllt
# Residuen sind nicht glockenförmig; Residuen zu Width sind nicht zufallsverteilt
# j) Spalte hinzufügen
goldchains$Area <- Length * Width
View(goldchains)
mod4 <- lm(Price~Length + Width + Area)
plot(mod4$residuals~Length)
plot(mod4$residuals~Width)
# k) Berechnen und interpretieren das Residium der 1 Beobachtung
# wahrer Wert aus erster Zeile 56.57 $
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