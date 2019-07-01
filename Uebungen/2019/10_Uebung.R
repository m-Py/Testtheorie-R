
####################
## Recap Termin 9 ##
####################

## Daten einlesen & fehlende Werte ausschließen
npi <- read.csv("data_npi.csv")
temp <- npi[, paste0("Q", 1:40)]
temp[temp == 0] <- NA
npi <- npi[complete.cases(temp), ]
rm(temp)

#############################
## Umkodierung aller Items ##
#############################

## Betrachtet und fuehrt den folgenden Code aus -- er
## muss nicht verstanden werden, aber ueberlegt, was
## passiert.

## Schluessel aller 40 Items in einen Vektor
keys <- c(1, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 2, 2, 2,
          1, 2, 2, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 2)

## Hier wird eine Rekodierung fuer alle 40 Items
## durchgefuert. Dieser Code muss nicht verstanden
## werden.

## (FYI: npi[["Q1"]] ist dasselbe wie npi$Q1)
for (i in 1:40) {
  colname <- paste0("Q", i)
  npi[[paste0("score_", colname)]] <- ifelse(npi[[colname]] == keys[i], 1, 0)
}

## Betrachtet die Tabelle npi:
head(npi)

###############
## Aufgabe 4 ##
###############

## Berechnet aus den rekodierten Items einen
## Summenscore und prueft, ob eure Wert mit der Spalte
## `score` uebereinstimmen.
items <- paste0("score_Q", 1:40)
my_score <- rowSums(npi[, items])
sum(my_score == npi$score) == nrow(npi)

###############
## Aufgabe 5 ##
###############

## Berechnet fuer die anderen 6 Subskalen nach Raskin
## und Terry (1988) Summenwerte. Entnehmt die
## Zugehoerigkeit der Items zu Subskalen aus dem
## Codebuch, oder der Tabelle 1 aus dem Paper von
## Schuetz Marcus, und Sellin (2004).

## Hinweis 1: Nutzt wiederum die [.,.]-Notation (oder
## subset) und rowSums.

## Hinweis 2: Speichert die Subskalen-Summenwerte als
## Spalten des npi data.frames ab

## 1. Speichere die Namen der Spalten der
##    Subskalen-Items in Variablen
authority        <- paste0("score_Q", c(1, 8, 10, 11, 12, 32, 33, 36))
selfSufficiency  <- paste0("score_Q", c(17, 21, 22, 31, 34, 39))
superiority      <- paste0("score_Q", c(4, 9, 26, 37, 40))
exhibitionism    <- paste0("score_Q", c(2, 3, 7, 20, 28, 30, 38))
exploitativeness <- paste0("score_Q", c(6, 13, 16, 23, 35))
vanity           <- paste0("score_Q", c(15, 19, 29))
entitlement      <- paste0("score_Q", c(5, 14, 18, 24, 25, 27))

## 2. Erstelle Subskalensummenwerte
npi$Authority        <- rowSums(npi[, authority])
npi$SelfSufficiency  <- rowSums(npi[, selfSufficiency])
npi$Superiority      <- rowSums(npi[, superiority])
npi$Exhibitionism    <- rowSums(npi[, exhibitionism])
npi$Exploitativeness <- rowSums(npi[, exploitativeness])
npi$Vanity           <- rowSums(npi[, vanity])
npi$Entitlement      <- rowSums(npi[, entitlement])


###############
## Aufgabe 6 ##
###############

## Stellt die Korrelationen zwischen den sieben
## Subskalen in einer Tabelle dar (auf zwei
## Nachkommastellen gerundet).

subscales <- c("Authority", "SelfSufficiency",
               "Superiority", "Exhibitionism",
               "Exploitativeness", "Vanity",
               "Entitlement")

round(cor(npi[, subscales]), 2)



###############
## Termin 10 ##
###############

## Hinweis: Der data frame npi enthaelt nun viele
## Spalten, die mit R erst aus den Originaldaten 
## abgeleitet wurden. Außerdem enthaelt er nur die
## Daten von Personen, die im Rohdatensatz keine
## fehlende Antwort hatten. Diese Bearbeitungen
## muessten wir jedes Mal wiederholen, wenn wir in
## einer neuen R-Session mit dem Datensatz
## psychometrische Auswertungen durchfuehren wollen --
## die Textdatei "data_npi.csv" enthaelt weiterhin nur
## die Rohdaten. Es gibt (mindestens) drei
## Moeglichkeiten damit umzugehen:

## (1) Wir schreiben die Berechnungen in jede
## R-Skript-Datei nach ganz oben, in der wir Analysen
## mit dem Datensatz rechnen wollen. Das machen wir im
## Moment; in jeder Uebung haben wir die Befehle am
## Kopf der Uebungsdatei. Das ist aber unbefriedigend.

## (2) Wir schreiben alle R-Befehle, die wir zum
## Bearbeiten der Daten nutzen, in eine separate
## R-Skript-Datei, die wir in unser RStudio-Projekt
## gemeinsam mit den Daten ablesen. Unsere
## tatsaechliche Analyse (t-Tests, Korrelationen,
## Reliabilitaeten etc) schreiben wir in andere
## R-Skripte, an deren Kopf wir die Bearbeitungs-Datei
## "laden". Das wuerde wie folgt funktionieren:

source("10_Uebung_Loesungen.R") # fuehrt alle Befehle in Datei aus

## (3) Wir speichern den bearbeiteten Datensatz in
## einer neuen Datei (niemals aendern wir die
## Originaldaten!) ab. Das geht beispielsweise so
## (diese Funktion zum Schreiben von Daten auf den
## Computer muessen wir uns nicht merken, aber es ist
## wichtig zu wissen, dass das funktioniert):

write.table(
  npi, # welche Daten abspeichern
  file = "npi_bearbeitet.csv", # wie heisst die neue Datei
  row.names = FALSE, # die Zeilennummer ist keine zusaetzliche Spalte
  sep = ",", # welches Zeichen trennt die Spalten in der Textdatei
  col.names = TRUE # Die Spaltennamen sind die erste Zeile in der Textdatei
)

## Diese Datei koennen wir wiederum laden und haben den
## bearbeiteten Datensatz. Loeschen wir zunaechst alle
## bestehenden Variablen:

rm(list = ls())
## ... und lesen den bearbeiteten Datensatz ein:
npi <- read.csv("npi_bearbeitet.csv")

## Es ist persoenliche Praeferenz, ob man Variante (2)
## oder (3) bevorzugt.  In *jedem* Fall ist es
## wuenschenswert, separate R-Skripte (a) zum
## Bearbeiten von Daten und (b) fuer die Auswertung
## der Daten anzulegen. Ein einziges grosses Skript, 
## das jeglichen Code eines Projekts enthaelt, ist 
## nicht zu empfehlen.




######################################
## Thema heute: Item-Trennschaerfen ##
######################################

###############
## Aufgabe 1 ##
###############

## (a) Erstellt einen data.frame, der aus den Items der
## Eitelkeits-Skala (Vanity) und dem Gesamtscore der
## Eitelkeits-Skala besteht


## (b) Wendet die Funktion cor auf den im letzten
## Aufgabenteil erstellten data.frame an. (Erinnerung:
## Mit der Funktion round kann man die Ausgabe besser
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

## (i) ... dreimal einen Summenwert bestimmt, bei dem
## jeweils eines der drei Items nicht beruecksichtigt
## wird

## (ii) ... diese Summenwerte mit dem uebrig
## gebliebenen Item korreliert.


## Vergleicht die Werte mit den unkorrigierten
## Trennschaerfen

## Hinweis: Ihr habt gerade Trennschaerfen in Bezug auf
## die Subskala Eitelkeit bestimmt. Es ist auch
## moeglich und ueblich Trennschaerfen in Bezug zur
## Gesamtskala zu bestimmen. Das machen wir in Aufgabe
## 2.
