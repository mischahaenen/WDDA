# Deskriptive Statistik
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
relfreq <- freq1 / sum(freq1)
print(relfreq)

# balkendiagram
barplot(freq1, ylim = c(0, 20), main = "Automarken", col = rainbow(25))

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

library(readxl)
restaurant <- read_excel("./WDDA_02.xlsx", sheet = "Restaurant")
attach(restaurant)
View(restaurant)

head(restaurant, 3) # Gibt Anfang der Liste zurück (default 6)
tail(restaurant, 3) # Gibt Ende der Liste zurück (default 6)

# Filter
Price[Quality == "Good"] # Filtert Preise nach Qualität == Good
length(Price[Quality == "Good"]) # Länge des Vektors || Anzahl Preise Good
restaurant[Quality == "Good", ] # Filtert Restaurants nach Qualität == Good
nrow(restaurant[Quality == "Good", ]) # Anzahl Restaurants Good

Price[Price <= 20] # Preis max 20
restaurant[Price <= 20, ] # Restaurant Preis max 20
# Logisches UND
restaurant[Price <= 20 & Quality == "Good", ]
# Logisches ODER
restaurant[Price <= 20 | Quality == "Good", ]
# Logisches NICHT
restaurant[Price <= 20 & Quality != "Good", ]
library(dplyr)
filter(restaurant, Price <= 20) # Filtern mit Library
sort(Price) # Sortiert Preise

# Kreuztabellen
# tabellarische Zusammenfassung von Daten für zwei Variablen
quality_preis <- table(Quality, Price) # Kreuztabelle
barplot(quality_preis) # Zeigt Preis mit Quality an
bins <- seq(0, 50, 10)
preise_klassiert <- cut(Price, bins)
quality_preis_binned <- table(Quality, preise_klassiert) # Kreuztabelle mit bins
barplot(quality_preis_binned)


library(readxl)
inventory <- read_excel("./WDDA_02.xlsx", sheet = "Inventory")
View(inventory)
# Attach Set of R Objects to Search Path
attach(inventory)
# ZReturn the First or Last Parts of an Object
head(inventory)
tail(inventory)

# Recoding
library(stringr)
# str_split_fixed zerteilt strings zu listen (liste, seperator, anzahl)
inventory2 <- data.frame(str_split_fixed(shirt, ",", 3))
# Spaltennamen setzten
colnames(inventory2) <- c("style", "color", "size")
head(inventory2)
# Preis hinzufügen
inventory2$price <- inventory$price # Spalte hinzufügen
inventory2$discount <- inventory$price * 0.7 # Spalte hinzufügen
inventory2 <- inventory2[, -4] # spalte löschen

# Aggregating
# Aggregieren bzw. zusammenfassen nach Farbe
aggregate(inventory2, list(inventory2$color), length)


library(readxl)
stereo <- read_excel("./WDDA_02.xlsx", sheet = "Stereo")
# stereo <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "Stereo")
View(stereo)
# Streudiagamm
attach(stereo)

# Streudiagramme
plot(Sales ~ Commercials) # Streudiagramm erstellen
fit <- lm(Sales ~ Commercials) # Lineares Modell für Trendlinie
abline(fit) # Trendlinie anzeigen