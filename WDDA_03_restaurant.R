#WDDA Woche 3
library(readxl)
restaurant <- read_excel("./WDDA_02.xlsx", sheet = "Restaurant")
View(restaurant)

head(restaurant, 3)
head(restaurant)

attach(restaurant)
Quality == "Good"
Price[Quality == "Good"]

restaurant[Quality == "Good"]

# länge vektor
length(Price[Quality == "Good"])
# länge datensatz
nrow(restaurant[Quality == "Good",])

#Preise maximal 20
Price <= 20
Price[Price <= 20]
restaurant[Price <= 20,]
#Logisches UND
restaurant[Price <= 20 & Quality == "Good",]
# Logisches ODER
restaurant[Price <= 20 | Quality == "Good",]
# Logisches NICHT
restaurant[Price <= 20 & Quality != "Good",]

# Gibt mögliche Funktionen von sort und order an
?sort
?order

# Sortieren nach Preis
gute_rest <- restaurant[Price <= 20 & Quality == "Good",]
gute_rest[sort(Price),]

# Tabelle erstellen
table(Quality)
# Kreuztabelle erstellen
table(Quality, Price)
bins <- 10 * (0:5)
preise_klassiert <- cut(Price, bins)
table(Quality, preise_klassiert)
