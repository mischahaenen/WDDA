#WDDA Woche 2
library(readxl)
Auto <- read_excel("./WDDA_02.xlsx", sheet = "Auto")
View(Auto)

# different answers
attach(Auto)
brands <- unique(Brand)
print(brands)
# counting of column
freq1 <- table(Brand)
print(freq1)
# anzahl aller elemente
sum(freq1)
# häufigkeit der einzelnen daten in der tabelle
relfreq <- freq1/sum(freq1)
print(relfreq)

# balkendiagram
barplot(freq1, ylim = c(0,20), main="Automarken", col=rainbow(25))

# hilfe
?barplot
?sum
?pie

# kuchendiagram
pie(freq)

detach(Auto)

# Audit import
library(readxl)
Audit <- read_excel("./WDDA_02.xlsx", sheet = "Audit")
View(Audit)
attach(Audit)

time <- table(Time) # Gruppieren
# Vektor mit 5er Schritten
bins <- c(0, 5 * 0:5 + 10)
# schöner
bins <- c(0, seq(10, 35, 5))
# -> Levels: (10,15] (15,20] ...
time_binned <- cut(Time, bins) # Zuweisung der Werte zu den einzelnen bins
time_table <- table(time_binned) # Häufigkeitsverteilung erstellen
time_table_percent <- table(time_binned) / length(Time) # Prozent verteilung
barplot(time_table) # Balkendiagramm
pie(time_table_percent) # Kuchendiagramm

sum(Time) # Summe aller Zeiten
# cumulated sum -> calculates all values from range
cumsum(table(Time)) # Kummulierte Häufigkeits-Verteilung
cumsum(time_table_percent) # 95% der werte sind zwischen 0 und 30
hist(Time, breaks = 10)
hist(Time, breaks = bins)