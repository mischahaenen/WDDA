#WDDA Woche 3
library(readxl)
restaurant <- read_excel("./WDDA_02.xlsx", sheet = "Restaurant")
attach(restaurant)
View(restaurant)

head(restaurant, 3) # Gibt Anfang der Liste zurück (default 6)
tail(restaurant, 3) # Gibt Ende der Liste zurück (default 6)


Price[Quality == "Good"] # Filtert Preise nach Qualität == Good
length(Price[Quality == "Good"]) # Länge des Vektors || Anzahl Preise Good
restaurant[Quality == "Good", ] # Filtert Restaurants nach Qualität == Good
nrow(restaurant[Quality == "Good", ]) # Anzahl Restaurants Good

Price[Price <= 20] # Preis max 20
restaurant[Price <= 20, ] # Restaurant Preis max 20
#Logisches UND
restaurant[Price <= 20 & Quality == "Good", ]
# Logisches ODER
restaurant[Price <= 20 | Quality == "Good", ]
# Logisches NICHT
restaurant[Price <= 20 & Quality != "Good", ]
library(dplyr)
filter(restaurant, Price <= 20) # Filtern mit Library
sort(Price) # Sortiert Preise

# tabellarische Zusammenfassung von Daten für zwei Variablen
quality_preis <- table(Quality, Price) # Kreuztabelle
barplot(quality_preis) # Zeigt Preis mit Quality an
bins <- seq(0, 50, 10)
preise_klassiert <- cut(Price, bins)
quality_preis_binned <- table(Quality, preise_klassiert) # Kreuztabelle mit bins
barplot(quality_preis_binned)

