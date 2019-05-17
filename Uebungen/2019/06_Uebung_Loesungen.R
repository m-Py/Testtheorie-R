
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
nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
## Aequivalent: 
nn$Machiavellismus <- rowSums(nn[, paste0("PF18_0", c(1, 4, 7))])

## (b) Psychopathie
nn$Psychopathie <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
## Aequivalent: 
nn$Psychopathie <- rowSums(nn[, paste0("PF18_0", c(2, 5, 8))])

## (c) Narzissmus
nn$Narzissmus <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09
## Aequivalent: 
nn$Narzissmus <- rowSums(nn[, paste0("PF18_0", c(3, 6, 9))])

###############
## Aufgabe 2 ##
###############

## (a) Waehlt aus dem data.frame nn die 9 Spalten mit
## den Items zu den Niedertraechtigen Neun aus;
## speichert die Auswahl in einer neuen Variablen.

items <- nn[, paste0("PF18_0", 1:9)]
## Aequivalent: 
items <- nn[, c("PF18_01", "PF18_02", "PF18_03", "PF18_04", 
                "PF18_05", "PF18_06", "PF18_07", "PF18_08", "PF18_09"), ]

## (b) Berechnet einen Summenscore fuer die gesamte
## Dunkle Triade (also ueber alle 9 Items). Nutzt
## dafuer den data.frame aus Aufgabenteil (a).
## Speichert den Summenscore als Spalte von nn ab.

nn$DunkleTriade <- rowSums(items)

## Alternativ: 
nn$DunkleTriade <- nn$Machiavellismus + nn$Psychopathie + nn$Narzissmus

## (c) Bestimmt die Korrelationen zwischen allen 9
## Items. Nutzt dafuer den data.frame aus Aufgabenteil
## (a). Korrelieren die Items einer Skala jeweils
## staerker untereinander als mit den Items der anderen
## Skalen? (Beantwortet diese Frage einfach durch 
## Betrachtung der Korrelationsmatrix)

round(cor(items), 2)

# Staerkste Korrelation haben Items derselben Skala 
# untereinander.

## (d) Bestimmt die Zustimmungsraten
## ("Item-Schwierigkeiten") zu allen Items. Nutzt
## dafuer den data.frame aus Aufgabenteil (a). Zu
## welchem Item war die Zustimmung am hoechsten /
## niedrigsten?

sort(round(colMeans(items), 2))

## Hoechste Zustimmung:
## Ich neige dazu, von anderen bewundert werden zu
## wollen. (N)

## Niedrigste Zustimmung:
## Ich neige dazu, mich nicht um die Moral meiner
## Handlungen zu kuemmern. (P)

##################
## Bonusaufgabe ##
##################

## Gibt es wieder eine Person, die in allen Items die 
## volle Zustimmung angegeben hat? Ist es dieselbe Person,
## die auch im Technophobie-Datensatz allen Items voll
## zugestimmt hat?

nn[nn$DunkleTriade == 9 * 5, ]

id_faker <- nn[nn$DunkleTriade == 9 * 5, ]$casenum
tp <- read.csv("technophobie.csv")
tp[tp$casenum == id_faker, ] # got ya!
