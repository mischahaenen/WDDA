# BFH import
library(readxl)
BFH <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

# Aufgabenserie 1
# 4. Unterschied sum(cash) und sum(gender)
sum_cash <- sum(cash)
sum_gender <- sum(gender)
# 5. umrechung cm in m
height / 100
# 6. rechnet ob erste reaktionszeit schneller oder langsamer war als reaktionszeit 2
reaction1-reaction2
# 7. rechnet kosten für alle geschenke aus
siblings*present

# Aufgabenserie 2
# 1. Häufigkeitsverteilung von transport
freq_transport = table(transport)
cumsum(freq_transport)
# 2. Balkendiagramm von gender, transport, maths
freq_gender = table(gender)
barplot(freq_gender, col=rainbow(3))
freq_transport = table(transport)
barplot(freq_transport, col=rainbow(6))
freq_maths = table(maths)
barplot(freq_maths, col=rainbow(10), xlab="Erreichte Note", ylab="Anzahl Noten")
# 3. Die Variable Note ist ordinal und muss daher aufeinanderfolgend sein.
# 4. Kreisdiagramme eye, eyetext
freq_eye = table(eye)
pie(freq_eye)
freq_eyetext = table(eyetext)
pie(freq_eyetext)
# 5. Das Diagramm sieht verzerrt aus und daher sieht Lila kleiner aus als Grün.
# 6. Häufigkeitsverteilung mit Barplot height mit Bins
bins = seq(155,185,5)
freq_height = table(height)
height_binned = cut(height, bins)
freq_height_binned = table(height_binned)
barplot(freq_height_binned, border="#69b3a2", col="white", xlab="Körperrange", ylab="Anzahl Personen")
# 7. Kumulative Häufigkeit von height mit bins
bins = seq(155,185,5)
freq_height = table(height)
height_binned = cut(height, bins)
freq_height_binned = table(height_binned)
cumulated_height = cumsum(freq_height_binned)
# 8. Histogramm raction1
fruit_hist = hist(reaction1)
# 9. Histogramm height
# a) hist()
height_hist = hist(height, col="grey", border="white")
# b) histogram men and women
library(dplyr)
men = filter(BFH, gender == "Male")
women = filter(BFH, gender == "Female")
height_hist_women = hist(women$height, col = "pink")
height_hist_men = hist(men$height, col="blue")
# 10. hist hair women, men, all
hair_hist_women = hist(women$hair, col = "pink")
hair_hist_men = hist(men$hair, col="blue")
sexes = rbind(men, women) # fügt listen men & women zusammen ist gleich wie BFH$hair
hair_hist_all = hist(sexes$hair)
# 11. hist cash -> Die Daten sind rechtsschief
cash_hist = hist(cash)
# 12 height men / women
men_height = filter(BFH, gender == "Male")$height
women_height = filter(BFH, gender == "Female")$height

