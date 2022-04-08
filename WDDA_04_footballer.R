# Kapitel 4
library(readxl)
Footballer <- read_excel("projects/school/WDDA/WDDA_04.xlsx", sheet = "Footballer") 
View(Footballer)
attach(Footballer)
# Durchschnittlicher Wochenlohn
mu = mean(WeeklySalary)
# Stichprobe
stichp1 = sample(WeeklySalary, size = 500)
xbar = mean(stichp1)
# Weitere Strichproben und darstellen
library(mosaic)
do(3)*mean(sample(WeeklySalary, size = 30))
m_stichps = do(3000)*mean(sample(WeeklySalary, size = 30))
dotPlot(m_stichps$mean, nint=200, cex=2, pch=1, ylim=c(0,100))
# Standardfehler der Stichproben (Schwanken viel weniger)
se = sd(m_stichps$mean)
# Wahre Standardabweichung
sd(WeeklySalary)
# Weitere Stichproben mit grösserer Auswahl
m_30 =do(3000)*mean(sample(WeeklySalary, size = 30))
m_100 =do(3000)*mean(sample(WeeklySalary, size = 100))
m_500 =do(3000)*mean(sample(WeeklySalary, size = 500))
# Fazit je grösser, desto näher am 'wahren' Wert und desto weniger Schwanken die Proben.
hist(m_30$mean, xlim = c(10000, 100000))
hist(m_100$mean, xlim = c(10000, 100000))
hist(m_500$mean, xlim = c(10000, 100000))

# Standartfehler der Stichmenge
se <- sd(m_30$mean)
# Konfidenzintervall: Der wahre Wochenlohn wird in diesem Bereich liegen (95%)
xbar + c(-2*se, 2*se)
xbar
# Je mehr Daten desto kleiner wird der Konfidenzintervall
se <- sd(m_500$mean)
xbar + c(-2*se, 2*se)
xbar

# Konfidenzintervalle: Eine Simulation
# Zufallswahlen von 0 und 1, Gewichtung 0 = 70.4% und 1 = 29.6%
stich_m <- do(100)*mean(sample(0:1, size = 30, replace = TRUE, prob = c(0.704, 0.296)))
hist(stich_m$mean)
se <- sd(stich_m$mean)
# Konfidenzintervall 95%-Bereich
xbar <- mean(stich_m$mean)
xbar + c(-2*se, 2*se)

untere = stich_m-2*se
obere = stich_m+2*se
library(plotrix)
# Für jede Stichprobe Mittelwert angeben
# li = lower limit, ui = upper limit
plotCI(x=1:100, y=stich_m$mean, li=untere$mean, ui=obere$mean)
# Linie: b = steigung, a = achsenabschnitt
abline(b=0, a=0.294)
?plotCI

# Bootstrap Konfidenzintervalle: Aus Stichprobe weitere Werte generieren
detach(Footballer)
BFH <- read_excel("dev/projects/school/WDDA/WDDA_04.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

hist(distance)
xbar = mean(distance)
sd(distance)

# Stichprobe kopieren um Stichprobenverteilung zu erhalten
# do ist in library mosaic enthalten
boot1000_dist = do(1000)*resample(distance)
boot1000_m = apply(boot1000_dist, 1, mean)
hist(boot1000_m)
dist_se_hat = sd(boot1000_m)
