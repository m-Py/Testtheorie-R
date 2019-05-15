
##############
## Termin 5 ##
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


## Wir berechnen direkt am Anfang invertierte Items und
## den Gesamtwert

tp$TP10i <- tp$TP10 * (-1) + 6
tp$TP11i <- tp$TP11 * (-1) + 6
tp$TP12i <- tp$TP12 * (-1) + 6
tp$sum <- tp$TP1 + tp$TP2 + tp$TP3 + tp$TP4 + tp$TP5 +
    tp$TP6 + tp$TP7 + tp$TP8 + tp$TP9 + tp$TP10i +
    tp$TP11i + tp$TP12i


########################
## Die Funktion cor() ##
########################

## De Funktion `cor()` berechnet die Korrelation
## zwischen den Antworten in zwei Items, nimmt also als
## Argumente zwei numerische Vektoren entgegen.

cor(tp$TP1, tp$TP2)
cor(tp$TP5, tp$TP10)
cor(tp$TP5, tp$TP10i)
cor(tp$TP10, tp$TP10i)

## In R koennen wir manchmal dieselbe Funktion mit
## verschiedenem Input nutzen, etwa: eine Funktion
## nimmt entweder einen Vektor oder einen data.frame
## an.

## Die Funktion cor() funktioniert auch auf einem
## ganzen data.frame; dann werden zwischen allen
## Spalten (die ja Vektoren sind) paarweise
## Korrelationen berechnet. Die Ausgabe ist eine
## Korrelationsmatrix.  Wir wuerden das bevorzugen
## anstatt fuer alle 12 Items paarweise die Funktion
## cor() neu aufzurufen [wer wissen will wie viele
## Moeglichkeiten es dafuer gibt: choose(12, 2)]

## Wir moechten also wissen, wie wir alle Spalten aus
## dem data.frame tp auswaehlen koennen, die Items
## enthalten (bzw. Items mit derselben Polung) -> wir
## lernen die [.,.]-Notation kennen.

## Aber zunaechst: Vektoren vom Typ character

## Angeben mit einfachen oder doppelten
## Anfuehrungszeichen

"Cronbach"
mein_text <- 'alpha'
c("weiblich", "maennlich")

## Wir nutzen Text vor allem, um Spalten aus
## data.frames auszuwaehlen

tp[, "alter"]  # ein Vektor

## Man kann vor dem Komma auch Zeilen auswaehlen 
## (dazu unten auch mehr)
tp[1:3, 1:2] # ein data.frame
tp[c(1, 4, 5), ]

## Achtung: $-Notation funktioniert nicht mit einem
## Vektor vom Typ character; hier kann der Spaltenname
## ohne Anfuehrungszeichen angegeben werden
tp$alter # aequivalent zu tp[, "alter"] 


###########################
## Die Funktion paste0() ##
###########################

## Erstellt einen character Vektor, indem sie
## verschiedene Vektoren zusammengefuegt, etwa:

paste0("item_", 1:10)

## Sollte ich Items aus nur einer Subskala auswaehlen
## wollen:
paste0("TP", c(1, 4, 7))


###############
## Aufgabe 1 ##
###############

## (a) Erstellt einen Vektor, der die Spaltennamen
## aller positiv gepolten Items enthaelt (also fuer die
## Items 10, 11, 12 muss der Name der invertierten
## Spalte enthalten sein). Nutzt dabei die Funktion
## paste0.

# 2 aequivalente Moeglichkeiten:
paste0("TP", c(1:9, "10i", "11i", "12i"))
spaltennamen <- c(paste0("TP", 1:9), paste0("TP", 10:12, "i"))

## (b) Waehlt die Spalten mit der [.,.]-Notation aus
## und speichert die Ausgabe in einer
## Variablen. Betrachtet den data.frame

items <- tp[, spaltennamen]

## (c) Wendet die Funktion cor() auf die Variable an,
## die ihr in Aufgabenteil (b) gespeichert habt und
## betrachtet die Ausgabe

cor(items)

## (d) Die Funktion round macht Output von Zahlen etwas
## lesbarer. Das erste Argument fuer round sind Daten,
## in denen Zahlen gerundet werden sollen; das zweite
## Argument ist die Zahl der Nachkommastellen, die
## angegeben werden sollen. Nutzt round, um die
## Korrelationsmatrix aus Aufgabenteil (c) besser
## lesbar zu machen.

round(cor(items), 2)

## (e) Zwischen welchen Items findet sich die staerkste
## Korrelation und zwischen welchen Items die
## schwaechste? Kopiert diese Item-Paare von oben
## hierhin und beschriftet sie im Kommentar mit der
## Korrelation. Um die AUfgabe zu loesen, beachtet:
## Auf die Korrelationsmatrix aus Aufgabe (c) koennt
## ihr alle Operationen anwenden, die ihr auch auf 
## Vektoren anwenden koennt (etwa min, max ...).

min(cor(items))
cor(items) == min(cor(items))

max(cor(items)) # die Diagonale macht uns Probleme

# Ersetze alle Werte auf der Diagonalen durch 0 -
# 0 ist definitiv nicht das Maximum:
cor_matrix <- cor(items)
cor_matrix[cor_matrix == 1] <- 0

cor_matrix == max(cor_matrix)
max(cor_matrix)

## r = .76
## TP5 Wenn ich an Computer denke, werde ich nervoes.
## TP6 Computer schuechtern mich ein.

## r = .14
## TP8 Ich habe mehr Vertrauen zu einem Menschen als zu
##     einem Computer.
## TP11 Computer machen den Alltag einfacher. (-)


# Hinweis: Diese Aufgabe (e) ist ein zusaetzliches Gimmick;
# Wir lernen darin, dass vektorisierte Operationen - wie 
# das logische Gleich, min, max und die Ersetzung von 
# Elementen - sogar auf eine ganze Korrelationsmatrix 
# anwendbar sind. Hier zeigt sich erneut die Staerke,
# die uns R per Vektorisierung bietet.



## (f) Die Funktion rowSums berechnet zeilenweise die
## Summe in einem data.frame. Wendet sie auf den
## data.frame an, den ihr in Aufgabenteil (b) erstellt
## habt.

rowSums(items)

## Was habt ihr gerade berechnet? Wir koennt ihr die
## Berechnung validieren?

# Pro Person einen Summenscore fuer Technophobie

# Validierung anhand der Berechnung von tp$sum, 
# die wir schon oben gemacht haben:
rowSums(items) == tp$sum
## Oder:
sum(rowSums(items) == tp$sum) == nrow(tp)


## (g) Die Funktion colMeans berechnet spaltenweise den
## Mittelwert in einem data.frame. Wendet sie auf den
## data.frame an, den ihr in Aufgabenteil (b) erstellt
## habt.

colMeans(items)

## Was habt ihr gerade berechnet?

# Die Itemschwierigkeit, d.h. die mittlere 
# Zustimmungsrate zu den Items 
# ["Schwierigkeit" ist hier technisch, 
# nicht woertlich zu verstehen]


###############
## Aufgabe 2 ##
###############

## Erstellt mithilfe des `:`-Operators, der [ ] Negativ
## Auswahl und der Funktion paste0() den folgenden
## Vektor:

c("TP1", "TP2", "TP4", "TP5", "TP6", "TP8")

namen <- paste0("TP", 1:8)
namen[c(3, 7)]
paste0("TP", 1:8)[-c(3, 7)]


########################
## Auswahl von Zeilen ##
########################

## Vor dem Komma kann man in der [.,.]-Notation kann
## man angeben, welche Zeilen man aus einem data.frame
## auswaehlen will. Beispielsweise:

tp[1:10, ]
tp[200:190, ]

## Man kann - unter anderem - mit einem numerischen
## oder logischen Vektor Zeilen auswaehlen. Dabei gelten
## dieselben Regeln wie bei der Auswahl per [.] fuer
## Vektoren. Uns interessiert oftmals eine Auswahl
## anhand einer logischen Bedingung:

tp[tp$alter < 18, ] # huch, was ist mit NA?


## Hausaufgabe: Lest den Abschnitt zur [.,.]-Notation
## im Skript (Kapitel 3.3)


###############
## Aufgabe 3 ##
###############


## Erstellt zwei data.frames, die ihr in Variablen
## abspeichert:

## 1. Ein data.frame, der alle weiblichen
##    Teilnehmerinnen enthaelt
## 2. Ein data.frame, der alle maennlichen Teilnehmer
##    enthaelt

weiblich  <- tp[tp$geschlecht == "weiblich", ]
maennlich  <- tp[tp$geschlecht == "maennlich", ]
