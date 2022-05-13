
# Woche 10
library(readxl)
#advertising <- read_excel("projects/school/WDDA/WDDA_06.xlsx", sheet = "Advertising") 
advertising <- read_excel("./WDDA_06.xlsx", sheet = "Advertising")
View(advertising)
attach(advertising)

library(scatterplot3d)
scatterplot3d(x = TV, y = radio, z = sales, scale.y = 0.9, angle = 30)

options(rgl.useNULL = TRUE)
library(rgl)
library(car)
library(mgcv)
scatter3d(x = TV, y = radio, z = sales)

# Multiples modell
md2 <- lm(sales ~ TV + radio)
b <- coef(md2)
# Plane of best fit
pbf <- function(x,y) b[1] + b[2] * x + b[3] * y

