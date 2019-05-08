
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


## Aufgabe 1

## Waehlt mit subset nur die Spalten aus, welche die
## *rekodierten* Werte der 40 Items des NPI
## enthalten. (Speichert diesen data.frame in einer
## neuen Variablen ab).


## Aufgabe 2

## Nutzt den in Aufgabe 1 erstellten data.frame, um mit
## der Funktion rowSums einen Narzissmus-Summenwert zu
## erstellen. Haengt diesen Summenwert als Spalte an
## den "Original-data.frame" an, den ihr am Anfang
## eingelesen habt.


## Aufgabe 3

## Wie verteilt sich das Geschlecht? Bevor ihr das
## untersucht: Wandelt mit dem folgenden Befehl die
## Spalte npi$gender in einen "factor" um:

npi$gender <- factor(npi$gender, levels = 0:3,
                     labels = c("none", "male", "female", "other"))


## Aufgabe 4

## Vergleicht mit einem t-Test die Narzissmuswerte der
## maennlichen und weiblichen Teilnehmer/innen, indem
## ihr ...

## (a) ... subset nutzt, um data.frames fuer Maenner
## und Frauen auszuwaehlen


## (b) ... die [ ]-Auswahl nutzt


## Aufgabe 5

## (a) Ueberprueft die Verteilung des Alters mit einem
## Mittel eurer Wahl (Histogramm, table,
## mean/sd/min/max, ...)


## (b) Plotted den Zusammenhang von Alter und
## Narzissmus. 


## (c) Plotted noch einmal den Zusammenhang zwischen
## Alter und Narzissmus. Schliesst davor alle Werte
## kleiner 14 und groesser gleich 100 aus.
## Nutzt die [ ]-Auswahl, um Daten auszuwaehlen. (Tipp:
## manchmal hilft es, logische Abfragen in Variablen
## zwischenzuspeichern)


## (d) Plotted noch einmal den Zusammenhang zwischen
## Alter und Narzissmus. Schliesst alle Werte kleiner
## 14 und groesser gleich 100 aus. Nutzt subset, um
## Daten auszuwaehlen.



## (e) Korreliert Narzissmus mit dem Alter? -- fuehrt
## vor Bestimmung der Korrelation denselben
## Datenausschluss wie in Aufgabenteil (c) und (d)
## durch.



## Aufgabe 6

## Berechnet fuer die 7 Subskalen nach Raskin und Terry
## (1988) Summenwerte. (Entnehmt die Zugehoerigkeit der
## Items zu Subskalen aus dem Codebuch, oder der
## Tabelle 1 aus dem Paper von Schuetz Marcus, und
## Sellin (2003)). Nutzt wiederum subset und rowSums.



## Aufgabe 7

## Stelle die Korrelationen zwischen den Subskalen in
## einer Tabelle auf zwei Nachkommastellen gerundet
## dar.


## Aufgabe 8

## Haben Maenner in allen Subskalen im Mittel
## signifikant hoehere Wert?

