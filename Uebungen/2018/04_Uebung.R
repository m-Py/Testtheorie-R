
## Praktischer Teil -- Termin 4

## Wir arbeiten weiter mit `data.frames`

## Zunaechst laden wir die Datentabelle ein. Sie
## enthaelt Antworten von 409 Teilnehmenden einer
## Online-Untersuchung.  (Dafuer muessen wir alle ein
## R-Studio Projekt anlegen, damit R-Studio weiss, wo
## es nach der Datei, die die Daten enthaelt, suchen
## muss.)

tp <- read.csv("technophobie.csv")

## Unter anderem wurden in der Studie Antworten auf
## eine Technophobieskala erfragt. Diese enthielt die
## folgenden Items:

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

## TP8 Die Geldangelegenheiten von Menschen sollten
##     nicht von Computern erledigt werden.

## Antworten wurden auf einer Likert-Skala mit 5
## Abstufungen gegeben; diese hatte an den Extremwerten
## die Beschriftungen "Trifft keinesfalls zu" (= 1) und
## "Trifft stark zu" (= 5).


## Aufgabe 1

## (a) Wie viele Antwortende werden eher nervoes, wenn
## sie an Computer denken?  (Zustimmung von 4 oder 5 in
## der Aussage TP5)



## (b) Gebt von den Personen, die eher nervoes werden,
## wenn sie an Computer denken, die Antworten auf Item
## TP6 aus (signalisieren diese Antworten auch eher
## Zustimmung?)



## (c) Gab es mindestens eine Person, die sowohl bei
## Item TP5 und Item TP6 die maximal moegliche
## Zustimmung signalisiert hat?




## Aufgabe 2

## Die Funktion `cor()` berechnet die Korrelation
## zwischen den Antworten in zwei Items, nimmt also als
## Argumente zwei Vektoren entgegen.

## (a) Berechnet die Korrelation zwischen den Items TP5
## und TP6.


## Wie ist diese Korrelation zu interpretieren? (schaut
## euch an, wie die Items formuliert sind)


## (d) Berechnet die Korrelation zwischen den Items TP5
## und TP8.


## Wie ist diese Korrelation zu interpretieren - auch
## unter Beruecksichtigung der Korrelation zwischen den
## Items TP5 und TP6? (schaut euch an, wie die Items
## formuliert sind)


###########################
## Pause zur Besprechung ## 
###########################


## Aufgabe 3

## (a) Berechnet einen Gesamtscore (Summenscore) fuer
## die Technophobie-Skala und haengt diesen als Spalte
## an den data.frame tp an. (Schaut im Zweifel noch mal
## in den Folien von heute nach, wie die Syntax zum
## Anhaengen von Spalten an data.frames aussieht.)



## (b) Was ist der mittlere Gesamtscore? 


## (c) Was ist die Standardabweichung des Gesamtscores?


## (d) Malt ein Histogramm der Gesamtscores (Wie war
## noch mal die Funktion zum Zeichnen eines Histograms?
## Schaut in der Uebung der letzten Woche nach, fragt
## eure Kommilitonen oder nutzt Google!)


## (e) Was war der hoechste Technophobie Score? Wie
## haeufig kam dieser vor?


## (f) Was war der niedrigste Technophobie Score? Wie
## haeufig kam dieser vor?


## (g) Wie viele Personen haben einen Technophobie
## Gesamtscore von groesser als oder gleich 25?


## (h) Wir setzen bei der Punktzahl 25 einen
## willkuerlichen "Cutoff" und bezeichnen Personen mit
## einer Punktzahl groesser oder gleich 25 als
## "Technophobiker". Haengt eine Spalte mit dem Namen
## "Technophobiker" an den data.frame `tp` an, die
## durch einen logischen Vektors kodiert, ob Personen
## Technophobiker sind.



###########################
## Pause zur Besprechung ## 
###########################

########################################
## Neuer Inhalt: Die Funktion table() ##
########################################

## Mit der Funktion table() kann man sich die
## Hauefigkeiten der Werte in Vektoren ausgeben
## lassen. Das ist oft vor allem bei "kategorialen
## Variablen" sinnvoll, da hier andere Berechnungen wie
## etwa der Mittelwert keinen Sinn machen. Das geht wie
## folgt:

table(tp$geschlecht)

## Es kann jedoch auch Sinn machen, bei "metrischen"
## Variablen die genaue Hauefigkeitsverteilung zu
## betrachten, etwa beim Gesamtscore:

table(tp$gesamtscore)

## So haette man oben die Aufgaben 3e und 3f loesen
## koennen, da mit dem Befehl table() direkt
## ersichtlich ist, welche Testscore das Minimum und
## Maximum waren, und wir auch die Hauefigkeit des
## Minimums und Maximums erfahren.

## table() kann auch Kreuztabellen erstellen, also
## Haeufigkeiten nach einer anderen Variable
## gruppieren:

table(tp$gesamtscore, tp$geschlecht)


## Aufgabe 4

## Erstellt eine Kreuztabelle der Spalte
## "Technophobiker" und dem Geschlecht der
## Teilnehmenden:


## Aufgabe 5

## (a) Speichert die Punktzahlen aller weiblichen
## Teilnehmerinnen in einer Variablen; macht dasselbe
## fuer die maennlichen Teilnehmer. Betrachtet die
## Variablen. Hinweis: Man kann Vektoren vom Typ
## `factor` (also etwa den Vektor `tp$geschlecht`) auf
## Gleichheit ueberpruefen, indem man die Faktorlabels
## in Anfuerungszeichen angibt, also etwa mit
## tp$geschlecht == "weiblich". (gebt diesen Befehl so
## einmal in die R-Konsole ein, wenn euch nicht klar
## ist, was das heisst oder was ihr tun sollt!)



## (b) Berechnet einen t-Test, der die Technophobie
## Scores der Teilnehmerinnen und Teilnehmer
## vergleicht. Das geht mit der Funktion t.test(), die
## als zwei Argumente zwei Vektoren annimmt.



###########################
## Pause zur Besprechung ## 
###########################


#####################################
## Neuer Inhalt: Scatterplots zur  ##
## Darstellung von Zusammenhaengen ##
#####################################


## Besteht zwischen dem Gesamtscore und dem Alter ein
## Zusammenhang?
plot(tp$alter, tp$gesamtscore)
## etwas schoener:
plot(tp$alter, tp$gesamtscore, col = gray(.0, .2),
     pch = 19, xlab = "Alter",
     ylab = "Punktzahl Technophobie", las = 1)

## Berechne Korrelation von Alter und Technophobie:
cor(tp$gesamtscore, tp$alter) # geht nicht wegen NA

## Nutze "paarweise komplette Faelle", also nur solche,
## die fuer beide Variablen einen gueltigen Wert
## enthalten:
cor(tp$gesamtscore, tp$alter,
    use = "pairwise.complete.obs")
## hier geben wir nicht na.rm = TRUE an, sondern use =
## "pairwise.complete.obs". Das ist leider eine
## "Inkonsistenz", mit der wir leben muessen

## Erhalte Info zur Signifikanz der Korrelation:
cor.test(tp$gesamtscore, tp$alter) ## hier NA kein Problem ...


## Aufgabe 6

## (a) Erstellt einen Scatterplot, um den Zusammenhang
## in den Antworten auf Item TP6 und dem Gesamtscore
## darzustellen



## (b) Berechnet eine Korrelation zwischen den
## Antworten auf Item TP6 und dem Gesamtscore



## (c) Bonusfrage: was habt ihr gerade berechnet?


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

paste0("TP", 1:8)

## Sollte ich Items aus einer hypothetischen Subskala
## aus Items 2, 4, 7 auswaehlen wollen:
paste0("TP", c(1, 5, 6))


## Aufgabe 7

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

female <- subset(tp, geschlecht == "weiblich")

## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum" und "alter" enthaelt:

bla <- subset(tp, select = c("casenum", "alter"))

## (Merke: Hier musste ich das Argument zur Auswahl der
## Spalten benennen!)

## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum", und "alter" der ueber 50 jaehrigen
## enthaelt:

bla2 <- subset(tp, alter > 50,
               select = c("casenum", "alter"))


## Aufgabe 8

## Erstellt einen `data.frame`, der nur die Spalten der
## Technophobie-Skala enthaelt

