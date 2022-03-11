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

# Besitzt viele Werte mit 1, daher müssen diese gruppiert werden
time <- table(Time)

# Quantitative Daten werden in Klassen zusammengefasst
bins <- c(0,5*0:5+10) # Vektor mit 5er Schritten plus 10 // <- und = machen das gleiche
time_binned <- cut(Time, bins) # -> Levels: (10,15] (15,20] ... (15 gehört nicht dazu 15 ist im vorderen dataset

time_table <- table(time_binned)
barplot(time_table)

time_table_percent <- table(time_binned) / length(Time)
print(time_table_percent)
pie(time_table_percent)

# Werte löschen
rm(schritte)

# cumulated sum -> calculates all values from range
cumsum(time_table) # 19 werte sind zwischen 0 und 30
cumsum(time_table_percent) # 95% der werte sind zwischen 0 und 30

# Histogramm: Plot für nummerische Daten
hist(Time, breaks = bins)
