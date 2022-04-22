library(readxl)
inventory <- read_excel("./WDDA_02.xlsx", sheet = "Inventory")
View(inventory)
# Attach Set of R Objects to Search Path
attach(inventory)
# ZReturn the First or Last Parts of an Object
head(inventory)
tail(inventory)

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
# Aggregieren bzw. zusammenfassen nach Farbe
aggregate(inventory2, list(inventory2$color), length)
