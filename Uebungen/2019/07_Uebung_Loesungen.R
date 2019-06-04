
##############
## Termin 7 ##
##############

## Wir arbeiten weiter mit dem Datensatz zu den
## "Niedertraechtigen Neun"

nn <- read.csv("niedertraechtige_neun.csv")
nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
nn$Psychopathie <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
nn$Narzissmus <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09
nn$DunkleTriade <- nn$Machiavellismus + nn$Psychopathie + nn$Narzissmus

###############
## Aufgabe 1 ##
###############

## (a) Erstellt einen data.frame, der alle Faelle
## enthaelt, deren Gesamt-Summenwert fuer die Dunkle
## Triade ueber dem Median liegen. Speichert diesen
## data.frame in einer neuen Variablen ab.

dark <- nn[nn$DunkleTriade > median(nn$DunkleTriade), ]

## (b) Wie viele Faelle hat der in Aufgabenteil (a)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?

nrow(dark)
nrow(dark) / nrow(nn)

## (c) Erstellt einen data.frame, der alle Personen
## enthaelt, die in mindestens einer der 3 dunklen
## Eigenschaften ueber dem Median liegen

somewhat_dark <- nn[nn$Psychopathie > median(nn$Psychopathie) | 
                      nn$Narzissmus > median(nn$Narzissmus) | 
                      nn$Machiavellismus > median(nn$Machiavellismus), ]

## (d) Wie viele Faelle hat der in Aufgabenteil (c)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?

nrow(somewhat_dark)
nrow(somewhat_dark) / nrow(nn)

## (e) Erstellt einen data.frame, der alle Personen
## enthaelt, die in allen der 3 dunklen Eigenschaften
## ueber dem Median liegen

highly_dark <- nn[nn$Psychopathie > median(nn$Psychopathie) & 
                    nn$Narzissmus > median(nn$Narzissmus) & 
                    nn$Machiavellismus > median(nn$Machiavellismus), ]

## (f) Wie viele Faelle hat der in Aufgabenteil (e)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?

nrow(highly_dark)
nrow(highly_dark) / nrow(nn)

###############
## Aufgabe 2 ##
###############

## Berechnet einen t-Test, der den Werte in Psychopathie,
## Machiavellismus und Narzissmus miteinander vergleicht.
## Befolgt dazu die folgende Anleitung.

## (a) Erstellt einen data.frame, der die maennlichen 
## Teilnehmer enthaelt und einen data.frame, der die 
## weiblichen Teilnehmerinnen enthaelt.

m <- nn[nn$geschlecht == "maennlich", ]
w <- nn[nn$geschlecht == "weiblich", ]

## (b) Die Funktion t.test nimmt als Argumente zwei 
## numerische Vektoren an. Nutzt die in Aufgabenteil 
## (a) erstellten data.frames, um die Summenwerte 
## der maennlichen und weiblichen Teilnehmerinnen 
## mit der Funktion t.test zu vergleichen.

t.test(m$Machiavellismus, w$Machiavellismus)
t.test(m$Narzissmus, w$Narzissmus)
t.test(m$Psychopathie, w$Psychopathie)

## (c) Rechnet noch einmal den t.test. Lest dieses Mal
## per Vektorauswahl die Summenwerte der maennlichen und 
## weiblichen Teilnehmerinnen direkt aus dem data.frame
## nn aus - nutzt *nicht* die in Aufgabenteil (a) 
## erstellten data.frames.

ist_weiblich <- nn$geschlecht == "weiblich"

t.test(nn$Machiavellismus[ist_weiblich], nn$Machiavellismus[!ist_weiblich])
t.test(nn$Narzissmus[ist_weiblich], nn$Narzissmus[!ist_weiblich])
t.test(nn$Psychopathie[ist_weiblich], nn$Psychopathie[!ist_weiblich])

#########################
## Die Funktion subset ##
#########################

## Die Funktion subset erlaubt uns logische Bedingungen 
## fuer die Zeilenauswahl zu formulieren, ohne die 
## $-Notation zu verwenden:

subset(nn, Psychopathie > 12)

## Aequivalent: 
nn[nn$Psychopathie > 12, ]

## Bei logischen Verknüpfungen kann das recht angenehm sein:

subset(nn, Psychopathie > 10 & Machiavellismus > 10 & Narzissmus > 10)

## Die Ausgabe der Funktion subset ist immer ein data.frame. 
## Sie funktioniert Aehnlich wie die [.,.]-Notation, aber 
## vereinfacht manche Zugriffe.


###########################
## Die Funktion subset() ##
###########################

## Mit der Funktion subset() koennen wir aus
## `data.frames` Zeilen (also Faelle), und Spalten
## (also Messvariablen, etc) auswaehlen.

## Folgendes speichert einen `data.frame` ab, der nur
## die Faelle der weiblichen Teilnehmerinnen enthaelt
## (nutzt logischen Vergleich zur Fallauswahl!)

female <- subset(nn, geschlecht == "weiblich")

## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum" und "alter" enthaelt:

bla <- subset(nn, select = c("casenum", "alter"))

## (Merke: Hier musste ich das Argument zur Auswahl der
## Spalten benennen!)

## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum", und "alter" der ueber 50 jaehrigen
## enthaelt:

bla2 <- subset(nn, alter > 50, select = c("casenum", "alter"))

## Wichtig: Achtet hier darauf, dass ich bei "alter >
## 5" auf die Spalte "alter" zugreifen kann, ohne die
## $-Notation zu verwenden! (Das ist auch unten in den
## Uebungen relevant)

## Erklaerung: Argumente in Funktionen haben Namen
## (siehe Skript Kapitel 3.4) Ich kann Argumente anhand ihrer
## Position oder ihres Namens ansteuern. Wir haben
## Namen schon verwendet: etwa `na.rm` in mean().

## In subset gibt es drei Argumente mit den folgenden
## Namen:

# 1. x: ein data.frame
# 2. subset: Ein logischer Ausdruck, der die Faelle auswaehlt
# 3. select: Die Namen der Zeilen, die wir auswaehlen wollen

## Deswegen funktionieren folgende Aufrufe, die
## aequivalent zu oben sind:

subset(nn, select = c("casenum", "alter"), subset = alter > 50)

subset(select = c("casenum", "alter"), x = nn, subset = alter > 50)

subset(subset = alter > 50, select = c("casenum", "alter"), x = nn)

## Das Argument x wuerden wir normalerweise nicht benennen; 
## das erste Argument einer Funktion sind eigentlich immer 
## die Daten, mit denen ich etwas anstellen moechte. Die 
## weiteren Argumente steuern genaue Funktionsweise der Funktion; 
## sie wuerde man eher benennen. [Argumente explizit zu benennen 
## ist oftmals gute Praxis.]


## Bezug zwischen der Funktion subset und der [.,.]-Notation: 
## Argument `subset` entspricht der Auswahl *vor* dem Komma.
## Argument `select` entspricht der Auswahl *nach* dem Komma. 

#################
## Hausaufgabe ##
#################

## 1. Abschnitt 3.4 im Skript zur Funktion subset lesen
## 2. Loest die Aufgaben 7.1, 7.2a, 6.2a mit der Funktion subset 
##    statt der [.,.]-Notation [lies: 6.2a = Aufgabenblatt 6, Aufgabe 2a]
