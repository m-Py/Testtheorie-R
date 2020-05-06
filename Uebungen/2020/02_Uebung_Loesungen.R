
##########################
# Termin 2 Uebungsblatt ##
##########################


############################################
## Vor den naechsten Aufgaben kommen neue ##
##    Inhalte: 1. Logisches UND / ODER    ##
############################################

# Logisches UND
TRUE & TRUE

TRUE & FALSE

FALSE & FALSE

# Logisches ODER
TRUE | TRUE 

TRUE | FALSE

FALSE | FALSE

# Entgegen umgangssprachlicher Intuition kein ENTWEDER/ODER, sondern
# ein "einschließendes ODER"

# Logische Operatoren arbeiten paarweise / komponentenweise:

c(TRUE, FALSE, FALSE) & c(TRUE, TRUE, FALSE)

c(TRUE, FALSE, FALSE) | c(TRUE, TRUE, FALSE)



####################################################
##     Vor den naechsten Aufgaben kommen neue     ##
## Inhalte: 2. Auswahl von Elementen aus Vektoren ##
####################################################


# In R kann man auf einzelne oder mehrere Elemente in Vektoren
# zugreifen.

meinVektor <- c(1, 2, 6, 2, 9) # Beispielvektor

# Mit der [ ]-Notation koennen wir Elemente aus Vektoren anhand ihrer
# Position auswaehlen
meinVektor[3] # waehlt das dritte Element aus

# Man kann eine "Negativ"-Auswahl durchfuehren:
meinVektor[-3] # laesst das dritte Element aus

bla <- meinVektor[-3]

# Man kann mehrere Elemente auswaehlen:
meinVektor[c(1, 4)]

# Oder mehrere Elemente auslassen:
meinVektor[-c(1, 4)]

# Oftmals erwuenscht: waehle Elemente anhand ihrer Eigenschaften aus.

# Waehle alle Elemente die groesser bzw kleiner gleich 2 sind aus:
meinVektor[meinVektor >= 2] # was ist `meinVektor > 2`?

meinVektor[meinVektor <= 2]

# Hier waehle ich die Daten mit einem logischen Vektor aus, der fuer
# jedes Element angibt, ob es in der Ausgabemenge sein soll. Das
# heisst das hier funktioniert auch:

meinVektor[c(TRUE, TRUE, FALSE, TRUE, FALSE)]

# Man kann mit dem [ ] Zugriff auch Daten veraendern, indem ich die
# "<-"-Zuweisung verwende:

meinVektor[3] <- 0

meinVektor[meinVektor > 8]  <- 9999

# Beispiel: in Fragebogenuebertragung wurden fehlende Werte mit -99
# kodiert.
punktZahlen <- c(10, 32, 12, 42, -99, -99)

punktZahlen[punktZahlen == -99] <- NA # NA = fehlender Wert; mehr dazu naechste Woche


# Merke: mit dem [ ] Zugriff kann man Elemente aus Vektoren
# auswaehlen:

# (a) anhand ihrer Position im Vektor

# (b) mithilfe eines logischen Vektors, der fuer jedes Element angibt,
# ob es in der Ausgabemenge sein soll.

# (c) zusammen mit der "<-" Zuweisung kann man so bestimmte Elemente
# in Vektoren veraendern.



##### Start der Aufgaben:


# Nach der Niederlage gegen den amerikanischen Verband sollen die
# Leistungen der deutschen Sportler mithilfe eines Dopingprogramms
# verbessert werden. Dafuer wird an einige Sportler*innen das
# Dopingmittel Diuretika verteilt. (Diuretika dienen der Entwässerung
# des Körpers und damit wird der Athlet / die Athletin leichter) Um
# den Erfolg des Programms zu evaluieren, werden die Leistungen aller
# Sportler*innen vor und nach Vergabe des Dopings verglichen. Die
# folgenden zwei Vektoren beinhalten die Sprungleistungen der Springer
# vor und nach dem Doping. Dabei kommt der erste Wert in
# `spruenge_vorher` von derselben Athlet*in wie Wert 1 in
# `spruenge_nachher` usw.

###############
## Aufgabe 0 ##
###############

# Ladet die zwei Variablen mit STRG-Enter in euren "workspace", damit
# ihr die weiteren Aufgaben loesen koennt.

spruenge_vorher <- c(1.85, 1.89, 2.02, 1.99, 1.84, 2.31, 1.99, 1.79,
                     2.15, 2.07, 2.01, 2.00, 1.87, 2.08, 2.13)

spruenge_nachher <- c(1.95, 1.83, 2.15, 2.03, 1.75, 2.28, 1.89, 2.04,
                      2.39, 2.33, 1.99, 2.13, 1.94, 2.26, 2.11)

###############
## Aufgabe 1 ##
###############

# Wie hoch war die mittlere Sprunghoehe an Termin 1 und an Termin 2?

mean(spruenge_nachher)
mean(spruenge_vorher)

###############
## Aufgabe 2 ##
###############

# Wie hoch war die mittlere Sprunghoehe ueber alle Spruenge hinweg?
# Speichert alle Spruenge in *einer* Variablen ab, bevor ihr den
# Mittelwert berechnet.

alle_spruenge <- c(spruenge_vorher, spruenge_nachher)
mean(alle_spruenge)

###############
## Aufgabe 3 ##
###############

# Erstellt mit einem logischen Vergleich einen logischen (TRUE/FALSE)
# Vektor, der kodiert, ob die Sprungweite nach Vergabe von Diuretikum
# hoeher war als davor. Speichert diesen Vektor in einer Variablen ab.

# An dieser Stelle wichtig: Logische Operatoren arbeiten paarweise /
# komponentenweise. Es ist also nur ein Befehl noetig

besser_nach_doping <- spruenge_nachher > spruenge_vorher

###############
## Aufgabe 4 ##
###############

# Wie viele Springer sind nach der Diuretikum-Vergabe hoeher
# gesprungen? Welchem relativen Anteil entspricht das?

sum(besser_nach_doping) 
mean(besser_nach_doping)


###############
## Aufgabe 5 ##
###############

# Speichert die paarweisen Differenzen zwischen den Sprunghoehen an 
# Termin 1 und Termin 2 in einer Variablen ab und betrachtet die Variable.

differenz <- spruenge_nachher - spruenge_vorher


###############
## Aufgabe 6 ##
###############

# Wie hoch war die mittlere Verbesserung vom ersten zum zweiten Sprung

mean(differenz)

###############
## Aufgabe 7 ##
###############

# Was war die staerkste Verbesserung nach Diuretikum-Einnahme?  Was
# die staerkste Verschlechterung?

max(differenz)
min(differenz)

###############
## Aufgabe 8 ##
###############

# Recherchiert online, wie man einen t-Test ausfuehren kann, um
# gepaarte Daten zu vergleichen; fuehrt ihn aus, um zu entscheiden, ob
# Diuretika zu einer signifikanten Verbesserung der Sprungleistung
# fuehren (bei einem konventionellen Alpha-Fehler Niveau von .05).

t.test(spruenge_nachher, spruenge_vorher, paired = TRUE)

t.test(spruenge_nachher, spruenge_vorher, paired = TRUE, 
       alternative = "greater")

# Fuehrt einen Einstichproben-t-Test (-> Internetrecherche) durch, der
# die Differenz der Messwerte (vorher/nachher) mit dem Wert Null
# vergleicht. Was faellt im Vergleich zum gepaarten t-Test auf?

t.test(differenz, mu = 0)
t.test(differenz, mu = 0, alternative = "greater")
?t.test


################################################
## Ab dieser Aufgabe: Verwendung von UND/ODER ##
################################################

###############
## Aufgabe 9 ##
###############

# (a) Wie viele Springer haben *vor* Vergabe von Diuretikum die
# 2-Meter Marke geknackt?

sum(spruenge_vorher >= 2)

# (b) Wie viele Springer haben *nach* Vergabe von Diuretikum die
# 2-Meter Marke geknackt?

sum(spruenge_nachher >= 2)

# (c) erstellt eine Variable, die kodiert wer vor ODER nach der
# Einnahme von Diuretikum die 2m Marke geknackt hat (nutzt das
# *logische* ODER, nicht das umgangsprachliche "entweder-oder").

min_einmal <- (spruenge_vorher >= 2) | (spruenge_nachher >= 2)

# Wie viele Sportler*innen haben an mindestens einem Termin die
# 2-Meter-Marke geknackt?

sum(min_einmal)

# (d) Wie viele Sportler*innen haben an beiden Terminen die
# 2-Meter-Marke geknackt?

zweimal <- (spruenge_vorher >= 2) & (spruenge_nachher >= 2)
sum(zweimal)

# (e) Bonus-Frage (ist etwa schwieriger, kann uebersprungen werden):
# Kodiert mit einem logischen Vektor, wer nur »entweder« vorher »oder« 
# nachher die 2-Meter-Marke geknackt hat. (TRUE bedeutet also: Person 
# hat einmal die Marke geknackt; FALSE bedeutet also: Person hat entweder
# keinmal oder zweimal die Marke geknackt).

genau_einmal <- ((spruenge_vorher >= 2) & (spruenge_nachher < 2)) | 
  ((spruenge_nachher >= 2) & (spruenge_vorher < 2))

sum((spruenge_vorher >= 2) != (spruenge_nachher >= 2))

##########################################
## Ab dieser Aufgabe Verwendung von [ ] ##
##########################################

################
## Aufgabe 10 ##
################

# (a) Waehlt das dritte Element aus dem Vektor `spruenge_nachher` aus
# und speichert es in einer Variablen.
ein_sprung <- spruenge_nachher[3]

# (b) Waehlt das erste, fuenfte und zehnte Element aus dem Vektor
# `spruenge_vorher` aus und speichert diese Auswahl in einer neuen
# Variablen.

mehrere_spruenge <- spruenge_vorher[c(1, 5, 10)]

# (c) Waehlt alle bis auf das das erste, fuenfte und zehnte Element
# aus dem Vektor `spruenge_vorher` aus.

mehrere_spruenge2 <- spruenge_vorher[-c(1, 5, 10)]


################
## Aufgabe 11 ##
################

# (a) Waehlt alle Elemente aus dem Vektor `spruenge_nachher` aus, bei
# denen die Sprunghoehe groesser als 2m war:

spruenge_nachher[spruenge_nachher > 2]

# (b) Waehlt alle Elemente aus dem Vektor `spruenge_nachher` aus, die
# zu den Springern gehoeren, die sowohl *vor als auch nach* der
# Einnahme von Diuretikum *niedriger* als 2m gesprungen sind.

bedingung <- (spruenge_vorher < 2) & (spruenge_nachher < 2)
spruenge_nachher[bedingung]

################
## Aufgabe 12 ##
################

mein_vektor <- c(1, 0, 2, 9)

# (a) Ersetzt in `mein_vektor` das zweite Element durch 55:
mein_vektor[2] <- 55

# (b) Erhoeht in `mein_vektor` das erste Element um 10
mein_vektor[1] <- mein_vektor[1] + 10

# (c) Ersetzt in `mein_vektor` das dritte und vierte Element durch 999
mein_vektor[c(3, 4)] <- 999


################
## Aufgabe 13 ##
################

# Wegen schlechter Windverhaeltnisse sollen die Sprunghoehen einiger
# Sportler nachtraeglich aufgewertet werden. Erhoeht die Werte der
# Sportler 3, 8, und 13 zu Zeitpunkt 2 um 10cm.
spruenge_nachher[c(3, 8, 13)] <- spruenge_nachher[c(3, 8, 13)] + 0.1
