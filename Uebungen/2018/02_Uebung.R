
## Praktischer Teil -- Termin 2

## Nach der Niederlage gegen den amerikanischen Verband
## sollen die Leistungen der deutschen Sportler
## mithilfe eines Dopingprogramms verbessert
## werden. Dafuer wird an einige Sportler das
## Dopingmittel EPO verteilt. Um den Erfolg des
## Programms zu evaluieren, werden die Leistungen aller
## Sportler vor und nach Vergabe des Dopings
## verglichen. Die folgenden zwei Vektoren beinhalten
## die Sprungleistungen der Springer vor und nach dem
## Doping. Dabei kommt der erste Wert in
## `spruenge_vorher` vom selben Springer wie Wert 1 in
## `spruenge_nachher`, usw.

## Aufgabe 0

## Ladet die zwei Variablen mit STRG-Enter in euren
## "workspace", damit ihr die weiteren Aufgaben loesen
## koennt.

spruenge_vorher <- c(1.85, 1.89, 2.02, 1.99, 1.84,
                     2.31, 1.99, 1.79, 2.15, 2.07,
                     2.01, 2.00, 1.87, 2.08, 2.13)

spruenge_nachher <- c(1.95, 1.83, 2.15, 2.03, 1.75,
                      2.28, 1.89, 2.04, 2.39, 2.33,
                      1.99, 2.13, 1.94, 2.26, 2.11)


## Hinweis fuer alle Aufgaben:

## Schreibt eure Loesungen direkt in diese Datei,
## d.h. benutzt den Texteditor, um eure Loesungen
## abzuspeichern.


## Aufgabe 1

## Wie hoch war die mittlere Sprunghoehe an Termin 1
## und an Termin 2?


## Aufgabe 2

## Wie hoch war die mittlere Sprunghoehe ueber alle
## Spruenge hinweg? Speichert alle Spruenge in *einer*
## Variablen ab, bevor ihr den Mittelwert berechnet.



## Aufgabe 3

## Erstellt mit einem logischen Vergleich einen
## logischen (TRUE/FALSE) Vektor, der kodiert, ob die
## Sprungweite nach Vergabe von EPO hoeher war als
## davor. Speichert diesen Vektor in einer Variablen
## ab.

## (Erinnerung: logische Operatoren arbeiten paarweise)



## Aufgabe 4

## Wie viele Springer sind nach der EPO-Vergabe hoeher
## gesprungen? Welchem relativen Anteil entspricht das?



## Aufgabe 5

## Speichert die Differenz zwischen den Sprunghoehen an
## Termin 1 und Termin 2 in einer Variablen ab, und
## betrachtet die Variable.



## Aufgabe 6

## Wie hoch war die mittlere Verbesserung vom ersten
## zum zweiten Sprung



## Aufgabe 7

## Was war die staerkste Verbesserung nach EPO-Einnahme?
## Was die staerkste Verschlechterung?



## Aufgabe 8

## Folgende Code berechnet einen t-Test um gepaarte
## Daten zu vergleichen; fuehrt ihn aus und betrachtet
## den Output:

t.test(spruenge_vorher, spruenge_nachher,
       paired = TRUE)

## Kann man von einer signifikanten Verbesserung der
## Sprungleistung nach EPO-Einnahme sprechen (bei einem
## konventionellen Alpha-Fehler Niveau von .05)?


############################################
## Vor den naechsten Aufgaben kommen neue ##
##    Inhalte --  logisches UND / ODER    ##
############################################

## Bild an der Tafel: logisches UND / ODER


## Logisches UND
TRUE & TRUE

TRUE & FALSE

FALSE & FALSE

## Logisches ODER
TRUE | TRUE # entgegen umgangssprachlicher Intuition

TRUE | FALSE

FALSE | FALSE

## Logische Operatoren arbeiten paarweise /
## komponentenweise:

c(TRUE, FALSE, FALSE) & c(TRUE, TRUE, FALSE)

c(TRUE, FALSE, FALSE) | c(TRUE, TRUE, FALSE)



###########################
## Aufgaben gehen weiter ##
###########################

## Aufgabe 9

## (a) Wie viele Springer haben *vor* Vergabe von EPO
## die 2-Meter Marke geknackt?



## (b) Wie viele Springer haben *nach* Vergabe von EPO
## die 2-Meter Marke geknackt?



## (c) erstellt eine Variable, die kodiert wer vor ODER
## nach der Einnahme von EPO die 2m Marke geknackt hat
## (nutzt das *logische* ODER, nicht das
## umgangsprachliche "entweder-oder").




## (c) Wie viele Sportler haben an mindestens einem
## Termin die 2-Meter Marke geknackt?



## (d) Wie viele Sportler haben an beiden Terminen die
## 2-Meter Marke geknackt?




#################################################
##   Vor den naechsten Aufgaben kommen neue    ##
## Inhalte: Auswahl von Elementen aus Vektoren ##
#################################################


## In R kann man auf einzelne oder mehrere Elemente in
## Vektoren zugreifen.

meinVektor <- c(1, 2, 6, 2, 9) # Beispielvektor

## Mit der [ ] Notation koennen wir Elemente aus Vektoren 
## anhand ihrer Position auswaehlen
meinVektor[3] # waehlt das dritte Element aus

## Man kann eine "Negativ"-Auswahl durchfuehren:
meinVektor[-3] # laesst das dritte Element aus

## Man kann mehrere Elemente auswaehlen:
meinVektor[c(1, 4)]

## Oder mehrere Elemente auslassen:
meinVektor[-c(1, 4)]

## Oftmals erwuenscht: waehle Elemente anhand ihrer
## Eigenschaften aus.

## Waehle alle Elemente die groesser bzw kleiner gleich
## 2 sind aus:
meinVektor[meinVektor > 2] # was ist `meinVektor > 2`?
meinVektor[meinVektor <= 2]

## Hier waehle ich die Daten mit einem logischen Vektor
## aus, der fuer jedes Element angibt, ob es in der
## Ausgabemenge sein soll. Das heisst das hier
## funktioniert auch:

meinVektor[c(TRUE, FALSE, FALSE, FALSE, TRUE)]

## Man kann mit dem [ ] Zugriff auch Daten veraendern,
## wenn ich die "<-" Zuweisung verwende:

meinVektor[3] <- 0

meinVektor[meinVektor > 8]  <- 9999

## Merke: mit dem [ ] Zugriff kann man Elemente aus
## Vektoren auswaehlen:

## (a) anhand ihrer Position im Vektor

## (b) mithilfe eines logischen Vektors, der fuer jedes
## Element angibt, ob es in der Ausgabemenge sein soll.

## (c) zusammen mit der "<-" Zuweisung kann man so
## bestimmte Elemente in Vektoren veraendern.



###########################
## Aufgaben gehen weiter ##
###########################

## Aufgabe 10

## (a) Waehlt das dritte Element aus dem Vektor
## `spruenge_nachher` aus und speichert es in einer
## Variablen.



## (b) Waehlt das erste, fuenfte und zehnte Element aus
## dem Vektor `spruenge_vorher` aus und speichert diese
## Auswahl in einer neuen Variablen.



## (c) Waehlt alle bis auf das das erste, fuenfte und
## zehnte Element aus dem Vektor `spruenge_vorher` aus.




## Aufgabe 11

## (a) Waehlt alle Elemente aus dem Vektor
## `spruenge_nachher` aus, bei denen die Sprunghoehe
## groesser als 2m war:



## (b) Waehlt alle Elemente aus dem Vektor
## `spruenge_nachher` aus, die zu den Springern
## gehoeren, die sowohl *vor als auch nach* der
## Einnahme von EPO *niedriger* als 2m gesprungen sind.




##################################
## Ersetzen von Vektorelementen ##
##################################

## Aufgabe 12

mein_vektor <- c(1, 0, 2, 9)

## (a) Ersetzt in `mein_vektor` das zweite Element
## durch 55:



## (b) Erhoeht in `mein_vektor` das erste Element um 10



## (c) Ersetzt in `mein_vektor` das dritte und vierte
## Element durch 999



## Aufgabe 13

## Wegen schlechter Windverhaeltnisse sollen die
## Sprunghoehen einiger Sportler nachtraeglich
## aufgewertet werden. Erhoeht die Werte der Sportler
## 3, 8, und 13 zu Zeitpunkt 2 um 10cm.



## Aufgabe 14

## Der Leichtathletik Weltverband hat nach den zweiten
## Spruengen mit allen Sportlern eine Dopingkontrolle
## durchgefuehrt. Positiv getestete Sportler sollen
## nachtraeglich ausgeschlossen werden. 

## Der folgende Vektor kodiert fuer jeden Sportler, ob
## die Doping-Kontrolle positiv war (`TRUE` heisst, dass
## die Kontrolle positiv war):

test_positiv <- c(TRUE, TRUE, TRUE, FALSE, TRUE, 
                  TRUE, TRUE, FALSE, TRUE, TRUE,
                  FALSE, FALSE, TRUE, TRUE, FALSE)

## Wie hoch war der Anteil korrekter Ergebnisse des
## Doping-Tests?



## Aufgabe 15

## Da die Spruenge dieser Sportler nun als ungueltig
## erklaert wurden, wollen wir dies in den Daten
## kennzeichnen. R hat einen eigenen Wert, um fehlende
## Daten zu kennzeichen, naemlich `NA`. Betrachtet etwa
## den folgenden Vektor:

messy_data <- c(1, 3, NA, 6, 2) # der dritte Wert "fehlt"

## Setzt die Sprunghoehen des zweiten Durchgangs der
## positiv getesteten Springer auf NA.



## Betrachtet nun den Vektor `spruenge_nachher`



## Wenn Daten in R als fehlend, d.h. `NA` klassifiziert
## sind, koennen wir auf Rs eingebaute Funktionalitaet
## bauen, mit fehlenden Werten umzugehen.
## Beispielsweise will uns R davor "schuetzen", einen
## Mittelwert zu berechnen, wenn ein Vektor fehlende
## Werte enthaelt:

mean(spruenge_nachher)

## Um einen Mittelwert bei Vorkommen von fehlenden
## Werten zu berechnen, muessen wir dies der Funktion
## `mean()` explizit mitteilen:

mean(spruenge_nachher, na.rm = TRUE)

## So werden die fehlenden Werte ignoriert.

