
library(readxl)
bfh <- read_excel("./WDDA_04.xlsx", sheet = "BFH")
View(bfh)
attach(bfh)

library(mosaic)
# 18)
hist(cash)
mean(cash)
median(cash)
cash_mean_boot <- do(5000) * mean(resample(cash))
confint(cash_mean_boot, level = 0.9) # 44.59735 63.13346
# Median bessere Lösung!
cash_median_boot <- do(5000) * median(resample(cash))
confint(cash_median_boot, level = 0.9) # 25 40
