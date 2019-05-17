
##############
## Termin 6 ##
##############

## Heute lernen wir einen weiteren Datensatz kennen:
## "Die Niedertraechtigen Neun"

## Zunaechst laden wir die Datentabelle ein. Sie
## enthaelt Antworten von 409 Teilnehmenden einer
## Online-Untersuchung. Das sind dieselben Teilnehmer,
## von denen wir auch schon Antworten auf die
## Technophobie-Skala kennen. (Dafuer muessen wir alle
## ein R-Studio Projekt anlegen, damit R-Studio weiss,
## wo es nach der Datei, die die Daten enthaelt, suchen
## muss.)

nn <- read.csv("niedertraechtige_neun.csv")
head(nn)

## Die Zuordnung von Spaltennamen zu Items koennt ihr
## der Datei "Codebuch_NN.txt" entnehmen. Oeffnet diese
## Datei in RStudio, indem ihr unten rechts auf sie
## klickt. Sie wird unten rechts im Panel des Ordners
## eures RStudio Projekts angezeigt.

###############
## Aufgabe 0 ##
###############

## Lest das Codebuch.

###############
## Aufgabe 1 ##
###############

## Berechnet folgende Test-Summenwerte und haengt sie
## an den data.frame nn an:

## (a) Machiavellismus

## (b) Psychopathie

## (c) Narzissmus

###############
## Aufgabe 2 ##
###############

## (a) Waehlt aus dem data.frame nn die 9 Spalten mit
## den Items zu den Niedertraechtigen Neun aus;
## speichert die Auswahl in einer neuen Variablen.


## (b) Berechnet einen Summenscore fuer die gesamte
## Dunkle Triade (also ueber alle 9 Items). Nutzt
## dafuer den data.frame aus Aufgabenteil (a).
## Speichert den Summenscore als Spalte von nn ab.


## (c) Bestimmt die Korrelationen zwischen allen 9
## Items. Nutzt dafuer den data.frame aus Aufgabenteil
## (a). Korrelieren die Items einer Skala jeweils
## staerker untereinander als mit den Items der anderen
## Skalen? (Beantwortet diese Frage einfach durch 
## Betrachtung der Korrelationsmatrix)



## (d) Bestimmt die Zustimmungsraten
## ("Item-Schwierigkeiten") zu allen Items. Nutzt
## dafuer den data.frame aus Aufgabenteil (a). Zu
## welchem Item war die Zustimmung am hoechsten /
## niedrigsten?


##################
## Bonusaufgabe ##
##################

## Gibt es wieder eine Person, die in allen Items die 
## volle Zustimmung angegeben hat? Ist es dieselbe Person,
## die auch im Technophobie-Datensatz allen Items voll
## zugestimmt hat?
