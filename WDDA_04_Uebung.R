# 1. Statistik oder Parameter?
# a) Durchschnittliches Haushaltseinkommen für alle Häuser in den CH,
#    unter Verwendung von Daten der CH-Volkszählung.
# Lösung: Dieser Mittelwert ist ein Populationsparameter; die Notation ist µ.
# b) Durchschnittliche Anzahl von Fernsehgeräten pro Haushalt in North Carolina,
#    unter Verwendung von Daten aus einer Stichprobe von 1000 Haushalten.
# Lösung: Dieser Mittelwert ist eine Stichprobenstatistik; die Notation ist ¯x.

# 2. Studie über Smartphone-Nutzer in den USA die Apps herunterladen.
#    Von n = 355 Smartphone-Benutzern ist der Durchschnitt von 19.7.
# a) Geben Sie die Notation für den interessierenden Parameter an,
#    und definieren Sie den Parameter in diesem Zusammenhang.
# Lösung: Der Parameter ist ein Populationsmittelwert, mit Notation µ.
# b) Geben Sie die Notation für die Größe an, die den besten Schätzwert liefert,
#    und geben Sie ihren Wert an.
# Lösung: Stichprobenmittelwert, der mit ¯x bezeichnet wird. ¯x = 19.7.
# c) Was müsste man tun, um den Parameter genau zu berechnen?
# Lösung: Alle Smartphonebenutzer fragen.

# 3. Abschätzen ob wert in Stichprobenverteilung vorkommen kann.
# (a) ¯x = 70: Sehr wahrscheinlich da dieser Wert oft vorkommt. (i)
# (b) ¯x = 100: Sehr wahrscheinlich da dieser Wert oft vorkommt (i)
# (c) ¯x = 140: Kann vorkommen, da dieser Wert aufkommt aber nicht oft. (ii)

# 4. Bereich der plausiblen Werte bestimmen (Punktschätzung ± Fehlerbereich)
# a) Verhüllungsverbot (siehe Grafik): [46.2, 51.8]
# b) Freihandel mit Indonesien (siehe Grafik): [49.2, 54.8] -> Bereich unter 50%
# b) Muss nicht davon ausgegangen werden dass die Absimmung angenommen wird.

# 5. Wahr oder Falsch?
# a) Ein 95%-Konfidenzintervall enthält 95% der Daten in der Grundgesamtheit.
# Lösung: Falsch! Ein Konfidenzintervall macht eine Aussage zum Parameter, nicht
# zu individuellen Werten. Wir sind zu 95% sicher, dass µ im Konfidenzintervall liegt #nolint
# b) Ich bin zu 95% sicher, dass der Mittelwert einer Stichprobe
#    in ein 95%-Konfidenzintervall für den Mittelwert fällt.
# Lösung: Falsch! Wir sind zu 95% sicher, dass der Mittelwert der Population in
# ein 95%-Konfidenzintervall für den Mittelwert fällt. Ein Konfidenzintervall
# gibt uns Informationen über den Populationsparameter, nicht
# über Mittelwerte anderer Stichproben.
# c) Die Wahrscheinlichkeit, dass der Populationsparameter in diesem
#    speziellen 95%-Konfidenzintervall liegt, beträgt 0.95.
# Lösung: Falsch! Nachdem das Konfidenzintervall konstruiert wurde, ist der
# Parameter entweder darin enthalten oder nicht. Die Konstruktion versichert,
# dass 95% der mit dieser Methode erstellten Intervalle den Parameter enthalten.

# 6. Interval konstruieren der den Bereich der plausiblen Werte für
#   einen Parameter angibt.
# a) Für µ, unter Verwendung von ¯x = 25 mit Standardfehler 3
# Lösung: µ: ¯x ± ME = 25 ± 3 -> [22, 28]
# b) Für p unter Verwendung von ˆp = 0.37 mit einer Fehlermarge von 0.02.
# Lösung: p: ˆp ± ME = 0.37 ± 0.02 -> [0.35, 0.39]

# 7. Angst Erwachsene (0.225) und Teenager (0.059) Standardfehler (0.091)
# a) Notation der zu schätzender Grösse: µA −µT (µA: Erwachsene µT: Teenger)
# Lösung: Unterschied in den Mittelwerten
# b) Notation der Grösse mit der besten Schätzung
# Lösung: µA − µT = 0.225 − 0.059 = 0.166
# c) 95% Konfidenzintervall
# Lösung: ± 2 · SE (¯xA − ¯xT) ± 2 · SE −0.166 ± 2(0.091)
# d) Experiment oder Beobachtungsstudie?
# Lösung: Beobachtungstsudie da das Alter nicht mainuliert wurde.

# 8. Studie 30% der Menschen mit 23 Jahren wurden bereits verhaftet
# a) Ist der Wert 30% ein Parameter oder eine Statistik?
# Lösung: Information aus Stichprobe also ist es eine Statistik
#         p^ (p-hut) = 0,30.
# b) Verwenden Sie die gegebenen Informationen, um einen Parameter zu
#    schätzen, und definieren Sie den zu schätzenden Parameter eindeutig.
# Lösung: p ≈ 0.30
# c) Die Fehlermarge für die Schätzung in Teil (b) ist 0.01.
#    Bereich der plausiblen Werten für den Parameter angeben.
# Lösung: p ≈ 0.30 ± 0.01 = [0.29, 0.31]
# d) Fehlermarge wie in c) alle Jugendlichen in den USA fragen,
# .  ob verhaftet wahrscheinlich weniger als 20% beträgt?
# Lösung: Sehr unwahrscheinlich da der Bereich der plausiblen Werte
#         zwischen 0.29 und 0.31 liegt.

# 9) Zufallsstichprobe von n = 1483 Erwachsenen in den USA
#    Auto als notwendigkeit, 95%-Konfidenzintervall für den Anteil,
#    der sagt, dass es eine Notwendigkeit ist, 0.83 bis 0.89 beträgt.
# Lösung: Wir sind 95% sicher, dass der Anteil aller Erwachsenen
#         in den USA, die ein Auto für eine Notwendigkeit halten,
#         zwischen 0.83 und 0.89 liegt.

# 10) Studie Reaktionszeit Spieler
# a) Bedeutung des 95%-Konfidenzintervalls für Reaktionszeit.
# Lösung: Wir sind uns zu 95% sicher, dass Spieler um -1.8 bis -1.2
#         Sekunden reaktiver sind.
# b) plausibel, dass Reaktionszeit von Spielern und Nicht-Spielern gleich ist?
# Lösung: Es ist nicht möglich, da die Differenz der Mittelwerte gleich Null
#         ist, nicht im Intervall liegt. Die Werte sind nur negativ daher
#         sind alle Spieler schneller.
# c) Bedeutung des 95%-Konfidenzintervalls für Genauigkeit.
# Lösung: Wir sind uns zu 95% sicher, dass einige Spieler viel genauer (-4.8)
# .       sind. Jedoch gibt es auch Spieler die ungenauer sind (+5.8)
# d) plausibel, dass Spieler und Nicht-Spieler bei der Genauigkeit gleich sind?
# Lösung: Es ist sehr wahrscheinlich das sie gleich sind. Da die Möglichkeit
#         besteht das die Differenz gleich Null ist. = kein Unterschied

# 11) Stichprobe: 85,72,79,97,88. Angegebene Werte Bootstrap-Stichprobe dar?
# a) 79, 79, 97, 85, 88 -> JA
# b) 72, 79, 85, 88, 97 -> JA
# c) 85, 88, 97, 72 -> NEIN, zu klein
# d) 88, 97, 81, 78, 85 -> Nein, andere Werte
# e) 97, 85, 79, 85, 97 -> Ja
# f) 72, 72, 79, 72, 79 -> Ja

# 12) Von 250 Studierenden stimmen 180 dafür um Mathematik zu erweitern
#     Bootstrap Methode den SE herausfinden und 95% Konfidenzintervall
library(mosaic)
p_hut <- 180 / 250
stich_m <-
    do(1000) *
    mean(sample(0:1, size = 250, replace = TRUE, prob = c(p_hut, 1 - p_hut)))
# Standartfehler (se)
se <- sd(stich_m$mean) # 0.028
# 95% Konfidenzintervall
p_hut + c(-2 * se, 2 * se) # [0.664, 0.776]

# 13. Wie viele Ameisen klettern auf ein Honigbrot?
#     Stichprobe: 43,59,22,25,36,47,19,21.
# a) Bestimmen Sie ¯x (mittelwert einer Stichprobe) und s (standartabeichung).
stichprobe <- c(43, 59, 22, 25, 36, 47, 19, 21.)
x_bar <- mean(stichprobe) # 34
s <- sd(stichprobe) # 14.629
# b) Beschreiben Sie,wie man eine Bootstrap-Statistik erstellt. konkret!
# Lösung: Wir mischeln die 8 Zettel und ziehen einen Zettel und notieren uns
#         den Wert, legen den Zettel zurück und wiederholen diesen Vorgang
#         bis wir 8 zufällige Zettel gezogen haben. => Bootstrap-Stichprobe
#         Der Mittelwert davon ist eine Bootstrap-Statistik.
# c) Was erwarten Sie für die Form und das Zentrum der Bootstrap-Verteilung?
# Lösung: Die Verteilung sollte möglichst Glockenförmig sein und bei 34
#         zentriert ist.
# d) Was ist Populationsparameter? Was ist die beste Schätzung dafür?
# Lösung: Der Populationsparameter ist der Mittelwert µ der Anzahl Ameisen
#         die auf den Honigbroten liegen. Die beste Schätzung ist 34.
# e) 5000 Bootstrap-Stichproben und Standardfehler.
stich_m <-
    do(5000) *
    mean(resample(stichprobe))
se <- sd(stich_m$mean) # 4.777
# f) 95%-Konfidenzintervall.
x_bar + c(-2 * se, 2 * se) # [24.4 43.6]

# 14) Nussmischung 400 Nüsse, davon 208 Cashews
# a) 95%-Konfidenzintervall für die Anzahl der Cashews
p_hut <- 208 / 400
stich_m <-
    do(1000) *
    mean(sample(0:1, size = 400, replace = TRUE, prob = c(p_hut, 1 - p_hut)))
se <- sd(stich_m$mean) # 0.025
# Berechnung mit empirischer Regel
p_hut + c(-2 * se, 2 * se) # [0.469 0.571]
# Berechnung mit Quantilen
dist_q25 <- quantile(stich_m$mean, probs = 0.025, type = 1) # 0.4325
dist_q975 <- quantile(stich_m$mean, probs = 0.975, type = 1) # 0.53
# Berechnung mit confint
confint(stich_m$mean, level = 0.95) # [0.4325. 0.53]
# b) Welchen Effekt hat die Erhöhung des Stichproben Umfangs?
# Lösung: Stichprobenumfang ist 4 ml grösser, der Fehlerbereich halbiert sich.
#         Der Fehlerbereich schrumpft nur mit Wuzel n

# 15) Konfidenzintervall mit Perzentilen
# 95%-Konfidenzintervall (25)
dist_q25 <- quantile(boot1000_m, probs = 0.025, type = 1)
dist_q975 <- quantile(boot1000_m, probs = 0.975, type = 1)
# 90%-Konfidenzintervall (50)
dist_q5 <- quantile(boot1000_m, probs = 0.05)
dist_q95 <- quantile(boot1000_m, probs = 0.95)
# 99%-Konfidenzintervall (5)
dist_q05 <- quantile(boot1000_m, probs = 0.005)
dist_q995 <- quantile(boot1000_m, probs = 0.995)

# 16) Intervall zuordnen gegeben: n = 30, 5000 BS, 95% confint, [67, 73]
# a) 90%-Konfidenzintervall -> C = [67.5,72.5]
# b) n = 16 -> A=[66,74]
# c) 1000 BS -> B = [67,73]

# 17) 99%-Konfiidenzintervall
# 1000 Pers, 382 zustimmen, 578 nicht, 40 unschlüssig
p_hut <- 578 / (382 + 578)
    do(1000) *
    mean(sample(c(0, 1), size = 1000, replace = TRUE, prob = c(p_hut, 1 - p_hut)))
confint(stich_m$mean, level = 0.99) # [0.564, 0.64]
# Lösung Nein: Anzeil der Nicht-Zustimmer zwischen 0.564 und 0.64
# Lösung Ja: Anzeil der Zustimmenden zeischen 0.34 und 0.436
# 18) 90%-Konfidenzintervall für den Betrag an Bargeld der BFH
library(readxl)
bfh <- read_excel("./WDDA_04.xlsx", sheet = "BFH")
View(bfh)
attach(bfh)
hist(cash)
mean(cash)
median(cash)
cash_mean_boot <- do(5000) * mean(resample(cash))
confint(cash_mean_boot, level = 0.9) # 44.59735 63.13346
# Median bessere Lösung!
cash_median_boot <- do(5000) * median(resample(cash))
confint(cash_median_boot, level = 0.9) # 25 40

# 19) Schlafen Studentinnen mehr als Studenten?
bfh_non_binary <- bfh[gender != "Non binary",]
men <- bfh_non_binary[gender == 'Male',]
women <- bfh_non_binary[gender == 'Female',]
boot1000_diff <-
    do(1000) *
    (mean(resample(men$sleep)) - mean(resample(women$sleep)))
confint(boot1000_diff$result, level = 0.95) # [-0.907 -0.231]
# 95%-Konfidenzintervall: [-0.907 -0.231] da beide Zahlen negativ sind
# kann man schliessen das die Studenten weniger schlafen als die Frauen

# 20) 99%-Konfidenzintervall der Korrelation Körpergrössen und Fusslänge
height_foot <- height ~ foot
height_foot_cor_boot <- do(1000) * cor(height_foot, data = resample(bfh))
confint(height_foot_cor_boot$cor, level = 0.99) # [0.082 0.482]
