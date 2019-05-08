
## Praktischer Teil -- Termin 6

## Heute arbeiten wir mit den "Die Niedertraechtigen Neun"
## Datensatz weiter

## Zunaechst laden wir die Datentabelle ein. Sie
## enthaelt Antworten von 409 Teilnehmenden einer
## Online-Untersuchung. Das sind dieselben Teilnehmer,
## von denen wir auch schon Antworten auf die
## Technophobie-Skala kennen. (Dafuer muessen wir alle
## ein R-Studio Projekt anlegen, damit R-Studio weiss,
## wo es nach der Datei, die die Daten enthaelt, suchen
## muss.)

nn <- read.csv("niedertraechtige_neun.csv") # laedt die Daten

## Die Zuordnung von Spaltennamen zu Items koennt ihr
## der Datei "05_Codebuch.txt" entnehmen. Oeffnet diese
## Datei in RStudio, indem ihr unten rechts auf sie
## klickt. Sie wird unten rechts im Panel des Ordners
## eures RStudio Projekts angezeigt.

## Wir wollen direkt auch Scores fuer Psychopathie,
## Machiavellismus und Narzissmus an den data.frame
## anhaengen:

nn$Machiavellismus <- nn$PF18_01 + nn$PF18_04 + nn$PF18_07
nn$Psychopathie    <- nn$PF18_02 + nn$PF18_05 + nn$PF18_08
nn$Narzissmus      <- nn$PF18_03 + nn$PF18_06 + nn$PF18_09
nn$DunkleTriade    <- nn$Machiavellismus + nn$Psychopathie + nn$Narzissmus

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
## (siehe Skript) Ich kann Argumente anhand ihrer
## Position oder ihres Namens ansteuern. Wir haben
## Namen schon verwendet: etwa `na.rm` in mean(), `use`
## in cor(), oder verschiedene Moeglichkeiten Graphiken
## schoener zu machen mit plot() und hist().

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

## Vielleicht hier noch mal bedenken: was passiert,
## wenn ich das Ergebnis von dem subset() Aufruf nicht
## in einer Varialblen speichere -> es ist wichtig zu
## verstehen, was das heisst

##############
## Uebungen ##
##############



## Aufgabe 1

## (a) Erstellt einen `data.frame`, der nur die Spalten
## der Niedertraechtigen Neun Skala enthaelt (speichert
## ihn in einer neuen Variable ab). Nutzt die
## Funktionen subset, paste0 und den
## `:`-Operator. (siehe letztes Uebungsblatt)



## (b) Erstellt einen data.frame, der alle Faelle
## enthaelt, die in der Eigenschaft Psychopathie ueber
## dem Median liegen



## (c) Wie viele Faelle hat der soeben erstellte
## data.frame?



## (d) Erstellt einen data.frame, der alle Faelle
## enthaelt, die in allen drei dunklen Eigenschaften
## ueber dem Median liegen



## (e) Wie viele Faelle enthaelt der soeben erstellte
## data.frame? Wie viel Prozent der Gesamtstichprobe
## sind das?


## (f) Wie ist das Geschlechterverhaeltnis unter den
## dunklen Personen, die wir in (e) ausgewaehlt
## haben. Unterscheidet es sich deskriptiv vom
## Geschlechterverhaeltnis in der Gesamtstichprobe?



#################
## Besprechung ##
#################

## Aufgabe 2

## Die Funktion `cor` kann man auch verwenden, indem
## man ihr einen einzelnen data.frame uebergibt (in dem
## Fall muessen alle Spalten numerisch sein). Dann wird
## einem eine Korrelationsmatrix ausgegeben, die die
## Korrelationen zwischen allen Spalten, d.h. in
## unserem Fall Items, enthaelt. Uebergebt den in
## Aufgabe 1 (a) erstellten data.frame an die Funktion
## cor() und betrachtet den output.




## Aufgabe 3

## (a) Die Funktion `colMeans` gibt fuer einen
## data.frame fuer jede Spalte den Mittelwert aus (das
## geht aber nur dann, wenn alle Spalten numerisch
## sind, also etwa dann, wenn wir nur Itemantworten
## vorliegen haben wie im data.frame aus Aufgabe
## 2). Bestimme alle "Itemschwierigkeiten", indem du
## colMeans auf den data.frame anwendest, der die
## Item-Antworten enthaelt (also den du in Aufgabe 1
## erstellt hast).



## (b) analog funktionieren auch die Funktionen
## colSums, rowMeans, und rowSums - was koennten diese
## wohl machen? Nutze die Funktion rowSums auf den
## data.frame, der die Item-Antworten enthaelt; dieser
## Aufruf ergibt dann fuer jede/n Teilnehmer/in der
## Studie einen Summenwert ueber alle Items der
## niedertraechtigen Neun.



## Was habt ihr gerade berechnet?

## Aufgabe 4

## Nutzt die Funktionen subset und rowMeans, um einen
## mittleren Score fuer Machiavellismus, Psychopathie
## und Narzissmus zu erstellen. Haengt diese Scores an
## den data.frame `nn` als Spalte an.



#################
## Besprechung ##
#################

## Aufgabe 5

## Vergleicht die Scores in Machiavellismus,
## Psychopathie und Narzissmus nach Geschlecht mit
## einem t-Test


## Aufgabe 6

## (a) Vor einigen Wochen haben wir festgestellt, dass eine
## Person immer volle Zustimmung im
## Technophobie-Inventar angegeben hat. Wir wollen
## herausfinden, ob sich diese Person auch bei den
## Niedertraechtigen Neun auffaellig verhalten
## hat. Findet du Fallnummer der Person heraus
## und waehlt die Daten dieser Person
## mithilfe der Funktion subset fuer den heutigen
## Datensatz aus. Hinweis: nutzt die Daten und euren Code aus den
## Woche, in denen wir mit dem Technophobie-Datensatz
## gearbeitet haben.



## (b) Speichert den data.frame ohne diesen Fall in
## einer neuen Variablen ab.





########################################
########################################
########################################

## Wiederholungsaufgaben fuer alle, die bis hierhin
## durchgekommen sind. Nutzt den data.frame unter
## Ausschluss des Durchklickers. D.h. fuer manche
## Aufgaben: ihr muesst ihn auch aus dem TP Datensatz
## ausschliessen

## (i) Wie ist das Geschlechterverhaeltnis unter den Personen, 
## die ueber dem Median in Machiavellismus sowie Psychopathie
## liegen. Vergleiche das Verhaeltnis zu Aufgabe 1 (f) 


## (ii) Waehle mit der [·] Auswahl alle Werte in
## Technophobie von Personen aus, die zu den dunklen
## Personen gehoeren (wie in Aufgabe 1 (f) bestimmt)


## (iii) Gibt es einen Zusammenhang zwischen den
## folgenden Variablen: Technophobie, Dunkle Triade,
## Vertraeglichkeit (nur das, was wir uns noch nicht in
## der letzten Stunde angeschaut haben). Untersucht
## jeweils auch die Signifikanz der Korrelationen. Wie
## sind signifikante Korrelationen zu interpretieren?
## (ggf. Scatterplot erstellen)


## (iv) Vergleicht das Alter der dunklen Personen (vgl
## Aufgabe 1 (f)) mit dem Alter der anderen Probanden
## mit einem t-Test.


## (v) Was ist der Technophobie Mittelwert der dunklen
## Personen (vgl Aufgabe 1 (f)). Wie der Mittelwert
## aller anderen Personen?
