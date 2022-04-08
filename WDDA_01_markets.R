#WDDA Woche 1
library(readxl)
# load excel sheet to work with
markets <- read_excel("dev/projects/school/WDDA/WDDA_01.xlsx", 
+     sheet = "Exchanges")
# View sheet inside editor
View(markets)
# stringfy name of excel
str(markets)
# get Column names
names(markets)
# markets[3,1] -> 3 row, 1 column
# R begins index 1
markets[3,]
markets[,2]
markets[3,1]
markets$trades # same as markets[,2]
markets$trades[1]
# attach table to directly access columns
attach(markets)
trades
# deconnect table
detach(markets)
# length of dataset
length(markets) # gets number of columns
nrow(markets) # gets number of rows
length(trades)


