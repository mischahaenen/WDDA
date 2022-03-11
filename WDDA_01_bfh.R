# BFH import
library(readxl)
BFH <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

sum_cash <- sum(cash) # funktioniert da summe von geld rechenbar ist
sum_gender <- sum(gender)  # gibt runtime error aus
height / 100 # rechnet von cm in m um
reaction1-reaction2 # rechnet ob erste reaktionszeit schneller oder langsamer war als reaktionszeit 2
siblings*present # rechnet kosten für alle geschenke aus
