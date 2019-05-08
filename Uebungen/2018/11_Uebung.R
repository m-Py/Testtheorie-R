
## Termin 11 - praktische Uebungen R Kurs - 12.07.2018

## Thema: Aufbereitung von Rohdaten

## Wir lesen die unbearbeiteten Rohdaten des
## NPI-Datensatzes ein
npi <- read.csv("data_npi.csv")

## Problem: manche Antworten fehlen; damit koennen wir
## nicht arbeiten. Leider sind fehlende Werte mit 0
## kodiert. "Leider", weil: in der Variable "score"
## kann der Summenwert 0 ein legaler Wert sein. Was wir
## wollen: alle 0-Werte als fehlend klassifizieren;
## aber wir machen dann einen Fehler fuer die Variable
## score.

## score ist nur eine abgeleitete Variable aus den
## Variablen aus den Antworten auf die 40 Items -- ein
## Summenscore, wie wir ihn selbst auch schon oft
## bestimmt haben. Das heisst, wir koennen die Variable
## entfernen und uns den score selber nachher neu
## berechnen, da wir die Originalantworten auf die 40
## Items nicht verlieren. Das funktioniert wie folgt:

npi$score <- NULL # entfernt Spalte aus data.frame

## Wir koennen nun 0-Werte wie folgt in NA
## umwandeln. Das Vorgehen kennen wir schon von
## Vektoren, und es funktioniert fuer data.frames
## identisch. Beachtet, dass wir hier eine []-Auswahl
## in einem data.frame ausfuehren. Das haben wir im
## gesamten Seminar sonst nicht gemacht, nehmen hier
## aber zur Kenntnis, dass das offensichtlich etwas
## ist, das funktioniert (wir lernen aber nicht mehr
## darueber)

npi[npi == 0] <- NA

## Wendet summary auf npi an, um zu betrachten, wie
## viele NA-Werte es gibt

summary(npi)

## Folgende Funktion gibt einen data.frame zurueck, in
## dem alle Faelle (d.h. Reihen) entfernt sind, in
## denen mindestens ein NA-Wert vorliegt. Wir nutzen
## sie, um die Variable npi mit einem data.frame zu
## ueberschreiben, der keine fehlenden Faelle enthaelt.

npi <- na.omit(npi)



## Aufgabe 0

## Wie viele Faelle haben wir soeben ausgeschlossen?


######################################################

## Umkodierung von Antworten mit der Funktion ifelse

## Wir wollen nun die Antworten auf die NPI Items
## umkodieren. Wie wir wissen, koennen die Antworten
## die Werte 1 und 2 annehmen, je nachdem ob die
## "erste" oder "zweite" Aussage ausgewaehlt wurde
## (siehe Codebuch). Wir moechten Variablen erstellen,
## die kodieren, ob fuer jedes Item die narzisstische
## Aussage gewaehlt wurde.

## Dafuer koennen wir die Funktion ifelse
## verwenden. Beispiele: 

npi$recode_Q1 <- ifelse(npi$Q1 == 1, 1, 0) # 1 ist der "Schluessel"
npi$recode_Q4 <- ifelse(npi$Q4 == 2, 1, 0) # 2 ist der "Schluessel"


## Aufgabe 1

## (a) Bestimmt fuer die Subskala Überlegenheitsgefuehl
## einen *mittleren* Score. Wendet dafuer zunaechst
## ifelse auf alle Items der Subskala an.


## (b) Bestimmt fuer die Ueberlegenheits-Score den
## Mittelwert.


## Aufgabe 2

## (a) Fuegt eine Spalte zum npi data.frame hinzu, der
## fuer alle Teilnehmer/innen, die aelter als 18 sind,
## den Wert "erwachsen" enthaelt; die anderen
## Teilnehmer/innen sollen als "minderjaehrig"
## bezeichnet werden.


## (b) Wie hoch ist der prozentuale Anteil
## minderjaehriger im Datensatz?



## Aufgabe 3

## (a) Was ist die Standardabweichung der
## Bearbeitungszeit (Spalte elapse: Werte in Sekunden)
## des Tests? Was der Mittelwert?


## (b) Was sind Mittelwert und Standardabweichung, wenn
## man die Person mit der hoechsten Testzeit
## ausschliesst?


## Nutzt im Weiteren in dieser Aufgabe einen
## data.frame, der nicht die Person mit der maximalen
## Bearbeitungszeit enthaelt.

## (c) Erstellt ein Histogramm der Bearbeitungszeiten


## (d) Erstellt eine Variable, die alle Personen, die
## mindestens 2 Standardabweichungen ueber oder unter
## der mittleren Testzeit liegen als "Ausreisser"
## bezeichnet. Denkt euch fuer die anderen Teilnehmer
## selber einen anderen Wert aus.


## (e) Wie viele so klassifizierte Ausreisser gibt es?
## Wie viele davon sind Ausreisser nach oben
## bzw. unten?



## (f) Bestimmt die mittlere Testzeit (+
## Standardabweichung) fuer alle
## Nicht-Ausreisser. Erstellt auch ein Histogramm der
## Testzeiten dieser Faelle.


