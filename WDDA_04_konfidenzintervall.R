# Kapitel 4
library(readxl)
Footballer <- read_excel("projects/school/WDDA/WDDA_04.xlsx", sheet = "Footballer") 
View(Footballer)
attach(Footballer)
# Punktschätzung
xbar = mean(sample(WeeklySalary, size=30))
library(mosaic)
m_30 = do(3000)*mean(sample(WeeklySalary, size=30))
hist(m_30$mean)
# Standartabweichung (Fehlerbereich)
se = sd(m_30$mean)

sample(0:1, size=30, replace=TRUE, prob = c(0.704, 0.296))