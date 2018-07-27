
## Praktischer Teil -- Termin 3

## Wir fangen an mit `data.frames` zu arbeiten!  (aber:
## die Uebungen werden zunaechst noch Grundlagen der
## letzten Wochen aufarbeiten, d.h. wir arbeiten
## *eigentlich* erst mal noch mit Vektoren)

## Zunaechst laden wir eine Datentabelle ein. Sie
## enthaelt Antworten von 409 Teilnehmenden einer
## Online-Untersuchung.  (Dafuer muessen wir alle ein
## R-Studio Projekt anlegen, damit R-Studio weiss, wo
## es nach der Datei, die die Daten enthaelt, suchen
## muss.)

tp <- read.csv("technophobie.csv")

## Unter anderem wurden in der Studie Antworten auf
## eine Technophobieskala erfragt. Diese enthielt
## (u.a.) die folgenden Items:

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

## Wir verschaffen uns zunaechst einen Ueberblick ueber
## die Daten.

## Wie viele Faelle
nrow(tp) # "Number of rows"

## Wie viele Variablen enthaelt die Tabelle
ncol(tp) # "Number of columns"

## Wie sehen die Daten aus
head(tp) # der "Kopf" der Daten; es gibt auch `tail()`

## Ausgabe der Variablennamen / Spalten
names(tp) # ein character Vektor!

## Mit der $-Notation koennen wir Daten auslesen
tp$alter # tp$alter ist ein Vektor! (enthaelt 1x NA)

## FYI: ich kann mit der Funktion `is.na()` pruefen, ob
## ein Objekt NA Werte enthaelt:

is.na(tp$alter) # unuebersichtlich

sum(is.na(tp$alter)) # wie oft NA?

## Das geht nicht:
tp$alter == NA ## ups

## Mit der $-Notation koennen wir auch Spalten aendern
## bzw. hinzufuegen. Dafuer wird der Zugriff mit der
## "<-" Zuweisung kombiniert. Beispiel:

median_alter <- median(tp$alter, na.rm = TRUE)

tp$aelter_als_median <- tp$alter >= median_alter
## Schlechter Variablenname! -> nicht "aelter als Median"!

## So kann man einen "Median-Split" machen; statistisch
## gesehen eher immer schlecht.

## Betrachte Resultat:
head(tp, n = 12)

## Die Funktion `hist()` malt ein Histogramm der Werte eines
## Vektors. Beispiel:
hist(tp$alter) # wohl keine Normalverteilung - bimodal?


#######################
## Aufgaben - Teil 1 ##
#######################

## Aufgabe 0

## Was sollte die Ausgabe des folgenden Befehls
## ungefaehr sein - erst nachdenken, dann ausfuehren!

mean(tp$aelter_als_median, na.rm = TRUE)


## Aufgabe 1

## (a) Was war das mittlere Alter der Stichprobe?


## (b) Gebt Ausserdem aus: Mininum, Maximum und
## Standardabweichung des Alters



## (c) Wie hoch war der Anteil der Teilnehmenden, die
## aelter als 50 waren?


## (d) War die Verteilung des Alters bimodal? Gebt ein
## Histogramm des Alters aller Teilnehmenden unter 30
## Jahren aus, sowie ein Histogramm des Alters aller
## Teilnehmenden, die mindestens 30 Jahre alt waren.




## Aufgabe 2

## (a) Welche Werte nahm die Variable tp$geschlecht an?
## Info: tp$geschlecht hat den Datentyp `factor`, was
## kategorielle Daten anzeigt. (Nominalskala)



## (b) Wie war die prozentuale Verteilung des Geschlechts?

## Hinweis: Man kann Vektoren vom Typ `factor` (also
## etwa den Vektor `tp$geschlecht`) auf Gleichheit
## ueberpruefen, indem man die Faktorlabels in
## Anfuerungszeichen angibt, also etwa 
## meinVektor == "weiblich"


## Aufgabe 3

## (a) Wie viele Personen haben beim Item "Computer
## schuechtern mich ein." eher ihre Zustimmung
## signalisiert, also eine 4 oder 5 angegeben. Welchem
## relativen Anteil entspricht das?


## (b) Gebt die Alterswerte der Personen aus, die beim
## Item "Computer schuechtern mich ein." eher ihre
## Zustimmung signalisiert haben. Berechnet den
## mittleren Wert des Alters dieser Personen und
## vergleicht ihn mit dem Gesamtmittelwert des Alters.



## (c) Wie viele Personen stimmten eher zu, dass andere
## Personen Computer besser bedienen koennen als sie
## selbst (Item TP3), UND sie sich frustriert fuehlen,
## wenn sie einen Computer benutzen (Item TP4) - Wert
## von mindestens 4 signalisiert jeweils Zustimmung.



## (c) Welches Item erhielt die hoechste mittlere
## Zustimmung?


## Aufgabe 4

## Die Funktion `cor()` berechnet die Korrelation
## zwischen den Antworten in zwei Items, nimmt also als
## Argumente zwei Vektoren entgegen.

## (a) Berechnet die Korrelation zwischen den Items TP2
## und TP4. Wie ist diese Korrelation zu interpretieren? 
## (schaut euch an, wie die Items formuliert sind)


## (d) Berechnet die Korrelation zwischen den Items TP2
## und TP8.
## Wie ist diese Korrelation zu interpretieren - auch
## unter Beruecksichtigung der Korrelation zwischen den
## Items TP2 und TP4? (schaut euch an, wie die Items
## formuliert sind)



###########################
## Pause zur Besprechung ##
###########################



## Aufgabe 5

## (a) Berechnet einen Gesamtscore (Summenscore) fuer
## die Technophobie-Skala und haengt diesen als Spalte
## an den `data.frame` tp an. (Schaut im Zweifel noch
## mal oben nach, wie die Syntax zum Anhaengen von
## Spalten an `data.frames` aussieht.)



## (b) Was ist der mittlere Gesamtscore? 


## (c) Was ist die Standardabweichung des Gesamtscores?


## (d) Malt ein Histogramm der Gesamtscores


## (e) Beschriftet die Achsen und die Ueberschrift des
## Histograms sinnvoll


## (f) Wie viele Personen haben einen Technophobie
## Gesamtscore von groesser als 25?


## (g) Waehlt alle Punktzahlen aus, die groesser sind
## als 25 ODER kleiner sind als 10


## (h) Was war der hoechste Technophobie Score? Wie
## haeufig kam dieser vor?


## (i) Was war der niedrigste Technophobie Score? Wie
## haeufig kam dieser vor?



## Aufgabe 6

## (a) Speichert die Punktzahlen aller weiblichen
## Teilnehmerinnen in einer Variablen; macht dasselbe
## fuer die maennlichen Teilnehmer. Betrachtet die
## Variablen.


## (b) Berechnet einen t-Test, der die Technophobie
## Scores der Teilnehmerinnen und Teilnehmer
## vergleicht. (mit der Funktion t.test())



#############################################
## Neuer Inhalt: Standard Scatterplots zur ##
##     Darstellung von Zusammenhaengen     ##
#############################################

## Besteht zwischen dem Gesamtscore und dem Alter ein
## Zusammenhang?
plot(tp$alter, tp$gesamtscore)
## etwas schoener:
plot(tp$alter, tp$gesamtscore, col = gray(.0, .2),
     pch = 19, xlab = "Alter",
     ylab = "Punktzahl Technophobie", las = 1)

cor(tp$gesamtscore, tp$alter) # geht nicht wegen NA
## Nutze "paarweise komplette Faelle", also nur solche,
## die fuer beide Variablen einen gueltigen Wert
## enthalten:
cor(tp$gesamtscore, tp$alter,
    use = "pairwise.complete.obs")

## Erhalte Info zur Signifikanz der Korrelation:
cor.test(tp$gesamtscore, tp$alter)
cor.test(tp$gesamtscore, tp$alter, method = "spearman")


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

## Der `:` Operator: Eine nuetzliche Moeglichkeit, um
## Vektoren aufsteigender, ganzer Zahlen zu erstellen:

1:10

5:-5 # auch absteigend

sum(1:10000)

## Die Funktion paste0()

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

## Speichere einen `data.frame` ab, der nur die Faelle
## der weiblichen Teilnehmerinnen enthaelt (nutzt
## logischen Vergleich zur Fallauswahl!)

female <- subset(tp, geschlecht == "weiblich")

## Speichere einen `data.frame` ab, der nur die
## Spalten "casenum" und "alter" enthaelt:

bla <- subset(tp, select = c("casenum", "alter"))


## Speichere einen `data.frame` ab, der nur die Spalten
## "casenum", und "alter" der ueber 50 jaehrigen
## enthaelt:

bla2 <- subset(tp, alter > 50,
              select = c("casenum", "alter"))




## Aufgabe 7

## Erstellt einen `data.frame`, der nur die Spalten der
## Technophobie-Skala enthaelt


#################################################

## Vorschau auf psychometrische Berechnungen

## Itemschwierigkeiten
colMeans(answers)

## Testscores bestimmen mit rowSums() - Viel einfacher
## als oben!
rowSums(answers)

rowSums(answers) == tp$gesamtscore ## hmmm
mean(rowSums(answers) == tp$gesamtscore)

## Cronbach's Alpha

library("psychometric") # man muss ein Paket installieren
psychometric::alpha(answers)
