library(readxl)

stereo <- read_excel("./WDDA_02.xlsx", sheet = "Stereo")
#stereo <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "Stereo")
View(stereo)

# Streudiagamm
attach(stereo)
plot(Sales~Commercials)
# Lineares Modell berechnen lm
fit <- lm(Sales~Commercials)
abline(fit)

install.packages("languageserver")
