
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


## (b) Wie viele Faelle hat der in Aufgabenteil (a)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?



## (c) Erstellt einen data.frame, der alle Personen
## enthaelt, die in mindestens einer der 3 dunklen
## Eigenschaften ueber dem Median liegen



## (d) Wie viele Faelle hat der in Aufgabenteil (c)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?



## (e) Erstellt einen data.frame, der alle Personen
## enthaelt, die in allen der 3 dunklen Eigenschaften
## ueber dem Median liegen



## (f) Wie viele Faelle hat der in Aufgabenteil (e)
## erstellte data.frame? Welchem relativen Anteil im
## Verhaeltnis zur Gesamtstichprobe antspricht das?



###############
## Aufgabe 2 ##
###############

## Berechnet einen t-Test, der den Werte in Psychopathie,
## Machiavellismus und Narzissmus zwischen maennlichen
## und weiblichen Teilnehmerinnen vergleicht.
## Befolgt dazu die folgende Anleitung.

## (a) Erstellt einen data.frame, der die maennlichen 
## Teilnehmer enthaelt und einen data.frame, der die 
## weiblichen Teilnehmerinnen enthaelt.



## (b) Die Funktion t.test nimmt als Argumente zwei 
## numerische Vektoren an. Nutzt die in Aufgabenteil 
## (a) erstellten data.frames, um die Summenwerte 
## fuer Psychopathie, Machiavellismus und Narzissmus
## der maennlichen und weiblichen Teilnehmerinnen 
## mit der Funktion t.test zu vergleichen.



## (c) Rechnet noch einmal den t.test. Lest dieses Mal
## per Vektorauswahl die Summenwerte der maennlichen und 
## weiblichen Teilnehmerinnen direkt aus dem data.frame
## nn aus - nutzt *nicht* die in Aufgabenteil (a) 
## erstellten data.frames.




#########################
## Die Funktion subset ##
#########################

## Die Funktion subset erlaubt uns logische Bedingungen 
## fuer die Zeilenauswahl zu formulieren, ohne die 
## $-Notation zu verwenden:

subset(nn, )

subset(nn, Psychopathie > 13)

## Aequivalent: 
nn[nn$Psychopathie > 12, ]

## Bei logischen Verknuepfungen kann das recht angenehm sein:

nrow(subset(nn, Psychopathie > median(nn$Psychopathie)&
       Machiavellismus > 10 & Narzissmus > 10))

## Die Ausgabe der Funktion subset ist immer ein data.frame. 
## Sie funktioniert Aehnlich wie die [.,.]-Notation, aber 
## vereinfacht manche Zugriffe.


## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum", und "alter" der ueber 50 jaehrigen
## enthaelt:

bla2 <- subset(nn, alter > 50, c("casenum", "alter"))

bla <- subset(nn, select = c(casenum, alter))

## (Merke: Hier musste ich das Argument zur Auswahl der
## Spalten benennen!)

## Erklaerung: Argumente in Funktionen haben Namen
## (siehe Skript Kapitel 3.4) Ich kann Argumente anhand ihrer
## Position oder ihres Namens ansteuern. Wir haben
## Namen schon verwendet: etwa `na.rm` in mean().

## In subset gibt es drei Argumente mit den folgenden
## Namen:

# 1. x: ein data.frame
# 2. subset: Ein logischer Ausdruck, der die Faelle auswaehlt
# 3. select: Die Namen der Spalten, die wir auswaehlen wollen

## Deswegen funktionieren folgende Aufrufe, die
## aequivalent zu oben sind:

subset(nn, select = c("casenum", "alter"), subset = alter > 50)

subset(select = c("casenum", "alter"), x = nn, subset = alter > 50)

subset(subset = alter > 50, select = c("casenum", "alter"), x = nn)


head(subset(nn, select = -c(alter, casenum)))

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

## "Standard"-Evaluation:

# subset(nn, nn$geschlecht == "weiblich")
# subset(nn, select = c("alter", "geschlecht"))

# - Argument subset ist logischer Vektor (der auch auﬂerhalb
#   der Funktion ein logischer Vektor waere)
# - Argument select ist vektor vom Typ character, der
#   die Spalten per Name ausw‰hlt

## "Nicht-Standard"-Evaluation:

subset(nn, geschlecht == "weiblich")
subset(nn, select = c(alter, geschlecht))
subset(nn, select = -c(alter, geschlecht))
subset(nn, select = PF18_01:PF18_09)
