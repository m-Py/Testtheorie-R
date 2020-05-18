
###########################
## Termin 4 Uebungsblatt ##
###########################

## Neue Inhalte heute:

# - Auswahl von Zeilen und Spalten mit der [.,.]-Notation (!)
# - Der Doppelpunktoperator
# - Die Funktion `paste0()`
# - die Funktionen `cor()`, `rowSums()` und `colMeans()`
#   fuer basale psychmetrische Auswertungen


# Wir arbeiten mit dem Technophobie-Datensatz weiter.

tp <- read.csv("technophobie.csv")

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
# sozialwissenschaftlicher Items und Skalen (ZIS). 
# https://doi.org/10.6102/zis62


# Wir berechnen direkt am Anfang invertierte Items und den
# Gesamtsummenwert. Beachtet, dass sich diese Berechnung aus der
# letzten Woche nicht in den Rohdaten abgebildet ist. So muss man die
# Berechnung in einer neuen R-Session neu durchfuehren.

tp$TP10i <- tp$TP10 * (-1) + 6
tp$TP11i <- tp$TP11 * (-1) + 6
tp$TP12i <- tp$TP12 * (-1) + 6
tp$sum <- tp$TP1 + tp$TP2 + tp$TP3 + tp$TP4 + tp$TP5 +
    tp$TP6 + tp$TP7 + tp$TP8 + tp$TP9 + tp$TP10i +
    tp$TP11i + tp$TP12i


#############################
## Der Doppelpunktoperator ##
#############################

# Erstelle eine Reihe ganzer Zahlen als numerischen Vektor:
1:10 # wichtige, bequeme Syntax
200:190
5:-5

###############################################
## Auswahl von Zeilen mit der [.,.]-Notation ##
###############################################

# Vor dem Komma kann man in der [.,.]-Notation kann man angeben,
# welche Zeilen man aus einem data.frame auswaehlen
# will. Beispielsweise:

tp[1:10, ]
tp[c(200, 88, 397), ]

# Man kann - unter anderem - mit einem numerischen oder logischen
# Vektor Zeilen auswaehlen. Dabei gelten dieselben Regeln wie bei der
# Auswahl per [.]! Man gibt also einen Index an (etwa: gib die erste
# Zeile aus) oder eine logische Bedingung (etwa: gib alle Zeilen mit
# weiblichen Teilnehmerinnen aus).

# Uns interessiert oftmals eine Auswahl anhand einer logischen
# Bedingung:

tp[tp$TP1 == 5, ]
# tp[c(TRUE, FALSE, TRUE, ...., TRUE), ]

tp[tp$TP1 == 5 | tp$TP2 == 5, ] # beliebige logische Bedingungen


# Oder auch:
tp[tp$alter < 18, ] 

# huch, was ist mit NA? Unschoen, aber wir koennen damit umgehen,
# Funktion `which()`:
which(tp$alter < 18)
tp[which(tp$alter < 18), ] # besser beim Umgang mit NA

# `which()` konvertiert logischen in numerischen Vektor.

# Hinweis: Mehr zu `which()` und Datenauswahl bei Anwesenheit von `NA`
# in der *aktuellen* Version des Skripts, siehe Kapitel 3.4.4
# (https://osf.io/nghyv/)

################################################
## Auswahl von Spalten mit der [.,.]-Notation ##
################################################

# Auswahl von Spalten hinter dem Komma der [.,.]-Notation
# spezifiziert. An dieser Stelle waehlen wir Spalten normalerweise
# durch Angabe ihrer Namen aus.

# Der Uebersicht wegen hier nur die ersten Zeilen :
drei_items <- tp[, c("TP1", "TP2", "TP3")]
head(drei_items)

# Erinnerung: Vektoren vom Typ character -> verwenden wir zur Auswahl
# von Spalten in data.frames.

"Cronbach"
mein_text <- 'alpha'
c("weiblich", "maennlich")
c("TP1", "TP2", "TP3", "TP4", "TP5") # -> Spaltenauswahl: *ein* Vektor

# Man kann auch die Position der Spalten angeben (als numerischen
# Vektor

# Man kann gleichzeitig Zeilen und Spalten auswaehlen
tp[1:3, 1:2] # ein data.frame
tp[c(1, 4, 5), c("alter", "casenum")]


## Ganz allgemein: Zeilen und Spalten koennen ausgewaehlt werden:
# - durch Position / numerischen Index
# - durch logische Bedingung (eher fuer Zeilen nuetzlich)
# - durch den Namen (eher fuer Spalten nuetzlich)


###########################
## Die Funktion paste0() ##
###########################

# Erstellt einen character-Vektor, indem sie verschiedene Vektoren
# zusammengefuegt, etwa:

paste0("item_", 1:10)

# Sollte ich Items aus nur einer Subskala auswaehlen wollen:
paste0("TP", c(1, 4, 7))
c("TP1", "TP4", "TP7")

paste0("Q", 1:40)

########################
## Die Funktion cor() ##
########################

# Die Funktion `cor()` berechnet eine Korrelation zwischen gepaarten
# numerischen Vektoren.

cor(tp$TP1, tp$TP2) # Inter-Itemkorrelation
cor(tp$TP10i, tp$TP11i)
cor(tp$TP5, tp$TP10i)

# Unten in Aufgabe 2 lernt ihr noch eine weitere Moeglichkeit kennen,
# `cor()` zu nutzen.


###############
## Aufgabe 1 ##
###############

## Warm werden mit der [.,.]-Notation

# (a) Waehlt die erste, 17., 139., und 401. Zeile aus `tp` aus.


# (b) Waehlt alle Personen aus, deren Fallnummer groesser als 1000
# ist, UND deren berichtetes Geschlecht "maennlich" ist.


# (c) Waehlt die dritte und achte Spalte aus `tp` aus; nur fuer die
# ersten 5 Faelle.


# (d) Waehlt alle ausser die dritte und achte Spalte aus; nur fuer die
# ersten fuenf Faelle


###############
## Aufgabe 2 ##
###############

# (a) Erstellt eine Variable, in der die Antworten auf alle positiv
# gepolten Items enthalten sind.

## Wichtig: 
# Dieser data.frame ist die Basis fuer alle moeglichen
# psychometrischen Auswertungen.

# Hinweis 1: Fuer die Items 10, 11, 12 muessen die invertierten
# Antworten enthalten sein.

# Hinweis 2: Nutzt fuer die Auswahl der entsprechenden Spalten einen
# character-Vektor, der die Spaltenname enthaelt.

# Hinweis 3: Bonuspunkte, wenn ihr zur Erstellung des
# character-Vektors mit den Spaltennamen die Funktion `paste0()`
# verwendet (Alternativ: einfach "per Hand" aufschreiben.



###############
## Aufgabe 3 ##
###############

# In R koennen wir manchmal dieselbe Funktion mit verschiedenem Input
# nutzen, etwa: eine Funktion nimmt entweder einen Vektor oder sogar
# einen ganzen data.frame an.

# Die Funktion cor() ist auf zwei Arten zu verwenden: (a) Zur
# Bestimmung der Korrelation zwischen genau *zwei* gepaarten Vektoren
# (wie oben in der Einfuehrung); (b) zur Bestimmung aller paarweisen
# Korrelationen in einem data.frame. Bei 12 Items im
# Technophobie-Inventar ist es zu bevorzugen, nur einmal `cor()`
# aufzurufen, um direkt alle Inter-Itemkorrelation zu erhalten,
# statt sie fuer alle Paare an Items neu aufzurufen.  (Wer wissen will
# wie viele moegliche Itempaare es gibt: Fuehrt `choose(12, 2)` in der
# Konsole aus)

# (a) Wendet die Funktion `cor()` auf den data.frame an, den ihr in
# Aufgabe 2 erstellt habt (und der nur die Item-Antworten
# enthaelt). Betrachtet die Ausgabe



# (b) Die Funktion `round()` macht Output von Zahlen besser lesbar,
# indem Dezimalstellen gerundet werden. Das erste Argument fuer
# `round()` sind die Daten, in denen die Zahlen gerundet werden
# sollen; das zweite Argument ist die Zahl der Nachkommastellen, die
# angegeben werden sollen. Nutzt `round()`, um die Korrelationsmatrix
# aus Aufgabenteil (c) besser lesbar zu machen (etwa per Angabe von
# zwei Nachkommastellen)



# (c) Bestimmt die Korrelationen zwischen den urspruenglichen und
# invertierten Antworten der Items 10, 11 und 12. Was faellt auf?



###############
## Aufgabe 4 ##
###############

# (a) Die Funktion `rowSums()` berechnet zeilenweise die Summe in
# einem data.frame. Wendet sie auf den data.frame an, den ihr in
# Aufgabe 2 erstellt habt.


# Was habt ihr gerade berechnet?


# (b) Die Funktion `colMeans()` berechnet spaltenweise den Mittelwert
# in einem data.frame. Wendet sie auf den data.frame an, den ihr in
# Aufgabe 2 erstellt habt.


# Was habt ihr so gerade berechnet?


###############
## Aufgabe 5 ##
###############

# (a) Erstellt zwei data.frames, die ihr in Variablen abspeichert:

# 1. Ein data.frame, der alle weiblichen Teilnehmerinnen enthaelt
# 2. Ein data.frame, der alle maennlichen Teilnehmer enthaelt



# (b) Berechnet einen t-Test, der die Technophobiewerte der
# maennlichen und weiblichen Teilnehmenden vergleichen. (Prinzipiell
# stehen euch hier verschiedene Varianten zur Verfuegung; es reicht,
# eine zu finden.)

