# Aufgabenserie 3
# 11. IHG
IHG <- read_excel("dev/projects/school/WDDA/WDDA_03.xlsx", sheet = "IHG")
View(IHG)
attach(IHG)
# a) Mittelwert
rating <- `Customer ratings`
median(rating)
# a) Durchscnitt
mean(rating)
# b) Besser ist der Durchschnitt da er genauere angaben macht. Des weiteren sind Ausreisser nicht möglich.
# c) Quartile
quantile(rating)
# c) IQR
quantile(rating, 0.75)  - quantile(rating, 0.25)
# d) 85 percentile
quantile(rating, 0.85)
# 12. polizeiaufzeichnungen
aufzeichnungen_winter = c(18, 20, 15, 16, 21, 20,  12, 16, 19, 20)
aufzeichnungen_sommer = c(28, 18, 24, 32, 18, 29, 23, 38, 28, 18)
# a) Spannweite
max(aufzeichnungen_winter)-min(aufzeichnungen_winter)
max(aufzeichnungen_sommer)-min(aufzeichnungen_sommer)
# a) IQR
quantile(aufzeichnungen_winter, .75) - quantile(aufzeichnungen_winter, .25)
quantile(aufzeichnungen_sommer, .75) - quantile(aufzeichnungen_sommer, .25)
