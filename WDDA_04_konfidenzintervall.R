# Kapitel 4
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

