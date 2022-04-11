# Kapitel 4
library(readxl)
footballer <- read_excel("./WDDA_04.xlsx", sheet = "Footballer")
View(footballer)
attach(footballer)
# Punktschätzung
xbar <- mean(sample(WeeklySalary, size = 30))
library(mosaic)
m_30 <- do(3000) * mean(sample(WeeklySalary, size = 30))
hist(m_30$mean)
# Standartabweichung (Fehlerbereich)
se <- sd(m_30$mean)
# Punktschätzung
phut <- mean(sample(0:1, size = 30, replace = TRUE, prob = c(0.704, 0.296)))
# Resampling
stich_m <-
        do(1000) *
        mean(sample(0:1, size = 30, replac = TRUE, prob = c(0.704, 0.296)))
hist(stich_m$mean)
se_hut <- sd(stich_m$mean)
# 95%-Konfidenzintervall
phut + c(-2 * se_hut, 2 * se_hut)
# Beispiel BFH
bfh <- read_excel("./WDDA_04.xlsx", sheet = "BFH")
detach(footballer)
attach(bfh)
hist(distance)
# Punktabschätzung
xbar <- mean(distance)
boot1000_dist <- do(1000) * resample(distance)
boot1000_m <- apply(boot1000_dist, 1, mean)
hist(boot1000_m)
dist_se_hat <- sd(boot1000_m)
# Konfidenzintervall
xbar + c(-2 * dist_se_hat, 2 * dist_se_hat)

# Beispiel Nüsse
# phat: Punktschätzung
phat <- 0.52
nuts <- c(rep(1, phat * 100), rep(0, (1 - phat) * 100))
nuts_re100 <- do(1000) * resample(nuts)
nuts_m100 <- apply(nuts_re100, 1, mean)
hist(nuts_m100)
se_nuts <- sd(nuts_m100)
# Konfidenzintervall
phat + c(-2 * se_nuts, 2 * se_nuts)

# Konfidenzintervall 2.0 (Oberste 2.5% und unterste 2.5% wegnehmen)
hist(boot1000_m)
dist_q25 <- quantile(boot1000_m, probs = 0.025)
dist_q975 <- quantile(boot1000_m, probs = 0.975)

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
men <- Sex[1:5]
women <- Sex[Sex == "W", ]
mw_m <- mean(men$Exercise)
