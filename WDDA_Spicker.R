# BFH import
library(readxl)
bfh <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "BFH")
View(bfh)
attach(bfh)

detach(bfh)
markets <- read_excel("WDDA_01.xlsx", sheet = "Exchanges")
attach(markets)
markets[3, ] # Zeigt Zeile 3
markets[, 2] # Zeigt Spalte 2
markets[3, 2] # Zeigt Zelle in Z3/S2
names(markets) # Zeigt alle Namen von markets
markets$trades # Zeigt Spalte trades
markets$trades[3] # Ziegt 3 Zelle von Spalte trades

length(markets) # 3
length(trades) # 21


auto <- read_excel("WDDA_02.xlsx", sheet = "Auto")
attach(auto)
unique(Brand) # eindeutigen Werte der Liste
freq <- table(Brand) # Häufigkeit der Werte in einer Liste
relfreq <- freq / sum(freq) # relative Häufigkeit in Prozent
barplot(freq) # Balkendiagramm
pie(freq) # Kuchendiagramm


audit <- read_excel("WDDA_02.xlsx", sheet = "Audit")
attach(auto)