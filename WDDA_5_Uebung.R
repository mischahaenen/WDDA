# Übungsserie 5
library(readxl)
#dimond_rings <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "DimondRings") 
diamonds_rings <- read_excel("./WDDA_05.xlsx", sheet = "Diamonds Rings")
View(diamonds_rings)
attach(diamonds_rings)
names(diamonds_rings) <- c("weight", "price")

# 2. 
# a) Streudiagramm
plot(price ~ weight)
# b) Modell 
m1 <- lm(price ~ weight)
abline(m1)
