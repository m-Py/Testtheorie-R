
## Praktischer Teil -- Termin 5

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

nn <- read.csv("niedertraechtige_neun.csv") # laedt die Daten

## Die Zuordnung von Spaltennamen zu Items koennt ihr
## der Datei "05_Codebuch.txt" entnehmen. Oeffnet diese
## Datei in RStudio, indem ihr unten rechts auf sie
## klickt. Sie wird unten rechts im Panel des Ordners
## eures RStudio Projekts angezeigt.

## Aufgabe 1

## Exploriert die Daten

## (a) Ueberprueft mit den Funktionen summary und table
## stichprobenartig die Antworten auf die
## Items. `table` kennt ihr schon -- `summary` nimmt
## als Argument einfach den ganzen data.frame an, und
## gibt dafuer deskriptive Statistiken aus. Wie stark faellt
## die Zustimmung auf Items der Skalen Machiavellismus,
## Narzissmus, und Psychopathie aus?


## (b) Erstellt einen Summenscore jweils fuer die 
## Subskalen Machiavellismus, Psychopathis, und Narzissmus.



## (c) Zeigt euch die Verteilungen der Skalenwerte
## jeweils in einem Histogram an


## (d) Die Funktion plot() zeigt einen Scatterplot von
## zwei Vektoren an. Sie nimmt also als zwei Argumente
## zwei Vektoren an. Betrachtet die Scatterplots, die
## den Zusammenhang zwischen den Variablen
## Machiavellismus, Psychopathis, und Narzissmus
## darstellen.


## (e) Betrachtet die Korrelationen zwischen der dunklen Triade
## sowie Verträglichkeit


## (f) Korreliert eine der Eigenschaften mit dem Alter?
## Da Alter einen NA Wert enthaelt, muessen wir
## explizit angeben, wie wir damit umgehen wollen. Wir
## moechten die Faelle ausschliessen von der
## Korrelation, die fehlende Werte enthalten. Dafuer
## muessen wir das benannte Argument "use" auf den Wert
## "pairwise.complete.obs" setzen, wenn wir die
## Funktion `cor` aufrufen. Beachtet, dass 
##  "pairwise.complete.obs" tatsaechlich
## in Anfuehrungszeichen gesetzt werden muss.


## (g) Um die Signifikanz von Korrelationen zu
## bestimmen, koennen wir die Funktion `cor.test`
## verwenden. Ueberprueft, ob das Alter signifikant mit
## einer der drei Variablen korreliert (bei einem
## alpha-Niveau von .05). Erstellt einen Scatterplot
## fuer alle Variablen, die mit Alter signifikant
## korrelieren. Hinweis: Die Funktion `cor.test`
## benoetigt nicht den Parameter "use"!



###########################
## Pause zur Besprechung ## 
###########################




############################################
## Weitere Inhalte: Auswahl von Variablen ##
##       Der `:`-Operator und die         ##
##   Funktionen subset() und paste0()     ##
############################################


## Fuer die meisten psychometrischen Analysen macht es
## Sinn, die Antworten auf die untersuchte Skala in
## *einem* data.frame zu speichern. Mit solchen Daten
## koennen wir auf zahlreiche Funktionen aus R
## zurueckgreifen, die uns ermoeglichen psychometrische
## Auswertungen durchzufuehren. D.h. wir sollten die
## Variablen, die nicht zur Skala gehoeren,
## entfernen. Wir lernen jetzt, wie wir Spalten (und
## auch Reihen, d.h. Faelle) aus `data.frames`
## auswaehlen koennen.


######################
## Der `:` Operator ##
######################

## Eine nuetzliche Moeglichkeit, um Vektoren
## aufsteigender, ganzer Zahlen zu erstellen:

1:10

5:-5 # auch absteigend

sum(1:10000)


###########################
## Die Funktion paste0() ##
###########################

## Erstellt einen character Vektor, indem sie
## verschiedene Vektoren zusammengefuegt, etwa:

paste0("item", 1:10)

paste0("PF18_0", 1:9)

## Sollte ich Items aus nur einer Subskala auswaehlen
## wollen:
paste0("PF18_0", c(1, 4, 7))


## Aufgabe 2

## Erstellt mithilfe des `:`-Operators, der [ ] Negativ
## Auswahl und der Funktion paste0() den folgenden
## Vektor:

c("TP1", "TP2", "TP4", "TP5", "TP6", "TP8")


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

bla2 <- subset(nn, alter > 50,
               select = c("casenum", "alter"))


## Aufgabe 3

## Erstellt einen `data.frame`, der nur die Spalten der
## Niedertraechtigen Neun Skala enthaelt (speichert ihn
## in einer neuen Variable ab). Nutzt die Funktionen
## subset, paste0 und den `:`-Operator.



## Aufgabe 4

## Die Funktion `cor` kann man auch verwenden, indem
## man ihr einen einzelnen data.frame uebergibt (in dem
## Fall muessen alle Spalten numerisch sein). Dann wird
## einem eine Korrelationsmatrix ausgegeben, die die
## Korrelationen zwischen allen Spalten, d.h. in
## unserem Fall Items, enthaelt.


## Aufgabe 5

## (a) Die Funktion `colMeans` gibt fuer einen
## data.frame fuer jede Spalte den Mittelwert
## aus. Bestimme alle Itemschwierigkeiten, indem du
## colMeans auf den data.frame anwendest, der die
## Item-Antworten enthaelt (also den du in Aufgabe 3
## erstellt hast).



## (b) analog funktionieren auch die Funktionen
## colSums, rowMeans, und rowSums - was koennten diese
## wohl machen? Nutze die Funktion rowSums auf den
## data.frame, der die Item-Antworten enthaelt; dieser
## Aufruf ergibt dann fuer jede/n Teilnehmer/in der
## Studie einen Summenwert ueber alle Items der
## niedertraechtigen Neun.



## Aufgabe 6

## Nutzt die Funktionen subset und rowMeans, um einen
## mittleren Score fuer Machiavellismus, Psychopathie
## und Narzissmus zu erstellen. Haengt diese Scores an
## den data.frame `nn` als Spalte an.




#######################################
## Neuer Inhalt: Die Funktion tapply ## 
#######################################

## Mit der Funktion tapply, kann man die mittleren
## Scores fuer Machiavellismus, Psychopathie und
## Narzissmus nach Geschlecht auszugeben.  Allgemein:
## man kann deskriptive Statistiken nach
## Gruppierungsvariablen ausgeben lassen.

tapply(nn$Mean_Narzissmus, nn$geschlecht, mean)
tapply(nn$Mean_Psychopathie, nn$geschlecht, mean)
tapply(nn$Mean_Machiavellismus, nn$geschlecht, mean)

tapply(nn$Mean_Narzissmus, nn$geschlecht, sd)
tapply(nn$Mean_Psychopathie, nn$geschlecht, sd)
tapply(nn$Mean_Machiavellismus, nn$geschlecht, sd)

## Aufgabe 7

## Vergleicht die Scores in Machiavellismus,
## Psychopathie und Narzissmus nach Geschlecht mit
## einem t-Test




## Aufgabe 8

## (b) Letzte Woche haben wir festgestellt, dass eine
## Person immer volle Zustimmung im
## Technophobie-Inventar angegeben hat. Wir wollen
## herausfinden, ob sich diese Person auch bei den
## Niedertraechtigen Neun auffaellig verhalten
## hat. Findet du Fallnummer der Person heraus
## (Hinweis: nutzt die Daten und euren Code aus der
## letzten Woche), und waehlt die Daten dieser Person
## mithilfe der Funktion subset fuer den heutigen
## Datensatz aus.



## (b) Speichert den data.frame ohne diesen Fall in
## einer neuen Variablen ab.



## (c) Betrachtet aufs neue die Korrelation zwischen
## Alter und den Niedertraechtigen Neun Subskalen

