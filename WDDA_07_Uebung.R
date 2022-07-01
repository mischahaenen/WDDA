# 1) Diamond Rings -> price and weight
library(readxl)
diamonds <- read_excel("./WDDA_07.xlsx", sheet = "Diamonds Rings")
names(diamonds) <- c("weight", "price")
attach(diamonds)
View(diamonds)
# (a) Könnten diese Daten aus einer Population sein,
#     in der der Populationsintercept Null ist?
mod1 <- lm(price ~ weight)
plot(price ~ weight, data = diamonds)
confint(mod1)
# 95% Intervall: [-294.487 -224.765] > 0
# Fazit: Das Intervall beinhaltet nicht NULL daher gibt
#        es keine Populationsintercepte mit Wert Null.
# b) Passen Sie ein Modell ohne Intercept für den Preis
#    auf das Gewicht an und interpretieren Sie es.
# Modell ohne Intercept
mod2 <- lm(price ~ -1 + weight) # 2539
# Fazit: Ringpreise sind proportional zum Gewicht.
# c) Vergleichen Sie die von beiden Modelle
#    (mit und ohne Intercept) erklärte Variation.
summary(mod1) # 97.83 % deckt das Modell ab
summary(mod2) # 98.06% deckt das Modell ab
# d) Vergleichen Sie beide Modelle, in dem Sie die optimale
#    Geraden in Scatterplot einzeichnen
plot(price ~ weight)
abline(mod1)
sum((price - abline(mod1))^2)
plot(price ~ -1 + weight)
abline(mod2)
# Fazit: Modell 1 passt besser da sie näher an den Punkten ist.
# e) Ist $350 ein ungewöhnlich hoher Preis
#    für einen Ring, der 0,15 Karat wiegt?
mean(mod1$fitted.values[weight == 0.15]) + c(2, -2) * summary(mod1)$sigma
# Konfidenzintervall zeigt zwischen [362.21, 234.85] daher nein es ist im
# Intervall enthalten
# f) Effekt einer 0.15-Karat Gewichtszunahme auf dem Preis?
# 95%-Konfidenzintervall auf das Modell
confint(mod1) # [3556.398 3885.6513] pro Karat
confint(mod1) * 0.15 # [533.46 582.85] pro 0.15 Karat

# 2) Netzwerkdaten in Datei Download
download <- read_excel("./WDDA_07.xlsx", sheet = "Download")
names(download) <-
    c("transfer_time_in_sec", "size_in_mb", "hours_past_8", "vendor")
attach(download)
View(download)
# a) Formulieren Sie das SRM mit Übertragungszeit auf Dateigrösse.
mod1 <- lm(transfer_time_in_sec ~ size_in_mb)
# Lösung: Y = a + bx (Y = übertragungszeit, X = dateigrösse) #nolint
# Fazit: Bevor die Übertragungbeginnt braucht es 7.27 sekunden.
#        Anschliessend werden 0.3133 sec / MB versendet
# b) Bestimmen und interpretieren Sie ein Konfidenzintervall für die Steigung.
confint(mod1) #  [0.259 0.368]
# Fazit: Um ein MB zu versenden braucht es zwischen 0.26 und 0.37 Sekunden.
# c) Korrelation zwischen Übertragungszeit und DateigrÖsse
#    signifikant von Null verschieden?
cor(transfer_time_in_sec, size_in_mb) # 0.79
# Fazit: Die Korrelation ist signifikant von Null unterschieden.
# d) Schätzen Sie die durchschnittliche Setup-Zeit zu Beginn
#    der Übertragung. Geben Sie Ihre Antwort als Bereich an.
# 95% Konfidenzintervall
confint(mod1)
# Fazit: Sezupt zeit benötigt zwischen [3.86, 10.69] Sekunden
# e) Kompressionssoftware verkleintert daten. Wie hoch ist die durchschnittliche
# Zeitverbesserung beim Senden einer 50-MB-Datei? Antwort als einen Bereich.
confint(mod1) * (50 - 25) # [6.46, 9.2]
confint(mod1) * 50
# Fazit: neu sind 50Mb dateien noch 25Mb gross daher sind sie
#       doppelt so schnell versendet in 6.46 bis 9.2 Sekunden .

# 3) Download
# a) MRM mit Übertragungszeit als Antwort und Dateigrösse und Tageszeit.
mod2 <- lm(transfer_time_in_sec ~ size_in_mb + hours_past_8)
# Lösung: Y = a + b1x1 + b2x2 (Y = übertragungszeit, X1 = dateigrösse, X2 = tageszeit) #nolint
# b) Konfidenzintervalle der partiellen Steigungen (interpretieren)
confint(mod2)
# Size_in_MB: [-0.034, 0.68] kann auch 0 sein
# hours_past_8: [-6.48, 6.11] kann auch 0 sein
# c) F-Statistik, sowie den entsprechenden F-Wert. (interpretieren)
summary(mod2)
# F-statistic: 64.05
# p-Wert: < 2.2e-16
# Interpretaton: Mindestens eins con b1, b2 ist nicht Null
# F-Statistik: Die F-Statistik zeigt einfach das Verhältnis von zwei Varianzen.
# Varianzen sind ein Maß für die Streuung, d. h. wie weit vom Mittelwert
# entfernt Daten verteilt sind. Größere Werte stehen für eine stärkere Streuung.
# Die Varianz ist die quadrierte Standardabweichung.
# d) Vergleichen und setzen Sie Ihre Antworten auf obige Fragen gegenüber.
# b besagt dass beide null sein können
# c besagt dass einer von beiden nicht null sein kann
# Fazit: Scheinbar ein wiederspruch
# e) Untersuchung Streudiagramme. Erklärung für Konsistenz bzw. Inkonsistenz?
plot(transfer_time_in_sec ~ size_in_mb + hours_past_8)
cor(transfer_time_in_sec, size_in_mb + hours_past_8) # 0.79
# Starker zusammenhang
cor(transfer_time_in_sec, size_in_mb) # 0.79
cor(transfer_time_in_sec, hours_past_8) # 0.78
cor(size_in_mb, hours_past_8) # 0.98
# Fazit die beiden erklärenden variablen sind fast gleich
# (korrelieren fast zu 100%) daher kann eine variable weggelassen werden
# f) Mit Modell zufrieden? Wenn nicht, dann haben Sie Verbesserungvorschläge?
# Nein da man eine Variabel nicht braucht. Besser mod1 brauchen
summary(mod1) # 62.46% von daten erklärt
summary(mod2) # 62.46% von daten erklärt
# Modell 2 bringt keinen mehrwert
# g) Durchschnittliche Setup-Zeit zu Beginn der Übertragung. Antwort -> Bereich.
# 95%-Konfidenzinterval
confint(mod2)
# Fazit: Setupzeit benötigt zwischen [1.39 12.89] Sekunden

# 4) Datensatz Default -> schulden in verzug, Student, Balance und Income
default <- read_excel("./WDDA_07.xlsx", sheet = "Default")
attach(default)
View(default)
# a) Zusammenhang zwischen Einkommen & Saldo?
cor(balance, income) # -0.14
# Fazit: Kein starker zusammenhang da wahrscheinlich ausgaben steigen
# bei höheren einkommen.
# b ) Streudiagramm Einkommen und Saldo.
# y-achse = balance
plot(balance ~ income)
# c) Erklärt Ihre erklärende Variable statistisch signifikante
# Variation in Ihrer Zielvariable?
mod1 <- lm(balance ~ income)
confint(mod1) # [-0.0075, -0.003] und 0 ist nicht enthalten
summary(mod1) # Jedoch beschreibt es nur 2% der Daten

# 5) BFH, erklären variation von Körpergrösse mit Hilfe von
# dob, foot, hair, siblinga, sleep
bfh <- read_excel("./WDDA_06.xlsx", sheet = "BFH")
attach(bfh)
View(bfh)
# a) dob zu alter umwandeln
library(ggplot2)
library(nloptr)
library(eeptools)
# show types
sapply(bfh, mode)
# transform to date type
bfh <- transform(bfh, dob = as.Date(dob))
bfh <- bfh[dob != as.Date("0001-01-01"), ]
# calculate ages
bfh$age <- age_calc(bfh$dob, Sys.Date(), units = "years")
# b) = dob

# Schritte beim Aufbau von Regressionsmodellen
# 1. Potenziell erklärende Variablen identifizieren
# 2. Streudiagramme betrachten.
# 3. Ein Modell anpassen und F-Statistik oder p-Wert prüfen
# 4. p-Werte der Koeffizienten prüfen und Modell verfeinern!
# 5. Residuen beurteilen!

# Für eine optimale Variablenkombination, starte vom Vollmodell und
# verwende die Rückwärtsauswahl, oder vom Nullmodell und
# wende die Vorwärtsauswahl an, oder kombiniere beide.

# c) Starten Vollmodell und finden eine optimale Variablenkombination
#    mittels Rückwärtsauswahl
plot(height ~ age + foot + hair + siblings + sleep)
mod1 <- lm(height ~ age + foot + hair + siblings)
# ansicht der einzelnen p werte in summary (Pr(>|t|))
library(sjPlot)
tab_model(mod1)
summary(mod1)
# tab_model markiert signifikante werte dick
mod2 <- lm(height ~ foot + hair)
tab_model(mod2)
summary(mod2)
# man sieht modell 2 erklärt gleich viel (40%) wie modell 1
hist(residuals(mod2))
library(moments)
skewness(residuals(mod2))
# Residuen sind glockenförmig um 0 verteilt
plot(residuals(mod2))
# Residuen sind zufällig um 0 verteilt
# d) Starten Nullmodell und finden eine optimale Variablenkombination
#    mittels Vorwärtsauswahl.
# TODO
# e) Erhalten Sie dieselbe optimale Kombination?
#    Wenn nicht, ist es ein Widerspruch?
# TODO

# 6) SAT
SAT <- read_excel("./WDDA_07.xlsx", sheet = "SAT")
attach(SAT)
View(SAT)
# a) Identifizieren Zielvariable und die erklärende(n) Variable(n).
# Zielvariable: SAT scrore
# erklärenden Variablen: Kosten pro Schüler (expend)
# b) Bestätigen / widerlegen Behauptung(en) SRM / MRM anpassen.
mod1 <- lm(sat ~ expend)
# sat = 1089.29 - 20.89 sat / tausend dollar pro schüler
confint(mod1) # expend: [-35.63, -6.16] < 0
cor(sat, expend) # -0.38
# Fazit: Negativer zusammenhang wirklich? anscheinend sinken die investitionen
# pro sat punkt.
# c) SRM mit SAT-score auf Lehrergehalt anpassen. Interpretieren.
mod2 <- lm(sat ~ salary)
# sat = 1158.86 - 5.54 sat punkte / tausend dollar gehalt
confint(mod2) # salary: [-8.82, -2.26] < 0
cor(sat, salary) # -0.44
# Interpretation: Anscheinend beeinflusst auch der Gehalt der lehrer
# den SAT Score negativ. Somit sind besser bezahlte lehrer nicht austomatisch
# besser als schlechter bezahlte lehrer.
# d) SRM für SAT-score auf Schüler/Lehrer Verhältnis anpassen. Interpretieren.
mod3 <- lm(sat ~ ratio)
# sat = 920 sat punkte + 2.682 sat punkte / ratio
confint(mod3) # ratio: [-6.87, 12.23] -> 0 ist enthalten
cor(sat, ratio) # -0.08
# Interpretation: Das verhältniss von schüler zu lehrer ist sehr schwach.
# man kann sehen dass 0 im konfidenzintervall enthalten ist und daher
# hat ratio keinen richtigen einfluss auf sat.
# e) Welches Ihrer vorherigen angepassten Modelle ist Ihr Favorit?
# modell 2 da ihr konfidenzintervall am wenigsten wankt und die korrelation
# am grössten ist
summary(mod1) # 14.48% der Daten erklärt
summary(mod2) # 19.35% der Daten sind erklärt
summary(mod3) # 0.6% der Daten sind erklärt
# f) Erklären Sie, warum die Variable frac eine wichtige Rolle spielen könnte.
# frac beschreibt welcher anteil der schüler teilnimmt. Eine schule könnte
# ausgewählte schüler hinschicken um ihre punkte zu erhöhen. Je mehr schüler
# einer schule teilnehmen desto besser sollte die sat aussagekräftig sein.
# g) Frac zu den obigen Modellen hinzufügen. Welches ist Ihr Favorit? Warum?
mod1 <- lm(sat ~ expend + frac)
# sat = 993.832 + 12.287 punkte / asugaben - 2.851 punkte / frac
confint(mod1)
# expend        3.788291   20.784746 > 0
# frac         -3.283679   -2.418179 < 0
cor(sat, expend + frac) # -0.879245
summary(mod1) # 81.95% der Daten sind erklärt
mod2 <- lm(sat ~ salary + frac)
# sat = 987.900 punkte + 2.180 punkte / salary - 2.779 punkte / frac
confint(mod2)
# salary        0.1101771    4.250616 > 0
# frac         -3.2382874   -2.319109 < 0
cor(sat, salary + frac) # -0.8561188
summary(mod2) # 80.56% der Daten sind erklärt
mod3 <- lm(sat ~ ratio + frac)
# sat = 1118.509 - 3.726 punkte / ratio - 2.547 punkte / frac
confint(mod3)
# ratio         -8.170102    0.7173743 -> null ist enthalten
# frac          -2.923693   -2.1710641 < 0
cor(sat, ratio + frac) # -0.8932457
summary(mod3) # 79.91% der Daten sind erklärt
# Favorit: Modell 1 da es den grössten Anteil an erklärten daten hat.
# h) Passen Sie ein MRM mit einer opitmalen Anzahl Variablen an.
mod4 <- lm(sat ~ salary + ratio + frac)
# sat = 1057.9 punkte + 2.552 punkte / salary -4.639 punkte
#    / ratio -2.913 punkte / frac
summary(mod4)
tab_model(mod4)

# 7)
# 8)