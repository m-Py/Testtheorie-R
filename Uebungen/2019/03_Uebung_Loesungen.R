
## Praktischer Teil -- Termin 3

## Wir fangen an mit `data.frames` zu arbeiten! Aber:
## die Uebungen werden zunaechst noch Grundlagen der
## letzten Wochen aufarbeiten, d.h. wir arbeiten
## *eigentlich* erst mal noch mit Vektoren. Denn:
## Spalten in data.frames sind Vektoren!

## Zunaechst laden wir eine Datentabelle ein. Sie
## enthaelt Antworten von 409 Teilnehmenden einer
## Online-Untersuchung. (Dafuer muessen wir alle ein
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



## Wir verschaffen uns zunaechst einen Ueberblick ueber
## die Daten.

## Wie viele Faelle gibt es
nrow(tp) # "Number of rows"

## Wie viele Variablen enthaelt die Tabelle
ncol(tp) # "Number of columns"

## Wie sehen die Daten aus
head(tp) # der "Kopf" der Daten; es gibt auch `tail()`

## Ausgabe der Variablennamen / Spalten
names(tp) # ein character Vektor!

## Mit der $-Notation koennen wir Daten auslesen
tp$alter # tp$alter ist ein Vektor! (enthaelt 1x NA)

## NA zeigt in R fehlende Werte an. Das hat einen
## Einfluss darauf, was wir mit dem Vektor machen
## koennen. Folgendes geht schief:

mean(tp$alter)

## Stattdessen:
mean(tp$alter, na.rm = TRUE)

## Ich kann mit der Funktion `is.na()` pruefen, ob ein
## Objekt NA Werte enthaelt. Die Ausgabe ist ein
## logischer Vektor:

is.na(tp$alter) # unuebersichtlich

## Besser:
sum(is.na(tp$alter))

## Das geht nicht:
tp$alter == NA # ups

## Mit der $-Notation koennen wir auch Spalten aendern
## bzw. hinzufuegen. Dafuer wird der Zugriff mit der
## "<-" Zuweisung kombiniert. Beispiel:

median_alter <- median(tp$alter, na.rm = TRUE)

## Was passiert, wenn wir »na.rm« weglassen?
median(tp$alter)

## Wir haengen die Info, ob jemand aelter ist als der
## Median an der data.frame an. Das geht mit der
## Zuweisung per <-
tp$aelter_als_median <- tp$alter > median_alter

## Betrachte Resultat:
head(tp, n = 12)

## Man kann einen "Median-Split" durchfuehren, indem
## man die Spalte »aelter_als_median« als
## Gruppierungsvariable verwendet. Median-Splits sind
## statistisch gesehen eher immer schlecht und sollten
## wenn moeglich vermieden werden.

## Die Funktion `hist()` malt ein Histogramm der Werte
## eines Vektors. Beispiel:
hist(tp$alter) # wohl keine Normalverteilung - bimodal?


###############
## Aufgabe 1 ##
###############

## (a) Was sollte die Ausgabe des folgenden Befehls
## ungefaehr sein - erst nachdenken, dann ausfuehren!

mean(tp$aelter_als_median, na.rm = TRUE)

## (b) Ist der Mediansplit optimal gewaehlt? Er soll
## die Stichprobe in zwei gleich grosse Gruppen
## einteilen und dafuer gibt es (zwei) verschiedene
## Moeglichkeiten. Habe ich die beste gewaehlt?

mean(tp$alter > median_alter, na.rm = TRUE)
mean(tp$alter >= median_alter, na.rm = TRUE)


###############
## Aufgabe 2 ##
###############



## (a) Gebt aus: Mittelwert, Mininum, Maximum und
## Standardabweichung des Alters

mean(tp$alter, na.rm = TRUE)
sd(tp$alter, na.rm = TRUE)
min(tp$alter, na.rm = TRUE)
max(tp$alter, na.rm = TRUE)

## (b) Wie hoch war der Anteil der Teilnehmenden, die
## aelter als 50 waren? [Nutzt eine logische Abfrage]
mean(tp$alter > 50, na.rm = TRUE)

## (c) War die Verteilung des Alters bimodal? Gebt ein
## Histogramm des Alters aller Teilnehmenden unter 30
## Jahren aus, sowie ein Histogramm des Alters aller
## Teilnehmenden, die mindestens 30 Jahre alt waren.

hist(tp$alter[tp$alter < 30])
hist(tp$alter[tp$alter >= 30]) ## beachtet y-Achse!

## Zusatzinfo: So koennen wir Histogramme beschriften:
hist(tp$alter, ylab = "Haeufigkeit",
     main = "Verteilung des Alters",
     xlab = "Alter")

## Und farbig machen:
hist(tp$alter, ylab = "Haeufigkeit",
     main = "Verteilung des Alters",
     xlab = "Alter", col = rainbow(7))

## Ernste Farben + Anpassung der Groesse der 
## Achsenbeschriftung
hist(tp$alter, ylab = "Haeufigkeit",
     main = "Verteilung des Alters",
     xlab = "Alter", col = "darkgrey",
     cex.lab = 1.5)


###############
## Aufgabe 3 ##
###############

## (a) Welche Werte nahm die Variable tp$geschlecht an?
## Info: tp$geschlecht hat den Datentyp `factor`, was
## kategorielle Daten anzeigt. (Nominalskala)

tp$geschlecht # Betrachte: levels

## Nuetzliche Alternativen:
unique(tp$geschlecht)
table(tp$geschlecht)

## (b) Wie war die prozentuale Verteilung des Geschlechts?

## Hinweis: Man kann Vektoren vom Typ `factor` (also
## etwa den Vektor `tp$geschlecht`) auf Gleichheit
## ueberpruefen, indem man die Faktorlabels in
## Anfuerungszeichen angibt, also etwa `meinVektor ==
## "weiblich"`.

mean(tp$geschlecht == "weiblich") * 100
mean(tp$geschlecht == "maennlich") * 100
