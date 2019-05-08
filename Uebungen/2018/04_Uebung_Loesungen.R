
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
## sie an Computer denken? (Zustimmung von 4 oder 5 in
## der Aussage TP5)

sum(tp$TP5 >= 4)

## (b) Gebt von den Personen, die eher nervoes werden,
## wenn sie an Computer denken, die Antworten auf Item
## TP6 aus (Betrachtet: signalisieren diese Antworten
## auch eher Zustimmung?)

tp$TP6[tp$TP5 >= 4]

## (c) Gab es mindestens eine Person, die sowohl bei
## Item TP5 und Item TP6 die maximal moegliche
## Zustimmung signalisiert hat?

sum(tp$TP5 == 5 & tp$TP6 == 5)

tp$casenum[tp$TP5 > 4 & tp$TP6 > 4]

## Aufgabe 2

## Die Funktion `cor()` berechnet die Korrelation
## zwischen den Antworten in zwei Items, nimmt also als
## Argumente zwei Vektoren entgegen.

## (a) Berechnet die Korrelation zwischen den Items TP5
## und TP6.
cor(tp$TP5, tp$TP6)

## Wie ist diese Korrelation zu interpretieren? (schaut
## euch an, wie die Items formuliert sind)

## (d) Berechnet die Korrelation zwischen den Items TP5
## und TP8.
cor(tp$TP5, tp$TP8)

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
## an den `data.frame` tp an. (Schaut im Zweifel noch
## mal in den Folien von heute nach, wie die Syntax zum
## Anhaengen von Spalten an `data.frames` aussieht.)

tp$gesamtscore <- tp$TP1 + tp$TP2 + tp$TP3 + tp$TP4 +
    tp$TP5 + tp$TP6 + tp$TP7 + tp$TP8

## (b) Was ist der mittlere Gesamtscore? 
mean(tp$gesamtscore)

## (c) Was ist die Standardabweichung des Gesamtscores?
sd(tp$gesamtscore)

## (d) Malt ein Histogramm der Gesamtscores (Wie war
## noch mal die Funktion zum Zeichnen eines Histograms?
## Schaut in der Uebung der letzten Woche nach, fragt
## eure Kommilitonen oder nutzt Google!)
hist(tp$gesamtscore)

## Mit Axenbeschriftung etwas schoener:
hist(tp$gesamtscore, xlab = "Technophobie Testscore",
     ylab = "Haeufigkeit", 
     main = "Verteilung der Technophobie")

## (e) Was war der hoechste Technophobie Score? Wie
## haeufig kam dieser vor?
maximum <- max(tp$gesamtscore)
sum(tp$gesamtscore == maximum)

## (f) Was war der niedrigste Technophobie Score? Wie
## haeufig kam dieser vor?
min(tp$gesamtscore)
sum(tp$gesamtscore == min(tp$gesamtscore))


## (g) Wie viele Personen haben einen Technophobie
## Gesamtscore von groesser als oder gleich 25?
sum(tp$gesamtscore >= 25)

## (h) Wir setzen bei der Punktzahl 25 einen
## willkuerlichen "Cutoff" und bezeichnen Personen mit
## einer Punktzahl groesser oder gleich 25 als
## "Technophobiker". Haengt eine Spalte mit dem Namen
## "Technophobiker" an den data.frame `tp` an, die
## durch einen logischen Vektors kodiert, ob Personen
## Technophobiker sind.

tp$Technophobiker <- tp$gesamtscore >= 25

###########################
## Pause zur Besprechung ## 
###########################

## Aufgabe 4

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

## Erstellt eine Kreuztabelle der Spalte
## "Technophobiker" und dem Geschlecht der
## Teilnehmenden.

table(tp$Technophobiker, tp$geschlecht)

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

punkte_weiblich  <- tp$gesamtscore[tp$geschlecht == "weiblich"]
punkte_maennlich <- tp$gesamtscore[tp$geschlecht == "maennlich"]

## (b) Berechnet einen t-Test, der die Technophobie
## Scores der Teilnehmerinnen und Teilnehmer
## vergleicht. Das geht mit der Funktion t.test(), die
## als zwei Argumente zwei Vektoren annimmt.

t.test(punkte_weiblich, punkte_maennlich)

## Alternative (hier zu bevorzugen):
t.test(tp$gesamtscore ~ tp$geschlecht)
