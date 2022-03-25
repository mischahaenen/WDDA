# BFH import
library(readxl)
BFH <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

# Aufgabenserie 3
# 1. Körpergrösse Männer & Frauen
# a) Anzahl Frauen grösser als durchschnitt Mann
mean_man = mean(height[gender == "Male"])
length(height[(gender == "Female" & height >= mean_man)])
# b) Anzahl Männer kleiner als durchscnitt Frau
mean_female = mean(height[gender == "Female"])
length(height[(gender == "Male" & height <= mean_female)])
# 2. schwarmintelligenz jar
# a) Mittelwert jar
mean_jar = mean(jar)
# b) geburtstadum person bester guess
kleinste_abweichung = min(abs(jar-405))
# gibt nur ein resultat
which.min(abs(jar-405))
# findet alle resultate
best_guess = abs(jar-405) == kleinste_abweichung
dob[best_guess]
# c) anzahl näher am Tatsächlichen wert als am Median
sum(abs(jar-405) < abs(jar-mean(jar)))
# 
