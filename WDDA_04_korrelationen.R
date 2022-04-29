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
    ylab = "count")
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