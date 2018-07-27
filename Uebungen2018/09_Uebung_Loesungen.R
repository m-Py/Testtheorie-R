
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

## 1. Speichere die Namen der Spalten der
##    Subskalen-Items in Variablen
authority        <- paste0("recode_Q", c(1, 8, 10, 11, 12, 32, 33, 36))
selfSufficiency  <- paste0("recode_Q", c(17, 21, 22, 31, 34, 39))
superiority      <- paste0("recode_Q", c(4, 9, 26, 37, 40))
exhibitionism    <- paste0("recode_Q", c(2, 3, 7, 20, 28, 30, 38))
exploitativeness <- paste0("recode_Q", c(6, 13, 16, 23, 35))
vanity           <- paste0("recode_Q", c(15, 19, 29))
entitlement      <- paste0("recode_Q", c(5, 14, 18, 24, 25, 27))

## 2. Erstelle Subskalensummenwerte
npi$Authority        <- rowSums(subset(npi, select = authority))
npi$SelfSufficiency  <- rowSums(subset(npi, select = selfSufficiency))
npi$Superiority      <- rowSums(subset(npi, select = superiority))
npi$Exhibitionism    <- rowSums(subset(npi, select = exhibitionism))
npi$Exploitativeness <- rowSums(subset(npi, select = exploitativeness))
npi$Vanity           <- rowSums(subset(npi, select = vanity))
npi$Entitlement      <- rowSums(subset(npi, select = entitlement))


## Aufgabe 3

## Stellt die Korrelationen zwischen den sieben Subskalen
## in einer Tabelle dar (auf zwei Nachkommastellen gerundet).

subscales <- c("Authority", "SelfSufficiency",
               "Superiority", "Exhibitionism",
               "Exploitativeness", "Vanity",
               "Entitlement")

round(cor(subset(npi, select = subscales)), 2)


## Aufgabe 4

## (a) Erstellt einen data.frame, der aus den Items
## der Eitelkeits-Skala (Vanity) und dem Gesamtscore
## der Eitelkeits-Skala besteht

## Bitte mal genau ueberlegen, warum der folgende
## Aufruf des select Arguments funktioniert.
vanity_items <- subset(npi, select = c(vanity, "Vanity"))

## (b) Wendet die Funktion cor auf den im letzten
## Aufgabenteil erstellten data.frame an. (Tipp: mit
## der Funktion round kann man die Ausgabe besser
## lesbar machen). Was berechnet ihr so?

round(cor(vanity_items), 2)

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

score1 <- npi$recode_Q19 + npi$recode_Q29
score2 <- npi$recode_Q15 + npi$recode_Q29
score3 <- npi$recode_Q15 + npi$recode_Q19

## (ii) diese Skalescores dann mit dem uebrig
## gebliebenen Item korreliert.

## Trennschaerfe fuer Item 15
cor(score1, npi$recode_Q15)

## Trennschaerfe fuer Item 19
cor(score2, npi$recode_Q19)

## Trennschaerfe fuer Item 29
cor(score3, npi$recode_Q29)

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

score1 <- rowSums(subset(npi, select = paste0("recode_Q", 1:40)[-15])) 
cor(score1, npi$recode_Q15)

score2 <- rowSums(subset(npi, select = paste0("recode_Q", 1:40)[-19]))
cor(score2, vanity_items$recode_Q19)

score3 <- rowSums(subset(npi, select = paste0("recode_Q", 1:40)[-29]))
cor(score3, vanity_items$recode_Q29)

