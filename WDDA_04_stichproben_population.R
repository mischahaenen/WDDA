# Kapitel 4
library(readxl)
# Footballer <- read_excel("projects/school/WDDA/WDDA_04.xlsx", sheet = "Footballer")
Footballer <- read_excel("./WDDA_04.xlsx", sheet = "Footballer")
View(Footballer)
attach(Footballer)

# Durchschnitt
mu <- mean(WeeklySalary)
# Stichprobe 500 zufälliger Werte
stichp1 <- sample(WeeklySalary, size = 500)
# Der Mittelwert x¯ dieser Stichprobe ist eine Punktschätzung für µ.
xbar <- mean(stichp1)

library(mosaic)
# Weitere Stichproben ergeben neue Stichprobenmittelwerte
do(3) * mean(sample(WeeklySalary, size = 30))
# 3000 Stichprobenmittelwerte bestimmen
m_stichps <- do(3000) * mean(sample(WeeklySalary, size = 30))
# Grafische Darstellung
dotPlot(m_stichps$mean, nint = 200, cex = 2, pch = 1, ylim = c(0, 100))

# Standardfehler der Stichproben (Schwanken viel weniger)
se <- sd(m_stichps$mean)

# Weitere Stichproben mit grösserer Auswahl
# Fazit je grösser, desto näher am 'wahren' Wert und desto weniger Schwanken die Proben. # nolint
m_30 <- do(3000) * mean(sample(WeeklySalary, size = 30))
m_100 <- do(3000) * mean(sample(WeeklySalary, size = 100))
m_500 <- do(3000) * mean(sample(WeeklySalary, size = 500))
hist(m_30$mean, xlim = c(10000, 100000))
hist(m_100$mean, xlim = c(10000, 100000))
hist(m_500$mean, xlim = c(10000, 100000))

# Standartfehler der Stichmenge
se <- sd(m_30$mean)
# Konfidenzintervall: Der wahre Wochenlohn wird in diesem Bereich liegen (95%)
xbar + c(-2 * se, 2 * e)
xbar
# Je mehr Daten desto kleiner wird der Konfidenzintervall
se <- sd(m_500$mean)
xbar + c(-2 * se, 2 * se)
xbar

# Konfidenzintervalle: Eine Simulation
# Zufallswahlen von 0 und 1, Gewichtung 0 = 70.4% und 1 = 29.6%
stich_m <-
    do(100) *
        mean(sample(0:1, size = 30, replace = TRUE, prob = c(0.704, 0.296)))
hist(stich_m$mean)
se <- sd(stich_m$mean)
# Konfidenzintervall 95%-Bereich
xbar <- mean(stich_m$mean)
xbar + c(-2 * se, 2 * se)

untere <- stich_m - 2 * se
obere <- stich_m + 2 * se
library(plotrix)
# Für jede Stichprobe Mittelwert angeben
# li = lower limit, ui = upper limit
plotCI(x = 1:100, y = stich_m$mean, li = untere$mean, ui = obere$mean)
# Linie: b = steigung, a = achsenabschnitt
abline(b = 0, a = 0.294)
?plotCI

# Bootstrap Konfidenzintervalle: Aus Stichprobe weitere Werte generieren
detach(Footballer)
BFH <- read_excel("dev/projects/school/WDDA/WDDA_04.xlsx", sheet = "BFH")
View(BFH)
attach(BFH)

hist(distance)
xbar <- mean(distance)
sd(distance)

# Stichprobe kopieren um Stichprobenverteilung zu erhalten
# do ist in library mosaic enthalten
boot1000_dist <- do(1000) * resample(distance)
boot1000_m <- apply(boot1000_dist, 1, mean)
hist(boot1000_m)
dist_se_hat <- sd(boot1000_m)

library(readxl)
footballer <- read_excel("./WDDA_04.xlsx", sheet = "Footballer")
View(footballer)
attach(footballer)

# Punktschätzung
library(mosaic)
# Punktschätzung von x = 59952.57
xbar <- mean(sample(WeeklySalary, size = 30))
m_30 <- do(3000) * mean(sample(WeeklySalary, size = 30))
hist(m_30$mean)
# Standartabweichung (Standartfehler)
se <- sd(m_30$mean) # 9703.438
# 95%-Konfidenzintervall
xbar + c(-2 * se, 2 * se) # 25545.19 64620.27

# Punktschätzung: Hochschulabschluss
phut <- mean(sample(0:1, size = 30, replace = TRUE, prob = c(0.704, 0.296)))
# Resampling
stich_m <-
    do(1000) *
        mean(sample(0:1, size = 30, replac = TRUE, prob = c(0.704, 0.296)))
hist(stich_m$mean)
# Standartabweichung (Standartfehler)
se_hut <- sd(stich_m$mean)
# 95%-Konfidenzintervall
phut + c(-2 * se_hut, 2 * se_hut)

untere <- stich_m - 2 * se_hut
obere <- stich_m + 2 * se_hut
library(plotrix)
plotCI(x = 1:1000, y = stich_m$mean, li = untere$mean, ui = obere$mean)


# Beispiel BFH
detach(footballer)
bfh <- read_excel("./WDDA_04.xlsx", sheet = "BFH")
attach(bfh)
hist(distance)

# Punktabschätzung
xbar <- mean(distance)
# Standartabweichung
sd(distance) # 22.65
# 1000 Sstichproben
boot1000_dist <- do(1000) * resample(distance)
boot1000_m <- apply(boot1000_dist, 1, mean)
# Durch mehrere Stichproben wird Histogramm glockenförmig
hist(boot1000_m) # approximiert mittelwert
dist_se_hat <- sd(boot1000_m)
# Konfidenzintervall
xbar + c(-2 * dist_se_hat, 2 * dist_se_hat) # 22.14680 28.24582

# Beispiel Nüsse (52 von 100 sind Cashew Nüsse)
# phat: Punktschätzung
phat <- 0.52
nuts <- c(rep(1, phat * 100), rep(0, (1 - phat) * 100))
sd(nuts) # 0.5021167
nuts_re100 <- do(1000) * resample(nuts)
nuts_m100 <- apply(nuts_re100, 1, mean)
sd(nuts_m100) # 0.04988417
hist(nuts_m100)
se_nuts <- sd(nuts_m100)
# Konfidenzintervall
phat + c(-2 * se_nuts, 2 * se_nuts)

# Konfidenzintervall 2.0 (Oberste 2.5% und unterste 2.5% wegnehmen)
hist(boot1000_m)
# Das 95%-Konfidenzintervall reicht von 22.3 km bis 28.4 km.
# , type = 1 ist optional
dist_q25 <- quantile(boot1000_m, probs = 0.025, type = 1)
dist_q975 <- quantile(boot1000_m, probs = 0.975, type = 1)

# 90%-Konfidenzintervall
dist_q5 <- quantile(boot1000_m, probs = 0.05)
dist_q95 <- quantile(boot1000_m, probs = 0.95)

# 99%-Konfidenzintervall
dist_q05 <- quantile(boot1000_m, probs = 0.005)
dist_q995 <- quantile(boot1000_m, probs = 0.995)
confint(boot1000_m, 0.99)


exercise_hours <- read_excel("./WDDA_04.xlsx", sheet = "ExerciseHours")
detach(bfh)
attach(exercise_hours)
View(exercise_hours)

# Filtern Gruppen nach Geschlecht (Mann / Frau)
men <- exercise_hours[Sex == "M", ]
women <- exercise_hours[Sex == "F", ]
# Mittelwert Männer
mw_m <- mean(men$Exercise) # 12.4
# Mittelwert Frauen
mw_f <- mean(women$Exercise) # 9.4
# Standartabweichng Männer
sd_m <- sd(men$Exercise) # 8.8
# Standartabweichung Frauen
sd_w <- sd(women$Exercise) # 7.41
anzahl <- table(Sex)
# Differenz Mittelwert
diff_hat <- mw_m - mw_f # 3
boxplot(Exercise ~ Sex, data = exercise_hours, horizontal = T)

# Bootstraping
boot3000_diff <- do(3000) *
    (mean(resample(men$Exercise)) - mean(resample(women$Exercise)))
hist(boot3000_diff$result)
# 95%-Konfidenzintervall
diff_q005 <- quantile(boot3000_diff$result, probs = 0.025) # -1.600833
diff_q995 <- quantile(boot3000_diff$result, probs = 0.975) # 7.450417
confint(boot3000_diff$result) # -1.600833 7.450417

library(readxl)
mustangs <- read_excel("./WDDA_04.xlsx", sheet = "Mustangs")
View(mustangs)
attach(mustangs)

library(mosaic)
# Konfiidenzintervall für Preise mit Bootstrapping
mustangs_price_boot <- do(5000) * mean(resample(Price))
# resample: nimmt zufällige Werte aus Price
# do: führt einen Befehl n mal aus

# Sollte symmetrische Verteilung (Glockenförmig) anzeigen
hist(mustangs_price_boot$mean,
    main = "Mean Mustang Price",
    xlab = "Price (in 1000$)",
    ylab = "count"
)

# Mittelwert verändert sich nicht!
mean(mustangs_price_boot$mean) # 16.01845
# Histogramm der Preise
hist(Price)
mean(Price) # 15.98

# Streuung wird kleiner
sd(Price) # 11.11362
sd(mustangs_price_boot$mean) # 2.167098

# Konfidenzinterfall mit empirischer Regel
mean(Price) + 2 * sd(mustangs_price_boot$mean)
mean(Price) - 2 * sd(mustangs_price_boot$mean)
# Konfidenzintervall mit Quantilen
quantile(mustangs_price_boot$mean, 0.025)
quantile(mustangs_price_boot$mean, 0.975)
# Makro für Konfidenzintervall
# , level = 0.95 kann geändert werden
confint(mustangs_price_boot)

# Konfidenzintervalle für Korrelationen
price_miles <- Price ~ Miles
plot(price_miles)
cor(price_miles)
# Modernere Syntax mit resample
cor(price_miles, data = resample(Mustangs))
# Resample
mustangs_cor_boot <- do(5000) * cor(price_miles, data = resample(Mustangs))
hist(mustangs_cor_boot$cor)
# 98% Konfidenzintervall
quantiles <- qdata(~cor, c(.01, .99), data = mustangs_cor_boot)
quantiles # -0.9371607 -0.7026376
# 95% Konfidenzintervall
confint(mustangs_cor_boot$cor) # -0.9284472 -0.7219353
# 98% Konfidenzintervall
confint(mustangs_cor_boot$cor, level = .98) # -0.9360365 -0.7023308