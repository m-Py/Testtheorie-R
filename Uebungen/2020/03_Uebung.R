        
##########################
# Termin 3 Uebungsblatt ##
##########################

# Wir fangen an mit `data.frames` zu arbeiten! Zunaechst laden wir
# eine Datentabelle ein. Sie enthaelt Antworten von 409 Teilnehmenden
# einer Online-Untersuchung. (Dafuer muessen wir alle ein R-Studio
# Projekt anlegen, damit R-Studio weiss, wo es nach der Datei, die die
# Daten enthaelt, suchen muss.)

tp <- read.csv("technophobie.csv")
# Falls das Einlesen einen Fehler ergibt, folgenden Befehl ausfuehren:
getwd() # ist das der Ordner, in dem die Daten liegen?

# Unter anderem wurden in der Studie Antworten auf eine
# Technophobieskala erfragt. Diese enthielt die folgenden Items:

# TP1 Irgendwie fuehle ich mich einfach aengstlich, wenn ich auf einen
#     Computer zugehe.

# TP2 Computer regen mich auf.

# TP3 Ich denke, die meisten Leute koennen einen Computer besser
#     bedienen als ich.

# TP4 Ich fuehle mich frustriert, wenn ich einen
#     Computer benutze.

# TP5 Wenn ich an Computer denke, werde ich nervoes.

# TP6 Computer schuechtern mich ein.

# TP7 Ich bin dagegen, dass Computer unser alltaegliches Leben so
#     bestimmen.

# TP8 Ich habe mehr Vertrauen zu einem Menschen als zu einem Computer.

# TP9 Die Geldangelegenheiten von Menschen sollten nicht von Computern
#     erledigt werden.

# TP10 Ich fuehle mich wohl, wenn ich Computer benutze. (-)

# TP11 Computer machen den Alltag einfacher. (-)

# TP12 Ich finde es angenehm, dass Computer so bequem sind. (-)

# Antworten wurden auf einer Likert-Skala mit 5 Abstufungen gegeben;
# diese hatte an den Extremwerten die Beschriftungen "Trifft
# keinesfalls zu" (= 1) und "Trifft stark zu" (= 5). Items 10 - 12
# sind negativ gepolt, d.h. hier zeigt staerkere Zustimmung *weniger*
# Technophobie an.

# Technophobie-Zitation (in unserer Studie aber leicht abgewandelt):
# Sinkovics, R. (2014). Technophobie-Skala. Zusammenstellung 
# sozialwissenschaftlicher Items und Skalen (ZIS). https://doi.org/10.6102/zis62

# Wir verschaffen uns zunaechst einen Ueberblick ueber die Daten.

# Wie viele Faelle gibt es
nrow(tp) # "Number of rows"

# Wie viele Variablen enthaelt die Tabelle
ncol(tp) # "Number of columns"

# Wie sehen die Daten aus
head(tp, n = 12) # der "Kopf" der Daten; es gibt auch `tail()`

# Ausgabe der Variablennamen / Spalten
names(tp)

# Mit der $-Notation koennen wir Daten auslesen
tp$alter # tp$alter ist ein Vektor! (enthaelt 1x NA)

# NA zeigt in R fehlende Werte an. Das hat einen Einfluss darauf, was
# wir mit dem Vektor machen koennen. Folgendes geht schief:

mean(tp$alter)

# Stattdessen:
mean(tp$alter, na.rm = TRUE)

# Ich kann mit der Funktion `is.na()` pruefen, ob ein Objekt NA Werte
# enthaelt. Die Ausgabe ist ein logischer Vektor:

is.na(tp$alter) # unuebersichtlich

# Besser:
sum(is.na(tp$alter))

# Das geht nicht:
tp$alter == NA # ups

# Mit der $-Notation koennen wir auch Spalten aendern
# bzw. hinzufuegen. Dafuer wird der Zugriff mit der "<-" Zuweisung
# kombiniert. Beispiel:

median_alter <- median(tp$alter, na.rm = TRUE)

# Was passiert, wenn wir »na.rm« weglassen?
median(tp$alter)

# Wir haengen die Info, ob jemand aelter ist als der Median an der
# data.frame an. Das geht mit der Zuweisung per <-
tp$aelter_als_median <- tp$alter > median_alter

# Betrachte Resultat:
head(tp, n = 12)

# Man kann einen "Median-Split" durchfuehren, indem man die Spalte
# »aelter_als_median« als Gruppierungsvariable
# verwendet. Median-Splits sind statistisch gesehen aber eher schlecht
# und sollten moeglichst vermieden werden.

# Fuer kategoriale Daten: Betrachte Haeufigkeiten:
table(tp$geschlecht)

# Oder wir nutzen logische Abfragen, was wir schon kennen:
sum(tp$geschlecht == "weiblich")
sum(tp$geschlecht == "maennlich")

# -> Anfuehrungszeichen: Vektoren vom Typ character
mein_text <- "Vektor mit Text"
c("Vektor mit Text")
mein_text2 <- c("Vektor", "mit", "Text")

length(mein_text)
length(mein_text2)



###############
## Aufgabe 1 ##
###############

# (a) Was sollte die Ausgabe des folgenden Befehls ungefaehr sein -
# erst nachdenken, dann ausfuehren!

mean(tp$aelter_als_median, na.rm = TRUE)

# (b) Ist der Mediansplit optimal gewaehlt? Er soll die Stichprobe in
# zwei gleich grosse Gruppen einteilen und dafuer gibt es (zwei)
# verschiedene Moeglichkeiten. Welche sind das - und habe ich die
# beste gewaehlt? Die beste Moeglichkeit liegt am naechsten am
# ausgeglichenen 50:50-Split.



###############
## Aufgabe 2 ##
###############

# (a) Gebt aus: Mittelwert, Mininum, Maximum und Standardabweichung
# des Alters



# (b) Wie hoch war der Anteil der Teilnehmenden, die aelter als 50
# waren? (Nutzt eine logische Abfrage)



# (c) Erstellt ein Histogramm des Alters (->
# Internetrecherche-Aufgabe: wie male ich ein Histogramm in R?)



# (d) War die Verteilung des Alters bimodal? Gebt ein Histogramm des
# Alters aller Teilnehmenden unter 30 Jahren aus, sowie ein Histogramm
# des Alters aller Teilnehmenden, die 30 oder älter waren.



###############################################################
## Bonusaufgaben zum Histogramm: Internetrecherche gefordert ##
###############################################################

# (e) (Bonusaufgabe) Findet per Internetrecherche heraus, wie man den
# y-Achsenabschnitt vereinheitlichen kann fuer die beiden im letzten
# Aufgabenteil erstellten Histogramme. Erstellt die beiden Histogramme
# dann neu mit demselben y-Achsenabschnitt



# (f) (Bonusaufgabe) Beschriftet die x- und y-Achsen mit einer eigenen
# (sinnvolleren) Beschriftung. Aendert ebenfalls den Diagrammtitel
# oben in der Abbildung. (Ihr koennt ab jetzt wieder nur ein
# Histogramm fuer alle Alterswerte nutzen.)



# (g) (Bonusaufgabe) Vergroessert die Schriftart der
# Achsenbeschriftung und der Achsen selbst.



# (h) (Bonusaufgabe) Aendert die Farbe der Balken im Histogramm



# (i) (Bonusaufgabe) Aendert die Farbe der Linien, die die Balken des
# Histogramms trennen.



# (j) (Bonusaufgabe) Richtet die y-Achsenwerte so aus, dass sie nicht
# um 90 Grad gedreht sind (also sie sollten "normal" lesbar sein).



###############
## Aufgabe 3 ##
###############

# Gebt die absolute und relative Verteilung des Geschlechts aus, indem
# ihr:

# (a) logische Abfragen verwendet (kombiniert mit den Funktionen
# `sum()` und `mean()`):


# (b) die Funktion `table()` verwendet.

# Hinweis, um mit der Funktion `table()` den relativen Anteil zu
# erhalten: Die Ausgabe von `table()` ist ein Vektor (stimmt technisch
# eigentlich nicht, aber passt so fuer uns).


###############
## Aufgabe 4 ##
###############

# (a) Wie viele Personen haben beim Item "Computer schuechtern mich
# ein." eher ihre Zustimmung signalisiert, also eine 4 oder 5
# angegeben. Welchem relativen Anteil entspricht das?



# (b) Gebt die Alterswerte der Personen aus, die beim Item "Computer
# schuechtern mich ein." eher ihre Zustimmung signalisiert
# haben. Berechnet den mittleren Wert des Alters dieser Personen und
# vergleicht ihn mit dem Gesamtmittelwert des Alters.


# (c) Wie viele Personen stimmten eher zu, dass andere Personen
# Computer besser bedienen koennen als sie selbst (Item TP3), UND sie
# sich frustriert fuehlen, wenn sie einen Computer benutzen (Item TP4)
# - Wert von mindestens 4 signalisiert jeweils Zustimmung.



###############
## Aufgabe 5 ##
###############

# Die Items sind unterschiedlich gepolt: Bei manchen Items bedeutet
# Zustimmung eine hohe Auspraegung in der jeweiligen Eigenschaft
# (Items 1-9), bei manchem Items eine niedrige (Items 10-12). Um eine
# Gesamtsumme fuer die Technophobie-Skala zu bestimmen, muss aber
# jeder Itemwert in die selbe Richtung interpretierbar sein. Das
# heisst, dass wir fuer die negativ gepolten Items (hoher Wert =
# niedrige Auspraegung) wie folgt eine Invertierung der Werte
# durchfuehren:

# 1 -> 5
# 2 -> 4
# 3 -> 3
# 4 -> 2
# 5 -> 1

# Diese Umpolung kann man mit der folgenden Formel duchfuehren (Der
# hoechste Skalenwert ist hier 5):

# Invertierter Wert = Ursprungswert * (-1) + Hoechster Skalenwert + 1

# (a) Berechnet invertierte Itemwerte fuer alle negativ gepolten
# Items. Haengt die berechneten Vektoren als Spalte an den data.frame
# in der Variablen tp an.


# (b) Berechnet einen Gesamt-Summenwert ueber alle 12 Items (das
# heisst= Pro Person ein Technophobie- Summenwert; haengt diesen
# Summenwert als Spalte an den data.frame tp an)


# (c) Bestimmt Mittelwert, Standardabweichung, Minimum und Maximum
# fuer den Summenwert


# (d) Erstellt ein Histogram des Summenwerts.



################################
##   Aufgabe 6 (Bonusaufgabe) ##
##    Ernsthafte Teilnahmen   ##
################################


# (a) Gibt es Personen, die allen Aussagen vollkommen zugestimmt haben
# (also immer den Wert 5 haben - sowohl bei positiv als auch negativ
# gepolten Aussagen)? Wenn ja, welche Fallnummern gehoeren zu diesen
# Personen?


# Wir lernen bald Moeglichkeiten kennen, wie man nicht alle Spalten
# einzeln anwaehlen muss, um solche Operationen durchzufuehren

# (b) Gibt es Personen, die andere Formen des (vermutlich) nicht
# ernsthaften Antwortens gezeigt haben, also bspw. immer denselben
# Wert angekreuzt haben?

