# Import der "bereinigten" Datei (alle N/A durch NA ersetzt)
library(readr)
realestate <-  read_csv("./RealEstate_California-adapted.csv", col_names = T)
realestate <- subset(realestate, select = c(pricePerSquareFoot, bedrooms, livingArea))
View(realestate)

# Filter n/a
row.has.na <- apply(realestate, 1, function(x){any(is.na(x) | x == "N/A")})
sum(row.has.na)
realestate_filtered <- realestate[!row.has.na,]
View(realestate_filtered)

realestate_filtered$pricePerSquareFoot <-
    as.numeric(realestate_filtered$pricePerSquareFoot)

# Multiples modell
# zu erklärende Variable: pricePerSquareFoot
# erklärende Variablen: Bedrooms, livingArea
md1 <- lm(realestate_filtered$pricePerSquareFoot ~ realestate_filtered$bedrooms + realestate_filtered$livingArea)
abline(md1)
plot(realestate_filtered$pricePerSquareFoot ~ realestate_filtered$livingArea)
plot(realestate_filtered$pricePerSquareFoot ~ realestate_filtered$bedrooms)
