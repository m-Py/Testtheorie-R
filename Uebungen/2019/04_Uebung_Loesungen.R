
##############
## Termin 4 ##
##############

## Wir arbeiten heute mit dem Technophobie-Datensatz
## weiter.

tp <- read.csv("technophobie.csv")

## TP1 Irgendwie fuehle ich mich einfach aengstlich,
##     wenn ich auf einen Computer zugehe.

## TP2 Computer regen mich auf.

## TP3 Ich denke, die meisten Leute koennen einen
##     Computer besser bedienen als ich.

## TP4 Ich fuehle mich frustriert, wenn ich einen
##     Computer benutze.

## TP5 Wenn ich an Computer denke, werde ich nervoes.

## TP6 Computer schuechtern mich ein.

## TP7 Ich bin dagegen, dass Computer unser
##     alltaegliches Leben so bestimmen.

## TP8 Ich habe mehr Vertrauen zu einem Menschen als zu
##     einem Computer.

## TP9 Die Geldangelegenheiten von Menschen sollten
##     nicht von Computern erledigt werden.

## TP10 Ich fuehle mich wohl, wenn ich Computer benutze. (-)

## TP11 Computer machen den Alltag einfacher. (-)

## TP12 Ich finde es angenehm, dass Computer so bequem
##      sind. (-)

## Antworten wurden auf einer Likert-Skala mit 5
## Abstufungen gegeben; diese hatte an den Extremwerten
## die Beschriftungen "Trifft keinesfalls zu" (= 1) und
## "Trifft stark zu" (= 5). Items 10 - 12 sind negativ
## gepolt, d.h. hier zeigt staerkere Zustimmung
## *weniger* Technophobie an.

## ---



#############################################
##               Aufgabe 0                 ##
## Relative Anteile kategorialer Variablen ## 
##          Die Funktion table()           ##
#############################################

## (a) Wie kann ich mir die Verteilung des Geschlechts
## ausgeben lassen?

sum(tp$geschlecht == "weiblich")
sum(tp$geschlecht == "maennlich")
mean(tp$geschlecht == "weiblich")
mean(tp$geschlecht == "maennlich")

## Alternative: die Funktion table()
table(tp$geschlecht)

## (b) Wie bekomme ich den relativen Anteil, wenn ich
## die Funktion table verwende? [Hinweis: Die Ausgabe
## von table verhaelt sich wie ein Vektor]
table(tp$geschlecht) / nrow(tp)

## Kreuztabelle -- verknuepfe zwei kategoriale Variablen
table(tp$geschlecht, tp$TP1)

## (c) Wie bekomme ich die relativen
## Antwortverteilungen nach Geschlecht? (Das machen wir
## nicht mit der Funktion table, sondern einfach mit
## logischen Vektoren, wie wir es schon kennen)

ist_weiblich <- tp$geschlecht == "weiblich"
table(tp$TP1[ist_weiblich]) / sum(ist_weiblich)
table(tp$TP1[!ist_weiblich]) / sum(!ist_weiblich)



##############################
##        Aufgabe 1         ##
## Verteilung der Antworten ##
##############################

## (a) Wie viele Personen haben beim Item "Computer
## schuechtern mich ein." eher ihre Zustimmung
## signalisiert, also eine 4 oder 5 angegeben. Welchem
## relativen Anteil entspricht das?

sum(tp$TP6 >= 4)
mean(tp$TP6 >= 4) ## es war eine Online-Studie ;-)

## (b) Gebt die Alterswerte der Personen aus, die beim
## Item "Computer schuechtern mich ein." eher ihre
## Zustimmung signalisiert haben. Berechnet den
## mittleren Wert des Alters dieser Personen und
## vergleicht ihn mit dem Gesamtmittelwert des Alters.

tp$alter[tp$TP6 >= 4]
## uebersichtlicher:
sort(tp$alter[tp$TP6 >= 4])

mean(tp$alter[tp$TP6 >= 4])
mean(tp$alter, na.rm = TRUE)

## (c) Wie viele Personen stimmten eher zu, dass andere
## Personen Computer besser bedienen koennen als sie
## selbst (Item TP3), UND sie sich frustriert fuehlen,
## wenn sie einen Computer benutzen (Item TP4) - Wert
## von mindestens 4 signalisiert jeweils Zustimmung.

sum(tp$TP3 >= 4 & tp$TP4 >= 4)

###############
## Aufgabe 2 ##
###############

## Die Items sind unterschiedlich gepolt: Bei manchen
## Items bedeutet Zustimmung eine hohe Auspraegung in
## der jeweiligen Eigenschaft (Items 1-9), bei manchem
## Items eine niedrige (Items 10-12). Um eine
## Gesamtsumme fuer die Technophobie-Skala zu
## bestimmen, muessen die Itemwerte in die selbe
## Richtung interpretierbar sein. Das heisst, dass wir
## fuer die negativ gepolten Items (hoher Wert =
## niedrige Auspraegung) wie folgt eine Invertierung
## der Werte durchfuehren:

## 1 -> 5
## 2 -> 4
## 3 -> 3
## 4 -> 2
## 5 -> 1

## Diese Umpolung kann man mit der folgenden Formel
## duchfuehren (Der hoechste Skalenwert ist hier 5):

## Invertierter Wert = Ursprungswert * (-1) + Hoechster Skalenwert + 1

## (a) Berechnet invertierte Itemwerte fuer alle
## negativ gepolten Items. Haengt die berechneten
## Vektoren als Spalte an den data.frame in der Variablen tp an.

tp$TP10_inv <- tp$TP10 * (-1) + 6
tp$TP11_inv <- tp$TP11 * (-1) + 6
tp$TP12_inv <- tp$TP12 * (-1) + 6

## (b) Berechnet einen Gesamt-Summenwert ueber alle 12
## Items (das heisst= Pro Person ein Technophobie-
## Summenwert; haengt diesen Summenwert als Spalte an 
## den data.frame tp an)

tp$sum <- tp$TP1 + tp$TP2 + tp$TP3 + tp$TP4 + tp$TP5 +
  tp$TP6 + tp$TP7 + tp$TP8 + tp$TP9 + tp$TP10_inv +
  tp$TP11_inv + tp$TP12_inv

## (c) Erstellt ein Histogram des Summenwerts.

hist(tp$sum)

###########################
##       Aufgabe 3       ##
## Ernsthafte Teilnahmen ##
###########################

## (a) Gibt es Personen, die allen Aussagen vollkommen
## zugestimmt haben? Wenn ja, welche Fallnummern
## gehoeren zu diesen Personen?

durchgeklickt <- (tp$TP1 + tp$TP2 + tp$TP3 + tp$TP4 +
    tp$TP5 + tp$TP6 + tp$TP7 + tp$TP8 + tp$TP9 +
    tp$TP10 + tp$TP11 + tp$TP12) == (12 * 5)

sum(durchgeklickt)
tp$casenum[durchgeklickt]

## Wir lernen bald Moeglichkeiten kennen, wie man nicht
## alle Spalten einzeln anwaehlen muss, um solche
## Operationen durchzufuehren

## (b) Gibt es Personen, die andere Formen des
## (vermutlich) nicht ernsthaften Antwortens gezeigt
## haben, also bspw. immer denselben Wert angekreuzt
## haben?

sum(tp$TP1 == tp$TP2 &
    tp$TP2 == tp$TP3 &
    tp$TP3 == tp$TP4 &
    tp$TP4 == tp$TP5 &
    tp$TP5 == tp$TP6 &
    tp$TP6 == tp$TP7 &
    tp$TP7 == tp$TP8 &
    tp$TP8 == tp$TP9 &
    tp$TP9 == tp$TP10 &
    tp$TP10 == tp$TP11 &
    tp$TP11 == tp$TP12)

## So geht es in einer Zeile; aber was hier passiert 
## ist bei weitem nicht trivial (dieser Code muss also 
## nicht verstanden werden)
Reduce("&", lapply(tp[, paste0("TP", 2:12)], function(x) tp$TP1 == x))

## Uff, das ist nicht so praktisch; wir haetten gerne
## die Moeglichkeit solche Operationen einfacher direkt
## auf ganze data.frames anzuwenden

##############################
##         Aufgabe 4        ##
## Inter-Item-Korrelationen ##
##############################

## De Funktion `cor()` berechnet die Korrelation
## zwischen den Antworten in zwei Items, nimmt also als
## Argumente zwei numerische Vektoren entgegen.

## (a) Berechnet die Korrelation zwischen den Items TP5
## und TP6.
cor(tp$TP5, tp$TP6)

## Wie ist diese Korrelation zu interpretieren? (schaut
## euch an, wie die Items formuliert sind)

## (b) Berechnet die Korrelation zwischen den Items TP5
## und TP8.
cor(tp$TP5, tp$TP8)

## (c) Berechnet die Korrelation zwischen den Items TP2
## und TP10. Nutzt einmal das invertierte und einmal
## das nicht-invertierte Item 10. Korreliert auch Item
## 10 mit dem invertierten Item 10.
cor(tp$TP2, tp$TP10)
cor(tp$TP2, tp$TP10_inv)
cor(tp$TP10, tp$TP10_inv)

