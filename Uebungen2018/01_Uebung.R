## Termin 1 praktischer Teil

# `#` startet einen Kommentar - dieser wird von der 
#`R`-Konsole nicht interpretiert

## STRG-Enter nimmt Befehle aus dem Skript-Editor und fuehrt 
## sie in der `R`-Konsole aus

## Heute lernen wir Vektoren kennen
## - Erstellung von numerischen Vektoren
## - Speichern von Vektoren in Variablen
## - basale mathematische / statistische Funktionen
## - logische Abfrage von Eigenschaften von Vektoren

## `R` beherrscht die Grundrechenarten
1 + 3

3 - 17

3 * 2

3^2

3^2 + 4^2

10 / 5

## Auf Klammerung achten:
(3 + 5) / 2

3 + 5 / 2

## Man kann Zahlen (und auch andere Objekte) in Variablen 
## speichern, um spaeter wieder darauf zuzugreifen:

pi <- 3.1415
radius <- 5

kreisflaeche <- pi * radius^2

## Gib den Wert einer Variablen mit STRG-Enter auf 
## der Konsole aus
kreisflaeche

## Loesche eine Variable
rm(pi)

pi # Warum ist pi noch da?! (und hat einen anderen Wert)

## `R` ist sehr praktisch fuer statistische Berechnungen, da es 
## Daten als "Vektoren abspeichert", d.h. im Normalfall koennen
## wir mehrere Daten direkt in *einem* Objekt abspeichern

## Mit der Funktion `c()` fuegen wir mehrere Zahlen zu *einem*
## Vektor zusammen

meinVektor <- c(1, 2, 6, 2, 9)

## Auf mehr-elementigen Vektoren koennen wir jetzt schon einfache 
## statistische Berechnungen durchfuehren, wir die `R` eingebaute 
## Funktionen bietet

mean(meinVektor)

sum(meinVektor)

sd(meinVektor)

var(meinVektor)

min(meinVektor)

max(meinVektor)

## Finde heraus, wie viele Elemente ein Vektor hat:

length(meinVektor)

## Viele Funktionen agieren direkt auf allen Elementen 
## eines Vektors:

sqrt(meinVektor)

## Merke: hier war die Ausgabe kein ein-elementiger Vektor 
## wie oben, sondern fuer alle Werte in `meinVektor` wurde 
## die Quadratwurzel ausgegeben

## Ebenso funktioniert auch das Rechnen mit 
## mehr-elementigen Vektoren:
meinVektor * 2

meinVektor / 2

## Man kann Funktionen "verschachteln":
sqrt(var(meinVektor)) # was ist das?

## Erhalte "Hilfe" fuer eine Funktion mit `?`
?var # fuer Anfaenger meiner Ansicht nach ungeeignet

## Andere Datentypen: `R` kennt nicht nur Zahlen, 
## sondern auch Text
meinText <- "bla bla"

## Auch Textvektoren koennen mehr-elementig sein:
mehrText <- c("bla", 'bla') # etwas anderes als oben

length(meinText)
length(mehrText) 


## - Logische Abfragen -

## Ich kann Eigenschaften von Vektoren ueberpruefen,
## etwa: wie viele Elemente entsprechen einem bestimmten 
## Wert:

meinVektor > 3

## Hier offenbart sich ein weiterer Datentyp: 
## "logical" -> kodiert Wahrheit. Kennt nur die Elemente 
## TRUE/FALSE. Kodiert hier: Ist ein Element in `meinVektor`
## groesser als 3? 

meinVektor == 2

## TRUE wird als 1 und FALSE wird als 0 interpretiert:
sum(meinVektor == 2) # wie viele Elemente sind gleich 2
sum(meinVektor == 999)

### Das war schon mal einiges: 
### Ueben wir das Ganze ein!


###################################
####### Uebungen Termin 1 #########
###################################

## Nutzt zur Bearbeitung der folgenden Aufgaben die oben 
## vorgestellten Funktionen.

## Deutsche und amerikanische Sportverbaende haben 
## Daten ueber die Leistungen von jeweils 6 ihrer 
## besten Hochspringer uebermittelt:

us_springer <- c(6.89, 7.05, 6.23, 
                 7.32, 7.55, 6.53)

d_springer  <- c(1.85, 1.89, 2.02, 
                 2.31, 1.99, 1.79)

## Leider nutzten der amerikanische Verband das 
## Angloamerikanische Masssystem, d.h. uebermittelte 
## die Werte in "foot", aber der deutsche 
## Verband verwendete Meter

## Aufgabe 1:

## Erstellt einen Vektor, der die Werte der US-Springer in Meter
## enthaelt. 1 foot entspricht 0,3048m. Achtet darauf, dass 
## in `R` das Dezimaltrennzeichen ein Punkt (`.`) ist und 
## kein Komma.



## Aufgabe 2:

## Welches Sportteam hat im Mittel die hoeheren 
## Spruenge geschafft?



## Aufgabe 2:

## Wie streuen die Werte um den Mittelwert der Gruppen? 
## Welche gruppe ist homogener?



## Aufgabe 3:
## Wie hoch war der insgesamt hoechste Sprung?
## Wie hoch der insgesamt niedrigste?
## In welcher Gruppe trat jeweils der hoechste / 
## niedrigste Sprung auf?


## Aufgabe 4:

## Wie viele Springer haben die 2m Marke geknackt?


## Aufgabe 5:

## Gibt es einen amerikanischen Springer, der niedriger als 
## 1.85m gesprungen ist? 
## Formuliert *eine* Anfrage, die entweder 
## `TRUE` oder `FALSE` ausgibt:



################## Wenn noch Zeit ist

## Auswahl von Elementen in Vektoren

## Mit der [ ] Notation koennen wir Elemente aus 
## Vektoren anhand ihrer Position auswaehlen
meinVektor[3] # waehlt das dritte Element aus

## Man kann eine "Negativ"-Auswahl durchfuehren:
meinVektor[-3] # laesst das dritte Element aus

## Oftmals erwuenscht: waehle Elemente 
## anhand ihrer Eigenschaften aus:

meinVektor[meinVektor > 2] # was ist `meinVektor > 2`?
meinVektor[meinVektor <= 2]

## Man kann mit dem [ ] Zugriff auch Daten veraendern:

meinVektor[3] <- 0

meinVektor[meinVektor > 8]  <- 9999

## Aufgabe 6:

## Waehle die Sprunghoehen aller deutschen Sportler aus,
## die niedriger als 2m gesprungen sind


## Aufgabe 7:

## Wir erhalten vom deutschen Sportverband eine Aktualisierung
## der Daten: anscheinend wurden im Wettbewerb einige der 
## Sportler disqualifiziert. Wir speichern diese Information
## in einem TRUE/FALSE Vektor ab:



## Setze die Sprunghoehen aller disqualifizierten Deutschen
## auf 0.



############### Falls immer noch Zeit ist:

# Zusatzinfo: einfache Berechnung eines t-Tests:

us_springer <- c(6.89, 7.05, 6.23, 
                 7.32, 7.55, 6.53)

us_springer_m <- us_springer * 0.3048

d_springer  <- c(1.85, 1.89, 2.02, 
                 2.31, 1.99, 1.79)

t.test(us_springer_m, d_springer)

