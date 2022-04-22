library(readxl)

stereo <- read_excel("./WDDA_02.xlsx", sheet = "Stereo")
#stereo <- read_excel("dev/projects/school/WDDA/WDDA_02.xlsx", sheet = "Stereo")
View(stereo)
# Streudiagamm
attach(stereo)

plot(Sales~Commercials) # Streudiagramm erstellen
fit <- lm(Sales~Commercials) # Lineares Modell für Trendlinie
abline(fit) # Trendlinie anzeigen

