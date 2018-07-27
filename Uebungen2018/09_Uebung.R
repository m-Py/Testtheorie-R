
## Testtheorie mit R Termin 9 - 28.06.2018

## Themen: Korrelation zwischen Subskalen und Item-Trennschaerfen

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

## Aufgabe 1

## Berechnet fuer die 7 Subskalen nach Raskin und Terry
## (1988) Summenwerte. (Entnehmt die Zugehoerigkeit der
## Items zu Subskalen aus dem Codebuch, oder der
## Tabelle 1 aus dem Paper von Schuetz Marcus, und
## Sellin (2003)).

## Hinweis 1: Nutzt wiederum paste0, subset und
## rowSums.

## Hinweis 2: Speichert die Vektoren, die ihr dem select
## Argument der Funktion subset uebergebt, in einer
## Variable zwischen.

## Hinweis 3: Speichert die Subskalen-Summenwerte als
## Spalten des npi data.frames ab



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


