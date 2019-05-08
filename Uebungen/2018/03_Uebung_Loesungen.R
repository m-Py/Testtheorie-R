
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
mean(tp$alter, na.rm = TRUE)

## (b) Gebt Ausserdem aus: Mininum, Maximum und
## Standardabweichung des Alters

sd(tp$alter, na.rm = TRUE)
min(tp$alter, na.rm = TRUE)
max(tp$alter, na.rm = TRUE)

## (c) Wie hoch war der Anteil der Teilnehmenden, die
## aelter als 50 waren?
mean(tp$alter > 50, na.rm = TRUE)

## (d) War die Verteilung des Alters bimodal? Gebt ein
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

## Ernste Farben:
hist(tp$alter, ylab = "Haeufigkeit",
     main = "Verteilung des Alters",
     xlab = "Alter", col = "darkgrey")



## Aufgabe 2

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



## Aufgabe 3

## (a) Wie viele Personen haben beim Item "Computer
## schuechtern mich ein." eher ihre Zustimmung
## signalisiert, also eine 4 oder 5 angegeben. Welchem
## relativen Anteil entspricht das?
sum(tp$TP6 >= 4)
mean(tp$TP6 >= 4) ## es war eine Online-Studie ;-)

## (b) Gebt die Alterswerte der Personen aus, die beim
## Item "Computer schuechtern mich ein." eher ihre
## Zustimmung signalisiert haben. Berechnet den
## mittleren Wert des Alters dieser Personen und
## vergleicht ihn mit dem Gesamtmittelwert des Alters.

tp$alter[tp$TP6 >= 4]
## uebersichtlicher:
sort(tp$alter[tp$TP6 >= 4])

mean(tp$alter[tp$TP6 >= 4])
mean(tp$alter, na.rm = TRUE)

## (c) Wie viele Personen stimmten eher zu, dass andere
## Personen Computer besser bedienen koennen als sie
## selbst (Item TP3), UND sie sich frustriert fuehlen,
## wenn sie einen Computer benutzen (Item TP4) - Wert
## von mindestens 4 signalisiert jeweils Zustimmung.

sum(tp$TP3 >= 4 & tp$TP4 >= 4)

## (c) Welches Item erhielt die hoechste mittlere
## Zustimmung?

mean(tp$TP1)
mean(tp$TP2)
mean(tp$TP3)
mean(tp$TP4)
mean(tp$TP5)
mean(tp$TP6)
mean(tp$TP7)
mean(tp$TP8)

## Oder:
summary(tp)

