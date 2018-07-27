
## Testtheorie mit R Termin 8

## Wir arbeiten heute mit einem Datensatz zum
## Narcissistic Personality Inventory. Die Daten wurden
## online abgerufen unter
## https://openpsychometrics.org/_rawdata/

## Wichtig: die folgenden drei Befehle ausfuehren,
## bevor ihr die Uebungen bearbeitet.

## Daten einlesen
npi <- read.csv("npi_clean.csv")
## NPI Score berechnen
npi$sum <- rowSums(subset(npi, select = paste0("recode_Q", 1:40)))
## Geschlecht in Faktor umwandeln:
npi$gender <- factor(npi$gender, levels = 0:3,
                     labels = c("missing", "male", "female", "other"))
## ACHTUNG: diesen Befehl (factor) kann man nicht
## zweimal durchfuehren! Das liegt daran, dass man die
## Spalte npi$gender mit neuen Werten ueberschreibt --
## die Werte sind nach der Umwandlung nicht mehr 0, 1,
## 2, 3, sondern: "none", "male", "female", "other"


######################################################

## Erinnerung: t.test mit [ ] und subset
t.test(npi$sum[npi$gender == "male"],
       npi$sum[npi$gender == "female"])

t.test(subset(npi, gender == "male")$sum,
       subset(npi, gender == "female")$sum)
## (wichtig zu verstehen, wieso hier beide Befehle zum
## selben Ergebnis fuehren!)

## FYI: mit der Funktion tapply kann man deskriptive
## Statistiken nach Gruppenzugehoerigkeit anfordern:
tapply(npi$sum, npi$gender, mean)
tapply(npi$sum, npi$gender, sd)
tapply(npi$sum, npi$gender, table) # !

######################################################


## Aufgabe 1

## (a) Ueberprueft die Verteilung des Alters mit einem
## Mittel eurer Wahl (Histogramm, table,
## mean/sd/min/max, ...)

mean(npi$age)
sd(npi$age)
min(npi$age)
max(npi$age)

## (b) Plotted den Zusammenhang von Alter und
## Narzissmus.

plot(npi$age, npi$sum)

## (c) Plotted noch einmal den Zusammenhang zwischen
## Alter und Narzissmus. 

## Schliesst davor alle Werte von Personen, die ein
## Alter von weniger als 14 oder mindestens 100
## angegeben haben, aus. 
## Nutzt die [ ]-Auswahl, um Daten auszuwaehlen. (Tipp:
## manchmal hilft es, logische Abfragen in Variablen
## zwischenzuspeichern)

select <- npi$age > 13 & npi$age < 100
plot(npi$age[select], npi$sum[select])

## Aequivalent:
plot(npi$age[npi$age > 13 & npi$age < 100], 
     npi$sum[npi$age > 13 & npi$age < 100])


## (d) Plotted noch einmal den Zusammenhang zwischen
## Alter und Narzissmus. Schliesst alle Werte kleiner
## 14 und groesser gleich 100 aus. Nutzt subset, um
## Daten auszuwaehlen.

age_ok <- subset(npi, age > 13 & age < 100)
plot(age_ok$age, age_ok$sum)

## (e) Korreliert Narzissmus mit dem Alter? -- fuehrt
## vor Bestimmung der Korrelation denselben
## Datenausschluss wie in Aufgabenteil (c) und (d)
## durch.

cor(age_ok$age, age_ok$sum)
cor.test(age_ok$age, age_ok$sum)

