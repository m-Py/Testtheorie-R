
# Termin 1 Uebungsblatt

# `#` startet einen Kommentar - dieser wird von der `R`-Konsole nicht
# interpretiert. Ich nutze Kommentare, um die Uebungsaufgaben zu
# stellen und zu erklaeren. Auch sonst sollten wir Kommentare nutzen,
# um unseren Code verstaendlich zu machen.

# Heute lernen wir die Arbeitsumgebung RStudio und *Vektoren* kennen

# - Basale mathematische Berechnungen
# - Erstellung von numerischen Vektoren
# - Speichern von Vektoren in Variablen
# - Anwendung basaler statistischer Funktionen
# - logische Abfragen

############################
## 1. Simple Berechnungen ##
############################

# `R` beherrscht die Grundrechenarten

# (STRG-Enter nimmt Befehle aus dem Skript-Editor und fuehrt sie in
# der `R`-Konsole aus)

1 + 3

3 - 17

3 * 2

3^2

3^2 + 4^2

10 / 5

# Auf Klammerung achten:

(3 + 5) / 2

3 + 5 / 2


###############################
## 2. Variablen und Vektoren ##
###############################

# Man kann Zahlen (und auch andere Objekte) in Variablen speichern, um
# spaeter wieder darauf zuzugreifen:

pi <- 3.1415
radius <- 5

kreisflaeche <- pi * radius^2

# Gib den Wert einer Variablen mit STRG-Enter auf der Konsole aus
kreisflaeche

# `R` ist sehr praktisch fuer statistische Berechnungen, da es Daten
# als Vektoren abspeichert. D.h. wir speichern mehrere Daten direkt
# in *einem* Objekt ab.  Mit der Funktion `c()` fuegen wir mehrere
# Zahlen zu *einem* Vektor zusammen

meinVektor <- c(1, 2, 6, 2, 9)

# Auf mehr-elementigen Vektoren koennen wir jetzt schon einfache
# statistische Berechnungen durchfuehren, wir die `R` eingebaute
# Funktionen bietet

mean(meinVektor) # Mittelwert
sd(meinVektor)   # Standardabweichung
var(meinVektor)  # Varianz
min(meinVektor)  # Minimum
max(meinVektor)  # Maximum
sum(meinVektor)  # Summe

# Funktion `length()` findet heraus, wie viele Elemente ein Vektor hat:

length(meinVektor)

# Viele Funktionen agieren direkt auf allen Elementen eines Vektors:

sqrt(meinVektor)

# Merke: hier war die Ausgabe kein ein-elementiger Vektor wie oben,
# sondern fuer alle Werte in `meinVektor` wurde die Quadratwurzel
# ausgegeben

# Ebenso funktioniert auch das Rechnen mit mehr-elementigen Vektoren:

meinVektor * 2

meinVektor / 2

# Man kann Funktionsaufrufe "verschachteln":

sqrt(var(meinVektor)) # was ist das?
sd(meinVektor)


##########################
## 3. Logische Abfragen ##
##########################


# Ich kann Eigenschaften von Vektoren ueberpruefen, etwa:

meinVektor > 3

# So lernen wir einen weiteren Datentyp kennen: "logical". Dieser
# kodiert Wahrheit und kennt nur die Elemente TRUE/FALSE. Oben: Ist
# ein Element in `meinVektor` groesser als 3? Unte: Ist ein Element
# gleich 2:

meinVektor == 2

# TRUE wird als 1 und FALSE wird als 0 interpretiert:
sum(meinVektor == 2) # wie viele Elemente sind gleich 2
sum(meinVektor == 999)

# Das war schon mal einiges: Ueben wir das Ganze als Naechstes ein!
# Nutzt zur Bearbeitung der folgenden Aufgaben die oben vorgestellten
# Funktionen.



###############
## Aufgabe 1 ##
###############

# Berechnet den Standardfehler von `meinVektor`


###############
## Aufgabe 2 ##
###############

# Deutsche und amerikanische Sportverbaende haben Daten ueber die
# Leistungen von jeweils 6 ihrer besten Hochspringer uebermittelt:

us_springer <- c(6.89, 7.05, 6.23, 7.32, 7.55, 6.53)

d_springer  <- c(1.85, 1.89, 2.02, 2.31, 1.99, 1.79)

# Leider nutzten der amerikanische Verband das Angloamerikanische
# Masssystem, d.h. uebermittelte die Werte in "foot", aber der
# deutsche Verband verwendete Meter.

# Erstellt einen Vektor, der die Werte der US-Springer in Meter
# enthaelt. 1 foot entspricht 0,3048m. Achtet darauf, dass in `R` das
# Dezimaltrennzeichen ein Punkt (`.`) ist und kein Komma. Speichert
# die neu berechneten Werte in einer Variablen.


###############
## Aufgabe 3 ##
###############

# Welches Sportteam hat im Mittel die hoeheren Spruenge geschafft?


###############
## Aufgabe 4 ##
###############

# Mit welcher Standardabweichung und Varianz streuen die Werte um
# den Mittelwert der Gruppen? Welche Gruppe ist homogener?


###############
## Aufgabe 5 ##
###############

# Recherchiert im Internet wie man in R einen t-Test durchfuehrt, um
# zu ueberpruefen, ob sich zwei Mittelwerte unterscheiden. Nutzt
# diesen Test, um die Werte der amerikanischen und deutschen Sportler
# zu vergleichen. Ist der Vergleich signifikant?


###############
## Aufgabe 6 ##
###############

# Wie hoch war der insgesamt hoechste Sprung? Wie hoch der insgesamt
# niedrigste? In welcher Gruppe trat jeweils der hoechste / niedrigste
# Sprung auf?


###############
## Aufgabe 7 ##
###############

# Wie viele Springer haben die 2m Marke geknackt?


###############
## Aufgabe 8 ##
###############

# Gibt es einen amerikanischen Springer, der niedriger als 1.85m
# gesprungen ist? Schreibt einen Befehl, der TRUE ausgibt, wenn das
# der Fall ist, und FALSE wenn nicht.
