
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
                     labels = c("none", "male", "female", "other"))
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


## (b) Plotted den Zusammenhang von Alter und
## Narzissmus. 


## (c) Plotted noch einmal den Zusammenhang zwischen
## Alter und Narzissmus. 

## Schliesst davor alle Werte von Personen, die ein
## Alter von weniger als 14 oder mindestens 100
## angegeben haben, aus. 
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



## Aufgabe 2

## Berechnet fuer die 7 Subskalen nach Raskin und Terry
## (1988) Summenwerte. (Entnehmt die Zugehoerigkeit der
## Items zu Subskalen aus dem Codebuch, oder der
## Tabelle 1 aus dem Paper von Schuetz Marcus, und
## Sellin (2003)). Nutzt wiederum subset und rowSums.



## Aufgabe 3

## Stellt die Korrelationen zwischen den sieben Subskalen
## in einer Tabelle dar (auf zwei Nachkommastellen gerundet).



## Aufgabe 4

## (a) Erstellt einen data.frame, der aus den Items
## der Eitelkeits-Skala (Vanity) und dem Gesamtscore
## der Eitelkeits-Skala besteht


## (b) Wendet die Funktion cor auf den im letzten
## Aufgabenteil erstellten data.frame an. (Tipp: mit
## der Funktion round kann man die Ausgabe besser
## lesbar machen). Was berechnet ihr so?


## (c) Die letzte Zeile (ebenso: Spalte) in
## Aufgabenteil (b) beinhaltet die unkorrigierte
## Item-Trennschaerfe. Normalerweise beruecksichtigt
## man bei der Berechnung von Item-Trennschaerfen
## jeweils die Punktzahlen des Items nicht, fuer das
## die Trennschaerfe bestimmt wird. Das nennt man eine
## "part-whole" Korrektur. Berechnet fuer die drei
## Items der Eitelkeits-Skala korrigierte
## Trennschaerfen, indem ihr:

## (i) dreimal einen Skalenscore bestimmt, bei dem
## jeweils eins der drei Items nicht beruecksichtigt
## wird und 

## (ii) diese Skalescores dann mit dem uebrig
## gebliebenen Item korreliert.


## Vergleicht die Werte mit den unkorrigierten
## Trennschaerfen


## Hinweis: In Aufgabe 4 habt ihr Trennschaerfen in
## Bezug auf die Subskala Eitelkeit bestimmt. Es ist
## auch moeglich und ueblich Trennschaerfen in Bezug
## zur Gesamtskala zu bestimmen. Das machen wir in
## Aufgabe 5.


## Aufgabe 5

## Bestimmt fuer Items 15, 19 und 29 (also die Items
## der Eitelkeits-Skala) die korrigierten
## Trennschaerfen wie in Aufgabe 4 (c), dieses Mal
## jedoch in Bezug zum Summenscore ueber die
## Gesamtskala.




## Aufgabe 6

## Haben Maenner in allen Subskalen im Mittel
## signifikant hoehere Wert?
