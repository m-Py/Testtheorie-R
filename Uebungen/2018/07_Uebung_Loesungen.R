
## Testtheorie mit R Termin 7

## Wir arbeiten heute mit einem Datensatz zum
## Narcissistic Personality Inventory. Die Daten wurden
## online abgerufen unter
## https://openpsychometrics.org/_rawdata/


## Daten einlesen
npi <- read.csv("npi_clean.csv")

## Aufgabe 0

## Exploriert die Daten: wie viele Faelle gibt es; wie
## sieht der Datensatz aus; betrachtet das Codebuch.

nrow(npi)
names(npi)
head(npi)

## Aufgabe 1

## Waehlt mit subset nur die Spalten aus, welche die
## *rekodierten* Werte der 40 Items des NPI
## enthalten. (Speichert diesen data.frame in einer
## neuen Variablen ab).

items <- subset(npi, select = paste0("recode_Q", 1:40))

## Aufgabe 2

## Nutzt den in Aufgabe 1 erstellten data.frame, um mit
## der Funktion rowSums einen Narzissmus-Summenwert zu
## erstellen. Haengt diesen Summenwert als Spalte an
## den "Original-data.frame" an, den ihr am Anfang
## eingelesen habt.

npi$sum <- rowSums(items)

## Aufgabe 3

## Wie verteilt sich das Geschlecht? Bevor ihr das
## untersucht: Wandelt mit dem folgenden Befehl die
## Spalte npi$gender in einen "factor" um:

npi$gender <- factor(npi$gender, levels = 0:3,
                     labels = c("none", "male", "female", "other"))

table(npi$gender)
table(npi$gender) / nrow(npi)
round(table(npi$gender) / nrow(npi), 2) ## uebersichtlicher

## Aufgabe 4

## Vergleicht mit einem t-Test die Narzissmuswerte der
## maennlichen und weiblichen Teilnehmer/innen, indem
## ihr ...

## (a) ... subset nutzt, um data.frames fuer Maenner
## und Frauen auszuwaehlen

males   <- subset(npi, gender == "male") 
females <- subset(npi, gender == "female") 

t.test(males$sum, females$sum)

## (b) ... die [ ]-Auswahl nutzt

t.test(npi$sum[npi$gender == "male"],
       npi$sum[npi$gender == "female"])
