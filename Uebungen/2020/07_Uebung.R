
## Termin 7

# Wir nutzen einen Datensatz zu den Big 5 (Inventar aus 50 Items)
# - Daten abzurufen hier: https://openpsychometrics.org/_rawdata/
# - Selbsttest: https://openpsychometrics.org/tests/IPIP-BFFM/
# - Infos zum Inventar: https://ipip.ori.org/new_ipip-50-item-scale.htm

## Nun:
# - Daten einlesen
# - Schauen, was es fuer Daten sind (-> Codebuch) 
# - Kategoriale Daten als `factor` definieren
# - Personen mit fehlenden Antworten ausschliessen
#   + `NA` definieren
#   + Funktionen zum Umgang mit `NA`: `is.na()`, `complete.cases()`, `na.omit()`
#   + (auch relevant: `summary()`)
# - Plausibilitaet der Daten checken (z.B. Alter). Unplausible Faelle ausschliessen.



## Aufgabe 0

# Zieht alle oben genannten Schritte zur "Datenbereinigung"
# nach. Fallen euch noch weitere moegliche Ueberpruefungen der
# Plausibilitaet der Daten ein? Fuehrt solche Ueberpruefungen
# durch. Ueberlegt, unter welchen Umstaenden ihr Faelle ausschliessen
# wuerdet und welche Faelle ihr eher behaltet. (Das ist oftmals
# einfach eine Abwaegung und es gibt nicht "richtig" und "falsch".)


## Aufgabe 1 

# Berechnet Item-Trennschaerfen und Cronbachs Alpha fuer die Skala
# Extraversion.  Beachtet, dass negativ gepolte Items invertiert
# werden muessen. Wie die Item gepolt sind, siehe hier:
# https://ipip.ori.org/new_ipip-50-item-scale.htm - oder entscheidet
# anhand der Items selbst, wie sie gepolt sind). Tipp: Markiert im
# Codebuch bei jedem Item die Polung.


## Aufgabe 2 

# (a) Berechnet einen Summenscores fuer die Skala Extraversion.


# (b) Vergleicht fuer die Skala "Extraversion" mit einem t-Test die
# Summenwerte zwischen maennlichen und weiblichen Teilnehmenden.


# (c) Vergleicht fuer die Skala "Extraversion" mit einem t-Test die
# Summenwerte zwischen Personen mit englischer Muttersprache und
# denjenigen, die keine englischen Muttersprachler sind. Wie viele
# Personen waren englische Muttersprachler und welchem relativen
# Anteil entspricht das?


## Aufgabe 3

# (a) Generiert ein Histogram fuer den Summenscore "Extraversion".


# (b) Generiert einen Scatterplot, der den Zusammenhang zwischen
# Extraversion mit dem Alter darstellt. Bestimmt auch die Korrelation
# dieser Variablen. Ist die Korrelation zwischen den Variablen
# signifikant?  (Rechercheaufgabe: Welche Funktion gibt die
# Signifikanz einer Korrelation aus?)

# Erinnerung: Wurde die Plausibilitaet der Alterswerte ueberprueft und
# wurde damit umgegangen?



###########
## Bonus ##
###########

# Eine ausfuehrliche Exploration dieses Datensatzes ist die perfekte
# Vorbereitung auf die Hausarbeit. Folgende Explorationen sind
# bspw. sinnvoll:

# - Berechnet Scores fuer alle Subskalen, achtet dabei auf
#   Invertierungen. (Tipp: Markiert im Codebuch bei jedem Item die
#   Polung)
# - Untersucht Korrelationen zwischen den Subskalen
# - Haengen die Big-5 anderen demographischen Variablen zusammen?
# - Psychometrische Auswertungen pro Subskala (korrigierte
#   Trennschaerfen; Schwierigkeiten, Cronbachs Alpha ... )
# - Gibt es "faule" Items? D.h. welche Items sind pro Subskala am
#   wenigsten trennscharf
# - Exploriert die Ernsthaftigkeit der Teilnahmen. Koennt ihr testen,
#   ob Personen immer dieselbe Antwort gegeben haben?
