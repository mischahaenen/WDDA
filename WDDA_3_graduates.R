library(readxl)

#graduates <- read_excel("./WDDA_03.xlsx", sheet = "Graduates")
graduates <- read_excel("dev/projects/school/WDDA/WDDA_03.xlsx", sheet = "Graduates")
View(graduates)
attach(graduates)

sum(Salary)
# Durchschnitt
sum(Salary/length(Salary))
# Median
mean(Salary)
